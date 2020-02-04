Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61612151BE3
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 15:11:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1518CC36B0C;
	Tue,  4 Feb 2020 14:11:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 895FBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 14:11:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 014E7HMS032493; Tue, 4 Feb 2020 15:10:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=x0039EP8HFPOf0RsTP5nutRrLlUwQCJuQ4Qn7Y7ROVM=;
 b=LN4xvgGWloVP5OMzg2X9XIW8phOvk1uKNM84DLAmoOaWDOVwNmIhJRVWq4QIP8qjaDNY
 yrQXkfMQDAoy/W7+FoTMO8xjwwPlxU9c7Qt3plc7esRHJeyOoNqyPS+xkOkYy+yCI+t4
 MVXJciklou7suhyFSKmqRAI/zzxc4mPu3+OXlmQCrGxYR/OdW2rqlNQ90LeM1At7JPUy
 hvcrLklGDiUOxNWNo+DO0R4WJ8VCKdWRm3Gs5ldmGciC1jB3vqsjpDdw2LSclPXAOCIY
 2fqXb7S+G0Hz394onVULvlDPbY5e5Q1I1q0vEiIDUzBkE6DBxqoFUlDs5PtE8aulbq4y cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw13nssby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 15:10:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 059BF100034;
 Tue,  4 Feb 2020 15:10:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E54822CD0E3;
 Tue,  4 Feb 2020 15:10:53 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 4 Feb 2020 15:10:53
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Tue, 4 Feb 2020 15:10:53 +0100
Message-ID: <20200204141053.28072-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_04:2020-02-04,
 2020-02-04 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: add resets property on
	all DMA nodes on stm32mp151
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

resets property is well-managed in DMA drivers. In previous products,
there were no reset lines, that's why they are missing here in dma1, dma2,
dmamux and mdma nodes.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 53fa6ed82b34..96f43fa48ec4 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -959,6 +959,7 @@
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc DMA1>;
+			resets = <&rcc DMA1_R>;
 			#dma-cells = <4>;
 			st,mem2mem;
 			dma-requests = <8>;
@@ -976,6 +977,7 @@
 				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc DMA2>;
+			resets = <&rcc DMA2_R>;
 			#dma-cells = <4>;
 			st,mem2mem;
 			dma-requests = <8>;
@@ -989,6 +991,7 @@
 			dma-masters = <&dma1 &dma2>;
 			dma-channels = <16>;
 			clocks = <&rcc DMAMUX>;
+			resets = <&rcc DMAMUX_R>;
 		};
 
 		adc: adc@48003000 {
@@ -1281,6 +1284,7 @@
 			reg = <0x58000000 0x1000>;
 			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc MDMA>;
+			resets = <&rcc MDMA_R>;
 			#dma-cells = <5>;
 			dma-channels = <32>;
 			dma-requests = <48>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
