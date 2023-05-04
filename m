Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED9A6F6892
	for <lists+linux-stm32@lfdr.de>; Thu,  4 May 2023 11:47:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F051C6A610;
	Thu,  4 May 2023 09:47:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96D1BC6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 May 2023 09:47:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3448eebS015762; Thu, 4 May 2023 11:46:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=tr01CIe/LpDGGpoPafu39bOHteV6ORG+tu0CkFYJUD0=;
 b=8AdbekMAyF/Vouy9hihxbWWvtjd7UozRxa1KRcWR7ENzD9GnPUAab3n3JAyQucvLlG4h
 Wbo9rC3xL4vG6z89tBgjS/kicSigfLlDdEWdfuzn1SfPcDCMfccvA8vYNXyF6t0S32fm
 y2nPbGg8wkVgaMCuTr4UhIa6dj+0KvGstXWEavYi7Zm0oQK945JWHRpbroxUMFfvtsX4
 L2QStngYN5VYgd+od2EjpuFohghPUfQhPvLcf3Zz8qBUZnLqkp0GCj2Jzb1ve82fi/lb
 Ix4yMrCb22sZba3eNmVGYkq3nlm7drHW4Kj6pCpVG+i2GKVE7lRBCz5Eyk8kj2Sh1vGq hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qc6uw9tdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 11:46:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20A50100034;
 Thu,  4 May 2023 11:46:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18B882138F9;
 Thu,  4 May 2023 11:46:56 +0200 (CEST)
Received: from localhost (10.201.21.213) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 4 May
 2023 11:46:55 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Thu, 4 May 2023 11:46:41 +0200
Message-ID: <20230504094641.870378-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504094641.870378-1-arnaud.pouliquen@foss.st.com>
References: <20230504094641.870378-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_06,2023-05-03_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/4] ARM: dts: stm32: fix m4_rproc
	references to use SCMI
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

Fixes stm32mp15*-scmi DTS files introduced in [1]:
This patch fixes the node which uses the MCU reset and adds the
missing HOLD_BOOT which is also handled by the SCMI reset service.

This change cannot be applied as a fix on commit [1], the management
of the hold boot impacts also the stm32_rproc driver.

[1] 'commit 5b7e58313a77 ("ARM: dts: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)")'

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts | 6 ++++--
 arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts | 6 ++++--
 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts | 6 ++++--
 arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts | 6 ++++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
index e539cc80bef8..134788e64265 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
@@ -55,8 +55,10 @@ &mdma1 {
 	resets = <&scmi_reset RST_SCMI_MDMA>;
 };
 
-&mlahb {
-	resets = <&scmi_reset RST_SCMI_MCU>;
+&m4_rproc {
+	resets = <&scmi_reset RST_SCMI_MCU>,
+		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
+	reset-names =  "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
index 97e4f94b0a24..c42e658debfb 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
@@ -61,8 +61,10 @@ &mdma1 {
 	resets = <&scmi_reset RST_SCMI_MDMA>;
 };
 
-&mlahb {
-	resets = <&scmi_reset RST_SCMI_MCU>;
+&m4_rproc {
+	resets = <&scmi_reset RST_SCMI_MCU>,
+		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
+	reset-names =  "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
index 9cf0a44d2f47..7a56ff2d4185 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
@@ -60,8 +60,10 @@ &mdma1 {
 	resets = <&scmi_reset RST_SCMI_MDMA>;
 };
 
-&mlahb {
-	resets = <&scmi_reset RST_SCMI_MCU>;
+&m4_rproc {
+	resets = <&scmi_reset RST_SCMI_MCU>,
+		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
+	reset-names =  "mcu_rst", "hold_boot";
 };
 
 &rcc {
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
index 3b9dd6f4ccc9..119874dd91e4 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
@@ -66,8 +66,10 @@ &mdma1 {
 	resets = <&scmi_reset RST_SCMI_MDMA>;
 };
 
-&mlahb {
-	resets = <&scmi_reset RST_SCMI_MCU>;
+&m4_rproc {
+	resets = <&scmi_reset RST_SCMI_MCU>,
+		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
+	reset-names =  "mcu_rst", "hold_boot";
 };
 
 &rcc {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
