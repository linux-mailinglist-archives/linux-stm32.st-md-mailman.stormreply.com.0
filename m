Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 809859C1422
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2024 03:36:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1788AC6C855;
	Fri,  8 Nov 2024 02:36:17 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FCE8C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2024 02:36:09 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-723db2798caso1842026b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2024 18:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1731033368; x=1731638168;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s+jyeFz5qLcpNF1wQeUyeaIh19p1lD8bQtGka/s8n1Q=;
 b=s6WibhcHaCRGViD7RbIYFGyec/UNBv1u+dtchkOfW5iuKeTIt2fbVNG8VOd2VDVVSC
 w/7+a/7OJt4rQspqYjghemFqLb6omn7q6yXSBvOdkQS4q+/+LlgSrn3TbKVQbLCh9/01
 DQ3pSKbmXjyk8b2v8DmAVJBb+oXDiH1GNMET00KjZRMMMFIqZ8GJbpiSfCTd5bZJhLAF
 tBkp23CtkhR+BBb7a5up5vVKGid0ddsrD2nvpkO4ywEcjPny6QuSNDxVB1fBipQhd8D2
 EKT0n4Wni7EJ+TJ59K6xsNYaVr1tyDT2LLUqOit7Tj5kNqeuFMcebkVOy7u5jb3A4qJt
 ktzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731033368; x=1731638168;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+jyeFz5qLcpNF1wQeUyeaIh19p1lD8bQtGka/s8n1Q=;
 b=elW29MeZpDe0OM4eBi0Q5wdQOCwFIMt0bqPdhZzECEKeg0tB9t5GjJGUDGcD22YiG8
 pFgZgpusDjHmY+gdJ7L/WQD/V9u0gZ8/TOzukK0swXZDfV5M8Yq4crsv5o6UIB8ciVkT
 AZ+L0gkuENx/epb6JMt4whpmLdUuvtqR5PuuXkCzfdJtFQoYXnYOtmbH83no0oSttkpr
 Y+f0FqDSS5PSBot51C5tt8GGwVeQdNdIttEeAGSsaaFiuYEzY0ENWogRbiKmM6SDWh2i
 MVm5uj1fhQwV1cakVVko7JeSTtwfxFfLvbDNDTeUWVhAlxpPtgdkkrLAmPRUs0BvipNL
 u20w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcp/r3qGQk1S51ucj5M05i71fvvAouhm8Eefs92pOIebMac4Q8vWTOMrV3opIsZTRqkhc/sIikowXk3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwtPnIzRtdP6TKgAX9bK3Via2SgqTvTJiGnYeRu6grw9JofBuzl
 Bk6khdn1ua6rpHoa+HtZZjY77FOYfqrfw1ErnLsgk4GBZkQxMaSr+BB7nnyhMHM=
X-Google-Smtp-Source: AGHT+IFkTBYmvuaObrf/NhsL6bgy8VSLe5N8eK2nw/1LxrZ9F9SMeNiCvMwnlaaGOCdkpjvr4IsokQ==
X-Received: by 2002:a05:6a00:1819:b0:71d:f510:b791 with SMTP id
 d2e1a72fcca58-724132cd1b1mr1832008b3a.12.1731033367828; 
 Thu, 07 Nov 2024 18:36:07 -0800 (PST)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a17ed3sm2541107b3a.142.2024.11.07.18.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 18:36:07 -0800 (PST)
