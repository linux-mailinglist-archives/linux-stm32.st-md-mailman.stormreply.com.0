Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8682AD8E4
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Nov 2020 15:36:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0E0FC35E2B;
	Tue, 10 Nov 2020 14:36:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A29A0C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 14:36:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AAEVoEM024503; Tue, 10 Nov 2020 15:36:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=mFr7Ui8Iql0dktouHacp+cT97Cl9za3NdjBtbhITl9k=;
 b=swFcLPEoP8AaLoTC2Q1cgfZOMyv4PETC6uds+noRNSpqPofafKvIxnEcZa3F40xZFWmc
 cDXF1gciTncG1/vfY41gkcsrOTfsGmFOfAj4J/42cf4OqE7ZIEwuEQE3TkAu8YX47ITI
 nTxFhv0WBp6ZSNRhcCECQQeS543f/3+rZRCr0rP1LCB07k1kk192Ho7tV0wNX/6JpMlo
 04zo3IC30E726aJA3yuYqyS1+KJy/xC3v6cLiTnum6SQa3eADZFFDAxxZUZJ6+0SUbhl
 0Dmgop4YMLLvDEKOZUM8xAPNxZjf98lcmtw2hACeR+lJQTxkooCvlDOSvgf5ujqi7KeS Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nhkcs7s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 15:36:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DA93100034;
 Tue, 10 Nov 2020 15:36:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 404022BA2D3;
 Tue, 10 Nov 2020 15:36:42 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Nov 2020 15:36:41
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 10 Nov 2020 15:36:41 +0100
Message-ID: <20201110143641.13879-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_05:2020-11-10,
 2020-11-10 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: fix mdma1 clients
	channel priority level on stm32mp151
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

Update mdma1 clients channel priority level following stm32-mdma bindings.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 719a4276a348..b95c46c82223 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1294,7 +1294,7 @@
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc HASH1>;
 			resets = <&rcc HASH1_R>;
-			dmas = <&mdma1 31 0x10 0x1000A02 0x0 0x0>;
+			dmas = <&mdma1 31 0x2 0x1000A02 0x0 0x0>;
 			dma-names = "in";
 			dma-maxburst = <2>;
 			status = "disabled";
@@ -1358,8 +1358,8 @@
 			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
 			reg-names = "qspi", "qspi_mm";
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&mdma1 22 0x10 0x100002 0x0 0x0>,
-			       <&mdma1 22 0x10 0x100008 0x0 0x0>;
+			dmas = <&mdma1 22 0x2 0x100002 0x0 0x0>,
+			       <&mdma1 22 0x2 0x100008 0x0 0x0>;
 			dma-names = "tx", "rx";
 			clocks = <&rcc QSPI_K>;
 			resets = <&rcc QSPI_R>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
