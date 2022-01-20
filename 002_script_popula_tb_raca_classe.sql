USE db_rpg

SET NOCOUNT ON

MERGE dbo.tb_raca_classe AS destino
USING	(
		VALUES
			 ('An�o'		,'Mestres das rochas e do ferro, destemidos e obstinados diante de adversidades'											,0)
			,('Elfo'		,'Arqueiros �geis e cautelosos que vagam livremente pelos ermos e florestas'												,0)
			,('Meio-Elfo'	,'Her�is e l�deres natos que combinam as melhores caracter�sticas dos humanos e dos elfos'									,0)
			,('Halfling'	,'N�mades velozes e engenhosos, de estatura pequena, mas grande coragem'													,0)
			,('Humano'		,'Ambiciosos, determinados e pragm�ticos � uma ra�a de her�is, e tamb�m de vil�es'											,0)
			,('Meio-Orc'	,'Guerreiros tem�veis que combinam a determina��o dos humanos com a selvageria dos orcs'									,0)
			,('B�rbaro'		,'Guerreiros selvagens que conseguem des�ferir golpes terr�veis com suas armas poderosas'									,1)
			,('Bardo'		,'Artistas que praticam a magia assim como suas can��es, dramas e poesias'													,1)
			,('Mago'		,'Detentores da magia arcana'																								,1)
			,('Feiticeiro'	,'Portadores do poder arcano em sua forma bruta, eles criam explos�es e rajadas de energia arcana atrav�s de seus corpos'	,1)
			,('Bruxo'		,'Canalizam o poder arcano retirado de entidades primordiais'																,1)
			,('Druida'		,'Eles correm ao lado de matilhas de lobos, falam com �rvores antigas e observam solit�rios os temporais'					,1)
			,('Cl�rigo'		,'L�deres de combate que foram investidos com o poder divino'																,1)
			,('Guerreiro'	,'S�o adeptos determinados do combate, trei�nados para proteger os outros membros dos seus grupos de aventureiros'			,1)
			,('Ladino'		,'Confiam em sua per�cia, furtividade e na vulnerabilidade de seus oponentes obter vantagem em qualquer situa��o'			,1)
		)
		AS origem (nm_rc, desc_rc, defi_rc)

ON (destino.nm_rc = origem.nm_rc)

WHEN MATCHED THEN

	UPDATE SET
	 destino.nm_rc		= origem.nm_rc
	,destino.desc_rc	= origem.desc_rc
	,destino.defi_rc	= origem.defi_rc

WHEN NOT MATCHED BY TARGET THEN

	INSERT (nm_rc, desc_rc, defi_rc)
	VALUES (origem.nm_rc, origem.desc_rc, origem.defi_rc)

WHEN NOT MATCHED BY SOURCE THEN

	DELETE;
