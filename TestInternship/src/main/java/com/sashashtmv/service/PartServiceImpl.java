package com.sashashtmv.service;

import com.sashashtmv.dao.PartDao;
import com.sashashtmv.model.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PartServiceImpl implements PartService {
    private PartDao partDao;

    @Autowired
    public void setPartDao(PartDao partDao) {
        this.partDao = partDao;
    }

    @Override
    @Transactional
    public void addPart(Part part) {
        this.partDao.addPart(part);
    }

    @Override
    @Transactional
    public void updatePart(Part part) {
        this.partDao.updatePart(part);
    }

    @Override
    @Transactional
    public void removePart(int id) {
        this.partDao.removePart(id);
    }

    @Override
    @Transactional
    public Part getPart(int id) {
        return this.partDao.getPart(id);
    }

    @Override
    @Transactional
    public List<Part> getParts(Integer page) {
        return this.partDao.getParts(page);
    }

    @Override
    @Transactional
    public List<Part> getParts(String name) {
        return this.partDao.getParts(name);
    }

    @Override
    @Transactional
    public int amountOfComp() {
        return this.partDao.amountOfComp();
    }

    @Override
    @Transactional
    public List<Part> filterOfParts(String filterValue){
        return this.partDao.filterOfParts(filterValue);
    }
}
