# CustomNavigationBarDemo
CustomNavigationBar view with storyboard and block base structure. 
- Easy to use 
- Easy to implement 
- Easy to modification
- Easy to add your style
- Run time and storyboard on apply style,color etc

## Screen shots

![Image 1](/../master/Simulator Screen Shot 28-Dec-2016, 12.34.45 PM.png?raw=true "Optional Title")

![Image 2](/../master/Simulator Screen Shot 28-Dec-2016, 12.34.48 PM.png?raw=true "Optional Title")

![Image 3](/../master/Simulator Screen Shot 28-Dec-2016, 12.34.51 PM.png?raw=true "Optional Title")

![Image 4](/../master/Simulator Screen Shot 28-Dec-2016, 12.34.55 PM.png?raw=true "Optional Title")


## Usages






handleBlockAction method perform button action.

```
 weak var weakSelf = self
 navContainer.navView.handleBlockAction { (sender, navTapped, button) in
            if navTapped == .LeftBtn1{
              // Add your code here
              ...
            }else if navTapped == .RightBtn1{
               // Add your code here
               ...
            }
            
        }
        
```






