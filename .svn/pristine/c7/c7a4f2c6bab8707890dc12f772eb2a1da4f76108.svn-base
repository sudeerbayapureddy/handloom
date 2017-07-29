/**
 * SMSServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.tempuri;

public class SMSServiceLocator extends org.apache.axis.client.Service implements org.tempuri.SMSService {

    public SMSServiceLocator() {
    }


    public SMSServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public SMSServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BasicHttpBinding_ISMSService
    private java.lang.String BasicHttpBinding_ISMSService_address = "http://dev.kdms.in/Shared/WebServices/SMSService.svc";

    public java.lang.String getBasicHttpBinding_ISMSServiceAddress() {
        return BasicHttpBinding_ISMSService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BasicHttpBinding_ISMSServiceWSDDServiceName = "BasicHttpBinding_ISMSService";

    public java.lang.String getBasicHttpBinding_ISMSServiceWSDDServiceName() {
        return BasicHttpBinding_ISMSServiceWSDDServiceName;
    }

    public void setBasicHttpBinding_ISMSServiceWSDDServiceName(java.lang.String name) {
        BasicHttpBinding_ISMSServiceWSDDServiceName = name;
    }

    public org.tempuri.ISMSService getBasicHttpBinding_ISMSService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BasicHttpBinding_ISMSService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBasicHttpBinding_ISMSService(endpoint);
    }

    public org.tempuri.ISMSService getBasicHttpBinding_ISMSService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            org.tempuri.BasicHttpBinding_ISMSServiceStub _stub = new org.tempuri.BasicHttpBinding_ISMSServiceStub(portAddress, this);
            _stub.setPortName(getBasicHttpBinding_ISMSServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBasicHttpBinding_ISMSServiceEndpointAddress(java.lang.String address) {
        BasicHttpBinding_ISMSService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (org.tempuri.ISMSService.class.isAssignableFrom(serviceEndpointInterface)) {
                org.tempuri.BasicHttpBinding_ISMSServiceStub _stub = new org.tempuri.BasicHttpBinding_ISMSServiceStub(new java.net.URL(BasicHttpBinding_ISMSService_address), this);
                _stub.setPortName(getBasicHttpBinding_ISMSServiceWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("BasicHttpBinding_ISMSService".equals(inputPortName)) {
            return getBasicHttpBinding_ISMSService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://tempuri.org/", "SMSService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://tempuri.org/", "BasicHttpBinding_ISMSService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BasicHttpBinding_ISMSService".equals(portName)) {
            setBasicHttpBinding_ISMSServiceEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
