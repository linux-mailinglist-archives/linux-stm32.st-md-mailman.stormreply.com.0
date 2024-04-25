Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E98B258A
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 17:47:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CA46C71292;
	Thu, 25 Apr 2024 15:47:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E857C71291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 15:47:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PDESOr021448;
 Thu, 25 Apr 2024 17:46:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=4NMVoNz
 2ja0mKMA3zgF7rxaTumBVu43eHSfBqn+yggE=; b=p0D3vHvYlFwZHcf7hV/v3de
 Uc5+XgJ57P+DbpLWYQACVBnDzPoKmDmPoAlc3NJ38Ps5ez2VBy12W24CUp9/IbaL
 ZQAWrOuTMjma+2AD9rc3FSxD5HOG9aOM4u3Pm8qnMoaAYDaVZnMsFfJCbHYFM4zM
 qCAdfhYCG8fjNHXDpi2gn2vNS7KxnsSsawOsBHElZutUZ1kMufedlb25+cOPXk6S
 9SWQ7XgnX2F36BXQbZbUCRiHYzpBmjjSIX9tvEyF5Kjs9psIcVc3DToH6fPEsX4P
 OpYs3fy5KiO86yrx2+rU/od5VVi8KwCSoW0H8bBxoGb//zTGO/Ksqy1tZpCXlLg=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm51wen46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Apr 2024 17:46:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A1F5E4002D;
 Thu, 25 Apr 2024 17:46:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43D512258BA;
 Thu, 25 Apr 2024 17:46:04 +0200 (CEST)
Received: from localhost (10.48.86.112) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 17:46:03 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 25 Apr 2024 17:45:55 +0200
Message-ID: <20240425174519.1.I443a218decda670093bc621165e3052db14d4c02@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_15,2024-04-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] arm64: dts: st: add power domain on stm32mp25
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

Add power domains on STM32MP25x SoC for supported low power modes:
- CPU_PD0/1: domain for idle of each core Cortex A35 (CStop)
- CLUSTER_PD: D1 domain with Stop1 and LP-Stop1 modes support when
  the Cortex A35 cluster and each device assigned to CPU1=CA35
  are deactivated
- RET_PD: D1 domain retention (VDDCore is reduced) to support
          the LPLV-Stop1 mode

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp253.dtsi |  9 +++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index af1444bf9442..4beb0a0bef4f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -18,6 +18,8 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD0>;
+			power-domain-names = "psci";
 		};
 	};
 
@@ -104,6 +106,20 @@ intc: interrupt-controller@4ac00000 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		CPU_PD0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+		};
+
+		CLUSTER_PD: power-domain-cluster {
+			#power-domain-cells = <0>;
+			power-domains = <&RET_PD>;
+		};
+
+		RET_PD: power-domain-retention {
+			#power-domain-cells = <0>;
+		};
 	};
 
 	timer {
diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index af48e82efe8a..79c02ef2e51e 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -12,6 +12,8 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			reg = <1>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD1>;
+			power-domain-names = "psci";
 		};
 	};
 
@@ -20,4 +22,11 @@ arm-pmu {
 			     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
+
+	psci {
+		CPU_PD1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER_PD>;
+		};
+	};
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
