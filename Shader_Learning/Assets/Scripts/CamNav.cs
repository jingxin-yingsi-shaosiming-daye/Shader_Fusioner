using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CamNav : MonoBehaviour
{
   [SerializeField] private ReplacementShaderEffect _replacementShaderEffect;

   public float stepNum = 1;

   private void Update()
   {
      _replacementShaderEffect.slider += Time.deltaTime * stepNum;
      if (_replacementShaderEffect.slider > 2)
      {
         _replacementShaderEffect.slider -= 2;
      }
   }
}
