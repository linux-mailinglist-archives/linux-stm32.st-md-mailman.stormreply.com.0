Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 345D074883F
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jul 2023 17:45:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCF32C6B45C;
	Wed,  5 Jul 2023 15:45:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 895E9C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 15:45:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365CFucw003266; Wed, 5 Jul 2023 17:45:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=tZcwoxurNeGdbCsmVtPFibHtTPWLiT7gddY+k8WdseA=;
 b=1f0xjDwGKf4JadidiYzNetth/V7O22syv3HcP4WaI72uZrYc/7/+HuWMEez2UDzJDHok
 aOFvMgQP/0JfTC8v/S5H2EatGBL90MJNsiH38b2CUx0r5OoiKhXDooIcMwXk/3opzrQt
 UOTNscVJIxRpUz05Zg00PkWtnjN8KSyXjFmBaGfjMbPvGnDvhPbk70rcik/TdLf6An5N
 H6+/0PoYJq0s5lBX99m7t97EW48USnTW0ZDLBljOkJ33oZRj36NqFXzr/IGkKkNZVsTD
 k8CpMY3hazzSu6VM6mVu09HRrGE+vMjIsCVPv1FkGaBGdWeHP3pHMiIPJz8tGyT7hruC 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn8c9shap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 17:45:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E75A10005E;
 Wed,  5 Jul 2023 17:45:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78FC7236948;
 Wed,  5 Jul 2023 17:45:06 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 17:45:06 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 5 Jul 2023 17:44:58 +0200
Message-ID: <20230705174358.1.I5e925c747298ee283f55a520a1a2f50925a17d75@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230705154459.1194895-1-patrick.delaunay@foss.st.com>
References: <20230705154459.1194895-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_07,2023-07-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe PRIOUZEAU <christophe.priouzeau@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: sm32mp: remove shmem for
	scmi-optee on stm32mp15
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

Since the OP-TEE commit "plat-stm32mp1: scmi_server: default use OP-TEE
shared memory", integrated in OP-TEE 3.22.0-rc1, the default configuration
for STM32MP15x SoCs changes and CFG_STM32MP1_SCMI_SHM_SYSRAM is disabled
by default and the OP-TEE SMCI server uses OP-TEE native shared memory
registered by clients.

To be compatible with this configuration and the next OP-TEE versions,
this patch removes in the STM32MP15 SCMI device tree the SHMEM used by
OP-TEE SCMI and the associated reserved memory in the last 4KByte page
of SRAM.

Fixes: ea3414e1249e ("ARM: dts: stm32: move SCMI related nodes in a dedicated file for stm32mp15")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index 543f24c2f4f6..ad2584213d99 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -16,7 +16,6 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
-			shmem = <&scmi_shm>;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
@@ -60,21 +59,6 @@ scmi_usb33: usb33@2 {
 			};
 		};
 	};
-
-	soc {
-		scmi_sram: sram@2ffff000 {
-			compatible = "mmio-sram";
-			reg = <0x2ffff000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x2ffff000 0x1000>;
-
-			scmi_shm: scmi-sram@0 {
-				compatible = "arm,scmi-shmem";
-				reg = <0 0x80>;
-			};
-		};
-	};
 };
 
 &reg11 {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
