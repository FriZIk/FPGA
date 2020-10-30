#include <vars.h>


int funcX(unsigned char* a, unsigned char* b, unsigned char* outdata)
{
    for(int i = 0; i < 16; ++i)
    {
	    outdata[i] = a[i]  ^ b[i];
	}
    return -1;
}

void funcS(unsigned char* indata, unsigned char* outdata)
{
    for(int i = 0; i < 16; ++i)
	{
		outdata[i] = kPi[indata[i]];
	}
}

int funcL(unsigned char* indata, unsigned char* outdata)
{
    unsigned char tmp[16];
	int i = 0;
    memcpy(tmp, indata, 16);

	 for(i = 0; i < 16; ++i)
     {
		  funcR(tmp, outdata);
          memcpy(tmp, outdata, 16);
     }

 return 0;
}



int  funcR(unsigned char * indata , unsigned char *outdata )
{
    unsigned long sum=0;
    for(int i = 0; i < 16; ++i)
    {
		sum ^= multTable[indata[i]*256 + kB[i]];
	}

	outdata[0] = sum;
	memcpy(outdata+1, indata, 15);
	return -1;
}

int funcReverseS(unsigned char* indata, unsigned char*  outdata)
{
	unsigned int i;
    for(i = 0; i < 16; ++i)
    {
        outdata[i] = kReversePi[indata[i]];
    }
	return 0;
}

int funcReverseL(unsigned char* indata, unsigned char* outdata)
{
    unsigned char tmp[16];
	unsigned int i;

    memcpy(tmp, indata, 16);

    for(i = 0; i < 16; ++i)
    {
		funcReverseR(tmp, outdata);
        memcpy(tmp, outdata, 16);
    }
	return 0;
}

int funcReverseR(unsigned char* indata, unsigned char* outdata)
{
     unsigned char tmp[16] = {0};
     unsigned char sum = 0;
     unsigned int i;
     memcpy(tmp, indata+1, 15);
     tmp[15] = indata[0];
     for(i = 0; i < 16; ++i)
     {
          sum ^= multTable[tmp[i]*256 + kB[i]];
     }
     memcpy(outdata, tmp, 15);
     outdata[15] = sum;
	return 0;
}


int funcF(unsigned char* inputKey, unsigned char* inputKeySecond, unsigned char* iterationConst, unsigned char* outputKey, unsigned char* outputKeySecond)
{
     unsigned char temp1[16] = {0};
	 unsigned char temp2[16] = {0};
	funcLSX(inputKey, iterationConst, temp1);
	 funcX(temp1, inputKeySecond, temp2);

     memcpy(outputKeySecond, inputKey, 16);
     memcpy(outputKey, temp2, 16);
     return 0;
}

int funcC(unsigned char number, unsigned char* output)
{
	 unsigned char tempI[16] = {0};
	 tempI[15] = number;
	 funcL(tempI, output);

	 return 0;
}

int ExpandKey(unsigned char* masterKey, unsigned char mass[8][16] )
{
	 unsigned char C[16] = {0};
	 unsigned char temp1[16] = {0};
	 unsigned char temp2[16] = {0};
	 unsigned char j, i;
	   unsigned char keys[16];
	  int g=0;
	 memcpy(keys, masterKey, 16);
	memcpy(keys + 16, masterKey + 16, 16);
	  memcpy(temp1, keys,16);
	   memcpy(temp1+16, keys+16,16);
	 for(j = 0; j < 4; ++j)
	 {
		  for( i = 1; i <8; ++i )
		  {
			   funcC(j*8+i, C);
			   funcF(temp1, temp2, C, temp1, temp2);
		  }
		  funcC(j*8+8, C);
		  funcF(temp1, temp2, C, temp1, temp2);  //два следующих ключа!

		  memcpy(keys , temp1, 16);
		  memcpy(keys + 16, temp2, 16);

	memcpy(mass[g],temp1,16);
	g++;
	memcpy(mass[g],temp2,16);
	g++;
}
 return 0;
}