Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5D992874
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:45:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2A8AC7128A;
	Mon,  7 Oct 2024 09:45:22 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03433C78017
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 18:16:21 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2059204f448so12546285ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 11:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1727374580; x=1727979380;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wkeCrPOlIseD/aizBlxYXizOEF/56/liiT5yf4vBIaE=;
 b=cGb4EPVjWk1qZirqfwBhs94RvvBBHn33M0oD9kaeX57/qfoc05le9uRfomsVjUWiNj
 0bRa0vHqXN4OFqPgivHIjCS3OUx6ydQevIU7nLY6Xu8GZ+CA2t1NM/xsVnNNcICzzh4Y
 RTCZQCvp7RDKpftQ/9uHlfqMU4OiUJMApFV21KWacuirZF+IlR8uvnDmFTAJjUMmeLNW
 7Cvu4lY4AQuxi5Ptvoh0xjTzz9xWIqoa5sQ3jCPq4gISELuJAzLM8JsV4qvfrW/ozqGw
 kHJl/Tic6yadSEgySqhzmFPyFT+IGlRHe1pTrlmF3tEA07cs7L+N/d9uatyo5I4TMhTu
 eUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727374580; x=1727979380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wkeCrPOlIseD/aizBlxYXizOEF/56/liiT5yf4vBIaE=;
 b=ofg4xDLQZ4ZWRTnF0wift8ebBHKa513kabSa5UY9436+kSXnVB8lzBonfaDe3xLaG8
 CnAhDstZDWIvuYhIYN+2UGOU2XhbLv/sgl+lATUOZhrM9udbqvZu5Ek7GjQXf/wRK1yL
 rCoZF6vu647q+JFi9DN01eAgbQc1xG4x5kxdBVAGNzODvB9PnMbLHPUPh9BNZFwB+4Bp
 gA9tS5NOhoE80J0n5YoAEyoJJ8wuSrqOFrfUe0XPBTtgJzCYZVJpz+x2jXd2o30MVCOE
 sfPGgSArPbjVSaWhiwOODITFvIUjNx7enA2lL3xGi9zCpOxBiwhgmrY4gfu+1qQJ7US/
 h4eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgIwnU8eNWHskJGdcsAGIH0azPf1adu506s/WyACGq+E+CqrS/nZNzTxwI62LVvW9Q8T2Vw5SZ27hMXA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyw4+wzYGmH3zXOBRmsZDGXx+5LBYDgf8p37+eeTOmJAF0SUXUa
 2pzrmypVE7OAUEmhqbulxipDhzf7xlXT1gKxaGJ3RyTGVyQnKMWn079ELrrk1uPKme0pJ/3L6xh
 i
X-Google-Smtp-Source: AGHT+IFIkdMbL4iTLZ8Ge0B/Bj8QKJ6lxuYgKzXHGXi++Ym9a+btPTNSE4YhA8c6GtM6W4wSqRxGuA==
X-Received: by 2002:a17:902:d4d0:b0:201:f6e8:637f with SMTP id
 d9443c01a7336-20b367ca7e1mr8264905ad.11.1727374580222; 
 Thu, 26 Sep 2024 11:16:20 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37d5ef5dsm1454145ad.32.2024.09.26.11.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 11:16:20 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Thu, 26 Sep 2024 11:15:52 -0700
