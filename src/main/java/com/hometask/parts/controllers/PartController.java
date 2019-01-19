package com.hometask.parts.controllers;

import com.hometask.parts.models.Part;
import com.hometask.parts.repository.PartsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PartController {

    @Autowired
    PartsRepository repository;

    //номер страницы для перехода
    private int nextPage = 0;
    //лист хранящий номера страниц
    private List<Integer> totalPagesList;
    //строка статус
    private String status = "";
    //число компьютеров, которые можно собрать
    private int pcsToConstruct = 0;
    //значение устанавливаемог фильтра
    private String nextFilter = "all";

    private void setPcsToConstruct(Page<Part> currentPage) {
        List<Part> allNeededParts = repository.findPartsByNeedTrueOrderById();
        if (allNeededParts.size() == 0) {
            pcsToConstruct = 0;
            return;
        }
        int minPartsQuantity = allNeededParts.get(0).getQuantity();
        for (Part p: allNeededParts) {
            if (!currentPage.getContent().contains(p)){
                pcsToConstruct = 0;
                return;
            } else {
                if (p.getQuantity() < minPartsQuantity)
                    minPartsQuantity = p.getQuantity();
            }
        }
        pcsToConstruct = minPartsQuantity;
    }

    private void setTotalPages(Page<Part> currentPage) {
        int totalPages = currentPage.getTotalPages();
        this.totalPagesList = new ArrayList<>();
        for (int i = 0; i < totalPages; i++) {
            totalPagesList.add(i);
        }
    }

    @RequestMapping(value = "/")
    public ModelAndView letsGoHome() {
        ModelAndView mv = new ModelAndView("index");
        Page<Part> currentPage;
        switch (nextFilter) {
            case "true":
                currentPage = repository.findPartsByNeedTrueOrderById(new PageRequest(nextPage, 10, Sort.Direction.ASC, "id", "name", "need", "quantity"));
                break;
            case "false":
                currentPage = repository.findPartsByNeedFalseOrderById(new PageRequest(nextPage, 10, Sort.Direction.ASC, "id", "name", "need", "quantity"));
                break;
            default:
                currentPage = repository.findAll(new PageRequest(nextPage, 10, Sort.Direction.ASC, "id", "name", "need", "quantity"));
                break;
        }
        setTotalPages(currentPage);
        setPcsToConstruct(currentPage);
        mv.addObject("parts", currentPage.getContent());
        mv.addObject("pages", totalPagesList);
        mv.addObject("status", status);
        mv.addObject("pcsToConstruct", pcsToConstruct);
        return mv;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView letsSave(@RequestParam("id") String id, @RequestParam("name") String name,
                                 @RequestParam("need") String need, @RequestParam("quantity") String quantity) {
        Part part;
        ModelAndView mv = new ModelAndView("redirect:/");
        if (!id.isEmpty()) {
            if ((part = repository.findPartByName(name)) == null) {
                part = repository.findPartById(Integer.parseInt(id));
                return getModelAndView(name, need, quantity, part, mv, "updated.");
            } else {
                if (id.equals(String.valueOf(part.getId()))){
                    return getModelAndView(name, need, quantity, part, mv, "updated.");
                } else {
                    status = "The part with this name already exist with another id.";
                    return mv;
                }
            }
        } else {
            if ((part = repository.findPartByName(name)) == null) {
                part = new Part();
                return getModelAndView(name, need, quantity, part, mv, "added.");
            } else {
                return getModelAndView(name, need, quantity, part, mv, "updated.");
            }
        }
    }

    private ModelAndView getModelAndView(@RequestParam("name") String name, @RequestParam("need") String need,
                                         @RequestParam("quantity") String quantity, Part part, ModelAndView mv, String whatWasDone) {
        try {
            if (!name.matches("^[A-Za-zА-Яа-я0-9]+[A-Za-zА-Яа-я0-9_\\- ]+$")) {
                status = "Input Error (special symbols).";
                return mv;
            }
            part.setName(name);

            if (need.equals("true"))
                part.setNeed(true);
            else
                part.setNeed(false);

            part.setQuantity(Integer.parseInt(quantity));
            repository.save(part);
        } catch (NumberFormatException e) {
            status = "Input Error (digits).";
            return mv;
        }
        status = "The part has been " + whatWasDone;
        return mv;
    }

    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public ModelAndView letsView(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("view");
        mv.addObject("part", repository.findPartById(id));
        status = "";
        return mv;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView letsEdit(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("edit");
        mv.addObject("part", repository.findPartById(id));
        return mv;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView letsDelete(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView("redirect:/");
        repository.delete(repository.findPartById(id));
        status = "The part has been removed.";
        return mv;
    }

    @RequestMapping(value = "/next/{page}", method = RequestMethod.GET)
    public ModelAndView letsGoToTheNextPage(@PathVariable("page") int page) {
        nextPage = page;
        ModelAndView mv = new ModelAndView("redirect:/");
        status = "";
        return mv;
    }

    @RequestMapping(value = "/filter/{selectedFilter}", method = RequestMethod.GET)
    public ModelAndView letsApplyFilter(@PathVariable("selectedFilter") String selectedFilter) {
        nextFilter = selectedFilter;
        nextPage = 0;
        ModelAndView mv = new ModelAndView("redirect:/");
        status = "";
        return mv;
    }

    @RequestMapping(value = "/find", method = RequestMethod.POST)
    public ModelAndView letsFind(@RequestParam("name") String name) {
        Part part;
        ModelAndView mv;
        if ((part = repository.findPartByName(name)) != null){
            mv = new ModelAndView("edit");
            mv.addObject("part", part);
        } else {
            mv = new ModelAndView("redirect:/");
            status = "The part with the name '" + name + "' was not found.";
        }
        return mv;
    }
}
