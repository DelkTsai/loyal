package com.loyal.weixin.service;

import com.loyal.weixin.bean.Permission;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.util.NutMap;

import java.util.Date;
import java.util.List;

//用户Service，处理用户的业务逻辑，数据库访问
@IocBean(fields = "dao")
public class PermissionService extends BaseService<Permission> {

    // 初始化数据库访问对象Dao

    // 数据库分页查询
    public NutMap find(Pager pager) {
        List<Permission> list = null;
        list = dao().query(Permission.class, null, pager);
        pager.setRecordCount(dao().count(Permission.class));
        return rsOk()
                .setv("pager", pager)
                .setv("list", list);
    }

    // 数据库添加操作
    public NutMap add(Permission obj) {
        try {
            obj.setCreateTime(new Date());
            obj.setUpdateTime(new Date());
            dao().insert(obj);
            return rsOk().setv("msg", "添加成功，权限：" + obj.getName());
        } catch (Exception e) {
            return rsFail().setv("msg", "添加失败，权限：" + obj.getName());
        }
    }

    // 数据库更新操作
    public NutMap edit(Permission obj) {
        try {
            obj.setUpdateTime(new Date());
            dao().update(obj);
            return rsOk().setv("msg", "修改成功，权限：" + obj.getName());
        } catch (Exception e) {
            return rsFail().setv("msg", "修改失败，权限：" + obj.getName());
        }
    }

    // 数据库删除数据操作
    public NutMap delete(Permission obj) {
        try {
            if("admin".equals(obj.getName())) return rsFail().setv("msg", "删除失败，禁止删除" + obj.getName());
            dao().delete(obj);
            return rsOk().setv("msg", "删除成功，权限：" + obj.getName());
        } catch (Exception e) {
            return rsFail().setv("msg", "删除失败，权限：" + obj.getName());
        }
    }


}
