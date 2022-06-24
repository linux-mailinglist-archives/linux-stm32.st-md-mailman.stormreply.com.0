Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 438BB559683
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jun 2022 11:27:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3C5AC5EC76;
	Fri, 24 Jun 2022 09:27:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57BBDC5E2C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 09:27:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25O44J3f011687;
 Fri, 24 Jun 2022 11:27:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=SdyaxZIoCL7TC+NVPJFvkKYNSlzvcCvaVVGIFyuzSrk=;
 b=vw+wTPN0u/542tWVnVDSu5rEp9QITz7OeADygtFh7ah/VCzhNrQoJDGuTCqjeM5Z1+Cr
 UlJa3tQQawJb7wfMQMKxtHv+FWTFzEKZuM1D3ew2a2GsJ5xYqGYH/C9163qOnJAb2q+1
 HJcIfpkjxU3l8fsfBfh5jc5PgffPbugemcBMCSVQGCbKzq1AGSXIX6KTI4wKDr+QY+XV
 QBcWTe9bjnfFMiRuiL1esRYlDtgjVDPrUeIhQuR3TQfUNNGRQ9OaXDEscvBrmBnXimfY
 WL8l8O3uLdHLR8gD1ya8VRSKVdAvFfpwAQxp6Ndc3gAhfLfWIYHLJJ5Jc4HiuHtMrDeh xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gw5wysrcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 11:27:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6E1810002A;
 Fri, 24 Jun 2022 11:27:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D176E2138D8;
 Fri, 24 Jun 2022 11:27:19 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 24 Jun
 2022 11:27:19 +0200
From: <gabriel.fernandez@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 24 Jun 2022 11:27:14 +0200
Message-ID: <20220624092715.1397827-3-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624092715.1397827-1-gabriel.fernandez@foss.st.com>
References: <20220624092715.1397827-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_05,2022-06-23_01,2022-06-22_01
Cc: devicetree@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: DSI should use LSE SCMI
	clock on DK1/ED1 STM32 board
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

LSE clock is provided by SCMI.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts | 4 ++++
 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
index 36371d6ed660..e539cc80bef8 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
@@ -29,6 +29,10 @@ &cpu1 {
 	clocks = <&scmi_clk CK_SCMI_MPU>;
 };
 
+&dsi {
+	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
+};
+
 &gpioz {
 	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
 };
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
index c1a79272c068..9cf0a44d2f47 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
@@ -34,6 +34,10 @@ &cryp1 {
 	resets = <&scmi_reset RST_SCMI_CRYP1>;
 };
 
+&dsi {
+	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
+};
+
 &gpioz {
 	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
