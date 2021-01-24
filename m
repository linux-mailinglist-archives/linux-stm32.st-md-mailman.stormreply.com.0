Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BBB301DC9
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Jan 2021 18:03:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CE15C57181;
	Sun, 24 Jan 2021 17:03:46 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0C32C5717F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Jan 2021 17:03:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DNzq41Mwwz1rypl;
 Sun, 24 Jan 2021 18:03:44 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DNzq40sd3z1tYWg;
 Sun, 24 Jan 2021 18:03:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 0lgeyNOPJ06X; Sun, 24 Jan 2021 18:03:42 +0100 (CET)
X-Auth-Info: VUSjwYk+C3xvJGqCpa11C2WD1zkVUEgTNVi6c5ABBWo=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 24 Jan 2021 18:03:42 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 24 Jan 2021 18:03:37 +0100
Message-Id: <20210124170337.32917-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V2] ARM: dts: stm32: Rename mmc controller
	nodes to mmc@
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

Per mmc-controller.yaml, the node pattern is "^mmc(@.*)?$" ,
so adjust the node.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Ludovic Barre <ludovic.barre@st.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org
---
V2: Fix stm32h743.dtsi
---
 arch/arm/boot/dts/stm32f429.dtsi  | 2 +-
 arch/arm/boot/dts/stm32f746.dtsi  | 4 ++--
 arch/arm/boot/dts/stm32h743.dtsi  | 2 +-
 arch/arm/boot/dts/stm32mp151.dtsi | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index ad715a0e1c9a..f6530d724d00 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -566,7 +566,7 @@ adc3: adc@200 {
 			};
 		};
 
-		sdio: sdio@40012c00 {
+		sdio: mmc@40012c00 {
 			compatible = "arm,pl180", "arm,primecell";
 			arm,primecell-periphid = <0x00880180>;
 			reg = <0x40012c00 0x400>;
diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 640ff54ed00c..e1df603fc981 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -473,7 +473,7 @@ usart6: serial@40011400 {
 			status = "disabled";
 		};
 
-		sdio2: sdio2@40011c00 {
+		sdio2: mmc@40011c00 {
 			compatible = "arm,pl180", "arm,primecell";
 			arm,primecell-periphid = <0x00880180>;
 			reg = <0x40011c00 0x400>;
@@ -484,7 +484,7 @@ sdio2: sdio2@40011c00 {
 			status = "disabled";
 		};
 
-		sdio1: sdio1@40012c00 {
+		sdio1: mmc@40012c00 {
 			compatible = "arm,pl180", "arm,primecell";
 			arm,primecell-periphid = <0x00880180>;
 			reg = <0x40012c00 0x400>;
diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index b083afd0ebd6..4ebffb0a45a3 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -354,7 +354,7 @@ mdma1: dma-controller@52000000 {
 			dma-requests = <32>;
 		};
 
-		sdmmc1: sdmmc@52007000 {
+		sdmmc1: mmc@52007000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x52007000 0x1000>;
diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 8c2a5d0875d8..33777a80799a 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1055,7 +1055,7 @@ adc2: adc@100 {
 			};
 		};
 
-		sdmmc3: sdmmc@48004000 {
+		sdmmc3: mmc@48004000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x48004000 0x400>;
@@ -1375,7 +1375,7 @@ qspi: spi@58003000 {
 			status = "disabled";
 		};
 
-		sdmmc1: sdmmc@58005000 {
+		sdmmc1: mmc@58005000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58005000 0x1000>;
@@ -1390,7 +1390,7 @@ sdmmc1: sdmmc@58005000 {
 			status = "disabled";
 		};
 
-		sdmmc2: sdmmc@58007000 {
+		sdmmc2: mmc@58007000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58007000 0x1000>;
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