Date: Thu, 7 Nov 2024 18:36:04 -0800
From: Drew Fustini <drew@pdp7.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Message-ID: <Zy15FJZrOFA2t687@x1>
References: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
 <20241020-th1520-dwmac-v4-3-c77acd33ccef@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241020-th1520-dwmac-v4-3-c77acd33ccef@tenstorrent.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/3] riscv: dts: thead: Add
 TH1520 ethernet nodes
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Sun, Oct 20, 2024 at 07:36:02PM -0700, Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add gmac, mdio, and phy nodes to enable the gigabit Ethernet ports on
> the BeagleV Ahead and Sipeed Lichee Pi 4a boards.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: change apb registers from syscon to second reg of gmac node,
>        add phy reset delay properties for beaglev ahead]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++++++++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 119 +++++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  50 +++++++++
>  3 files changed, 260 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 86feb3df02c8..21c33f165ba9 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -15,6 +15,7 @@ / {
>  	compatible = "beagle,beaglev-ahead", "thead,th1520";
>  
>  	aliases {
> +		ethernet0 = &gmac0;
>  		gpio0 = &gpio0;
>  		gpio1 = &gpio1;
>  		gpio2 = &gpio2;
> @@ -98,6 +99,25 @@ &emmc {
>  	status = "okay";
>  };
>  
> +&gmac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_pins>;
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	phy0: ethernet-phy@1 {
> +		reg = <1>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <10000>;
> +		reset-post-delay-us = <50000>;
> +	};
> +};
> +
>  &padctrl_aosys {
>  	led_pins: led-0 {
>  		led-pins {
> @@ -116,6 +136,77 @@ led-pins {
>  };
>  
>  &padctrl0_apsys {
> +	gmac0_pins: gmac0-0 {
> +		tx-pins {
> +			pins = "GMAC0_TX_CLK",
> +			       "GMAC0_TXEN",
> +			       "GMAC0_TXD0",
> +			       "GMAC0_TXD1",
> +			       "GMAC0_TXD2",
> +			       "GMAC0_TXD3";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <25>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pins = "GMAC0_RX_CLK",
> +			       "GMAC0_RXDV",
> +			       "GMAC0_RXD0",
> +			       "GMAC0_RXD1",
> +			       "GMAC0_RXD2",
> +			       "GMAC0_RXD3";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		mdc-pins {
> +			pins = "GMAC0_MDC";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <13>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		mdio-pins {
> +			pins = "GMAC0_MDIO";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <13>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +
> +		phy-reset-pins {
> +			pins = "GMAC0_COL"; /* GPIO3_21 */
> +			bias-disable;
> +			drive-strength = <3>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		phy-interrupt-pins {
> +			pins = "GMAC0_CRS"; /* GPIO3_22 */
> +			function = "gpio";
> +			bias-pull-up;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	uart0_pins: uart0-0 {
>  		tx-pins {
>  			pins = "UART0_TXD";
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index 724d9645471d..8e76b63e0100 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -11,6 +11,11 @@ / {
>  	model = "Sipeed Lichee Module 4A";
>  	compatible = "sipeed,lichee-module-4a", "thead,th1520";
>  
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +	};
> +
>  	memory@0 {
>  		device_type = "memory";
>  		reg = <0x0 0x00000000 0x2 0x00000000>;
> @@ -45,6 +50,22 @@ &emmc {
>  	status = "okay";
>  };
>  
> +&gmac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_pins>, <&mdio0_pins>;
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&gmac1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_pins>;
> +	phy-handle = <&phy1>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
>  &gpio0 {
>  	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
>  			  "", "", "", "", "", "", "", "", "", "",
> @@ -78,6 +99,104 @@ &gpio3 {
>  			  "GPIO10";
>  };
>  
> +&mdio0 {
> +	phy0: ethernet-phy@1 {
> +		reg = <1>;
> +	};
> +
> +	phy1: ethernet-phy@2 {
> +		reg = <2>;
> +	};
> +};
> +
> +&padctrl0_apsys {
> +	gmac0_pins: gmac0-0 {
> +		tx-pins {
> +			pins = "GMAC0_TX_CLK",
> +			       "GMAC0_TXEN",
> +			       "GMAC0_TXD0",
> +			       "GMAC0_TXD1",
> +			       "GMAC0_TXD2",
> +			       "GMAC0_TXD3";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <25>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pins = "GMAC0_RX_CLK",
> +			       "GMAC0_RXDV",
> +			       "GMAC0_RXD0",
> +			       "GMAC0_RXD1",
> +			       "GMAC0_RXD2",
> +			       "GMAC0_RXD3";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	gmac1_pins: gmac1-0 {
> +		tx-pins {
> +			pins = "GPIO2_18", /* GMAC1_TX_CLK */
> +			       "GPIO2_20", /* GMAC1_TXEN */
> +			       "GPIO2_21", /* GMAC1_TXD0 */
> +			       "GPIO2_22", /* GMAC1_TXD1 */
> +			       "GPIO2_23", /* GMAC1_TXD2 */
> +			       "GPIO2_24"; /* GMAC1_TXD3 */
> +			function = "gmac1";
> +			bias-disable;
> +			drive-strength = <25>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pins = "GPIO2_19", /* GMAC1_RX_CLK */
> +			       "GPIO2_25", /* GMAC1_RXDV */
> +			       "GPIO2_30", /* GMAC1_RXD0 */
> +			       "GPIO2_31", /* GMAC1_RXD1 */
> +			       "GPIO3_0",  /* GMAC1_RXD2 */
> +			       "GPIO3_1";  /* GMAC1_RXD3 */
> +			function = "gmac1";
> +			bias-disable;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	mdio0_pins: mdio0-0 {
> +		mdc-pins {
> +			pins = "GMAC0_MDC";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <13>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		mdio-pins {
> +			pins = "GMAC0_MDIO";
> +			function = "gmac0";
> +			bias-disable;
> +			drive-strength = <13>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &sdio0 {
>  	bus-width = <4>;
>  	max-frequency = <198000000>;
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index cd835aea07d2..acfe030e803a 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -223,6 +223,12 @@ aonsys_clk: clock-73728000 {
>  		#clock-cells = <0>;
>  	};
>  
> +	stmmac_axi_config: stmmac-axi-config {
> +		snps,wr_osr_lmt = <15>;
> +		snps,rd_osr_lmt = <15>;
> +		snps,blen = <0 0 64 32 0 0 0>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -274,6 +280,50 @@ uart0: serial@ffe7014000 {
>  			status = "disabled";
>  		};
>  
> +		gmac1: ethernet@ffe7060000 {
> +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> +			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
> +			reg-names = "dwmac", "apb";
> +			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC1>;
> +			clock-names = "stmmaceth", "pclk";
> +			snps,pbl = <32>;
> +			snps,fixed-burst;
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <32>;
> +			snps,axi-config = <&stmmac_axi_config>;
> +			status = "disabled";
> +
> +			mdio1: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		gmac0: ethernet@ffe7070000 {
> +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> +			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
> +			reg-names = "dwmac", "apb";
> +			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC0>;
> +			clock-names = "stmmaceth", "pclk";
> +			snps,pbl = <32>;
> +			snps,fixed-burst;
> +			snps,multicast-filter-bins = <64>;
> +			snps,perfect-filter-entries = <32>;
> +			snps,axi-config = <&stmmac_axi_config>;
> +			status = "disabled";
> +
> +			mdio0: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		emmc: mmc@ffe7080000 {
>  			compatible = "thead,th1520-dwcmshc";
>  			reg = <0xff 0xe7080000 0x0 0x10000>;
> 
> -- 
> 2.34.1
> 

The dwmac-thead driver and dt binding have been applied to net-next [1]
so I have now applied this dts patch to thead-dt-for-next [2].

-Drew

[1] https://lore.kernel.org/linux-riscv/173085843050.764350.5609116722213276708.git-patchwork-notify@kernel.org/
[2] https://github.com/pdp7/linux/commit/7e756671a664b73b2a3c0cc37fd25abf6bcd851e
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
