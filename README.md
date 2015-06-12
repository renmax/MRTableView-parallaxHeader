# MRTableView
a subclass of UITableView with parallaxheader

 
## Brief 
   
   MRTableView is a subclass of UITableView. just use it as UITableView.
   
   
## Usage 

   Just drag MRTableView.h and MRTableView.m into your project. #import "MRTableView.h" at your file where you want
   to use MRTableView.
  
       MRTableView *tableView = [[MRTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
       tableView.MRDelegate = self;
       tableView.dataSource = self;
   
    
     ##note
    "you should use MRDelegate  instead of delegate, the rest just the same as you use UITablView".  
   
         
    
       
  
## Result 

    
   ![img_0175](https://cloud.githubusercontent.com/assets/8423149/6499906/e27ef27e-c33d-11e4-9d23-6222adb769e1.PNG)


## License
   
   This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>
     
     
  
