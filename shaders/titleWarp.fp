// retooled from "func_warp1.fp" in uzdoom.pk3

vec2 GetFountainOffset(vec2 texCoord, float time, float timeSpanX, float timeSpanY, float magnitudeX, float magnitudeY)
{
	const float pi = 3.1415;
	float yMult = abs(0.5 - texCoord.y);
	return vec2(sin(-10 * pi * yMult + time) * magnitudeX * max(0, 0.7 - texCoord.y), 0);
}

vec4 ProcessTexel()
{
	vec2 texCoord = vTexCoord.st;
	vec2 offset = vec2(0,0);
	float curTimer = timer;
	float magnitudeX = 0.01;
	float magnitudeY = 0.01;
	
	offset = GetFountainOffset(texCoord, curTimer, 2, 8, magnitudeX, magnitudeY);
	vec4 layer1 = getTexel(texCoord + offset);
	offset = GetFountainOffset(texCoord, curTimer, 2, 8, -magnitudeX, magnitudeY);
	vec4 layer2 = getTexel(texCoord + offset);
	
	float secondLayerAlpha = 0.5;
	
	//return layer1;
	return secondLayerAlpha * layer2 + (1 - secondLayerAlpha) * layer1;
}