@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_CLIENTES_8712
  as select from ztb_clientes_12  as Clientes
    inner join   ztb_clnts_lib_12 as ClientesLib on ClientesLib.id_cliente = Clientes.id_cliente
{
  key ClientesLib.id_libro                                        as idLibro, 
  key Clientes.id_cliente                                         as IdCliente,
  key Clientes.tipo_acceso                                        as TipoAcceso,
      Clientes.nombre                                             as Nombre,
      Clientes.apellidos                                          as Apellidos,
      Clientes.email                                              as Email,
      Clientes.url                                                as Url,
      concat_with_space( Clientes.nombre, Clientes.apellidos, 1 ) as NombreCompleto
}
