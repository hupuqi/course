package com.fh.entity.${packageName}.${objectNameLower};

import java.util.Date;

public class ${objectName}{

	<#list fieldList as var>
		private ${var[2]} ${var[0]};//${var[3]}
		
		
	</#list>
	<#list fieldList as var>
		
		public ${var[2]} get${var[0]?cap_first}(){
			return ${var[0]};
		}
		
		public void set${var[0]?cap_first}(${var[2]} ${var[0]}){
			this.${var[0]}=${var[0]};
		}
		
	</#list>

}