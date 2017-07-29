package org.tempuri;

public class ISMSServiceProxy implements org.tempuri.ISMSService {
  private String _endpoint = null;
  private org.tempuri.ISMSService iSMSService = null;
  
  public ISMSServiceProxy() {
    _initISMSServiceProxy();
  }
  
  public ISMSServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initISMSServiceProxy();
  }
  
  private void _initISMSServiceProxy() {
    try {
      iSMSService = (new org.tempuri.SMSServiceLocator()).getBasicHttpBinding_ISMSService();
      if (iSMSService != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)iSMSService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)iSMSService)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (iSMSService != null)
      ((javax.xml.rpc.Stub)iSMSService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public org.tempuri.ISMSService getISMSService() {
    if (iSMSService == null)
      _initISMSServiceProxy();
    return iSMSService;
  }
  
  public void doWork() throws java.rmi.RemoteException{
    if (iSMSService == null)
      _initISMSServiceProxy();
    iSMSService.doWork();
  }
  
  public java.lang.Boolean sendMessage(java.lang.String message, java.lang.String mobileNo) throws java.rmi.RemoteException{
    if (iSMSService == null)
      _initISMSServiceProxy();
    return iSMSService.sendMessage(message, mobileNo);
  }
  
  public java.lang.Boolean broadcastMessage(java.lang.String message, java.lang.String[] mobileNos) throws java.rmi.RemoteException{
    if (iSMSService == null)
      _initISMSServiceProxy();
    return iSMSService.broadcastMessage(message, mobileNos);
  }
  
  
}