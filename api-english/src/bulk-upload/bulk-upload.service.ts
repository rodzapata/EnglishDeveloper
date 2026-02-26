import { Injectable } from '@nestjs/common';
import { Client } from 'pg';
import * as fs from 'fs';
import { from as copyFrom } from 'pg-copy-streams';

@Injectable()
export class BulkUploadService {

   async loadCsv(filePath: string): Promise<void> {
    const client = new Client({
      host: 'localhost',
      port: 5432,
      user: 'english_api',
      password: 'Clave01.',
      database: 'english_db',
    });

    await client.connect();

    const stream = client.query(
      copyFrom(`COPY dictionary (word, pronunciation, period_type)
                FROM STDIN WITH CSV HEADER DELIMITER ';' ENCODING 'UTF8'`)
    );

    const fileStream = fs.createReadStream(filePath);

    return new Promise((resolve, reject) => {
      fileStream
        .pipe(stream)
        .on('finish', async () => {
          await client.end();
          resolve();
        })
        .on('error', async (err) => {
          await client.end();
          reject(err);
        });
    });
  }

  }
