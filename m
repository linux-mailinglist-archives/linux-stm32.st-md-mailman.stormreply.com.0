Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C72903C9B
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 15:03:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97B70C78004;
	Tue, 11 Jun 2024 13:03:45 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05D61C78003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 13:03:39 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BBd5oY027852;
 Tue, 11 Jun 2024 15:03:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rzB8FDfqH/5o0JaJks8+M9T6Lw8YHBZ4Oeie2tNtBWI=; b=6TtpdRdRzXuyADNg
 ZQzSjNUu2YytkLMkfn0r6yHZPlBjx8FOyTizU6HB7jJy6whwESEkEAWq94WAVBrh
 MzeESaqrGVTjFVIJ2PJbkWtr+FrpDsRmKpS/hN1Af0ldvbJJNqIRe6v9GPdCcaNd
 uYp3Xs4SN4HuqzfghTQ1d8fi4iVD+tZqGabxhKvxHlaNK9gizxrUiGLBq4rLOYh5
 pxSHWzIsPn0TQckunX7gPi03EoqNpc2JZ9Fc6rVKEfNXntIvumvqSmbUUgmw3YO7
 n8s+qjgLNFAtYRdATMtinonykkemfQmgZ2u8CdX+rdZ4Dz+iHlRQYmet8JDZj/64
 +UKKWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp2b054-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 15:03:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6154C4004C;
 Tue, 11 Jun 2024 15:03:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC6E1216833;
 Tue, 11 Jun 2024 15:01:59 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 15:01:57 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Tue, 11 Jun 2024 15:01:08 +0200
Message-ID: <20240611130110.841591-2-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611130110.841591-1-christophe.roullier@foss.st.com>
References: <20240611130110.841591-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/3] ARM: dts: stm32: add ethernet1 and
	ethernet2 support on stm32mp13
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

Both instances ethernet based on GMAC SNPS IP on stm32mp13.
GMAC IP version is SNPS 4.20.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 38 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp133.dtsi | 31 +++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 6704ceef284d3..f41508195eb51 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -979,6 +979,12 @@ ts_cal1: calib@5c {
 			ts_cal2: calib@5e {
 				reg = <0x5e 0x2>;
 			};
+			ethernet_mac1_address: mac1@e4 {
+				reg = <0xe4 0x6>;
+			};
+			ethernet_mac2_address: mac2@ea {
+				reg = <0xea 0x6>;
+			};
 		};
 
 		etzpc: bus@5c007000 {
@@ -1505,6 +1511,38 @@ sdmmc2: mmc@58007000 {
 				status = "disabled";
 			};
 
+			ethernet1: ethernet@5800a000 {
+				compatible = "st,stm32mp13-dwmac", "snps,dwmac-4.20a";
+				reg = <0x5800a000 0x2000>;
+				reg-names = "stmmaceth";
+				interrupts-extended = <&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+						      <&exti 68 1>;
+				interrupt-names = "macirq", "eth_wake_irq";
+				clock-names = "stmmaceth",
+					      "mac-clk-tx",
+					      "mac-clk-rx",
+					      "ethstp",
+					      "eth-ck";
+				clocks = <&rcc ETH1MAC>,
+					 <&rcc ETH1TX>,
+					 <&rcc ETH1RX>,
+					 <&rcc ETH1STP>,
+					 <&rcc ETH1CK_K>;
+				snps,axi-config = <&stmmac_axi_config_1>;
+				snps,mixed-burst;
+				snps,pbl = <2>;
+				snps,tso;
+				st,syscon = <&syscfg 0x4 0xff0000>;
+				access-controllers = <&etzpc 48>;
+				status = "disabled";
+
+				stmmac_axi_config_1: stmmac-axi-config {
+					snps,blen = <0 0 0 0 16 8 4>;
+					snps,rd_osr_lmt = <0x7>;
+					snps,wr_osr_lmt = <0x7>;
+				};
+			};
+
 			usbphyc: usbphyc@5a006000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm/boot/dts/st/stm32mp133.dtsi b/arch/arm/boot/dts/st/stm32mp133.dtsi
index 3e394c8e58b92..ae2fbc09e93b9 100644
--- a/arch/arm/boot/dts/st/stm32mp133.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp133.dtsi
@@ -68,4 +68,35 @@ channel@18 {
 			};
 		};
 	};
+
+	ethernet2: ethernet@5800e000 {
+		compatible = "st,stm32mp13-dwmac", "snps,dwmac-4.20a";
+		reg = <0x5800e000 0x2000>;
+		reg-names = "stmmaceth";
+		interrupts-extended = <&intc GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "macirq";
+		clock-names = "stmmaceth",
+			      "mac-clk-tx",
+			      "mac-clk-rx",
+			      "ethstp",
+			      "eth-ck";
+		clocks = <&rcc ETH2MAC>,
+			 <&rcc ETH2TX>,
+			 <&rcc ETH2RX>,
+			 <&rcc ETH2STP>,
+			 <&rcc ETH2CK_K>;
+		snps,axi-config = <&stmmac_axi_config_2>;
+		snps,mixed-burst;
+		snps,pbl = <2>;
+		snps,tso;
+		st,syscon = <&syscfg 0x4 0xff000000>;
+		access-controllers = <&etzpc 49>;
+		status = "disabled";
+
+		stmmac_axi_config_2: stmmac-axi-config {
+			snps,blen = <0 0 0 0 16 8 4>;
+			snps,rd_osr_lmt = <0x7>;
+			snps,wr_osr_lmt = <0x7>;
+		};
+	};
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
