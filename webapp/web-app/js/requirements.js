		$(document).ready(function()
		{
			$("#selectall").click(function()				
			{
				var checked_status = this.checked;
				$("input[name=chosen]").each(function()
				{
					this.checked = checked_status;
				});
			});					
		});		

		$(document).ready(function()
		{
			$("#selectall2").click(function()				
			{
				var checked_status = this.checked;
				$("input[name=chosen2]").each(function()
				{
					this.checked = checked_status;
				});
			});					
		});		