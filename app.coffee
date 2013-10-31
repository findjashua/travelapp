
###
Module dependencies.
###
cluster = require("cluster")
os = require ("os")
if cluster.isMaster
	numCpus = os.cpus().length
	for i in [0...numCpus]
		cluster.fork()

else
	express = require("express")
	routes = require("./routes")
	user = require("./routes/user")
	http = require("http")
	path = require("path")
	app = express()

	# all environments
	app.set "port", process.env.PORT or 3000
	app.set "views", __dirname + "/views"
	app.set "view engine", "jade"
	app.use express.favicon()
	app.use express.logger("dev")
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use app.router
	app.use express.static(path.join(__dirname, "public"))

	# development only
	app.use express.errorHandler()  if "development" is app.get("env")

	app.get '/', (req, res)->
		res.send 'server running'

	yelp = require './apis/yelp'
	google = require './apis/google'
	app.get '/yelp/:location/:term', yelp.listPlaces
	app.get '/google/:location', google.listPlaces

	http.createServer(app).listen app.get("port"), ->
	  console.log "Express server listening on port " + app.get("port")

