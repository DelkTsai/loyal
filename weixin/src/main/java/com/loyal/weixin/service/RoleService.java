package com.loyal.weixin.service;

import java.util.Date;
import java.util.List;

import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.IocBean;

import com.loyal.weixin.bean.Role;
import org.nutz.lang.util.NutMap;

//用户Service，处理用户的业务逻辑，数据库访问
@IocBean(fields = "dao")
public class RoleService extends BaseService<Role> {

    // 初始化数据库访问对象Dao

    // 数据库分页查询
    public NutMap find(Pager pager) {
        List<Role> list = null;
        list = dao().query(Role.class, null, pager);
        pager.setRecordCount(dao().count(Role.class));
        return rsOk().setv("pager", pager).setv("list", list);
    }

    // 数据库添加操作
    public NutMap add(Role role) {
        try {
            role.setCreateTime(new Date());
            role.setUpdateTime(new Date());
            dao().insert(role);
            return rsOk().setv("msg", "添加成功，角色名：" + role.getName());
        } catch (Exception e) {
            return rsFail().setv("msg", "添加失败，角色名：" + role.getName());
        }
    }

    // 数据库更新操作
    public NutMap edit(Role role) {
        try {
            role.setUpdateTime(new Date());
            dao().update(role);
            return rsOk().setv("msg", "修改成功，角色名：" + role.getName());
        } catch (Exception e) {
            return rsFail().setv("msg", "修改失败，角色名：" + role.getName());
        }
    }

    // 数据库删除数据操作
    public NutMap delete(Role role) {
        try {
            if("admin".equals(role.getName())) return rsFail().setv("msg", "删除失败，禁止删除" + role.getName());
            dao().delete(role);
            return rsOk().setv("msg", "删除成功，角色名：" + role.getName());
        } catch (Exception e) {
            return rsFail().setv("msg", "删除失败，角色名：" + role.getName());
        }
    }


}
