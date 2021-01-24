using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReplacementShaderEffect : MonoBehaviour
{

    public Color color;

    public float slider;

    public Shader ReplacementShader;

    
    
    
    private void OnValidate()
    {
        Shader.SetGlobalColor("_Color_1", color);
    }


    private void Update()
    {
        Shader.SetGlobalFloat("_Temp", slider);
    }

    private void OnEnable()
    {
        if (ReplacementShader != null)
        {
            GetComponent<Camera>().SetReplacementShader(ReplacementShader,"");
        }
    }

    private void OnDisable()
    {
        GetComponent<Camera>().ResetReplacementShader();
    }
}
