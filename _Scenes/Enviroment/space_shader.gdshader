shader_type spatial;

uniform sampler2D star_map;
uniform vec3 base_colour : source_color;
uniform vec3 star_colour : source_color;

uniform vec2 space_move_direction;

void fragment() {	
	vec2 _uv = UV;
	
	_uv.x += TIME * space_move_direction.x;
	_uv.y += TIME * space_move_direction.y;
	
	ALBEDO = mix(base_colour, star_colour, texture(star_map, _uv).rbg);
	ROUGHNESS = 1.0;
	METALLIC = 1.0;
}

