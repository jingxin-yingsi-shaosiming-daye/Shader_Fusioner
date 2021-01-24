Shader "Shader02/Base02"
{


    Properties
    {

        /*_MainTex("Texture" ,2D) = "white"
        
        
        _Color_1("Color", color) = (1,1,1,1)
        
        _Temp("Float" , Float) =1*/




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
                float depth : DEPTH;
            };


            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.depth = - (mul(UNITY_MATRIX_MV, v.vertex).z) * _ProjectionParams.w;
                return o;
            }


            sampler2D _MainTex;

            float4 _Color_1;

            float _Temp;


            fixed4 frag(v2f i) : SV_Target
            {
                float4 col;
                float invert = 1 - i.depth;
                // col = float4(invert * _Color_1.r * _Temp, invert * _Color_1.g * _Temp, invert * _Color_1.b * _Temp, 1);

                if (abs(i.depth - _Temp / 2) < 0.005)
                {
                    col = fixed4(invert * 20*  _Color_1.r , _Color_1.g, _Color_1.b, 1);
                }
                else
                {
                    col = fixed4(invert * _Color_1.r*0.5 , _Color_1.g*0.5, _Color_1.b*0.5, 1);
                }

                return col;
            }
            ENDCG
        }
    }
}