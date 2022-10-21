import csv
data = []
with open("event.csv", "w", newline='') as output:
    writer = csv.DictWriter(output, fieldnames=["visit_id", "cookie_id", "page_id", "event_type", "sequence_number", "event_time"])
    writer.writeheader()

with open("event_raw.csv","r") as input:
    reader = csv.DictReader(input,skipinitialspace=True, fieldnames=["visit_id", "cookie_id", "page_id", "event_type", "sequence_number", "event_time"])
    for row in reader:
        visit_id = row['visit_id'][2:-1]
        cookie_id = row['cookie_id'][1:-1]
        page_id = row['page_id'][1:-1]
        event_type = row['event_type'][1:-1]
        sequence_number = row['sequence_number'][1:-1]
        event_time = row['event_time'][1:-2]
        
        with open("event.csv","a",newline="") as output:
            writer = csv.DictWriter(output, fieldnames=["visit_id", "cookie_id", "page_id", "event_type", "sequence_number", "event_time"])
            writer.writerow(
                {"visit_id": visit_id,
                 "cookie_id":cookie_id,
                 "page_id": page_id,
                 "event_type":event_type,
                 "sequence_number": sequence_number,
                 "event_time":event_time})
       
       
        # data.append({"visit_id":row['visit_id'][2:-1],
        #              "cookie_id":row['cookie_id'][1:-1],
        #              "page_id":row['page_id'][1:-1],
        #              "event_type":row['event_type'][1:-1],
        #              "sequence_number":row['sequence_number'][1:-1],
        #              "event_time":row['event_time'][1:-2]})

