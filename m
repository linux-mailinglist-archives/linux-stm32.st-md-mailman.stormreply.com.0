Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB2122781
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 10:22:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87FB5C36B18;
	Tue, 17 Dec 2019 09:22:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0BC5C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 09:22:41 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH9I8ln013158; Tue, 17 Dec 2019 10:22:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ZJaz6YDY6+PS/DfjYewnZZEfTHRT8KLeDP4ytvQdXsQ=;
 b=vuUh3Z6czIJak//+81n02edIG1dyxM9RMiR0xXdcT2pPagvLkQ8TzHv3zgFTo525fLt5
 Z4JAu1Noc9BDo07n7VzkrboQXbdwPKJbX8JEKNByWeUwfNeUNy7TNaTDnGQEccAqHxOn
 YHQg0BKjFSxLkYFNpNJP0hhsuMjwNbRFIGdWEMKPt3ygdIXrkx20dHYycKKdsxAN+cRJ
 agWfw701uHNitCi+n7lbJLs5Qf8iGkKT5VQu5bCUA0XjfEY/MpkvfSiexSdS/vbrtZn1
 EwOm1T+TiLlK87dq8hrx11M24O8XozxqDjaVJFHu7EG+H9tuV+dUX+Ym1pLXpsHAMaP8 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvpd1dvrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 10:22:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1F0010002A;
 Tue, 17 Dec 2019 10:22:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B51132A64E4;
 Tue, 17 Dec 2019 10:22:34 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 17 Dec 2019 10:22:34
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <vkoul@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Tue, 17 Dec 2019 10:22:00 +0100
Message-ID: <20191217092201.20022-6-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20191217092201.20022-1-benjamin.gaignard@st.com>
References: <20191217092201.20022-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/6] ARM: dts: stm32: fix dma controller node
	name on stm32f743
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

Modify dma controller nodes name to fit with the standard naming.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32h743.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index c065266ee377..05eb02e6d083 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -231,7 +231,7 @@
 			status = "disabled";
 		};
 
-		dma1: dma@40020000 {
+		dma1: dma-controller@40020000 {
 			compatible = "st,stm32-dma";
 			reg = <0x40020000 0x400>;
 			interrupts = <11>,
@@ -249,7 +249,7 @@
 			status = "disabled";
 		};
 
-		dma2: dma@40020400 {
+		dma2: dma-controller@40020400 {
 			compatible = "st,stm32-dma";
 			reg = <0x40020400 0x400>;
 			interrupts = <56>,
@@ -329,7 +329,7 @@
 			status = "disabled";
 		};
 
-		mdma1: dma@52000000 {
+		mdma1: dma-controller@52000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x52000000 0x1000>;
 			interrupts = <122>;
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
