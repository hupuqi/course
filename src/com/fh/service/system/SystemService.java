package com.fh.service.system;

import com.fh.dao.DaoSupport;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("systemService")
public class SystemService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    public List<PageData> searchTableByName(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("SystemMapper.searchTableByName", pd);
    }
    public List<PageData> searchTableNameByBase() throws Exception {
        return (List<PageData>) dao.findForList("SystemMapper.searchTableNameByBase", null);
    }
    
}
