 countdown = ({date,
                year,
                month,
                day,
                hours,
                minutes,
                seconds,
                format,
                hasFinished,
                onTick,
                onTock,
                selector
                }) ->
    year ?= "" ; month ?= "" ; day ?= "" ; hours ?= "" ; minutes ?= "" ; seconds ?= "" ; selector ?= "countdown"
    format ?= "`Y year `M month `D day `H hours `m minutes `S seconds left"
    
    hasFinished ?= -> 
        console.log "Finished"
    onTick ?= -> 
        console.log "tick !!"
    onTock ?= ->
        console.log "tock !!"
        
    year2secCoef = 31536000 ; month2secCoef = 2628200 ; day2secCoef = 86400 ; hour2secCoef = 3600
    
    time = 0
    if(date?)
        now = new Date
        year = Math.abs(date.getFullYear() - now.getFullYear())
        month = Math.abs(date.getMonth() - now.getMonth())
        day = Math.abs(date.getDay() - now.getDay())
        hours = Math.abs(date.getHours() - now.getHours())
        minutes = Math.abs(date.getMinutes() - now.getMinutes())
        seconds = Math.abs(date.getSeconds() - now.getSeconds())
        
    time = (year*year2secCoef) + (month*month2secCoef) + (day*day2secCoef) + (hours*hour2secCoef) + (minutes * 60)+ seconds
    
    formatter = (realTime) ->
        dateText = format
        dateText = dateText.replace("`Y",~~(realTime/year2secCoef))
                    .replace("`M",~~((realTime%year2secCoef)/month2secCoef))
                    .replace("`D",~~(((realTime%year2secCoef)%month2secCoef)/day2secCoef))
                    .replace("`H",~~((((realTime%year2secCoef)%month2secCoef)%day2secCoef)/hour2secCoef))
                    .replace("`m",~~(((((realTime%year2secCoef)%month2secCoef)%day2secCoef)%hour2secCoef)/60))
                    .replace("`S",~~(((((realTime%year2secCoef)%month2secCoef)%day2secCoef)%hour2secCoef)%60))
        document.getElementById(selector).innerHTML = dateText
    
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