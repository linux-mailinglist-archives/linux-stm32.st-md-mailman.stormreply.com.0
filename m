Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F53E2F8E8C
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Jan 2021 19:05:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC89AC57191;
	Sat, 16 Jan 2021 18:05:35 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2DA8C5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 18:05:34 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DJ5Z64Qcbz1qs0p;
 Sat, 16 Jan 2021 19:05:34 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DJ5Z63jNfz1qqkn;
 Sat, 16 Jan 2021 19:05:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id YsgKP4Ot00dp; Sat, 16 Jan 2021 19:05:33 +0100 (CET)
X-Auth-Info: DgP2Scq84PJFIgJmKrhhYnT8L6xBn47Wx0HdBALYiys=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 16 Jan 2021 19:05:33 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sat, 16 Jan 2021 19:05:27 +0100
Message-Id: <20210116180527.57532-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Rename mmc controller nodes
	to mmc@
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
 arch/arm/boot/dts/stm32f429.dtsi  | 2 +-
 arch/arm/boot/dts/stm32f746.dtsi  | 4 ++--
 arch/arm/boot/dts/stm32mp151.dtsi | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

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
