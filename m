Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36487E469
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Mar 2024 08:54:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DE01C6DD93;
	Mon, 18 Mar 2024 07:54:23 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BC3BC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 22:28:37 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5684ea117a3so3612114a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 15:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710541717; x=1711146517;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EoqrHV/pJegAKS+3Zs75bA48HBVK/uGfqkB8xSr5TFI=;
 b=ebfYF8wxcuwwEMRzDoHbZj7EUnH7+0Qlc67DlvmqLhoS+bVf/P1Fz8WnyfQuHFdFxj
 q6Sfy8PbunBRfoSPk2kx6PGNmw5BIEVagH5ONC9OsPSizXbL5/dzaX+NT8fxugiB6rMi
 qUTDoPLEuX2/E7Fqy1X17owB7qVLsrQGS+B9gch/v2x7VOpHfirE7L4Re1xlLRaMVK96
 98Dq9k5jpsObUvt+Qj0TPaQX6WHNlol9EXavbr7RA56IXNN/bmXm7+E3+MEbxPAeoiD8
 auftqUsijl0MX6NoQhqG1FAQgO648pRtl3SHUFp54Q1EqHIf51aAVpxOsYn9Kuy1/opo
 2Jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710541717; x=1711146517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoqrHV/pJegAKS+3Zs75bA48HBVK/uGfqkB8xSr5TFI=;
 b=VTvmJBVbrKYflO//waz++lGzWkqKFbBCvpSKEFdbtGExEu5WfcBl54XzKrPsOvYAn5
 ed25extSCRItF0gl7GVvlGe9WG/eb3ObgNKK7Y37wsE5lXepp7I4p42T3PMU+wDZ64GY
 ZJocplYGG9fPBAqnrcyV/ioCRB87h6Kb4yUp6HDMuP+JZYbh2RcnEXscHmUOShMx3nbV
 sm1uN6XYYaQ0bFvC93R7OkUQJCbBGltDF9eTU0jUZQCglUofA/b1GlpF+daGRh+LM5vR
 ri+NkGlm2ORhqHEowYQui4ANqA4fUYyCTE0U6SJXzIpblcpRaH/ULPdsp0VfEWl2mOHZ
 wBUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW85oFjNrmHrDsH/qyVJXGezEe4PcJK3GaHzFaUPOyO63cduNCX2kTiMmCdkf5vXWAbVT0Ra5vWui+cKY+8tIVQ3Zm5mkrufafZsatD7hG078IPETkbDtmm
X-Gm-Message-State: AOJu0Yx1bOkKjDR1flJmRCvxRgV++ONf0av6AYMDWbg2JYOFC6iS1pyL
 acLgOFDT4bt22ODPY1E+isRD7WVM1GXG81aiIpFMiq7ztStLjihXOrZHew0ABCM=
X-Google-Smtp-Source: AGHT+IFDlEBQww0G3TM01cGQj7ivgS5yY7b0wcU0XKx4QQySjvP69UWdgIiUkKET9ITrR4aD7fnglA==
X-Received: by 2002:a05:6402:4581:b0:568:bda1:9630 with SMTP id
 ig1-20020a056402458100b00568bda19630mr187152edb.7.1710541716897; 
 Fri, 15 Mar 2024 15:28:36 -0700 (PDT)
Received: from bhlegrsu.conti.de ([2a02:908:2525:6ea0::f845])
 by smtp.googlemail.com with ESMTPSA id
 el9-20020a056402360900b005684173e413sm2039833edb.72.2024.03.15.15.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 15:28:36 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: 
Date: Fri, 15 Mar 2024 23:27:47 +0100
Message-Id: <20240315222754.22366-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240315222754.22366-1-wafgo01@gmail.com>
References: <20240315222754.22366-1-wafgo01@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Mar 2024 07:54:20 +0000
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Wadim Mueller <wafgo01@gmail.com>,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-clk@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Linux-stm32] [PATCH 1/3] arm64: dts: S32G3: Introduce device tree
	for S32G-VNP-RDB3
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

This commit adds device tree support for the NXP S32G3-based
S32G-VNP-RDB3 Board (Vehicle Networking Platform - Reference Design Board) [1].

The S32G3 features an 8-core ARM Cortex-A53 based SoC developed by NXP.

The device tree files are derived from the official NXP downstream Linux tree [2].

