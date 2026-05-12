
struct PSInput
{
    float4 pos : SV_POSITION;
    float2 texCoord : TEXCOORD0;
};

cbuffer cbPerObject
{
    float4x4 WVP;
};

Texture2D texture0;
SamplerState PointSampler;

PSInput VS(float4 input : POSITION, float2 texCoord : TEXCOORD0)
{
    PSInput output;
    output.pos = mul(input, WVP);
    output.texCoord = texCoord;
    return output;
}

float4 PS(PSInput input) : SV_TARGET
{
    return texture0.Sample(PointSampler, input.texCoord);
}