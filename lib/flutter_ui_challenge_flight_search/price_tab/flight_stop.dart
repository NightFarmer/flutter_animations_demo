class FlightStop {
  String from;
  String to;
  String data;
  String duration;
  String price;
  String fromToTime;
  FlightStop(this.from,this.to,this.data,this.duration,this.price,this.fromToTime);
}

class TicketFlightStop{
  String from;
  String fromShort;
  String to;
  String toShort;
  String flightNumber;
  TicketFlightStop(this.from,this.fromShort,this.to,this.toShort,this.flightNumber);
}