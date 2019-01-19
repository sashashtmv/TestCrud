package com.sashashtmv.service;

import com.sashashtmv.model.Part;


import java.util.List;

public interface PartService {
    void addPart(Part part);

    void updatePart(Part part);

    void removePart(int id);

    Part getPart(int id);

    List<Part> getParts(Integer page);

    List<Part> getParts(String name);

    int amountOfComp();

    List<Part> filterOfParts(String filterValue);


}
