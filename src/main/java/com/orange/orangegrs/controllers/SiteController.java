package com.orange.orangegrs.controllers;

import com.orange.orangegrs.entities.Site;
import com.orange.orangegrs.services.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/sites")
public class SiteController {

    @Autowired
    SiteService siteService;


    @GetMapping(name = "/")
    public List<Site> getAllSites(){
        return this.siteService.findAll();
    }


    @GetMapping("/{code}")
    public List<Site> getAllBySiteCode(@PathVariable String code){
        return this.siteService.findBySiteCode(code);
    }
}
