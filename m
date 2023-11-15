Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E25F67E2697
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 15:23:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F877C6B460;
	Mon,  6 Nov 2023 14:23:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE947C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Nov 2023 14:23:32 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3A6CcAIH011451; Mon, 6 Nov 2023 15:23:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=6RvQCNT
 AbR4WG3MTp5KNgtlkKEXn2F/eV91u9BzdgVI=; b=cMiIKgJ53zl/C+cKmVZRoYc
 KXCPZNyoU5ro5mAjW9n2X8tjUjIRW4UO2lblErAx8KcMZuPCynBqogYV74+Xk+H3
 zsRVu3tUr31sNsT4rGdxSzA59m0LmPWFgHmpN3vE+3OqJfONgxxIMglZ1vNoktrv
 5qF8mUBcDzk1DaRMPFBvEgaK4SB4IXhQNQ+owfQeIPEj26g1pcFBRyZ1MinxCdI+
 Xvcuduj2nSPlH63pHL60sZTNQ66SS7ciT/LDn2AVyPuXk+KvvDigV+8VmIsYzI/4
 YCX/KnkIyQ15CaMF6fxTUPAQMFz13fbVCPsGSyuGyfV+Lx0aBe3eF7+rO6lJiOg=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u5eq2fcxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Nov 2023 15:23:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F35D510005C;
 Mon,  6 Nov 2023 15:23:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DABD9257A92;
 Mon,  6 Nov 2023 15:23:14 +0100 (CET)
Received: from localhost (10.201.21.240) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 6 Nov
 2023 15:23:14 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
Date: Mon, 6 Nov 2023 15:18:41 +0100
Message-ID: <20231106141845.102648-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.240]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_12,2023-11-02_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/4] Introduce STM32MP257 clock driver
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

This patch-set introduces clock driver for STM32MP257 based on Arm Cortex-35.
It creates also a menuconfig for all STM32MP clock drivers.

Gabriel Fernandez (4):
  dt-bindings: stm32: add clocks and reset binding for stm32mp25
    platform
  clk: stm32: introduce clocks for STM32MP257 platform
  clk: stm32mp1: move stm32mp1 clock driver into stm32 directory
  arm64: dts: st: add rcc support in stm32mp251

 .../bindings/clock/st,stm32mp25-rcc.yaml      |  116 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |   59 +-
 drivers/clk/Kconfig                           |   10 +-
 drivers/clk/Makefile                          |    1 -
 drivers/clk/stm32/Kconfig                     |   35 +
 drivers/clk/stm32/Makefile                    |    2 +
 drivers/clk/{ => stm32}/clk-stm32mp1.c        |    0
 drivers/clk/stm32/clk-stm32mp25.c             | 1003 ++++
 drivers/clk/stm32/stm32mp25_rcc.h             | 4977 +++++++++++++++++
 include/dt-bindings/clock/stm32mp25-clks.h    |  492 ++
 include/dt-bindings/reset/stm32mp25-resets.h  |  167 +
 11 files changed, 6824 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
 create mode 100644 drivers/clk/stm32/Kconfig
 rename drivers/clk/{ => stm32}/clk-stm32mp1.c (100%)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25.c
 create mode 100644 drivers/clk/stm32/stm32mp25_rcc.h
 create mode 100644 include/dt-bindings/clock/stm32mp25-clks.h
 create mode 100644 include/dt-bindings/reset/stm32mp25-resets.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
