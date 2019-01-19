package com.sashashtmv.controller;


import java.util.List;
import com.sashashtmv.model.Part;
import com.sashashtmv.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class PartController {
	private PartService partService;

	@Autowired
	public void setPartService(PartService partService) {
		this.partService = partService;
	}

	@RequestMapping(value = "parts", method = RequestMethod.GET)
	public String listParts(@RequestParam(value="page", required = false) Integer page, Model model) {
		if (page == null) page = 1;
		model.addAttribute("part", new Part());
		model.addAttribute("searchedpart", new Part());
		model.addAttribute("listParts", partService.getParts(page));
		model.addAttribute("page", page);
		model.addAttribute("amountOfComp", partService.amountOfComp());

		return "parts";
	}

	@RequestMapping(value = "/parts/add", method = RequestMethod.POST)
	public String addPart(@ModelAttribute("part") Part part) {
		if(part.getId() == 0){
			partService.addPart(part);
		}
		else {
			partService.updatePart(part);
		}

		return "redirect:/parts";
	}
	@RequestMapping(value = "/parts/edit", method = RequestMethod.POST)
	public String editPart(@ModelAttribute("part") Part part) {
		partService.updatePart(part);

		return "redirect:/parts";
	}

	@RequestMapping("/remove/{id}")
	public String removePart(@PathVariable("id") int id) {
		partService.removePart(id);

		return "redirect:/parts";
	}

	@RequestMapping("edit/{id}")
	public String editPart(@PathVariable("id") int id, @RequestParam(value="page", required = false) Integer page, Model model) {
		if (page == null) page = 1;
		model.addAttribute("part", partService.getPart(id));
		model.addAttribute("searchedpart", new Part());
		model.addAttribute("listParts", partService.getParts(page));
		model.addAttribute("page", page);

		return "editpart";
	}

	@RequestMapping("addpart")
	public String createPart(@ModelAttribute Part part) {

		return "addpart";
	}

	@RequestMapping(value="searchresults", method = RequestMethod.POST)
	public String searchResults(@ModelAttribute("searchedpart") Part part, Model model) {
		List<Part> searchResult = partService.getParts(part.getPartName());
		model.addAttribute("listParts", searchResult);

		return "searchresults";
	}

	@RequestMapping("filter")
	public String selectFilter(@ModelAttribute String filter) {

		return "filter";
	}

	@RequestMapping(value = "/parts/filter", method = RequestMethod.POST)
	public String filterMethod(@ModelAttribute("filter") String part, Model model) {
		List<Part> filterParts = partService.filterOfParts(part);
		model.addAttribute("listParts", filterParts);

		return "filterresult";
	}


}
