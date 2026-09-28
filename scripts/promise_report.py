#!/usr/bin/env python3

import csv
import sys
from datetime import datetime

def transform_clockify_csv(input_path, output_path):
    rows = []

    with open(input_path, newline='', encoding='utf-8') as infile:
        reader = csv.DictReader(infile)

        for row in reader:
            try:
                raw_date = row['Start Date'].strip()
                raw_time = row['Start Time'].strip()
                dt_obj = datetime.strptime(f"{raw_date} {raw_time}", '%m/%d/%Y %I:%M:%S %p')
                date_str = dt_obj.strftime('%Y-%m-%d')

                rows.append({
                    'datetime': dt_obj,  # for sorting
                    'date': date_str,
                    'person': 'Renato Gomes [38843]',
                    'project': 'Promise686 [585]',
                    'hours': row['Duration (decimal)'].strip(),
                    'notes': row.get('Description', '').strip()
                })
            except KeyError as e:
                print(f"❌ Missing expected column in input CSV: {e}")
                sys.exit(1)
            except ValueError:
                print(f"❗ Skipping row with unparseable date/time: {row.get('Start Date', '')} {row.get('Start Time', '')}")
                continue

    # Sort by full datetime
    rows.sort(key=lambda x: x['datetime'])

    # Write to output
    with open(output_path, 'w', newline='', encoding='utf-8') as outfile:
        fieldnames = ['date', 'person', 'project', 'hours', 'notes']
        writer = csv.DictWriter(outfile, fieldnames=fieldnames)
        writer.writeheader()

        for row in rows:
            del row['datetime']  # remove internal sort key before writing
            writer.writerow(row)

    print(f"✅ Timesheet generated at: {output_path}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: ./clockify_promise.py input.csv output.csv")
        sys.exit(1)

    transform_clockify_csv(sys.argv[1], sys.argv[2])



def transform_clockify_csv(input_path, output_path):
    rows = []

    with open(input_path, newline='', encoding='utf-8') as infile:
        reader = csv.DictReader(infile)

        for row in reader:
            try:
                raw_date = row['Start Date'].strip()
                raw_time = row['Start Time'].strip()
                dt_obj = datetime.strptime(f"{raw_date} {raw_time}", '%m/%d/%Y %I:%M:%S %p')
                date_str = dt_obj.strftime('%Y-%m-%d')

                rows.append({
                    'datetime': dt_obj,  # for sorting
                    'date': date_str,
                    'person': 'Renato Gomes [38843]',
                    'project': 'Promise686 [585]',
                    'hours': row['Duration (decimal)'].strip(),
                    'notes': row.get('Description', '').strip()
                })
            except KeyError as e:
                print(f"❌ Missing expected column in input CSV: {e}")
                sys.exit(1)
            except ValueError:
                print(f"❗ Skipping row with unparseable date/time: {row.get('Start Date', '')} {row.get('Start Time', '')}")
                continue

    # Sort by full datetime
    rows.sort(key=lambda x: x['datetime'])

    # Write to output
    with open(output_path, 'w', newline='', encoding='utf-8') as outfile:
        fieldnames = ['date', 'person', 'project', 'hours', 'notes']
        writer = csv.DictWriter(outfile, fieldnames=fieldnames)
        writer.writeheader()

        for row in rows:
            del row['datetime']  # remove internal sort key before writing
            writer.writerow(row)

    print(f"✅ Timesheet generated at: {output_path}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: ./clockify_promise.py input.csv output.csv")
        sys.exit(1)

    transform_clockify_csv(sys.argv[1], sys.argv[2])



