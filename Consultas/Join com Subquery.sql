--joins da vida real

--qual o cliente tem e-mail e telefone? (no mínimo 1 de cada)
--qual o cliente tem e-mail e não tem telefone?
--qual o cliente tem telefone e não tem e-mail?
--qual o cliente não tem e-mail e nem telefone?


SELECT
	tc.ID_CLIENTE,
	count(te.EMAIL) as qtd_email, 
	count(tf.TELEFONE) as qtd_tel
FROM
	TB_CLIENTE tc 
	inner join TB_EMAIL te on tc.ID_CLIENTE = te.ID_CLIENTE
	inner join TB_TELEFONE tf on tc.ID_CLIENTE = tf.ID_CLIENTE
GROUP BY
	tc.ID_CLIENTE







