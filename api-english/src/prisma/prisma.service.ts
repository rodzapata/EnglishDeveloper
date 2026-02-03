import { Injectable, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from 'src/generated/prisma/client';

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
    constructor(){
       super({
              log: ['error', 'warn'],
       });
    }

    async onModuleInit() {
        try {
            await this.$connect();
            console.log(`conexion establecida`)
        } catch (error) {
            console.log(`error {error}`)
            throw error;
        }
    }
}
