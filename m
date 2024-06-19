Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C27CF90E5D4
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 10:37:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48880C78017;
	Wed, 19 Jun 2024 08:37:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45421C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 08:37:19 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J7P92p024131;
 Wed, 19 Jun 2024 10:37:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 HSEeHUr0hh897plAMVxrPawkWTVmj0QotMkNEu3ecZk=; b=r8ERr3ZwFZ5W+vBa
 IeAL6GD6TQZ6GGmct/09bPVA7zZgp0dacw/5VpNQdWnH4iyYA9Pprrvf+JNkPWbH
 qnLKAX5vrR6MlIOOa7fLkxROHuyK6BaBYyv05h1UVKJzprSTkDOmF8ZWOe7yKDHM
 tgp5Ao0O8zZc+zlYbsPtdHl1Db+URo9TCjbVlfhffpgXP3Zr4//ctyeWz1aiaaBR
 ezegIHoJnUsywVQfBlzV47jXlIHOXU5NlqPXImp5rdNlB9HQBlL0xmN8IP+IgwOy
 7o0MX3SLQTt65rduzK64sGls9UFHxu6h5L6rD+euWXu7Qs6rzdnwOIatGVcnM+iP
 dtMPhA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yuj9n23y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 10:37:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 419B940045;
 Wed, 19 Jun 2024 10:37:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4297B20FA23;
 Wed, 19 Jun 2024 10:36:12 +0200 (CEST)
Received: from localhost (10.48.86.232) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 19 Jun
 2024 10:36:11 +0200
From: Pascal Paillet <p.paillet@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Date: Wed, 19 Jun 2024 10:36:00 +0200
Message-ID: <20240619083602.33007-3-p.paillet@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619083602.33007-1-p.paillet@foss.st.com>
References: <20240619083602.33007-1-p.paillet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.232]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
Cc: p.paillet@foss.st.com
Subject: [Linux-stm32] [PATCH 2/4] arm64: dts: st: add scmi regulators on
	stm32mp25
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

Add SCMI regulators description on STM32MP25.

Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 96d6de29c14c..18094dadc9c4 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/st,stm32mp25-rcc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+#include <dt-bindings/regulator/st,stm32mp25-regulator.h>
 
 / {
 	#address-cells = <2>;
@@ -75,6 +76,40 @@ scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
 			};
+
+			scmi_voltd: protocol@17 {
+				reg = <0x17>;
+
+				scmi_regu: regulators {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					scmi_vddio1: regulator@0 {
+						reg = <VOLTD_SCMI_VDDIO1>;
+						regulator-name = "vddio1";
+					};
+					scmi_vddio2: regulator@1 {
+						reg = <VOLTD_SCMI_VDDIO2>;
+						regulator-name = "vddio2";
+					};
+					scmi_vddio3: regulator@2 {
+						reg = <VOLTD_SCMI_VDDIO3>;
+						regulator-name = "vddio3";
+					};
+					scmi_vddio4: regulator@3 {
+						reg = <VOLTD_SCMI_VDDIO4>;
+						regulator-name = "vddio4";
+					};
+					scmi_vdd33ucpd: regulator@5 {
+						reg = <VOLTD_SCMI_UCPD>;
+						regulator-name = "vdd33ucpd";
+					};
+					scmi_vdda18adc: regulator@7 {
+						reg = <VOLTD_SCMI_ADC>;
+						regulator-name = "vdda18adc";
+					};
+				};
+			};
 		};
 	};
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
