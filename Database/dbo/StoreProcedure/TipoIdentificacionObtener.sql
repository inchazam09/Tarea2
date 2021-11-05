CREATE PROCEDURE [dbo].[TipoIdentificacionObtener]
      @IdTipoIdentificacion int= NULL
AS BEGIN
  SET NOCOUNT ON

  SELECT 
    O.IdTipoIdentificacion,
    O.Descripcion    
    FROM dbo.TipoIdentificacion O
    WHERE
    (@IdTipoIdentificacion IS NULL OR @IdTipoIdentificacion=@IdTipoIdentificacion)

END