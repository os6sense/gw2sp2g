# == description: Responsible for generating the main "index" page, tying all the other components together.
# The "main" of the application
require 'erb'
require_relative 'page_fragments'
require_relative 'highest_return'

def random_background
    urls = ["https://d3b4yo2b5lbfy.cloudfront.net/wp-content/uploads/wallpapers/GW2Warrior02-1280x960.jpg",
        "https://d3b4yo2b5lbfy.cloudfront.net/wp-content/uploads/wallpapers/HumanBonusWP02-1280x960.jpg",
        "https://d3b4yo2b5lbfy.cloudfront.net/wp-content/uploads/wallpapers/Sylvari-02-1280x960.jpg",
        "https://d3b4yo2b5lbfy.cloudfront.net/wp-content/uploads/wallpapers/AsuraCharacter-1280x960.jpg",
        "https://d3b4yo2b5lbfy.cloudfront.net/wp-content/uploads/wallpapers/GW2_ThiefWallpaper01-1280x960.jpg"
    ]
    "#{urls.sample}"
end

def generate_page

        # Somewhat ugly however this is required to ensure we have the latest prices
        MFRRecipe.reset_components

        # These recipes are generated before the template is created in order to allow
        # for us to determine the highest returns from common crafting materials
        #  and place this information at the head of the html
        $top5 = HighestReturn.new
        fine_frag = fine_crafting_materials
        common_frag = common_crafting_materials

	page_template = %{
		<html>
		<head>
			<title></title>
			<link rel="stylesheet" type="text/css" href="css/gw2sp2g.css">
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
			<script type="text/javascript" src="javascript/jExpand.js"></script>
                        <style>
                            body {
                                background: url('<%= random_background %>') no-repeat center center fixed; 
                                -webkit-background-size: cover;
                                -moz-background-size: cover;
                                -o-background-size: cover;
                                background-size: cover;
                            }
                        </style>
		</head>
		<body>
                <div id="nav">
                    <ul>
                        <li><a href="">Common materials</a></li>
			<li><a href="">Fine materials</a></li>
			<li><a href="">Dust</a></li>
			<li><a href="">Lodestones</a></li>
			<li><a href="#Mystic Weapons">Mystic weapons</a></li>
			<li><a href="#Pendants">Pendants</a></li>
			<li><a href="#Mystic Forge Recipes">Mystic forge recipes</a></li>
                    </ul>
                </div>
		<div id="wrapper">
			<h1>Skill Point To Gold Values - ALPHA VERSION</h1>
			<p id="intro">
                                ** Please note that this is a work in progress and no guarantees are made as to the accuracy of these figures.
                                <br/><br/>
                                UPDATE: 06/11/13
                                I'm about to tear down the AWS instance that has been serving this app BUT I hope to move it across to
                                a new box as part of a rubberized setup.<br/><br/>
                                <b>If this server vanishes check my github account for the new URL <a href="https://github.com/os6sense/gw2sp2g">https://github.com/os6sense/gw2sp2g</a><br/><br/></b>
                                I've 95.1% finished with a first pass of the backend - I'm using this project as a way to learn ruby 
                                (<a href="https://github.com/os6sense/gw2sp2g">souce code available on github</a> - critical comments appreciated)
                                and the next step there will be to create a rails version. I'm very unhappy with the presentation of the tables 
                                hence I want to try and better convey the information the pages contain. Expect the site to be all over the place 
                                the next few days while I play with css and various js frameworks.
                                <br/>
                                <br/>
				This page shows the current values of conversions that you can make using skill points at the Mystic Forge.
                                It uses prices from gw2spidy which are refreshed every 15 minutes, hence there my be some difference between
                                current trading post values/costs and those displayed. <br/><br/>
				Costs are provided illustrating the price based on both buying via a buy order or buying instantly.
                                Value is displayed showing the current trading post sale price before taxes.
				Profit per SP is calculated after all taxes and fees have been deducted and is based on selling at the current
                                \"Buy it instantly\" price on the trading post.
				<br/>
				<br/>

			</p>
			<%= top5 %>
			<p>NB: Average common yield assumed to be 20 for T5->T6 and 80 for all lower tiers.</p>
			<%= common_frag%>

			<p>NB: Average Fine yield assumed to be 6 for T5->T6. Lower tier yield is set to 16 although the accuracy of this is unknown.<p>
			<%= fine_frag %>
			<%= dust %>
			<%= lodestones %>
			<%= mystic_weapons %>
			<%= gifts %>
			<%= pendants %>
			<%= mystic_forge_recipes %>
		</div>
		</body>
		</html>
	}

	ERB.new(page_template).result(binding)
end

if $DEBUG
    print generate_page
end
