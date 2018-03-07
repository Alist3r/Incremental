<%@page import="java.util.*"%>
<%@page import="oggetti.*"%>
<%@page import="utility.*"%>


<!DOCTYPE html>

<script type='text/javascript' src='/Incremental/dwr/engine.js'></script>
  	<script type='text/javascript' src='/Incremental/dwr/interface/CCService.js'></script>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/tooltipster.bundle.min.js"></script>



<script>
	        $(document).ready(function() {
	        	
	        	$('#tableDizionario').hide();
	        	
	        	$('.tip').click(function() {
	        		var codParola = this.getAttribute("id");
	        		var desc = "";
	        		var parola = "";
	        		
	        		$('#tableDizionario').hide('slide',500);
	        		
	        		CCService.dizionarioGetDescrizione(codParola, {
	        			callback: function(result) {
	        						desc = result; 
	        					  },
	        			async: false
	        		});
	        		
	        		CCService.dizionarioGetParola(codParola, {
	        			callback: function(result) {
	        						parola = result; 
	        					  },
	        			async: false
	        		});
	        		
	        		$('#tdParolaDizionario').html(parola);
	        		$('#tdDescDizionario').html(desc);
	        		
	        		$('#tableDizionario').show('slide',500);
	        		
	       
	        		
			
		        });
	        });
	        
	        
</script>






<div class="div-main-title">Prologo</div>	
<br>
<div class="div-main-page">
	Finalmente arrivava il momento.
	<br>
	Era passato circa un anno dall'annuncio che aveva scosso tutto il mondo videoludico e non solo.
	<br>
	Avevano promesso di rivoluzionare il concetto di videogioco e di realtà virtuale; avevano promesso che più nulla sarebbe stato come prima. Sembrava che le promesse le avessero 
	rispettate tutte quante.
	<br>
	L'anno prima non avevi dormito un'intera notte, pur di riuscire a prenotatare uno dei primi kit distribuiti e ieri era arrivato, insieme all'apertura del server. Eri però riuscito 
	solo ad effettuare la registrazione, poi il server era andato in crash. Troppi utenti, troppi pochi stress-test forse.
	<br>
	Avevi quindi deciso di rimandare al giorno dopo, godendoti con calma l'esperienza. Ma ora eri li, seduto sulla tua comoda sedia da gaming; il kit davanti ai tuoi occhi, tutte le 
	componenti collegate e pronte all'uso. Il kit era così composto:
	<ul>
		<li> <div id="DZVRDR" class="tip">Virtual Drive</div> </li>
		<li> <div id="DZVRGR" class="tip">Virtual Gear</div></li>
		<li> Cavetteria varia</li>
	</ul>
	Difficile da credere che così pochi componenti potessero realizzare quel che si era visto nei video diffusi nei mesi precedenti. Eccola, la prima rivoluzione: era necessario 
	solamente collegarsi alla rete internet, avere i dispositivi carichi, indossarli ed adagiarsi dove più si è comodi. E' il Virtual Drive a fare tutto il lavoro: <i>stimolazione neuronale</i>.
	Acceso il dispositivo, il primo input, detto <i>Start Input</i>, ti induceva in un sonno profondo; dopodichè venivi catapultato nel server virtuale, dove aveva inizio il gioco. 
	Come sarebbe stato il gioco, lo avresti scoperto di li a poco. 
	
	<div class="div-game-tip">
	TIP: se vedi qualche parola interessante, che stimola la tua curiosità, prova a farci un click sopra. Potresti scoprire approfondimenti sul mondo di gioco, consigli utili e 
	addirittura, in alcuni casi, guadagnare punti crescita (PC).
	</div>
	
	<!--  <div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
		<span id="idDiz">
				
		</span>
	</div>-->
	
	
</div>		
	
	
	
	
