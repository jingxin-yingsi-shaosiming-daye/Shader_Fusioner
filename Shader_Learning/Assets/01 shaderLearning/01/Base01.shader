Shader "Shader01/Base01"
{


    Properties
    {

        _MainTex("Texture" ,2D) = "white"


    }



    SubShader
    {
        Tags
        {
            "RenderType"="Plane"
        }


        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };


            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }


            sampler2D _MainTex;

            fixed4 frag(v2f i) : SV_Target
            {
                // sample the texture

                //1 全白
                //fixed4 col = float4(i.uv.r, i.uv.g, 1, 1);

                //2 取贴图
                // fixed4 col = tex2D(_MainTex,i.uv);    

                //3 sin7彩
                /*fixed4 col = float4(i.uv.r * abs(_SinTime.w),
                                   i.uv.g * abs(_SinTime.y),
                                   abs(_SinTime.z),
                                   1);*/

                //4 切割
                float2 moveCoord;
                if((i.uv.y * 10) % 2 > 1 )
                    moveCoord = float2(i.uv.x - 0.1 * _SinTime.w, i.uv.y);
                else
                    moveCoord = float2(i.uv.x + 0.1 * _SinTime.w, i.uv.y);

                float4 col = tex2D(_MainTex, moveCoord);

                return col;
            }
            ENDCG
        }
    }
}