Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC789A0A3C
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 14:43:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AAF7C78032;
	Wed, 16 Oct 2024 12:43:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D432C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 12:43:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GAv7RR018446;
 Wed, 16 Oct 2024 14:42:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=FXtu/QHGpXfhegm33yGhz2
 xtymGMtBPYcZnOTLNw6kA=; b=yuoH5bdq6hLAyMsnWVkdV0Goz14wUJfaVZVplk
 942M2Qm5eOX5JSbY5txCtxwxtyjotKKYKvV9oIsaidZlJ6APvESXi9qJy6cCcIyg
 GHqx1HlfMnXi9qH0KWwyRdoLoH0D0ftJWUzyDUF4Inh7nKWCgWyPQNcR9ETMJc9B
 TRZx+kNLj6r2xN32Zz52fgVmy+SyUR6xMzqGs50Id+MgMhdtOL52z/zKnSFY/CjR
 rsGVAW5g++zh7pARjqae0pnyZYTpNtYSAAp67gLtMjT/fJqUkzgOXr8sjy7tbD2/
 9BsiN+uGejTsgUcL6HU9jwy7ebVy+Dp848KXpKzREFR/fNnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42a8mv9uwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 14:42:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3922D40050;
 Wed, 16 Oct 2024 14:41:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F19E237A40;
 Wed, 16 Oct 2024 14:40:20 +0200 (CEST)
Received: from localhost (10.252.17.239) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 14:40:19 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 16 Oct 2024 14:39:52 +0200
Message-ID: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABi0D2cC/23OSwqDMBCA4atI1o3k0UTrqvcoXUQzqVloJGNDi
 3j3RqHQgst/YL6ZhSBED0iaYiERkkcfxhzyVJCuN+MDqLe5iWDizBlX1A5G0mESij4na2ZAais
 ndKVky6wleW+K4PxrN2/33L3HOcT3fiLxbfrV2IGWOGXUWMe0lJeag7m6gFjiXHZhIJuXxK9x9
 FES2Wi1BMGV0tDV/8a6rh/Ppn3H+AAAAA==
X-Change-ID: 20241015-dma3-mp25-updates-d7f26753b0dd
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.17.239]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/9] STM32 DMA3 updates for STM32MP25
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

The HW version of STM32 DMA3 inside STM32MP25 requires some tunings to
meet the needs of the interconnect. This series adds the linked list
refactoring feature to have optimal performance when addressing the
memory, and it adds the use of two new bits in the third cell specifying
the DMA transfer requirements:
- bit[16] to prevent packing/unpacking mode to avoid bytes loss in case
of interrupting an ongoing transfer (e.g. UART RX),
- bit[17] to prevent linked-list refactoring because some peripherals
(e.g. FMC ECC) require a one-shot transfer, they trigger the DMA only
once.
It also adds platform data to clamp the burst length on AXI port,
especially when it is interconnected to AXI3 bus, such as on STM32MP25.
Finally this series also contains STM32MP25 device tree updates, to add
DMA support on SPI, I2C, UART and apply the tunings introduced.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Changes in v3:
- Refine commit description of patch 4 about preventing
  additionnal transfers, as per Rob's suggestion.
- Link to v2: https://lore.kernel.org/r/20241015-dma3-mp25-updates-v2-0-b63e21556ec8@foss.st.com

Changes in v2:
- Reword commit title/message/content of patch 4 about preventing
  additionnal transfers, as per Rob's suggestion
- Rework AXI maximum burst length management using SoC specific
  compatible, as pointed out by Rob
- Drop former patches 6 and 8, which are no longer relevant
- Link to v1: https://lore.kernel.org/r/20241010-dma3-mp25-updates-v1-0-adf0633981ea@foss.st.com

---
Amelie Delaunay (9):
      dt-bindings: dma: stm32-dma3: prevent packing/unpacking mode
      dmaengine: stm32-dma3: prevent pack/unpack thanks to DT configuration
      dmaengine: stm32-dma3: refactor HW linked-list to optimize memory accesses
      dt-bindings: dma: stm32-dma3: prevent additional transfers
      dmaengine: stm32-dma3: prevent LL refactoring thanks to DT configuration
      dmaengine: stm32-dma3: clamp AXI burst using match data
      arm64: dts: st: add DMA support on U(S)ART instances of stm32mp25
      arm64: dts: st: add DMA support on I2C instances of stm32mp25
      arm64: dts: st: add DMA support on SPI instances of stm32mp25

 .../bindings/dma/stm32/st,stm32-dma3.yaml          |   6 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  75 +++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   2 +
 drivers/dma/stm32/stm32-dma3.c                     | 119 +++++++++++++++++----
 4 files changed, 182 insertions(+), 20 deletions(-)
---
base-commit: 76355c25e4f71ee4667ebaadd9faf8ec29d18f23
change-id: 20241015-dma3-mp25-updates-d7f26753b0dd

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
