countdown
=========

What
----
`countdown` is a counter implementation written in CoffeeScript

Why
---
This library implemented for self use 


How
---
`countdown` works without Date objects.It works on integer values in a recursive approach.

With
----
Coffeescript : coffeescript.org


Sample : http://jsfiddle.net/furkankaynak/WrEfz/

Usage
---

```html
<span id="countdown"></span>
```

 ```javascript
 countdown
    years: 300,
    hours: 23,
    minutes: 58,
    seconds: 100,
    hasFinished: -> 
        alert "Finished"    
 ```
 
  ```javascript
 countdown
    date: new Date(2014,1,1),
    selector: "countdown",
    format: "`Y year `M month `D day `H hours `m minutes `S seconds left",
    hasFinished: -> 
        alert "Finished"    
 ```
 
 `selector` must be id. Default selector id `countdown`

Formatting

`Y - Year

`M - Month

`D - Day

`H - Hours

`m - Minutes

`S - Seconds
 
 Author
 ---
 Furkan Kaynak
 
 furkankaynak.74@gmail.com

    
