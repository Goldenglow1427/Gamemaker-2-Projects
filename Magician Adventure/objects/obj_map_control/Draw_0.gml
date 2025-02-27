draw_set_color(c_white)

// Creating Connections.
for(var i=0; i<array_length(stage_list)-1; i++)
{
	if(stage_list[i] == stage_list[i+1])
	{	
		for(var j=0; j<stage_list[i]; j++)
		{
			draw_line_width(
				hori_defa + hori_dist * i + 110,
				360-130/2*(stage_list[i]-1)+130*j,
				hori_defa + hori_dist * (i+1) - 110,
				360-130/2*(stage_list[i]-1)+130*j,
				5
			);
		}
	}
	else if(stage_list[i] < stage_list[i+1])
	{
		var cur_index = 0;
		for(var j=0; j<stage_list[i]; j++)
		{
			for(var k=0; k<connect_list[i][j]; k++)
			{
				draw_line_width(
					hori_defa + hori_dist * i + 110,
					360-130/2*(stage_list[i]-1)+130*j,
					hori_defa + hori_dist * (i+1) - 110,
					360-130/2*(stage_list[i+1]-1)+130*cur_index,
					5
				);
				cur_index++;
			}
		}
	}
	else if(stage_list[i] > stage_list[i+1])
	{
		var cur_index = 0;
		for(var j=0; j<stage_list[i+1]; j++)
		{
			for(var k=0; k<connect_list[i][j]; k++)
			{
				draw_line_width(
					hori_defa + hori_dist * (i+1) - 110,
					360-130/2*(stage_list[i+1]-1)+130*j,
					hori_defa + hori_dist * i + 110,
					360-130/2*(stage_list[i]-1)+130*cur_index,
					5
				);
				cur_index++;
			}
		}
	}
	else
	{
		show_debug_message("What the fuck");
		game_end(-1);
	}
}
