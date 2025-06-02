Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40BACADF0
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 14:23:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15D4AC36B30;
	Mon,  2 Jun 2025 12:23:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B3D3C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jun 2025 12:23:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552AAQX9025592;
 Mon, 2 Jun 2025 14:22:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 IgxTZBT25twzbM3wpJ4isoQbEkFyGOclWHPMbqKTDj0=; b=gX8sxzd1EhfGsaL1
 pz55+EN38mX+Hl3Ppsu2B+tH0dxwDT0bNdAaVFAww4LC4tQj1kS3C6Zna2nn6DRw
 sh1t4tICsLNQkABqsJB0km0YZiO+qU7zLS6P8pcG1DLF5KkEnMoIoPiOFlODBM1s
 gLb/o5SOB04mnjCaAbeBa9OkrgRewTVRFMQsx8HUw0Y3K71tUg/w7T3jKgqBa02i
 vf65BZoGJtyeXudtHM86O225e6LgJCvVMJUxcOTGX0Hlz2Cq5LhIlYBp8J6mMb+D
 vKDcHwk9QcNvaVOZ71E60x4oGFy7zj+EhK8jhFiBvrxeU6yIckgC5wzOD9rVqTvA
 Fm8pIQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46yrngxjw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Jun 2025 14:22:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5DA1F40054;
 Mon,  2 Jun 2025 14:21:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5DB3B3327A;
 Mon,  2 Jun 2025 14:19:40 +0200 (CEST)
Received: from localhost (10.48.87.146) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 14:19:40 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Mon, 2 Jun 2025 14:19:39 +0200
MIME-Version: 1.0
Message-ID: <20250602-upstream_rcc_mp21-v4-3-336b4278136a@foss.st.com>
References: <20250602-upstream_rcc_mp21-v4-0-336b4278136a@foss.st.com>
In-Reply-To: <20250602-upstream_rcc_mp21-v4-0-336b4278136a@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.146]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_05,2025-05-30_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 3/3] dt-bindings: stm32: cosmetic fixes for
 STM32MP25 clock and reset bindings
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

- drop minItems from access-controllers
- remove rcc label from example
- fixes typos
- remove double '::' from 'See also::'

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../devicetree/bindings/clock/st,stm32mp25-rcc.yaml         | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 88e52f10d1ecc68e818cd7d8cb1ca39dceb7a494..1e3b5d218bb01acb247d27bc6902be821cabd98c 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -11,9 +11,9 @@ maintainers:
 
 description: |
   The RCC hardware block is both a reset and a clock controller.
-  RCC makes also power management (resume/supend).
+  RCC makes also power management (resume/suspend).
 
-  See also::
+  See also:
     include/dt-bindings/clock/st,stm32mp25-rcc.h
     include/dt-bindings/reset/st,stm32mp25-rcc.h
 
@@ -38,7 +38,7 @@ properties:
       - description: CK_SCMI_MSI Low Power Internal oscillator (~ 4 MHz or ~ 16 MHz)
       - description: CK_SCMI_LSE Low Speed External oscillator (32 KHz)
       - description: CK_SCMI_LSI Low Speed Internal oscillator (~ 32 KHz)
-      - description: CK_SCMI_HSE_DIV2 CK_SCMI_HSE divided by 2 (coud be gated)
+      - description: CK_SCMI_HSE_DIV2 CK_SCMI_HSE divided by 2 (could be gated)
       - description: CK_SCMI_ICN_HS_MCU High Speed interconnect bus clock
       - description: CK_SCMI_ICN_LS_MCU Low Speed interconnect bus clock
       - description: CK_SCMI_ICN_SDMMC SDMMC interconnect bus clock
@@ -108,15 +108,14 @@ properties:
       - description: CK_SCMI_ICN_APB2 Peripheral bridge 2
       - description: CK_SCMI_ICN_APB3 Peripheral bridge 3
       - description: CK_SCMI_ICN_APB4 Peripheral bridge 4
-      - description: CK_SCMI_ICN_APBDBG Peripheral bridge for degub
+      - description: CK_SCMI_ICN_APBDBG Peripheral bridge for debug
       - description: CK_SCMI_TIMG1 Peripheral bridge for timer1
       - description: CK_SCMI_TIMG2 Peripheral bridge for timer2
       - description: CK_SCMI_PLL3 PLL3 clock
       - description: clk_dsi_txbyte DSI byte clock
 
   access-controllers:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
 required:
   - compatible
@@ -131,7 +130,7 @@ examples:
   - |
     #include <dt-bindings/clock/st,stm32mp25-rcc.h>
 
-    rcc: clock-controller@44200000 {
+    clock-controller@44200000 {
         compatible = "st,stm32mp25-rcc";
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