MIME-Version: 1.0
Message-Id: <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
In-Reply-To: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:45:20 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/3] riscv: dts: thead: Add TH1520 ethernet
	nodes
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: change apb registers from syscon to second reg of gmac node]
[drew: add phy reset delay properties for beaglev ahead]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 135 +++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++++++
 3 files changed, 276 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 5a5888f4eda6..ddcee6298939 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -15,6 +15,7 @@ / {
 	compatible = "beagle,beaglev-ahead", "thead,th1520";
 
 	aliases {
+		ethernet0 = &gmac0;
 		gpio0 = &gpio0;
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
@@ -108,6 +109,25 @@ &sdio0 {
 	status = "okay";
 };
 
+&gmac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_pins>;
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&mdio0 {
+	phy0: ethernet-phy@1 {
+		reg = <1>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <50000>;
+	};
+};
+
 &padctrl_aosys {
 	led_pins: led-0 {
 		led-pins {
@@ -127,6 +147,77 @@ led-pins {
 };
 
 &padctrl0_apsys {
+	gmac0_pins: gmac0-0 {
+		tx-pins {
+			pins = "GMAC0_TX_CLK",
+			       "GMAC0_TXEN",
+			       "GMAC0_TXD0",
+			       "GMAC0_TXD1",
+			       "GMAC0_TXD2",
+			       "GMAC0_TXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "GMAC0_RX_CLK",
+			       "GMAC0_RXDV",
+			       "GMAC0_RXD0",
+			       "GMAC0_RXD1",
+			       "GMAC0_RXD2",
+			       "GMAC0_RXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		mdc-pins {
+			pins = "GMAC0_MDC";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		mdio-pins {
+			pins = "GMAC0_MDIO";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+
+		phy-reset-pins {
+			pins = "GMAC0_COL"; /* GPIO3_21 */
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		phy-interrupt-pins {
+			pins = "GMAC0_CRS"; /* GPIO3_22 */
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pins = "UART0_TXD";
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index ca84bc2039ef..d9d2e1f4dc68 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -11,6 +11,11 @@ / {
 	model = "Sipeed Lichee Module 4A";
 	compatible = "sipeed,lichee-module-4a", "thead,th1520";
 
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x00000000 0x2 0x00000000>;
@@ -25,6 +30,16 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&dmac0 {
+	status = "okay";
+};
+
+&aogpio {
+	gpio-line-names = "", "", "",
+			  "GPIO00",
+			  "GPIO04";
+};
+
 &aonsys_clk {
 	clock-frequency = <73728000>;
 };
@@ -55,6 +70,22 @@ &sdio0 {
 	status = "okay";
 };
 
+&gmac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_pins>, <&mdio0_pins>;
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&gmac1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_pins>;
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
 &gpio0 {
 	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
 			  "", "", "", "", "", "", "", "", "", "",
@@ -87,3 +118,107 @@ &gpio3 {
 			  "GPIO09",
 			  "GPIO10";
 };
+
+&mdio0 {
+	phy0: ethernet-phy@1 {
+		reg = <1>;
+	};
+
+	phy1: ethernet-phy@2 {
+		reg = <2>;
+	};
+};
+
+&padctrl0_apsys {
+	gmac0_pins: gmac0-0 {
+		tx-pins {
+			pins = "GMAC0_TX_CLK",
+			       "GMAC0_TXEN",
+			       "GMAC0_TXD0",
+			       "GMAC0_TXD1",
+			       "GMAC0_TXD2",
+			       "GMAC0_TXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "GMAC0_RX_CLK",
+			       "GMAC0_RXDV",
+			       "GMAC0_RXD0",
+			       "GMAC0_RXD1",
+			       "GMAC0_RXD2",
+			       "GMAC0_RXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	gmac1_pins: gmac1-0 {
+		tx-pins {
+			pins = "GPIO2_18", /* GMAC1_TX_CLK */
+			       "GPIO2_20", /* GMAC1_TXEN */
+			       "GPIO2_21", /* GMAC1_TXD0 */
+			       "GPIO2_22", /* GMAC1_TXD1 */
+			       "GPIO2_23", /* GMAC1_TXD2 */
+			       "GPIO2_24"; /* GMAC1_TXD3 */
+			function = "gmac1";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "GPIO2_19", /* GMAC1_RX_CLK */
+			       "GPIO2_25", /* GMAC1_RXDV */
+			       "GPIO2_30", /* GMAC1_RXD0 */
+			       "GPIO2_31", /* GMAC1_RXD1 */
+			       "GPIO3_0",  /* GMAC1_RXD2 */
+			       "GPIO3_1";  /* GMAC1_RXD3 */
+			function = "gmac1";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	mdio0_pins: mdio0-0 {
+		mdc-pins {
+			pins = "GMAC0_MDC";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		mdio-pins {
+			pins = "GMAC0_MDIO";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
+&sdio0 {
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 517a9e2e93a3..f51cc0c465ee 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -222,6 +222,12 @@ aonsys_clk: aonsys-clk {
 		#clock-cells = <0>;
 	};
 
+	stmmac_axi_config: stmmac-axi-config {
+		snps,wr_osr_lmt = <15>;
+		snps,rd_osr_lmt = <15>;
+		snps,blen = <0 0 64 32 0 0 0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -273,6 +279,50 @@ uart0: serial@ffe7014000 {
 			status = "disabled";
 		};
 
+		gmac1: ethernet@ffe7060000 {
+			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
+			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
+			reg-names = "dwmac", "apb";
+			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
+			clock-names = "stmmaceth", "pclk";
+			snps,pbl = <32>;
+			snps,fixed-burst;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,axi-config = <&stmmac_axi_config>;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gmac0: ethernet@ffe7070000 {
+			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
+			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
+			reg-names = "dwmac", "apb";
+			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
+			clock-names = "stmmaceth", "pclk";
+			snps,pbl = <32>;
+			snps,fixed-burst;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,axi-config = <&stmmac_axi_config>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
