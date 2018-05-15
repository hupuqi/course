<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${objectName}Mapper">
	
	
	<!-- 新增-->
	<insert id="save" parameterType="pd">
		insert into ${tabletop}(
	<#list fieldList as var>
			${var[4]}<#if var_has_next>,</#if>	
	</#list>
			
		) values (
	<#list fieldList as var>
			${r"#{"}${var[0]}${r"}"}<#if var_has_next>,</#if>
	</#list>
			
		)
	</insert>
	
	
	<!-- 删除-->
	<delete id="delete" parameterType="pd">
		delete from ${tabletop}
		where 
		<#list fieldList as var>
			<#if var[5]=='PRI'>
				${var[4]}= ${r"#{"}${var[0]}${r"}"}
			</#if>
		</#list>
			
	</delete>
	
	
	<!-- 修改 -->
	<update id="edit" parameterType="pd">
		update  ${tabletop}
			set 
	<#list fieldList as var>
		${var[4]} = ${r"#{"}${var[0]}${r"}"}<#if var_has_next>,</#if>
	</#list>
			where 
	<#list fieldList as var>
	<#if var[5]=='PRI'>
		${var[4]} = ${r"#{"}${var[0]}${r"}"}
	</#if>
	</#list>
	</update>
	
	
	<!-- 通过ID获取数据 -->
	<select id="findById" parameterType="pd" resultType="pd">
		select 
	<#list fieldList as var>
			${var[4]}<#if var_has_next>,</#if>	
	</#list>
			
		from 
			${tabletop}
		where 
	<#list fieldList as var>
		<#if var[5]=='PRI'>
			${var[4]} = ${r"#{"}${var[0]}${r"}"}
		</#if>
	</#list>
	</select>
	
	
	<!-- 列表 -->
	<select id="datalistPage" parameterType="page" resultType="pd">
		select
		<#list fieldList as var>
				a.${var[4]}<#if var_has_next>,</#if>	
		</#list>
		from 
				${tabletop} a
	</select>
	
	<!-- 列表(全部) -->
	<select id="listAll" parameterType="pd" resultType="pd">
		select
		<#list fieldList as var>
				a.${var[4]}<#if var_has_next>,</#if>		
		</#list>
		from 
				${tabletop} a
	</select>
	
	<!-- 批量删除 -->
	<delete id="deleteAll" parameterType="String">
		delete from ${tabletop}
		where 
	<#list fieldList as var>
		<#if var[5]=='PRI'>
			${var[4]} 
		</#if>
	</#list> in
		<foreach item="item" index="index" collection="array" open="(" separator="," close=")">
                 ${r"#{item}"}
		</foreach>
	</delete>
	
</mapper>