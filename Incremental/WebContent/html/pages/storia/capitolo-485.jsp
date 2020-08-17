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
	        
			$(document).ready(function () {
				$('#to485').click(function () {				
					var url = "/Incremental/game?toPage=capitolo-485"
		            //window.location.href = url;
		            alert('url')
		            return false;
					
				});	
				
			});		
		
</script>






<div class="div-main-title">CAPITOLO 485</div>	
<br>
<div class="div-main-page">
	
	
	<!--  <div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
		<span id="idDiz">
				
		</span>
	</div>-->
	
	
</div>		
	
	
	
	
