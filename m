Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FDB71606F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 14:48:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A5C6C6A616;
	Tue, 30 May 2023 12:48:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EABDAC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 12:48:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UCAgre017542; Tue, 30 May 2023 14:48:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Do0DjikyeIDFZP9oGmyZJjVUwz6VAIDmWXDZg0ApHTI=;
 b=X17XIzBHPM4SWuko/RB6ogwCTzLbiqELLn7CU++i+dC2onOJVEAsR6KGzqhEXnJ/m9Wf
 HPWGoVPIDrNf/zN6ubzLMCvmpMYlTYCx0NDr0hfH8A+01C2WZ9zVk5VrF9pN1oHS0lqg
 g1GHwmnhRRxa0wEm5TzBcZC2f93g5QQx8Z/jMlaKjcTqGInuCdM0AZCCTEWGXGZLzLv/
 yz9/BhH6WOJ/boKliF2ubmBjk1pp4Y7g2zaqPrauqARlEougS5y4w61fh+GRXSAkjJmM
 pQsxPHGchpTLWrKMsmN1pQRXWAir0PErwEwlgi/+dXaaFnvC8X3KHbHRJZ5etM55DxmW vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quahy7yun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 14:48:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BE5A100038;
 Tue, 30 May 2023 14:48:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54A852248DB;
 Tue, 30 May 2023 14:48:20 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 14:48:20 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 30 May 2023 14:45:36 +0200
Message-ID: <20230530124538.621760-9-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530124538.621760-1-olivier.moysan@foss.st.com>
References: <20230530124538.621760-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_09,2023-05-30_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 8/9] ARM: dts: stm32: adopt generic iio
	bindings for adc channels on dhcor-testbench
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

Use STM32 ADC generic bindings instead of legacy bindings on
DHCOR Testbench board.

The STM32 ADC specific binding to declare channels has been deprecated,
hence adopt the generic IIO channels bindings, instead.
The STM32MP151 device tree now exposes internal channels using the
generic binding. This makes the change mandatory here to avoid a mixed
use of legacy and generic binding, which is not supported by the driver.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../boot/dts/stm32mp15xx-dhcor-testbench.dtsi | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
index faed31b6d84a..ab7f0ba49639 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
@@ -41,15 +41,35 @@ &adc {
 	status = "okay";
 
 	adc1: adc@0 {
-		st,adc-channels = <0 1 6>;
-		st,min-sample-time-nsecs = <5000>;
 		status = "okay";
+		channel@0 {
+			reg = <0>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@1 {
+			reg = <1>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@6 {
+			reg = <6>;
+			st,min-sample-time-ns = <5000>;
+		};
 	};
 
 	adc2: adc@100 {
-		st,adc-channels = <0 1 2>;
-		st,min-sample-time-nsecs = <5000>;
 		status = "okay";
+		channel@0 {
+			reg = <0>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@1 {
+			reg = <1>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@2 {
+			reg = <2>;
+			st,min-sample-time-ns = <5000>;
+		};
 	};
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
