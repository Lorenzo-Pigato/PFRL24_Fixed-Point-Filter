library ieee;
use ieee.std_logic_1164.all;

entity FILTER is
	port(
        X 		: in  std_logic_vector (31 downto 0);
        K 		: in  std_logic_vector (2 downto 0);
		  INIT	: in  std_logic;
		  
		  OUTPUT : out std_logic_vector (31 downto 0);
		  VALID  : out std_logic;
		  
		  RESET	: in 	std_logic;
		  CLK		: in  std_logic
    );
end FILTER;

architecture FILTER of FILTER is

	component REG is
		generic( N : integer := 32 );
		port(
			CLK 	: in  std_logic;
			D 		: in  std_logic_vector (N - 1 downto 0);
			Q		: out std_logic_vector (N - 1 downto 0);
			RESET : in  std_logic
		);
	end component;
	
	component C2 is
		generic( N : integer := 32 );  
		port(
			A 		 : in  std_logic_vector (N - 1 downto 0);
			C2_OUT : out std_logic_vector (N - 1 downto 0)
		);
	end component;
	
	component K_SHIFTER
    port(
         SH_AMNT 	: in  std_logic_vector(2 downto 0);
         INPUT		: in	std_logic_vector(31 downto 0);
         OUTPUT	: out std_logic_vector(31 downto 0)
        );
    end component;
	 
	 component CSA is
		generic(N : integer := 32 );
		port(
			A 	 : in  std_logic_vector (N - 1 downto 0);
			B 	 : in  std_logic_vector (N - 1 downto 0);
			C 	 : in  std_logic_vector (N - 1 downto 0);
			SUM : out std_logic_vector (N + 1 downto 0)
		);
	 end component;
	 
	 component CLOCK_GATE is
		port(
			EN				:	in std_logic;
			CLK_IN		:	in std_logic;
			CLK_OUT		:	out std_logic;
			NOT_CLK_OUT	:	out std_logic
		);
	 end component;	 
	
	component D_FLIP_FLOP
		port( 
			CLK :  in   std_logic;
			D 	 :  in   std_logic;
			Q	 :  out  std_logic;
			RESET: in   std_logic
	   );
   end component;

	 
	 signal SIG_RST_OUT 	: std_logic;
	 signal SIG_RST_REG  : std_logic;
	 
	 signal SIG_ENABLE	: std_logic;
	 
	 signal SIG_LOOPBACK		: std_logic_vector(31 downto 0);
	 signal SIG_X_TO_SHIFT	: std_logic_vector(31 downto 0);
	 signal SIG_C2_TO_SHIFT	: std_logic_vector(31 downto 0);
	 signal SIG_K_TO_SHIFT	: std_logic_vector(2 downto 0);
	 
	 signal SIG_C2_TO_CSA	: std_logic_vector(31 downto 0);
	 signal SIG_X_S_TO_CSA	: std_logic_vector(31 downto 0);
	 
	 signal SIG_CSA_OUT		: std_logic_vector(33 downto 0);
	 
	 signal SIG_VALID			: std_logic;
	 
	 signal NOT_INIT			: std_logic;
begin
	 
	 NOT_INIT <= not INIT;
	 
	 x_reg : REG
		generic map( N => 32)
		port map (
			CLK 	=> CLK,
			D 		=> X,
			Q		=> SIG_X_TO_SHIFT,
			RESET => SIG_RST_REG
		);
	 
	 k_reg : REG
		generic map( N => 3)
		port map (
			CLK 	=> CLK,
			D 		=> K,
			Q		=> SIG_K_TO_SHIFT,
			RESET => SIG_RST_REG
		);
		
	 twos_compl: C2
		port map(
			A 		 => SIG_LOOPBACK,
			C2_OUT => SIG_C2_TO_SHIFT
		);
	
	 x_shift: K_SHIFTER
		port map(
         SH_AMNT => SIG_K_TO_SHIFT,
         INPUT	  => SIG_X_TO_SHIFT,
         OUTPUT  => SIG_X_S_TO_CSA
      );
	
	 loopback_shift: K_SHIFTER
		port map(
         SH_AMNT => SIG_K_TO_SHIFT,
         INPUT	  => SIG_C2_TO_SHIFT,
         OUTPUT  => SIG_C2_TO_CSA
      );
	 
	 carry_save_adder: CSA
		port map(
        A 	=> SIG_X_S_TO_CSA,
        B 	=> SIG_C2_TO_CSA,
        C 	=> SIG_LOOPBACK,
        SUM => SIG_CSA_OUT
		);
		
	 out_reg : REG
		generic map( N => 32)
		port map (
			CLK 	=> CLK,
			D 		=> SIG_CSA_OUT(31 downto 0),
			Q		=> SIG_LOOPBACK,
			RESET => SIG_RST_OUT
		);
		
	 valid_reg: D_FLIP_FLOP
		port map (
			CLK 	=> CLK,
			D 		=> NOT_INIT,
			Q		=> VALID,
			RESET => SIG_RST_REG
		);
	 
	 
	 
	 SIG_RST_OUT <= INIT or RESET;
	 SIG_RST_REG <= RESET;
	 
	OUTPUT <= SIG_LOOPBACK;
	
end FILTER;

