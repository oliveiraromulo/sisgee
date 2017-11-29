<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="import_head.jspf"%>

<style type="text/css">

div.container {
	margin-bottom: 2em;
}
form {
	margin-top: 50px;
}
fieldset.form-group {
	 border:1px solid #999999;
}
fieldset legend.col-form-legend {
	font-weight: bold;
}
div.form-row {
	padding: 0px 15px;
}

</style>

<title>
	<fmt:message key = "br.cefetrj.sisgee.resources.form.registroTermoAditivo"/>
</title>

</head>
<body>
	<%@include file="import_navbar.jspf"%>
	
	<div class="container">
		<c:if test="${ not empty msg }">
			<div class="alert alert-warning" role="alert">
				${ msg }
			</div>
		</c:if>

		<p class="tituloForm">

		<h5>		
			<fmt:message key = "br.cefetrj.sisgee.resources.form.registroTermoAditivo"/>
		</h5>		

		</p>		
		
		<form action=BuscaTermoAditivoServlet method="post">
			
			<fieldset class="form-group dadosAluno" >
				
				<%@include file="import_busca_aluno.jspf"%>
				<div class="container">
					

					<button type="submit" class="btn btn-primary"><fmt:message key = "br.cefetrj.sisgee.resources.form.listarAditivos"/></button>

				</div>				
				
			</fieldset>
		</form>
		
		<div class="container">
		<table class = "table table">
			
			<thead>		
				<tr>
					<th><fmt:message key = "br.cefetrj.sisgee.resources.form.dataRegistro"/></th>
					<th><fmt:message key = "br.cefetrj.sisgee.resources.form.cnpj"/></th>
					<th><fmt:message key = "br.cefetrj.sisgee.resources.form.razaoSocial"/></th>
				</tr>
			</thead>			
			<tbody>
				<c:forEach items = "${termosAditivos}" var = "termoAditivo">
						<tr>
						<td>
							<c:url value = "/VerTermoAditivoServlet" var = "verTermoAditivoUrl" scope = "page">
								<c:param name="idTermoAditivo" value = "${termoAditivo.idTermoAditivo}"/>  
							</c:url>
						<a href = "${verTermoAditivoUrl}" >${ termoAditivo.termoEstagio.dataInicioTermoEstagio }</a></td>	
												
						<td> ${ termoAditivo.termoEstagio.convenio.empresa.cnpjEmpresa }</td>
						<td> ${ termoAditivo.termoEstagio.convenio.empresa.cnpjEmpresa }</td>						
							
						</tr>
				</c:forEach>
			</tbody>

		</table>
		</div>
		
			
		<form action="TermoAditivoServlet" method="post">
				
		<br>
			
			<div class="mx-auto" style="width: 500px;">
				<div class="row">
					<div class="form-check form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" id="vigencia" name="vigencia"  value="sim"><fmt:message key = "br.cefetrj.sisgee.resources.form.vigenciaEstagio"/>
						</label>
					</div>
				
					<div class="mx-auto" style="width: 200px;">
					<div class="form-check form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" id="enderecoTermoEstagio" name="endereco" value="sim"><fmt:message key = "br.cefetrj.sisgee.resources.form.endereco"/>
						</label>
					</div>
					</div>
				
				</div>
			</div>
			
			<div class="mx-auto" style="width: 500px;">
				<div class="row">
					<div class="form-check form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" id="cargaHorariaTermoEstagio" name="cargaHoraria" value="sim"><fmt:message key = "br.cefetrj.sisgee.resources.form.cargaHorariaAluno"/>
						</label>
					</div>
				
					<div class="mx-auto" style="width: 236px;">
					<div class="form-check form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" id="professorOrientador" name="professor" value="sim"><fmt:message key = "br.cefetrj.sisgee.resources.form.professorOrientador"/>
						</label>
					</div>
					</div>				
				</div>
			</div>
			
			<div class="mx-auto" style="width: 500px;">
				<div class="row">
					<div class="form-check form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" id="valorBolsa" name="valor" value="sim"><fmt:message key = "br.cefetrj.sisgee.resources.form.valorBolsaEstagio"/>
						</label>
					</div>
				</div>
			</div>			
			<br>			
			<input type="hidden" id="idAlunoAdt" name="idAlunoAdt" value="" />
			<button type="submit" class="btn btn-primary"><fmt:message key = "br.cefetrj.sisgee.resources.form.salvar"/></button>
			<button type="button" class="btn btn-secondary"><fmt:message key = "br.cefetrj.sisgee.resources.form.cancelar"/></button>			
		</form>
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="myModalLabel"></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body"></div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal"><fmt:message key = "br.cefetrj.sisgee.resources.form.fechar"/></button>
		      </div>
		    </div>
		  </div>
		</div>

	</div>
	<%@include file="import_footer.jspf"%>
	<%@include file="import_finalbodyscripts.jspf"%>
	<%@include file="import_scripts.jspf"%>
	<script type="text/javascript">
		$(".form-check-input").change(function(){
			$('#idAlunoAdt').val($("#idAluno").val());
		});
	</script>
    
</body>
</html>