This addition encompasses a limited selection of peripherals that are upstream-supported. Apart from the ARM System Modules (GIC, Generic Timer, etc.), the following IPs have been validated:

    UART: fsl-linflexuart
    SDHC: fsl-imx-esdhc
    Ethernet: synopsys gmac/stmac

Clock settings for the chip rely on ATF Firmware [3]. Pin control integration into the device tree is pending and currently relies on Firmware/U-Boot settings [4].

These changes were validated using the latest BSP39 Firmware/U-Boot from NXP [5].

The modifications enable booting the official Ubuntu 22.04 from NXP on
the RDB3 with default settings from the SD card and eMMC.

[1] https://www.nxp.com/design/design-center/designs/s32g3-vehicle-networking-reference-design:S32G-VNP-RDB3
[2] https://github.com/nxp-auto-linux/linux
[3] https://github.com/nxp-auto-linux/arm-trusted-firmware
[4] https://github.com/nxp-auto-linux/u-boot
[5] https://github.com/nxp-auto-linux/auto_yocto_bsp

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 352 ++++++++++++++++++
 .../boot/dts/freescale/s32g399a-rdb3.dts      |  57 +++
 .../dt-bindings/clock/nxp,s32-scmi-clock.h    | 158 ++++++++
 4 files changed, 568 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32g3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
 create mode 100644 include/dt-bindings/clock/nxp,s32-scmi-clock.h

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2cb0212b63c6..e701008dbc7b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -252,3 +252,4 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx-rpidsi.dtb
 dtb-$(CONFIG_ARCH_S32) += s32g274a-evb.dtb
 dtb-$(CONFIG_ARCH_S32) += s32g274a-rdb2.dtb
 dtb-$(CONFIG_ARCH_S32) += s32v234-evb.dtb
