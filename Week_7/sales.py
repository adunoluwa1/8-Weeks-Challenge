import csv

with open ("sales.csv", "w", newline="") as new:
    writer = csv.DictWriter(new, fieldnames=["prod_id","qty","price","discount","member","txn_id","start_txn_time"])
    writer.writeheader()

with open("raw_sales.csv", "r", newline="") as file:
    reader = csv.DictReader(file,fieldnames=["prod_id","qty","price","discount","member","txn_id","start_txn_time",],)
    for row in reader:
        prod_id = row["prod_id"][4:-1]
        qty = row["qty"] [2:-1]
        price = row["price"][2:-1] 
        discount = row["discount"][2:-1] 
        member = row["member"][2:-1]
        txn_id = row["txn_id"][2:-1]
        start_txn_time = row["start_txn_time"][2:-2]

        with open("sales.csv","a",newline="") as new:
            writer = csv.DictWriter(new, fieldnames=["prod_id","qty","price","discount","member","txn_id","start_txn_time"])
            writer.writerow(
                            {"prod_id":prod_id,
                             "qty":qty,
                             "price":price,
                             "discount":discount,
                             "member":member,
                             "txn_id":txn_id,
                             "start_txn_time":start_txn_time}
                             )



