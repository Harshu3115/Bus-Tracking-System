package com.rt.model;

public class Bus {

    private int id;
    private String busNumber;
    private String route;
    private String driverName;
    private String conductorName;
    private String arrivalTime;
    private String departureTime;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getBusNumber() { return busNumber; }
    public void setBusNumber(String busNumber) { this.busNumber = busNumber; }

    public String getRoute() { return route; }
    public void setRoute(String route) { this.route = route; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getConductorName() { return conductorName; }
    public void setConductorName(String conductorName) { this.conductorName = conductorName; }

    public String getArrivalTime() { return arrivalTime; }
    public void setArrivalTime(String arrivalTime) { this.arrivalTime = arrivalTime; }

    public String getDepartureTime() { return departureTime; }
    public void setDepartureTime(String departureTime) { this.departureTime = departureTime; }
}
