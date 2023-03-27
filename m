Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED9C6CA941
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 17:40:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D6C5C6A5F2;
	Mon, 27 Mar 2023 15:40:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8DC1C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 15:40:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RChs9n009211; Mon, 27 Mar 2023 17:40:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=+2s3HinxEFYlnrVOOc1wZG7xm3r63KTSzXlu+4OWoMY=;
 b=rOdl795eQvFAe6LjBkVMOGMOKdFoYE/JFRRvpQ25q4I3JrpTAv6WHfuJB1zYKeYuF5HL
 3hvxD4Dy7JrggVlYy4bDRCIY/L03G/Bx9ZJ1sYx9/MxCp99qyOnBaaUdKmpD3UVpqTur
 5OlmGrhe5/QFQBf9jbORxcCNdmwl2wUwIAPqv3ygBOOmyp+n0InatT0fCo/dMnuTabxu
 5qyMnBqdsEre3txr3g8kZ0nfJEWdwdTZxCDUhvPsJQPvxlyY43k4egtZYSfgZiJAcDod
 69pOYRDGm3v6Rf+ifFna2zts5xyuacVkaUf3+idOY5Z5cePeUjoDq5kw0tal9HMsl0TP wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pk5xkbnt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 17:40:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 770C510002A;
 Mon, 27 Mar 2023 17:40:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 713B42194ED;
 Mon, 27 Mar 2023 17:40:22 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 27 Mar
 2023 17:40:22 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 27 Mar 2023 17:39:39 +0200
Message-ID: <20230327153943.275124-2-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327152948.274743-1-valentin.caron@foss.st.com>
References: <20230327152948.274743-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/7] ARM: dts: stm32: clean uart aliases on
	stm32mp15xx-dkx boards
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

Remove duplicates and clean uart aliases.
Uart aliases and uart pins should be declared and associated to
uart instance at the same time.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts  | 3 ---
 arch/arm/boot/dts/stm32mp157c-dk2.dts  | 3 ---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 6 ++++++
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 4c8be9c8eb20..0da3667ab1e0 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -17,9 +17,6 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart7;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index 2bc92ef3aeb9..ab13e340f4ef 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -18,9 +18,6 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart7;
 		serial3 = &usart2;
 	};
 
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 11370ae0d868..ded5ab9a4798 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -8,6 +8,12 @@
 #include <dt-bindings/mfd/st,stpmic1.h>
 
 / {
+	aliases {
+		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &uart7;
+	};
+
 	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xc0000000 0x20000000>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
