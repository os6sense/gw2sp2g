# == description: Responsible for generating the main "index" page, tying all the other components together.
# The "main" of the application
require 'erb'
require_relative 'page_fragments'

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
                                ** Please note that this is a work in progress and no guarantees are made as to the accuracy of these figures. <br/><br/>
				This page attempts to show the current values of conversions that you can make using skill points at the Mystic Forge. It uses prices from gw2spidy which are refreshed every 15 minutes, hence there my be some difference between current trading post values/costs and those displayed. <br/><br/>
				Costs are provided illustrating the price based on both buying via a buy order or buying instantly. Value is displayed showing the current trading post sale price before taxes.
				Profit per SP is calculated after all taxes and fees have been deducted and is based on selling at the current \"Buy it instantly\" price on the trading post. 
				<br/>
				<br/>
				Please also note that their are no definative figures for yields on the lower tier recipies and thus these all default to 6 hence some of the T2-T5 recipies may yield a greater profit than is illustrated.

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
