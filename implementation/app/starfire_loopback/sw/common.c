/*
Company: Elsys Design
Engineer: Nicolas Belland
*/

void wait(int i){
	for (int j = 0; j < i ; j++){ asm("nop");}
}

void wait_us_clk_150mhz(int i){
	int nb_clock= i*150;
	for (int j = 0; j < nb_clock ; j++){ asm("nop");}
}