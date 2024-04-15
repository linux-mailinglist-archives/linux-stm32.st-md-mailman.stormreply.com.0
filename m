Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E10DF8A523F
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Apr 2024 15:51:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A71C0C6DD94;
	Mon, 15 Apr 2024 13:51:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E1DCC6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 13:51:49 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43FCEbqv013411; Mon, 15 Apr 2024 15:51:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=Qh+d821k3hfgEZijAk5AUEPE177e4SfDnVA2TKafL5Q=; b=6G
 IBxY29LyremTr+C97DwebPQbPfkYQ2kmePUcXBUxVW3Of8fDOhsIT/zvvZcA8WTV
 +WRVMzz+4AkFuOYM9Zq2yoJg6pVrsCm4RYUkWtKGZs81C3xcj254Q7ZFFQiqrhVR
 pS0xooKWuOiJBo6RGNCtEc8gevB+Rk6FNeEBcz+5jgT2RzuWJatXNNaukgs2ynL4
 B7ujWhHx+m5P/uOPHOvHooh+AjOTkiFPUfLHQcjzvo5m0AdfTjjft5N4uf8JHTIA
 f6MuOaJNpYJF9+8fYWBxkTr/AVTFjNJX8S2J+p04Y3eeXVSY3ih4myhI3xgUyeZp
 xd2CdM9mr6wC0nwuNFuA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg3m0dtac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2024 15:51:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 137E440046;
 Mon, 15 Apr 2024 15:51:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B685216EE1;
 Mon, 15 Apr 2024 15:50:51 +0200 (CEST)
Received: from localhost (10.48.86.102) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Apr
 2024 15:50:51 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Mon, 15 Apr 2024 15:49:24 +0200
Message-ID: <20240415134926.1254428-10-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216094758.916722-1-antonio.borneo@foss.st.com>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.102]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_11,2024-04-15_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 09/11] ARM: dts: stm32: List exti parent
	interrupts on stm32mp131
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

Stop using the table inside the EXTI driver and list in DT the
mapping between EXTI events and its parent interrupts.

By switching away from using the internal table, there is no need
anymore to use the specific compatible "st,stm32mp13-exti", which
was introduced to select the proper internal table.

Convert the driver's table for stm32mp131 to the DT property
interrupts-extended.
Switch the compatible string to the generic "st,stm32mp1-exti", in
place of the specific "st,stm32mp13-exti".

Older DT using compatible "st,stm32mp13-exti" will still work as
the driver remains backward compatible.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 74 +++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 3900f32da797b..c432fe109cbec 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1093,10 +1093,82 @@ rcc: rcc@50000000 {
 		};
 
 		exti: interrupt-controller@5000d000 {
-			compatible = "st,stm32mp13-exti", "syscon";
+			compatible = "st,stm32mp1-exti", "syscon";
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			reg = <0x5000d000 0x400>;
+			interrupts-extended =
+				<&intc GIC_SPI 6   IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_0 */
+				<&intc GIC_SPI 7   IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 8   IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 9   IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 10  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 24  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 65  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 66  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 67  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 68  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 41  IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_10 */
+				<&intc GIC_SPI 43  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 77  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 78  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 1   IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 3   IRQ_TYPE_LEVEL_HIGH>,
+				<0>,						/* EXTI_20 */
+				<&intc GIC_SPI 32  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 34  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 73  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 93  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 38  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 39  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 40  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 72  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 53  IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_30 */
+				<&intc GIC_SPI 54  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 83  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 84  IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,						/* EXTI_40 */
+				<0>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 96  IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 92  IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<&intc GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,	/* EXTI_50 */
+				<0>,
+				<&intc GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,						/* EXTI_60 */
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<0>,
+				<&intc GIC_SPI 63  IRQ_TYPE_LEVEL_HIGH>,
+				<0>,
+				<&intc GIC_SPI 98  IRQ_TYPE_LEVEL_HIGH>;	/* EXTI_70 */
 		};
 
 		syscfg: syscon@50020000 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
