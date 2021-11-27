shader_type canvas_item;
uniform float speed = 3.0;
uniform vec4 tintColor : hint_color;
uniform float glowFactor = 3.0;

void fragment(){
	vec2 uv = UV - vec2(TIME, 0) * speed;
	COLOR.rgb = tintColor.rgb * glowFactor;
	COLOR.a = texture(TEXTURE, uv).r;
}