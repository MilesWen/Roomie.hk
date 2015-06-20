This is the root folder. Folder structure as follows:

\BulletinBoard_Django	:	root folder
	__init__.py
	settings.py			: 	system-wide settings
	urls.py				:	system-wide url routing
	wsgi.py				:	Web Server Gateway Interface
	README.txt
\bulletin 				:	folder for application/package: bulletin
	__init__.py
	admin.py			:	admin panel
	views.py			:	views (controllers in Rails language)
	models.py			:	DB model
	urls.py				:	url routing for bulletin
	tests.py			:	website testers
	utils.py			:	helper functions (view this as some customized liraries)
	\static				:	folder for static resources
		\bulletin
			\css		:	stylesheets all stay here
			\images		:	image assets stay here
			\js			:	javascripts stay here
	\templates
		\bulletin 		:	all templates (views in Rails language) stay here
			base.html	:	base html for all pages
			listing.html	:	bulletin listing page
			details.html	:	bulletin details page
			preferences.html	:	user preferences page
			profile.html	:	user profile page
			login.html		:	user login page
	\migrations			:	DB migration files
fake_data.py 			:	fake data into database
manage.py 				:	main Django script engine
README.txt 				:	dude you are reading it now
Process Flowchart.graffle	: source file for program process
Process Flowchart.pdf	:	pdf version of the flowchart
requirements.txt		:	python packages installed on my machine