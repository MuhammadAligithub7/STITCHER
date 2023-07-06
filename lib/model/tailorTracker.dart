class TailorTracker {
  late String id,
      customer_id,
      tailor_id,
      created_time,
      created_date,
      status,
      deadline,
      charges,
      instructions,
      measurement_id,
      category,
      name;

  TailorTracker(
      String id,
      String customer_id,
      String tailor_id,
      String created_time,
      String created_date,
      String status,
      String deadline,
      String charges,
      String instruction,
      String measurement_id,
      String category,
      String name) {
    this.id = id;
    this.customer_id = customer_id;
    this.tailor_id = tailor_id;
    this.created_time = created_time;
    this.created_date = created_date;
    this.status = status;
    this.deadline = deadline;
    this.charges = charges;
    this.instructions = instruction;
    this.measurement_id = measurement_id;
    this.category = category;
    this.name = name;
  }
}
