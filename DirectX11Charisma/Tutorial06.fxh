
struct PSInput
{
    float4 pos : SV_POSITION;
};

cbuffer ColorBuffer : register(b0)
{
    float4 u_color; // RGBA color
};

PSInput VS(float4 input: POSITION)
{
    PSInput output;
    output.pos = input;
    return output;
}

float4 PS(PSInput input) : SV_TARGET
{

    return u_color;
}