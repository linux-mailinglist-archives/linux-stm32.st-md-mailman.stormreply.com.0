Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3948177E382
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 16:26:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DECD0C6B45F;
	Wed, 16 Aug 2023 14:26:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FABEC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 14:26:36 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37GDHGWA002228; Wed, 16 Aug 2023 16:26:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=szXQJpt
 kKizXSfwXSxIj1fEKQa8MbeyLm6VyELkCJP8=; b=eDXXTE+kNc8l575O6SYJRbx
 Q64U+Q2QfzVvBMbbcsz/6S8w395jRmLR8VkA2xerleMO4xW2D09rsYq4/36avVM2
 5oCAXH4Fy9wFyaNxqE26563DkeQxzekw8GXDJqZtp8iBSMnQL0Sh4EuzZOQFkZu8
 jWzW0umKGWEyoGvB7ChfVoX/l8g0V11y3LeHoROQSWs/mbgNfax0tt4KOQ5/siZV
 UpPaT9BQMd8OOKIPu3XOW9lctPrblJ8y7AZmjJr8+IklNcGRbPz47xDce4viyyx4
 TIT/++f0Vu7Ya2/6NzOQMS/XuXMELH/cZMYgJ2Zowt3AOZy9Ev/c9nOncfB+svA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgth628tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 16:26:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E382100061;
 Wed, 16 Aug 2023 16:26:22 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35C3824C447;
 Wed, 16 Aug 2023 16:26:22 +0200 (CEST)
Received: from localhost (10.252.20.29) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 16:26:21 +0200
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Wed, 16 Aug 2023 16:26:17 +0200
Message-ID: <20230816142617.2625802-1-thomas.bourgoin@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.20.29]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_14,2023-08-15_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add HASH on stm32mp131
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

From: Lionel Debieve <lionel.debieve@foss.st.com>

Add the HASH support on stm32mp131.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 672f3b7735a2..4e4f64cfb75b 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1210,6 +1210,17 @@ timer {
 			};
 		};
 
+		hash: hash@54003000 {
+			compatible = "st,stm32mp13-hash";
+			reg = <0x54003000 0x400>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc HASH1>;
+			resets = <&rcc HASH1_R>;
+			dmas = <&mdma 30 0x2 0x1000a02 0x0 0x0>;
+			dma-names = "in";
+			status = "disabled";
+		};
+
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
