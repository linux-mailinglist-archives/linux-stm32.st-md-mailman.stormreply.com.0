Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190941781E
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Sep 2021 18:03:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE810C5A4F4;
	Fri, 24 Sep 2021 16:03:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DB6CC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 16:03:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ODc9KP008309; 
 Fri, 24 Sep 2021 18:03:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=AWpwaT6zwq0p8d48eBkmNfSbiQBcZtL8hSkteXSX24Y=;
 b=QNN4faaNsVJz3n4qRPICMPs3NzQE20qXbekI+Uf6ss0E63zQt3lAo+E3+e3islST9urk
 MJbnrkPz9O+VWh9he0WnKK1Ti4Xp3GWMDSJdv7YcMnkLKn/PuRXDrfxq6H5UasXfC/xd
 Pyh865u+Dj2jVcmdVBRL6bJDz4abmEco9sFjATtJesrQSVwIfos+KdJbK3TLSax3YexJ
 yGkyzhg/2ExGqAwR3HLwL7CObTSkafl3IVx0jewpwYv0GdV994pvRNorBaik5iz/j807
 rmiXxGSG7Gz+mRVNqgHUjtS6re3sb6Q4NOws1cW8y0sPUB6cxT/JcTTL34Io9cObve8N YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b9fqxrp4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 18:03:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B503810002A;
 Fri, 24 Sep 2021 18:03:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD5BE22ADCC;
 Fri, 24 Sep 2021 18:03:00 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep 2021 18:03:00
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@st.com>, "Rob
 Herring" <robh+dt@kernel.org>
Date: Fri, 24 Sep 2021 18:02:21 +0200
Message-ID: <20210924160221.13287-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix SAI sub nodes register
	range
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

The STM32 SAI subblocks registers offsets are in the range
0x0004 (SAIx_CR1) to 0x0020 (SAIx_DR).
The corresponding range length is 0x20 instead of 0x1c.
Change reg property accordingly.

Fixes: 5afd65c3a060 ("ARM: dts: stm32: add sai support on stm32mp157c")

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index bd289bf5d269..6992a4b0ba79 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -824,7 +824,7 @@
 				#sound-dai-cells = <0>;
 
 				compatible = "st,stm32-sai-sub-a";
-				reg = <0x4 0x1c>;
+				reg = <0x4 0x20>;
 				clocks = <&rcc SAI1_K>;
 				clock-names = "sai_ck";
 				dmas = <&dmamux1 87 0x400 0x01>;
@@ -834,7 +834,7 @@
 			sai1b: audio-controller@4400a024 {
 				#sound-dai-cells = <0>;
 				compatible = "st,stm32-sai-sub-b";
-				reg = <0x24 0x1c>;
+				reg = <0x24 0x20>;
 				clocks = <&rcc SAI1_K>;
 				clock-names = "sai_ck";
 				dmas = <&dmamux1 88 0x400 0x01>;
@@ -855,7 +855,7 @@
 			sai2a: audio-controller@4400b004 {
 				#sound-dai-cells = <0>;
 				compatible = "st,stm32-sai-sub-a";
-				reg = <0x4 0x1c>;
+				reg = <0x4 0x20>;
 				clocks = <&rcc SAI2_K>;
 				clock-names = "sai_ck";
 				dmas = <&dmamux1 89 0x400 0x01>;
@@ -865,7 +865,7 @@
 			sai2b: audio-controller@4400b024 {
 				#sound-dai-cells = <0>;
 				compatible = "st,stm32-sai-sub-b";
-				reg = <0x24 0x1c>;
+				reg = <0x24 0x20>;
 				clocks = <&rcc SAI2_K>;
 				clock-names = "sai_ck";
 				dmas = <&dmamux1 90 0x400 0x01>;
@@ -886,7 +886,7 @@
 			sai3a: audio-controller@4400c004 {
 				#sound-dai-cells = <0>;
 				compatible = "st,stm32-sai-sub-a";
-				reg = <0x04 0x1c>;
+				reg = <0x04 0x20>;
 				clocks = <&rcc SAI3_K>;
 				clock-names = "sai_ck";
 				dmas = <&dmamux1 113 0x400 0x01>;
@@ -896,7 +896,7 @@
 			sai3b: audio-controller@4400c024 {
 				#sound-dai-cells = <0>;
 				compatible = "st,stm32-sai-sub-b";
-				reg = <0x24 0x1c>;
+				reg = <0x24 0x20>;
 				clocks = <&rcc SAI3_K>;
 				clock-names = "sai_ck";
 				dmas = <&dmamux1 114 0x400 0x01>;
@@ -1271,7 +1271,7 @@
 			sai4a: audio-controller@50027004 {
 				#sound-dai-cells = <0>;
 				compatible = "st,stm32-sai-sub-a";
-				reg = <0x04 0x1c>;
+				reg = <0x04 0x20>;
 				clocks = <&rcc SAI4_K>;
 				clock-names = "sai_ck";
 				dmas = <&dmamux1 99 0x400 0x01>;
@@ -1281,7 +1281,7 @@
 			sai4b: audio-controller@50027024 {
 				#sound-dai-cells = <0>;
 				compatible = "st,stm32-sai-sub-b";
-				reg = <0x24 0x1c>;
+				reg = <0x24 0x20>;
 				clocks = <&rcc SAI4_K>;
 				clock-names = "sai_ck";
 				dmas = <&dmamux1 100 0x400 0x01>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
