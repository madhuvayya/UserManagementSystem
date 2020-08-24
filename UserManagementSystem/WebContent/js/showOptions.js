/**
 * 
 */
   function showOptions(input)
    {  
         var div = document.getElementById(input);  
         if (div.style.display !== "none") 
         {  
             div.style.display = "none";  
         }  
         else
         {  
             div.style.display = "block";  
         }  
    }