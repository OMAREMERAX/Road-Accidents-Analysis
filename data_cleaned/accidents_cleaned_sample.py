import pandas as pd

# Load your big dataset
df = pd.read_csv("accidents_cleaned.csv")

# --- Option 1: Create a sample file for GitHub preview ---
sample_size = 500   # number of rows to keep
df.head(sample_size).to_csv("accidents_cleaned_sample.csv", index=False)

# --- Option 2: Split into smaller parts ---
rows_per_file = 100000   # adjust depending on file size
for i in range(0, len(df), rows_per_file):
    chunk = df.iloc[i:i+rows_per_file]
    chunk.to_csv(f"accidents_cleaned_part{i//rows_per_file+1}.csv", index=False)

print("✅ Done! Created accidents_cleaned_sample.csv and split files.")
