Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 233227C67B
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2019 17:26:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D218C35E01;
	Wed, 31 Jul 2019 15:26:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97665C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 15:26:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6VFGFBw001928; Wed, 31 Jul 2019 17:26:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=hqY6QAzzaGShhRhu9sPzoFPBiimrui7oz2W66kOYNWQ=;
 b=jxZlB5bc3GxXWhEvCWZ/i5UcigqrTllppWki5MxLWKZLUsOoapFRNqRU+WzSf6ofL+KY
 dQeWqjBEOgtrMdR1Y+Zfp1IeChNWAsB1/kCp0jJ8wnoJh07UjBfEcdxEdsR/zTTof4ki
 aoQtcskK07fC+V4YEcLtmAK2BZZ743ZGrfdHS+XQqnmF2yUQG1zNTaoOXnfc3nsc/NPu
 mXVpU3Su4EqYQWYOLWEMb9cb4D4snwTIDZFLQYbUhR7W2BPr1A+cp7+5ELBq6CG7gY8U
 F2/Jwp2KTZUHCYETI5VdDxy36QjD9URmJVVCdGsNFdI+LIYNuZMG1L3thyFnkiyYjNoz rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4g33g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 31 Jul 2019 17:26:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0573731;
 Wed, 31 Jul 2019 15:26:09 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E212FF9AA8;
 Wed, 31 Jul 2019 17:26:09 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 31 Jul 2019 17:26:09
 +0200
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, <arnd@arndb.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Wed, 31 Jul 2019 17:26:09 +0200
Message-ID: <20190731152609.32197-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_07:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: remove useless pinctrl
	entries in stm32mp157-pinctrl
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

This patch removes "ngpios" and "gpio-ranges" information from
stm32mp157-pinctrl.dtsi file as it is now filled in stm32mp157 pinctrl
package files.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index df6470133574..3f6008aa28a4 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -24,8 +24,6 @@
 				reg = <0x0 0x400>;
 				clocks = <&rcc GPIOA>;
 				st,bank-name = "GPIOA";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
 				status = "disabled";
 			};
 
@@ -37,8 +35,6 @@
 				reg = <0x1000 0x400>;
 				clocks = <&rcc GPIOB>;
 				st,bank-name = "GPIOB";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
 				status = "disabled";
 			};
 
@@ -50,8 +46,6 @@
 				reg = <0x2000 0x400>;
 				clocks = <&rcc GPIOC>;
 				st,bank-name = "GPIOC";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
 				status = "disabled";
 			};
 
@@ -63,8 +57,6 @@
 				reg = <0x3000 0x400>;
 				clocks = <&rcc GPIOD>;
 				st,bank-name = "GPIOD";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
 				status = "disabled";
 			};
 
@@ -76,8 +68,6 @@
 				reg = <0x4000 0x400>;
 				clocks = <&rcc GPIOE>;
 				st,bank-name = "GPIOE";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
 				status = "disabled";
 			};
 
@@ -89,8 +79,6 @@
 				reg = <0x5000 0x400>;
 				clocks = <&rcc GPIOF>;
 				st,bank-name = "GPIOF";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 80 16>;
 				status = "disabled";
 			};
 
@@ -102,8 +90,6 @@
 				reg = <0x6000 0x400>;
 				clocks = <&rcc GPIOG>;
 				st,bank-name = "GPIOG";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 96 16>;
 				status = "disabled";
 			};
 
@@ -115,8 +101,6 @@
 				reg = <0x7000 0x400>;
 				clocks = <&rcc GPIOH>;
 				st,bank-name = "GPIOH";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 112 16>;
 				status = "disabled";
 			};
 
@@ -128,8 +112,6 @@
 				reg = <0x8000 0x400>;
 				clocks = <&rcc GPIOI>;
 				st,bank-name = "GPIOI";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 128 16>;
 				status = "disabled";
 			};
 
@@ -141,8 +123,6 @@
 				reg = <0x9000 0x400>;
 				clocks = <&rcc GPIOJ>;
 				st,bank-name = "GPIOJ";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 144 16>;
 				status = "disabled";
 			};
 
@@ -154,8 +134,6 @@
 				reg = <0xa000 0x400>;
 				clocks = <&rcc GPIOK>;
 				st,bank-name = "GPIOK";
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl 0 160 8>;
 				status = "disabled";
 			};
 
@@ -849,8 +827,6 @@
 				clocks = <&rcc GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl_z 0 400 8>;
 				status = "disabled";
 			};
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
