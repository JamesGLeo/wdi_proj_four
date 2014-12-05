```
_                                 ____ _
| |    ___ _ __ ___  _   _ _ __   / ___| | ___  ___ _   _ _ __ ___  ___
| |   / _ \ '_ ` _ \| | | | '__| | |   | |/ _ \/ __| | | | '__/ _ \/ __|
| |__|  __/ | | | | | |_| | |    | |___| | (_) \__ \ |_| | | |  __/\__ \
|_____\___|_| |_| |_|\__,_|_|     \____|_|\___/|___/\__,_|_|  \___||___/
```


###`Service` application... meet `Client` application
- The web-development industry is favoring a separation between `service` and `client` applications.  Why?!  Well... given this separation, the `service` can be consumed by multiple `clients`.  For example, a phone application, a browser, other web applications.  In this project, you will build your own `service` and `client` applications.

---

###Three Stage Long-Term Project
- 1. Build a `Service` (MVP by 12/8)
- 2. Build a `Client` application that consumes the `Service` (MVP by 12/15)
- 3. Document, polish, present as portfolio piece

---

`Service` Stack options:  
- Ruby/Sinatra
- Ruby/Rails
- Node/Hapi
- Node/Express

`Client` Stack options:  
- Backbone with:
  - Ruby/Sinatra
  - Ruby/Rails
  - Node/Hapi
  - Node/Express

---

###Service:
- A `Service`, in this project, will be an assortment of json endpoints which provide data and/or compute something given input data
  - Examples:
    - Data API:
      - Find large dataset without an existing API
        - Search for interesting csv files for example
      - Process the data and provide API
        - For example...
          - ... what taxi trip was the most expensive in 2013? (and other taxi-related questions)
          - ... how many people ordered the veal? (and other restaurant-related questions)
          - ... how many flights were delayed due to the snow on Thanksgiving 2014? (and other flight-related questions)
          - ... what is the average yearly precipitation in Zimbabwe? (and other weather- or zimbabwe-related questions)
    - Service API:
      - Given some input data, provide processed response
        - For example...
          - ... a commenting service
          - ... a markov model for processing text (i.e. SkakeItSpeare)
          - ... a small restaurant's data on used tables, orders and food available

---

###Client:
- A `Client`, in this project, will be a JS-heavy browser-based application with focus on the user experience that interacts with a service via ajax.  We will be using `Backbone` for the `client` application.

---

####Extra-Challenge:
- Build a `Client` application using another `JS` library, i.e. other than `Backbone`, or with a `JS` framework, e.g. `Angularjs` or `Emberjs`


---

##Collaboration 
You have the option of working alone or with a group of your choosing.  If your groups will be larger than two people, please consult us before moving forward.

