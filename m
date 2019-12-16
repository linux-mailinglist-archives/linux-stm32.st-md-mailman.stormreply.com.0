Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0811FE1D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 06:40:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FCB8C36B10;
	Mon, 16 Dec 2019 05:40:17 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71E4BC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 05:40:14 +0000 (UTC)
X-UUID: b83c995ee2664b2ab22617f9491e5ee6-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZFK5ya63Cy6wgpbjF8WuGV2/7oL5ZesSkDZ/6F6akns=; 
 b=URuXVQ6rEfU70mCz7AhPi2espcq0sh73aLPTTTNiFNhvgqbo3R+//uGoo20HDq62wvq4EZnmIgZI9LreEAz1u3NfJOLD9cKVfvzcItZyn102ixKKiLu4obWhzPEQHRs8FdrSGXPtUfmuxQvI/S39hrN83egTm8WRlM9Ne9e/m5s=;
X-UUID: b83c995ee2664b2ab22617f9491e5ee6-20191216
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1769448215; Mon, 16 Dec 2019 13:40:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 13:40:30 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Dec 2019 13:39:22 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Date: Mon, 16 Dec 2019 13:39:58 +0800
Message-ID: <20191216053958.26130-3-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191216053958.26130-1-biao.huang@mediatek.com>
References: <20191216053958.26130-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yt.shen@mediatek.com,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [v2,
	PATCH 2/2] net-next: dt-binding: dwmac-mediatek: add more
	description for RMII
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

MT2712 SoC can provide RMII reference clock,
so add corresponding description in dt-binding.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../bindings/net/mediatek-dwmac.txt           | 33 +++++++++++++------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
index 8a08621a5b54..afbcaebf062e 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
@@ -14,7 +14,7 @@ Required properties:
 	Should be "macirq" for the main MAC IRQ
 - clocks: Must contain a phandle for each entry in clock-names.
 - clock-names: The name of the clock listed in the clocks property. These are
-	"axi", "apb", "mac_main", "ptp_ref" for MT2712 SoC
+	"axi", "apb", "mac_main", "ptp_ref", "rmii_internal" for MT2712 SoC.
 - mac-address: See ethernet.txt in the same directory
 - phy-mode: See ethernet.txt in the same directory
 - mediatek,pericfg: A phandle to the syscon node that control ethernet
@@ -23,8 +23,10 @@ Required properties:
 Optional properties:
 - mediatek,tx-delay-ps: TX clock delay macro value. Default is 0.
 	It should be defined for RGMII/MII interface.
+	It should be defined for RMII interface when the reference clock is from MT2712 SoC.
 - mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
-	It should be defined for RGMII/MII/RMII interface.
+	It should be defined for RGMII/MII interface.
+	It should be defined for RMII interface.
 Both delay properties need to be a multiple of 170 for RGMII interface,
 or will round down. Range 0~31*170.
 Both delay properties need to be a multiple of 550 for MII/RMII interface,
@@ -34,13 +36,20 @@ or will round down. Range 0~31*550.
 	reference clock, which is from external PHYs, is connected to RXC pin
 	on MT2712 SoC.
 	Otherwise, is connected to TXC pin.
+- mediatek,rmii-clk-from-mac: boolean property, if present indicates that
+	MT2712 SoC provides the RMII reference clock, which outputs to TXC pin only.
 - mediatek,txc-inverse: boolean property, if present indicates that
 	1. tx clock will be inversed in MII/RGMII case,
 	2. tx clock inside MAC will be inversed relative to reference clock
 	   which is from external PHYs in RMII case, and it rarely happen.
+	3. the reference clock, which outputs to TXC pin will be inversed in RMII case
+	   when the reference clock is from MT2712 SoC.
 - mediatek,rxc-inverse: boolean property, if present indicates that
 	1. rx clock will be inversed in MII/RGMII case.
-	2. reference clock will be inversed when arrived at MAC in RMII case.
+	2. reference clock will be inversed when arrived at MAC in RMII case, when
+	   the reference clock is from external PHYs.
+	3. the inside clock, which be sent to MAC, will be inversed in RMII case when
+	   the reference clock is from MT2712 SoC.
 - assigned-clocks: mac_main and ptp_ref clocks
 - assigned-clock-parents: parent clocks of the assigned clocks
 
@@ -50,29 +59,33 @@ Example:
 		reg = <0 0x1101c000 0 0x1300>;
 		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "macirq";
-		phy-mode ="rgmii";
+		phy-mode ="rgmii-rxid";
 		mac-address = [00 55 7b b5 7d f7];
 		clock-names = "axi",
 			      "apb",
 			      "mac_main",
 			      "ptp_ref",
-			      "ptp_top";
+			      "rmii_internal";
 		clocks = <&pericfg CLK_PERI_GMAC>,
 			 <&pericfg CLK_PERI_GMAC_PCLK>,
 			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
-			 <&topckgen CLK_TOP_ETHER_50M_SEL>;
+			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
+			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
 		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
-				  <&topckgen CLK_TOP_ETHER_50M_SEL>;
+				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
+				  <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
 		assigned-clock-parents = <&topckgen CLK_TOP_ETHERPLL_125M>,
-					 <&topckgen CLK_TOP_APLL1_D3>;
+					 <&topckgen CLK_TOP_APLL1_D3>,
+					 <&topckgen CLK_TOP_ETHERPLL_50M>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
 		mediatek,pericfg = <&pericfg>;
 		mediatek,tx-delay-ps = <1530>;
 		mediatek,rx-delay-ps = <1530>;
 		mediatek,rmii-rxc;
 		mediatek,txc-inverse;
 		mediatek,rxc-inverse;
-		snps,txpbl = <32>;
-		snps,rxpbl = <32>;
+		snps,txpbl = <1>;
+		snps,rxpbl = <1>;
 		snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
 		snps,reset-active-low;
 	};
-- 
2.18.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
