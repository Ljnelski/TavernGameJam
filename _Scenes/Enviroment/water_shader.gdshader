shader_type spatial;

uniform sampler2D water_wave;
uniform vec3 base_colour : source_color;
uniform vec3 wave_colour : source_color;

uniform vec2 water_flow_dir;
uniform float strength;

void fragment() {	
	vec2 _uv = UV;
	vec3 texture_sample = texture(water_wave, _uv).rbg;	
		
	float wave_x = sin(TIME * 0.5 + (_uv.x + _uv.y) * 1.0);
	float wave_y = cos(TIME * 0.5 + (_uv.x - _uv.y) * 1.0);
	
	float wiggle_x = cos(TIME * 0.1 + texture_sample.x * 0.15);
	float wiggle_y = sin(TIME * 0.1 + texture_sample.y * 0.15);
	
	_uv.x += (wave_x + wiggle_x) * strength/1000.0 + TIME * water_flow_dir.x; 
	_uv.y += (wave_y + wiggle_y) * strength/1000.0 + TIME * water_flow_dir.y; 
	
	ALBEDO = mix(base_colour, wave_colour, texture(water_wave, _uv).rbg);
}
