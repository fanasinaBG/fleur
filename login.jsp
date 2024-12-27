
<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="initial-scale=1, width=device-width">
  	<link rel="stylesheet"  href="assets/css/login.css" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@500;600;700&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" />
</head>
<body>
	<form action="Traitement/log.jsp" method="POST">
  	<div class="login">
    		<div class="wrapper">
      			<div class="st">
        				<div class="text">
          					<b class="sign-up">Se connecter</b>
          					<div class="please-fill-your">Veuiller remplir les champs </div>
        				</div>
        				<div class="form">
          					<div class="name">
            						<div class="bg">
										<input type="text" name="nom" placeholder="Nom">
										<img class="iconlyboldprofile" alt="" src="assets/icon/Profile.svg">
            						</div>
          					</div>
          					<div class="name">
            						<div class="bg">
										<input type="text" name="email" placeholder="E-mail">
										<img class="envelope-light-solid" alt="" src="assets/icon/Solid.svg">
            						</div>
            						
									
          					</div>
        				</div>
      			</div>
				  <button type="submit">Se connecter</button>
      			<div class="nd">
        				<div class="text5">
          					<div class="text6">
            						<div class="div">Don't have an account?</div>
          					</div>
          					<div class="login-btn">
								<div class="login-to-your">
									<a href="inscription.jsp" style="text-decoration: none; color: inherit;">Create an account</a>
								</div>
          					</div>
        				</div>
      			</div>
    		</div>
    		<div class="left">
      			<img class="unsplashe2i7hftb-ri-icon" alt="" src="assets/images/unsplash_E2i7Hftb_rI.png">
      			</div>
				
  	</div> 
</form>	
</body>
</html>