+dtb-$(CONFIG_ARCH_S32) += s32g399a-rdb3.dtb
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
new file mode 100644
index 000000000000..481ddcfd3a6d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/nxp,s32-scmi-clock.h>
+/ {
+	compatible = "nxp,s32g3";
+	interrupt-parent = <&gic>;
+	#address-cells = <0x02>;
+	#size-cells = <0x02>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+
+				core1 {
+					cpu = <&cpu5>;
+				};
+
+				core2 {
+					cpu = <&cpu6>;
+				};
+
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+			clocks = <&dfs S32_SCMI_CLK_A53>;
+			next-level-cache = <&cluster0_l2_cache>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+			clocks = <&dfs S32_SCMI_CLK_A53>;
+			next-level-cache = <&cluster0_l2_cache>;
+			#cooling-cells = <2>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			enable-method = "psci";
+			clocks = <&dfs S32_SCMI_CLK_A53>;
+			next-level-cache = <&cluster0_l2_cache>;
+			#cooling-cells = <2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			enable-method = "psci";
+			clocks = <&dfs S32_SCMI_CLK_A53>;
+			next-level-cache = <&cluster0_l2_cache>;
+			#cooling-cells = <2>;
+		};
+
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			enable-method = "psci";
+			clocks = <&dfs S32_SCMI_CLK_A53>;
+			next-level-cache = <&cluster1_l2_cache>;
+			#cooling-cells = <2>;
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			enable-method = "psci";
+			clocks = <&dfs S32_SCMI_CLK_A53>;
+			next-level-cache = <&cluster1_l2_cache>;
+			#cooling-cells = <2>;
+		};
+
+		cpu6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			enable-method = "psci";
+			clocks = <&dfs S32_SCMI_CLK_A53>;
+			next-level-cache = <&cluster1_l2_cache>;
+			#cooling-cells = <2>;
+		};
+
+		cpu7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			enable-method = "psci";
+			clocks = <&dfs S32_SCMI_CLK_A53>;
+			next-level-cache = <&cluster1_l2_cache>;
+			#cooling-cells = <2>;
+		};
+
+		cluster0_l2_cache: l2-cache0 {
+			compatible = "cache";
+			status = "okay";
+		};
+
+		cluster1_l2_cache: l2-cache1 {
+			compatible = "cache";
+			status = "okay";
+		};
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* sec-phys */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* virt */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* hyp-virt */
+		             <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>, /* sec-phys */
+		             <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>; /* phys */
+		always-on;
+	};
+
+	reserved-memory  {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scmi_tx_buf: shm@d0000000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0000000 0x0 0x80>;
+			no-map;
+		};
+
+		scmi_rx_buf: shm@d0000080 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0xd0000080 0x0 0x80>;
+			no-map;
+		};
+	};
+
+	firmware {
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			mbox-names = "tx", "rx";
+			shmem = <&scmi_tx_buf>, <&scmi_rx_buf>;
+			arm,smc-id = <0xc20000fe>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+			interrupts = <GIC_SPI 300 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "p2a_notif";
+
+			dfs: protocol@13 {
+				reg = <0x13>;
+				#clock-cells = <1>;
+			};
+
+			clks: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+			reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+
+			pinctrl_scmi: protocol@80 {
+				reg = <0x80>;
+				#pinctrl-cells = <2>;
+
+				status = "disabled";
+			};
+		};
+
+		psci: psci {
+			compatible = "arm,psci-1.0";
+			method = "smc";
+		};
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0x80000000>;
+
+		uart0: serial@401c8000 {
+			compatible = "nxp,s32g3-linflexuart",
+				     "fsl,s32v234-linflexuart";
+			reg = <0x401c8000 0x3000>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+		};
+
+		uart1: serial@401cc000 {
+			compatible = "nxp,s32g3-linflexuart",
+				     "fsl,s32v234-linflexuart";
+			reg = <0x401cc000 0x3000>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+		};
+
+		uart2: serial@402bc000 {
+			compatible = "nxp,s32g3-linflexuart",
+				     "fsl,s32v234-linflexuart";
+			reg = <0x402bc000 0x3000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@50800000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x50800000 0x10000>,
+			      <0x50900000 0x200000>,
+			      <0x50400000 0x2000>,
+			      <0x50410000 0x2000>,
+			      <0x50420000 0x2000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			mbi-ranges = <167 16>;
+		};
+
+		qspi: spi@40134000 {
+			compatible = "nxp,s32g3-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x00000000 0x0 0x20000000>,
+				<0x0 0x40134000 0x0 0x1000>;
+			reg-names = "QuadSPI-memory", "QuadSPI";
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "qspi_en", "qspi";
+			clocks = <&clks S32_SCMI_CLK_QSPI_FLASH1X>,
+				 <&clks S32_SCMI_CLK_QSPI_FLASH1X>;
+			spi-max-frequency = <200000000>;
+			spi-num-chipselects = <2>;
+			status = "disabled";
+		};
+
+		usdhc0: mmc@402f0000 {
+			compatible = "nxp,s32g3-usdhc",
+			             "nxp,s32g2-usdhc";
+			reg = <0x402f0000 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks S32_SCMI_CLK_USDHC_MODULE>,
+				 <&clks S32_SCMI_CLK_USDHC_AHB>,
+				 <&clks S32_SCMI_CLK_USDHC_CORE>;
+			clock-names = "ipg", "ahb", "per";
+			status = "disabled";
+		};
+
+		gmac0: ethernet@4033c000 {
+			status = "disabled";
+			compatible = "nxp,s32-dwmac";
+			reg = <0x4033c000 0x2000>, /* gmac IP */
+			      <0x4007c004 0x4>;    /* S32 CTRL_STS reg */
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			tx-fifo-depth = <20480>;
+			rx-fifo-depth = <20480>;
+			dma-coherent;
+			snps,mtl-rx-config = <&mtl_rx_setup_gmac0>;
+			snps,mtl-tx-config = <&mtl_tx_setup_gmac0>;
+			clocks = <&clks S32_SCMI_CLK_GMAC0_AXI>,
+				 <&clks S32_SCMI_CLK_GMAC0_AXI>,
+				 <&clks S32_SCMI_CLK_GMAC0_TX_SGMII>,
+				 <&clks S32_SCMI_CLK_GMAC0_TX_RGMII>,
+				 <&clks S32_SCMI_CLK_GMAC0_TX_RMII>,
+				 <&clks S32_SCMI_CLK_GMAC0_TX_MII>,
+				 <&clks S32_SCMI_CLK_GMAC0_RX_SGMII>,
+				 <&clks S32_SCMI_CLK_GMAC0_RX_RGMII>,
+				 <&clks S32_SCMI_CLK_GMAC0_RX_RMII>,
+				 <&clks S32_SCMI_CLK_GMAC0_RX_MII>,
+				 <&clks S32_SCMI_CLK_GMAC0_TS>;
+			clock-names = "stmmaceth", "pclk",
+				      "tx_sgmii", "tx_rgmii",
+				      "tx_rmii", "tx_mii",
+				      "rx_sgmii", "rx_rgmii",
+				      "rx_rmii", "rx_mii",
+				      "ptp_ref";
+
+			mtl_rx_setup_gmac0: rx-queues-config {
+				snps,rx-queues-to-use = <5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				queue@0 {};
+				queue@1 {};
+				queue@2 {};
+				queue@3 {};
+				queue@4 {};
+			};
+
+			mtl_tx_setup_gmac0: tx-queues-config {
+				snps,tx-queues-to-use = <5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				queue@0 {};
+				queue@1 {};
+				queue@2 {};
+				queue@3 {};
+				queue@4 {};
+			};
+
+			gmac0_mdio: mdio0 {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
new file mode 100644
index 000000000000..707b503c0165
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)
+ */
+
+/dts-v1/;
+
+#include "s32g3.dtsi"
+
+/ {
+	model = "NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)";
+	compatible = "nxp,s32g399a-rdb3", "nxp,s32g3";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		ethernet0 = &gmac0;
+		reset = &reset;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	/* 4GiB RAM */
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0 0x80000000>,
+		      <0x8 0x80000000 0 0x80000000>;
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&mdio_a_phy1>;
+	phy-mode = "rgmii-id";
+};
+
+&gmac0_mdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	mdio_a_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usdhc0 {
+	status = "okay";
+};
diff --git a/include/dt-bindings/clock/nxp,s32-scmi-clock.h b/include/dt-bindings/clock/nxp,s32-scmi-clock.h
new file mode 100644
index 000000000000..240022c1f109
--- /dev/null
+++ b/include/dt-bindings/clock/nxp,s32-scmi-clock.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+
+#ifndef __DT_BINDINGS_NXP_SCMI_CLOCK_S32_H
+#define __DT_BINDINGS_NXP_SCMI_CLOCK_S32_H
+
+#define S32_SCMI_COMPLEX_CLK		0xFFFFFFFFU
+#define S32_SCMI_NOT_IMPLEMENTED_CLK	0xFFFFFFFEU
+
+#define S32_SCMI_CLK_BASE_ID		0U
+#define S32_SCMI_CLK(N)		        ((N) + S32_SCMI_CLK_BASE_ID)
+#define S32_PLAT_SCMI_CLK(N)		((N) + S32_SCMI_PLAT_CLK_BASE_ID)
+
+#define S32_SCMI_CLK_VERSION_MAJOR	(1)
+#define S32_SCMI_CLK_VERSION_MINOR	(0)
+
+/* A53 */
+#define S32_SCMI_CLK_A53		S32_SCMI_CLK(0)
+/* SERDES */
+#define S32_SCMI_CLK_SERDES_AXI	        S32_SCMI_CLK(1)
+#define S32_SCMI_CLK_SERDES_AUX	        S32_SCMI_CLK(2)
+#define S32_SCMI_CLK_SERDES_APB	        S32_SCMI_CLK(3)
+#define S32_SCMI_CLK_SERDES_REF	        S32_SCMI_CLK(4)
+/* FTM0 */
+#define S32_SCMI_CLK_FTM0_SYS		S32_SCMI_CLK(5)
+#define S32_SCMI_CLK_FTM0_EXT		S32_SCMI_CLK(6)
+/* FTM1 */
+#define S32_SCMI_CLK_FTM1_SYS		S32_SCMI_CLK(7)
+#define S32_SCMI_CLK_FTM1_EXT		S32_SCMI_CLK(8)
+/* FlexCAN */
+#define S32_SCMI_CLK_FLEXCAN_REG	S32_SCMI_CLK(9)
+#define S32_SCMI_CLK_FLEXCAN_SYS	S32_SCMI_CLK(10)
+#define S32_SCMI_CLK_FLEXCAN_CAN	S32_SCMI_CLK(11)
+#define S32_SCMI_CLK_FLEXCAN_TS	        S32_SCMI_CLK(12)
+/* LINFlexD */
+#define S32_SCMI_CLK_LINFLEX_XBAR	S32_SCMI_CLK(13)
+#define S32_SCMI_CLK_LINFLEX_LIN	S32_SCMI_CLK(14)
+#define S32_SCMI_CLK_GMAC0_TS		S32_SCMI_CLK(15)
+/* GMAC0 - SGMII */
+#define S32_SCMI_CLK_GMAC0_RX_SGMII	S32_SCMI_CLK(16)
+#define S32_SCMI_CLK_GMAC0_TX_SGMII	S32_SCMI_CLK(17)
+/* GMAC0 - RGMII */
+#define S32_SCMI_CLK_GMAC0_RX_RGMII	S32_SCMI_CLK(18)
+#define S32_SCMI_CLK_GMAC0_TX_RGMII	S32_SCMI_CLK(19)
+/* GMAC0 - RMII */
+#define S32_SCMI_CLK_GMAC0_RX_RMII	S32_SCMI_CLK(20)
+#define S32_SCMI_CLK_GMAC0_TX_RMII	S32_SCMI_CLK(21)
+/* GMAC0 - MII */
+#define S32_SCMI_CLK_GMAC0_RX_MII	S32_SCMI_CLK(22)
+#define S32_SCMI_CLK_GMAC0_TX_MII	S32_SCMI_CLK(23)
+#define S32_SCMI_CLK_GMAC0_AXI	        S32_SCMI_CLK(24)
+/* SPI */
+#define S32_SCMI_CLK_SPI_REG		S32_SCMI_CLK(25)
+#define S32_SCMI_CLK_SPI_MODULE	        S32_SCMI_CLK(26)
+/* QSPI */
+#define S32_SCMI_CLK_QSPI_REG		S32_SCMI_CLK(27)
+#define S32_SCMI_CLK_QSPI_AHB		S32_SCMI_CLK(28)
+#define S32_SCMI_CLK_QSPI_FLASH2X	S32_SCMI_CLK(29)
+#define S32_SCMI_CLK_QSPI_FLASH1X	S32_SCMI_CLK(30)
+/* uSDHC */
+#define S32_SCMI_CLK_USDHC_AHB	        S32_SCMI_CLK(31)
+#define S32_SCMI_CLK_USDHC_MODULE	S32_SCMI_CLK(32)
+#define S32_SCMI_CLK_USDHC_CORE	        S32_SCMI_CLK(33)
+#define S32_SCMI_CLK_USDHC_MOD32K	S32_SCMI_CLK(34)
+/* DDR */
+#define S32_SCMI_CLK_DDR_REG		S32_SCMI_CLK(35)
+#define S32_SCMI_CLK_DDR_PLL_REF	S32_SCMI_CLK(36)
+#define S32_SCMI_CLK_DDR_AXI		S32_SCMI_CLK(37)
+/* SRAM */
+#define S32_SCMI_CLK_SRAM_AXI		S32_SCMI_CLK(38)
+#define S32_SCMI_CLK_SRAM_REG		S32_SCMI_CLK(39)
+/* I2C */
+#define S32_SCMI_CLK_I2C_REG		S32_SCMI_CLK(40)
+#define S32_SCMI_CLK_I2C_MODULE	        S32_SCMI_CLK(41)
+/* SIUL2 */
+#define S32_SCMI_CLK_SIUL2_REG	        S32_SCMI_CLK(42)
+#define S32_SCMI_CLK_SIUL2_FILTER	S32_SCMI_CLK(43)
+/* CRC */
+#define S32_SCMI_CLK_CRC_REG		S32_SCMI_CLK(44)
+#define S32_SCMI_CLK_CRC_MODULE	        S32_SCMI_CLK(45)
+/* EIM0 */
+#define S32_SCMI_CLK_EIM0_REG		S32_SCMI_CLK(46)
+#define S32_SCMI_CLK_EIM0_MODULE	S32_SCMI_CLK(47)
+/* EIM0 */
+#define S32_SCMI_CLK_EIM123_REG	        S32_SCMI_CLK(48)
+#define S32_SCMI_CLK_EIM123_MODULE	S32_SCMI_CLK(49)
+/* EIM */
+#define S32_SCMI_CLK_EIM_REG		S32_SCMI_CLK(50)
+#define S32_SCMI_CLK_EIM_MODULE	        S32_SCMI_CLK(51)
+/* FCCU */
+#define S32_SCMI_CLK_FCCU_MODULE	S32_SCMI_CLK(52)
+#define S32_SCMI_CLK_FCCU_SAFE	        S32_SCMI_CLK(53)
+/* RTC */
+#define S32_SCMI_CLK_RTC_REG		S32_SCMI_CLK(54)
+#define S32_SCMI_CLK_RTC_SIRC		S32_SCMI_CLK(55)
+#define S32_SCMI_CLK_RTC_FIRC		S32_SCMI_CLK(56)
+/* SWT */
+#define S32_SCMI_CLK_SWT_MODULE	        S32_SCMI_CLK(57)
+#define S32_SCMI_CLK_SWT_COUNTER	S32_SCMI_CLK(58)
+/* STM */
+#define S32_SCMI_CLK_STM_MODULE	        S32_SCMI_CLK(59)
+#define S32_SCMI_CLK_STM_REG		S32_SCMI_CLK(60)
+/* PIT */
+#define S32_SCMI_CLK_PIT_MODULE	        S32_SCMI_CLK(61)
+#define S32_SCMI_CLK_PIT_REG		S32_SCMI_CLK(62)
+/* eDMA */
+#define S32_SCMI_CLK_EDMA_MODULE	S32_SCMI_CLK(63)
+#define S32_SCMI_CLK_EDMA_AHB		S32_SCMI_CLK(64)
+/* ADC */
+#define S32_SCMI_CLK_SAR_ADC_BUS	S32_SCMI_CLK(65)
+/* CMU */
+#define S32_SCMI_CLK_CMU_MODULE	        S32_SCMI_CLK(66)
+#define S32_SCMI_CLK_CMU_REG		S32_SCMI_CLK(67)
+/* TMU */
+#define S32_SCMI_CLK_TMU_MODULE	        S32_SCMI_CLK(68)
+#define S32_SCMI_CLK_TMU_REG		S32_SCMI_CLK(69)
+/* FlexRay */
+#define S32_SCMI_CLK_FR_REG		S32_SCMI_CLK(70)
+#define S32_SCMI_CLK_FR_PE		S32_SCMI_CLK(71)
+/* WKPU */
+#define S32_SCMI_CLK_WKPU_MODULE	S32_SCMI_CLK(72)
+#define S32_SCMI_CLK_WKPU_REG		S32_SCMI_CLK(73)
+/* SRC */
+#define S32_SCMI_CLK_SRC_MODULE	        S32_SCMI_CLK(74)
+#define S32_SCMI_CLK_SRC_REG		S32_SCMI_CLK(75)
+/* SRC-TOP */
+#define S32_SCMI_CLK_SRC_TOP_MODULE	S32_SCMI_CLK(76)
+#define S32_SCMI_CLK_SRC_TOP_REG	S32_SCMI_CLK(77)
+/* CTU */
+#define S32_SCMI_CLK_CTU_MODULE	        S32_SCMI_CLK(78)
+#define S32_SCMI_CLK_CTU_CTU		S32_SCMI_CLK(79)
+/* DBG */
+#define S32_SCMI_CLK_DBG_SYS4		S32_SCMI_CLK(80)
+#define S32_SCMI_CLK_DBG_SYS2		S32_SCMI_CLK(81)
+/* Cortex-M7 */
+#define S32_SCMI_CLK_M7_CORE		S32_SCMI_CLK(82)
+/* DMAMUX */
+#define S32_SCMI_CLK_DMAMUX_MODULE	S32_SCMI_CLK(83)
+#define S32_SCMI_CLK_DMAMUX_REG	        S32_SCMI_CLK(84)
+/* GIC */
+#define S32_SCMI_CLK_GIC_MODULE	        S32_SCMI_CLK(85)
+/* MSCM */
+#define S32_SCMI_CLK_MSCM_MODULE	S32_SCMI_CLK(86)
+#define S32_SCMI_CLK_MSCM_REG		S32_SCMI_CLK(87)
+/* SEMA42 */
+#define S32_SCMI_CLK_SEMA42_MODULE	S32_SCMI_CLK(88)
+#define S32_SCMI_CLK_SEMA42_REG	        S32_SCMI_CLK(89)
+/* XRDC */
+#define S32_SCMI_CLK_XRDC_MODULE	S32_SCMI_CLK(90)
+#define S32_SCMI_CLK_XRDC_REG		S32_SCMI_CLK(91)
+/* CLKOUT */
+#define S32_SCMI_CLK_CLKOUT_0		S32_SCMI_CLK(92)
+#define S32_SCMI_CLK_CLKOUT_1		S32_SCMI_CLK(93)
+
+#define S32_SCMI_PLAT_CLK_BASE_ID	S32_SCMI_CLK(94)
+
+#define S32_SCMI_CLK_MAX_ID		S32_PLAT_SCMI_CLK(32)
+
+#endif
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
