Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3A93FA03
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9492BC78F6B;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FF01C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 22:35:28 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fb0d7e4ee9so21078445ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720910127; x=1721514927;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fMe9w4Sl4nYm2juZuyLgqok6sq0vOd/dm0cLXM37PB8=;
 b=HEnmp9IoPqQIoLpSwzp81RSg6C1j4LIu1See2KAgTjZ4Iz+aGct2Prlye4Zyc5wWEK
 vNsIT/Yy5en7uwb8U3TuQNqTRzH4mLIZ+5nrmt6ELFAnu/GkxwpxyYDEKdK2bmpumo86
 ECf3hJxtmceGeVTHHvv8dQIFlOJrQby7F0+YrA3mtfk0f9N0tcMOoPkXCGIcTwpbwcge
 l2NO6QbTwpGUXw9tKmEO/IAC7Ba8gwRXs6NATN2i3LVbtjE+ZC7VAQohNqEjEaJFGtiv
 yFQkBBb5sm7PsAdgUWhwfswAFVnu1Hp6eISoC1U4GRTRlS3H5eIvE+G/FticBrtzKi1h
 HQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720910127; x=1721514927;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fMe9w4Sl4nYm2juZuyLgqok6sq0vOd/dm0cLXM37PB8=;
 b=w2ru21/nJkM1LHc59qCaISp444zv/NblzCRyZCAp/QP3Zm6YMxH+bq3m5iTujxBhiC
 fjkyE4whQyqJkwaC943W0M2cIGcCHUdvriE6qVzvUDXl1JsJD8d6KWV7EtuOwjN+RmbQ
 5UlxGG3K/uliUlBJJZwG5ti+TwAdNTOPWgTEApmM7k9J/JTVAqdZZbTKs4alqKkZIRNQ
 GMjGD0I5XzDpZSn17cV313BeM5EFyNY/4Fhw6UvE/NFaHuoWXQMIHpDpuDV9W9kSa/9s
 fHlI3Tbe06b4GkLplKKANfgOteVpYfOkjDOYM91BlQJ6VyAhmwnLNmsws1Z7rNpsTX4O
 UwIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSp+7oqfp9LxLpjk0WryCQP/xXu4ksg4/xMKFQXQsxJDxNtlR9XO0KM/SUHoB4P6urPKHrsmeTXOCMCezjyVkp/fFQ3/9Jdj4Lf9NKryqMmGvbCH3B53gw
X-Gm-Message-State: AOJu0YxxNbuarlIFigw9UPXpedyFod5pR0VIH1feyhPtLsvv0ibq/Gje
 vKWDvIUb0oUId5llQhb8ysHJNy92ifkEtWTpIJRr+hHmJxGgNhejkZ4QdmpVPJ8=
X-Google-Smtp-Source: AGHT+IGObIZ643TT2wBhyhU7VKoiLnFm1jB2Pr2MWhe0lodyFncsHzDT94Hk/HfjPv+LynUfQ7XAoQ==
X-Received: by 2002:a17:902:f541:b0:1fb:1faa:96af with SMTP id
 d9443c01a7336-1fbb6ee18d5mr128941985ad.43.1720910126825; 
 Sat, 13 Jul 2024 15:35:26 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:d7fc:57d0:ada6:13b7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc4d9d8sm14640025ad.264.2024.07.13.15.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 15:35:26 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Sat, 13 Jul 2024 15:35:13 -0700
MIME-Version: 1.0
Message-Id: <20240713-thead-dwmac-v1-4-81f04480cd31@tenstorrent.com>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
In-Reply-To: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
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
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720910119; l=9168;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=pgJZ1RvKmdYSrnUvyessF+9Y4MQGDYFqOhd3RpDVmoA=;
 b=Rg/C5Qgi/ty5j4VgYT6Mazq4CfBfpa3p/eKX8d+sJCxiFC4gifdbfADVvkecRYSbGYXkr6qCK
 fqVq2+Ay3AtD/sz+7kxXZ+5CH5iC7ILOF7vxN7fEhW+yjrA8jrwN89b
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 4/4] riscv: dts: thead: Add
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: change apb registers from syscon to second reg of gmac node]
Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  89 ++++++++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 131 +++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  55 ++++++++-
 3 files changed, 273 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index e9f573c7e67c..59b84a318e03 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -15,6 +15,7 @@ / {
 	compatible = "beagle,beaglev-ahead", "thead,th1520";
 
 	aliases {
+		ethernet0 = &gmac0;
 		gpio0 = &gpio0;
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
@@ -111,6 +112,23 @@ &sdio0 {
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
+	};
+};
+
 &padctrl_aosys {
 	led_pins: led-0 {
 		led-pins {
@@ -130,6 +148,77 @@ led-pins {
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
index b5ab80fcd4c3..8a5012f3f3ee 100644
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
@@ -29,6 +34,12 @@ &dmac0 {
 	status = "okay";
 };
 
+&aogpio {
+	gpio-line-names = "", "", "",
+			  "GPIO00",
+			  "GPIO04";
+};
+
 &aonsys_clk {
 	clock-frequency = <73728000>;
 };
@@ -62,6 +73,22 @@ &dmac0 {
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
@@ -94,3 +121,107 @@ &gpio3 {
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
index 34b3e10bab09..21f9f81e5322 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -153,6 +153,12 @@ uart_sclk: uart-sclk-clock {
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
@@ -201,6 +207,50 @@ uart0: serial@ffe7014000 {
 			status = "disabled";
 		};
 
+		gmac1: ethernet@ffe7060000 {
+			compatible = "thead,th1520-dwmac", "snps,dwmac-3.70a";
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
+			compatible = "thead,th1520-dwmac", "snps,dwmac-3.70a";
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
@@ -293,7 +343,7 @@ gpio3: gpio-controller@0 {
 		padctrl1_apsys: pinctrl@ffe7f3c000 {
 			compatible = "thead,th1520-group2-pinctrl";
 			reg = <0xff 0xe7f3c000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 		};
 
 		gpio@ffec005000 {
@@ -339,7 +389,8 @@ gpio1: gpio-controller@0 {
 		padctrl0_apsys: pinctrl@ffec007000 {
 			compatible = "thead,th1520-group3-pinctrl";
 			reg = <0xff 0xec007000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
+
 		};
 
 		uart2: serial@ffec010000 {

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
