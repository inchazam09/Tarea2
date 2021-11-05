DROP TABLE IF EXISTS #TipoIdentificacionTemp

SELECT 
IdTipoIdentificacion, Descripcion INTO #TipoIdentificacionTemp
FROM (
VALUES
(1, 'Cedula'),
(2, 'Pasaporte'),
(3, 'Cedula Juridca')
)AS TEMP (IdTipoIdentificacion, Descripcion)


----ACTUALIZAR DATOS---
UPDATE I SET
  I.Descripcion= TI.Descripcion
FROM Dbo.TipoIdentificacion I
INNER JOIN #TipoIdentificacionTemp TI
    ON I.IdTipoIdentificacion= TI.IdTipoIdentificacion


----INSERTAR DATOS---

SET IDENTITY_INSERT dbo.TipoIdentificacion ON

INSERT INTO dbo.TipoIdentificacion(
IdTipoIdentificacion, Descripcion)
SELECT
IdTipoIdentificacion, Descripcion
FROM #TipoIdentificacionTemp


EXCEPT
SELECT
IdTipoIdentificacion, Descripcion
FROM dbo.TipoIdentificacion


SET IDENTITY_INSERT dbo.TipoIdentificacion OFF

GO