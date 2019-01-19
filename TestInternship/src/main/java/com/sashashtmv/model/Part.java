package com.sashashtmv.model;


import org.hibernate.annotations.Type;

import javax.persistence.*;

//связываем с базой данных
@Entity
@Table(name = "parts")
public class Part {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "PARTS_NAME")
    private String partName;

    @Type(type = "org.hibernate.type.BooleanType")
    @Column(name = "IS_NEED")
    private boolean isNeed;

    @Column(name = "AMOUNT")
    private int amount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public boolean isNeed() {
        return isNeed;
    }

    public void setNeed(boolean need) {
        isNeed = need;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Part{" +
                "id=" + id +
                ", partName='" + partName + '\'' +
                ", isNeed=" + isNeed +
                ", amount=" + amount +
                '}';
    }
}
