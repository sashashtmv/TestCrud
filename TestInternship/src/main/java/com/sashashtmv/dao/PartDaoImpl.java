package com.sashashtmv.dao;

import com.sashashtmv.model.Part;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import java.util.ArrayList;
import java.util.List;

@Repository
public class PartDaoImpl implements PartDao {
    //создает сессии для создания соединения с базой данных
    private SessionFactory sessionFactory;
    private static final int limitResultsPerPage = 10;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addPart(Part part) {
        //создаем сессию, которая просит нашу фабрику сессий получить текущую сессию
        Session session = sessionFactory.getCurrentSession();
        //наша сессия будет сохранять объект, который ей передаем
        session.persist(part);
        //logger.info("Part successfully saved. Part details: " + part);
    }

    @Override
    public void updatePart(Part part) {
        Session session = sessionFactory.getCurrentSession();
        //наша сессия будет обновлять объект, который ей передаем
        session.update(part);

    }

    @Override
    public void removePart(int id) {
        Session session = sessionFactory.getCurrentSession();
        Part part = (Part) session.get(Part.class, id);
        if (part != null)
            session.delete(part);

    }

    @Override
    public Part getPart(int id) {
        Session session = sessionFactory.getCurrentSession();
        Part part = (Part) session.get(Part.class, id);
        return part;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> getParts(Integer page) {
        Session session = sessionFactory.getCurrentSession();
        Criteria cq = session.createCriteria(Part.class);
        cq.setFirstResult((page - 1) * limitResultsPerPage);
        cq.setMaxResults(limitResultsPerPage);

        List<Part> partsList = cq.list();

        return partsList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> getParts(String name) {
        Session session = sessionFactory.getCurrentSession();
        Criteria cq = session.createCriteria(Part.class).add(Restrictions.eq("partName", name));

        List<Part> partsList = cq.list();

        return partsList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public int amountOfComp() {
        Session session = sessionFactory.getCurrentSession();
        Criteria cq = session.createCriteria(Part.class);

        List<Part> partsList = cq.list();
        int temp = 0;
        for(int i= 0; i < partsList.size(); i++){
            if (partsList.get(i).isNeed()) {
                temp = partsList.get(0).getAmount();
                break;
            }
        }
        for (Part part : partsList) {
            if (part.isNeed()) {
                if (part.getAmount() < temp) {
                    temp = part.getAmount();
                }
            }
        }
        return temp;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> filterOfParts(String filterValue) {
        Session session = sessionFactory.getCurrentSession();
        Criteria cq = session.createCriteria(Part.class);

        List<Part> partsList = cq.list();
        List<Part> list= new ArrayList<>();

        if (filterValue.equals("All")) {
            return partsList;
        }else {
            for (Part part : partsList) {
                if (filterValue.equals("Optional")) {
                    if (!part.isNeed()) {
                        list.add(part);
                    }
                }
                else if (filterValue.equals("Need")) {
                    if (part.isNeed()) {
                        list.add(part);
                    }
                }
            }
        }
        return list;
    }


}
