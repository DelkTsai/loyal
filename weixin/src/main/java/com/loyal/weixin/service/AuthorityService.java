package com.loyal.weixin.service;

import com.loyal.weixin.bean.Role;
import com.loyal.weixin.bean.User;

/**
 * Created by Loyal on 2015/5/22.
 */
public interface AuthorityService {

    /**
     * 扫描RequiresPermissions和RequiresRoles注解
     * @param pkg 需要扫描的package
     */
    void initFormPackage(String pkg);

    /**
     * 检查最基础的权限,确保admin用户-admin角色-(用户增删改查-权限增删改查)这一基础权限设置
     * @param admin
     */
    void checkBasicRoles(User admin);

    /**
     * 添加一个权限
     */
    public void addPermission(String permission);

    /**
     * 添加一个角色
     */
    public Role addRole(String role);
}