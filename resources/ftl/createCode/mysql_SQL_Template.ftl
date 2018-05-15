
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `${tabletop}`
-- ----------------------------
DROP TABLE IF EXISTS `${tabletop}`;
CREATE TABLE `${tabletop}` (
	<#list fieldList as var>
		<#if var[1] == 'Integer'>
		`${var[4]}` int(11) NOT NULL COMMENT '${var[2]}',
		<#else>
		`${var[4]}` varchar(255) DEFAULT NULL COMMENT '${var[2]}',
		</#if>
		<#if var[5]=='PRI'>
		PRIMARY KEY (`${var[4]}`)
		</#if>
	</#list>
  		
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
