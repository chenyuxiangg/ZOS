void test()
{
	*(unsigned int *)0x1000000 = 0x1;
}

int main(int argc, char* argv[])
{
	test();
	return 0;
}
