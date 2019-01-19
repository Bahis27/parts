package com.hometask.parts.models;

import javax.persistence.*;

@Entity
@Table(name = "test")
public class Part {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "need")
    private boolean need;

    @Column(name = "quantity")
    private int quantity;

    public Part() {
    }

    public Part(String name, boolean need, int quantity) {
        this.name = name;
        this.need = need;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isNeed() {
        return need;
    }

    public void setNeed(boolean need) {
        this.need = need;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
