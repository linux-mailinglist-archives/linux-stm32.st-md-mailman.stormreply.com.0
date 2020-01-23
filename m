Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067A146DF6
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 17:13:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA3E9C36B0F;
	Thu, 23 Jan 2020 16:13:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57FD4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 16:13:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00NGCWjH000791; Thu, 23 Jan 2020 17:13:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2pLASYC7DKu+Ek/d/bAfcVV4JHnQ0bcSh78Nb7SNuXc=;
 b=aWuqCrF2rwbiQUbWUIc2yll44u/449dGj/giWC3bNHTZ9fNyWdFBKNZVMxcqst5iot6A
 /aKNp2QpgUPHKkp/SeoA5h4etLSTajWPra4v2sM7uesxRIFPTmhE8VtVBMw+DsbxqOaI
 CJrCd5I6mXnp/vE1fb5F6+6fOfuBe+D/3CKre2SK9SpCgaJuiI7xKsi9IwuhSlHfbbN8
 BM1mLLZc5L+B1DN1MS03FRd/ryrsSbD1XrPcidFh4G8jXY60O+x6HMAqZJU/KXxp3lal
 6Fa6srnEW/rGPf3+MPcxlZz5Z3R/TjF5U2eUBLk1o7hZACMKtj4gv05iYxvHL2k+yR/E vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1ebaye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 17:13:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2533110003A;
 Thu, 23 Jan 2020 17:13:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FCD92BC7D5;
 Thu, 23 Jan 2020 17:13:18 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan 2020 17:13:17
 +0100
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@the-dreams.de>, <robh+dt@kernel.org>
Date: Thu, 23 Jan 2020 17:12:49 +0100
Message-ID: <1579795970-22319-5-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_08:2020-01-23,
 2020-01-23 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: use st,
	stm32mp15-i2c compatible for stm32mp151
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

Replace previous st,stm32f7-i2c compatible with st,stm32mp15-i2c
for the platform stm32mp151.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 02918dd6cf25..2dbf32ca9b36 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -474,7 +474,7 @@
 		};
 
 		i2c1: i2c@40012000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x40012000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
@@ -488,7 +488,7 @@
 		};
 
 		i2c2: i2c@40013000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x40013000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
@@ -502,7 +502,7 @@
 		};
 
 		i2c3: i2c@40014000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x40014000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
@@ -516,7 +516,7 @@
 		};
 
 		i2c5: i2c@40015000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x40015000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
@@ -1468,7 +1468,7 @@
 		};
 
 		i2c4: i2c@5c002000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x5c002000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
@@ -1504,7 +1504,7 @@
 		};
 
 		i2c6: i2c@5c009000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x5c009000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
