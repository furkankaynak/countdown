
countdown = ({years,
                months,
                days,
                hours,
                minutes,
                seconds,
                format,
                hasFinished,
                onTick,
                onTock
                }) ->
    years ?= "" ; months ?= "" ; days ?= "" ; hours ?= "" ; minutes ?= "" ; seconds ?= ""
    format ?= "`D gun/`M months/`Y years `H hours-`m minutes-`S seconds left"
    
    hasFinished ?= -> 
        alert "asd"
    onTick ?= -> 
        console.log("tick !!")
    onTock ?= ->
        console.log("tock !!")
        
    year2secCoef = 31557600 ; month2secCoef = 2678400 ; day2secCoef = 86400 ; hour2secCoef = 3600 
        
    time = (years*year2secCoef) + (months*month2secCoef) + (days*day2secCoef) + (hours*hour2secCoef) + (minutes * 60)+ seconds
    
    formatter = (realTime) ->
        dateText = format
        dateText = dateText.replace("`Y",~~(realTime/year2secCoef))
                    .replace("`M",~~((realTime%year2secCoef)/month2secCoef))
                    .replace("`D",~~(((realTime%year2secCoef)%month2secCoef)/day2secCoef))
                    .replace("`H",~~((((realTime%year2secCoef)%month2secCoef)%day2secCoef)/hour2secCoef))
                    .replace("`m",~~(((((realTime%year2secCoef)%month2secCoef)%day2secCoef)%hour2secCoef)/60))
                    .replace("`S",~~(((((realTime%year2secCoef)%month2secCoef)%day2secCoef)%hour2secCoef)%60))
        document.getElementById("countdown").innerHTML = dateText
    
    timer = (time) ->
        to = setTimeout(->
          formatter(time)         
          if time > 0
            onTick()
            timer time - 1
            onTock()
          else
            hasFinished()
            clearTimeout to
        , 1000)
        to
    timer(time) 