Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD3A2F185
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 16:24:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0934AC78F85;
	Mon, 10 Feb 2025 15:24:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D837C78F8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 15:24:52 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AF0m0F027851;
 Mon, 10 Feb 2025 16:24:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=1oxvjGElHM3a+H6uBmKYvZ
 Xu1ajfuZrjKxAqE8nqy2A=; b=KMSobn1WYylQ2+obOs2BQypQ0aFiE3d8CdZU2/
 t0ms3ktaj3bZ9mRHUwAt+skvfIPGIKx9OstUHOv+SLoBqiyXtM/XVkBJT9lSTLgm
 vOpy0IgbH+vSL7BEYZsB4UbdUh21s6cdU1pTs7BPOAv3vc6I4RbBtQEvTvuItbcM
 OKIhUdn9tlSMf4JVFY77XjQsEQPceNYWudSEWzBb4C3LKCkE1vmqRImlGfIV7EZU
 7kLTSTzDzQLGDygfX1lOokxuCUuZ/NL7DreAs/WPNfRuzEzD+Wu3EreTJWRAfuf8
 ewGCvdzDbSqX9yW4STY5hrS7AtXJQoIGvG+L0rkPqPJA6+TA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44phq3n6b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2025 16:24:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 17B4D4004B;
 Mon, 10 Feb 2025 16:23:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E34DA294C1B;
 Mon, 10 Feb 2025 16:21:36 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 16:21:36 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Mon, 10 Feb 2025 16:20:54 +0100
Message-ID: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFYZqmcC/x3MwQpAQBCA4VfRnG2tQS2vIgkzmIOlHaHk3W2O3
 +H/H1AOwgp18kDgU1Q2H5GlCYxL72c2QtGAFkuLmTVDYfRYc1x37DxfHR1q3EREuatcaXuI5R5
 4kvu/Nu37fo1U79JlAAAA
X-Change-ID: 20250210-b4-stm32mp2_new_dts-8fddd389850a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/10] Expand STM32MP2 family with new SoC and
	boards
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

Add STM32MP25 Discovery Kit board [1] STM32MP257F-DK. It is based on a
different package of STM32MP257 SoC than STM32MP257F-EV1, and has 4GB of
LPDDR4 instead of DDR4.
Introduce two new SoC families [2] with Arm Cortex-A35 and Cortex-M33,
in development:
- STM32MP23x SoCs family, with STM32MP231 (single Arm Cortex-A35),
STM32MP233 and STM32MP235 (dual Arm Cortex-A35) [3]. Add STM32MP235F-DK
board to demonstrate the differences with STM32MP257F-DK board;
- STM32MP21x SoCs family, based on Cortex-A35 single-core, with
STM32MP211, STM32MP213 and STM32MP215. Add STM32MP215F-DK board based on
STM32MP215 SoC, with 2GB of LPDDR4.

[1] https://www.st.com/en/evaluation-tools/stm32mp257f-dk.html
[2] https://www.st.com/en/microcontrollers-microprocessors/stm32-arm-cortex-mpus.html
[3] https://www.st.com/en/microcontrollers-microprocessors/stm32mp235.html

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Alexandre Torgue (3):
      arm64: dts: st: add stm32mp257f-dk board support
      arm64: dts: st: introduce stm32mp23 SoCs family
      arm64: dts: st: introduce stm32mp21 SoCs family

Amelie Delaunay (7):
      dt-bindings: stm32: document stm32mp257f-dk board
      arm64: Kconfig: expand STM32 Armv8 SoC with STM32MP23 SoCs family
      dt-bindings: stm32: document stm32mp235f-dk board
      arm64: dts: st: add stm32mp235f-dk board support
      arm64: Kconfig: expand STM32 Armv8 SoC with STM32MP21 SoCs family
      dt-bindings: stm32: document stm32mp215f-dk board
      arm64: dts: st: add stm32mp215f-dk board support

 .../devicetree/bindings/arm/stm32/stm32.yaml       |   13 +
 arch/arm64/Kconfig.platforms                       |    4 +
 arch/arm64/boot/dts/st/Makefile                    |    6 +-
 arch/arm64/boot/dts/st/stm32mp211.dtsi             |  130 +++
 arch/arm64/boot/dts/st/stm32mp213.dtsi             |    9 +
 arch/arm64/boot/dts/st/stm32mp215.dtsi             |    9 +
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts          |   49 +
 arch/arm64/boot/dts/st/stm32mp21xc.dtsi            |    8 +
 arch/arm64/boot/dts/st/stm32mp21xf.dtsi            |    8 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi             | 1216 ++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp233.dtsi             |   94 ++
 arch/arm64/boot/dts/st/stm32mp235.dtsi             |   16 +
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts          |  115 ++
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi            |    8 +
 arch/arm64/boot/dts/st/stm32mp23xf.dtsi            |    8 +
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  115 ++
 16 files changed, 1807 insertions(+), 1 deletion(-)
---
base-commit: 8c6d469f524960a0f97ec74f1d9ac737a39c3f1e
change-id: 20250210-b4-stm32mp2_new_dts-8fddd389850a

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
