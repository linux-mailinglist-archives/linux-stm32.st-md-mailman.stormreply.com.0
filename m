Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 310567EE4C4
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Nov 2023 16:54:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7B3FC6C839;
	Thu, 16 Nov 2023 15:54:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A0E6C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:54:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGARpgZ007319; Thu, 16 Nov 2023 16:53:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=FTuGpnC
 esklKD7MATIa9GL+6MeJKxiNCBGNvyVSe6Nk=; b=TncYUhDOAaUV7Ccnr+jgp+L
 iKMnNooTL8xJ7naQNIrFTLYbQqBpwLVg9y39pQybqxE4CAFnERE14fPnmupt/LVL
 l/YG59TBOx8GtZViq9S9c4RyIqWeusCCMlxDryCGFvLTZvBstbpQOKbBxbGzUJT+
 tn1Z2YvX+Ap4YsL/9CIC/ffOYh7FI1LTMEDn51cNglKiAGgZ+Esu14H6TlzTQBn2
 SKENEMXIFhfq6q/yFMaDFvtIz2s3h0irwxW9svFdgrBmCk//di0qe5o6Ds8o6sQ1
 pO/mLv8Hy335KQZw4iBvf/R1Xb61FPznRNMh0vaDxUu1SUtzJ9JL0CQ4DX3ERtA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u9ym8ymf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 16:53:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3359A100056;
 Thu, 16 Nov 2023 16:53:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1999023C69E;
 Thu, 16 Nov 2023 16:53:48 +0100 (CET)
Received: from localhost (10.201.21.240) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 16 Nov
 2023 16:53:47 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Thu, 16 Nov 2023 16:49:47 +0100
Message-ID: <20231116154952.1206705-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.240]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_16,2023-11-16_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/5] Introduce STM32MP257 clock driver
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
The STM32MP1 and STM32MP13 are now in same stm32 directory

v2:
  - rework reset binding (use ID witch start from 0)
  - rework reset driver to manage STM32MP13 / STM32MP15 / STM32MP25
    new binding of STM32MP25.
  - rework YAML documentation

Gabriel Fernandez (5):
  clk: stm32mp1: move stm32mp1 clock driver into stm32 directory
  clk: stm32mp1: use stm32mp13 reset driver
  dt-bindings: stm32: add clocks and reset binding for stm32mp25
    platform
  clk: stm32: introduce clocks for STM32MP257 platform
  arm64: dts: st: add rcc support in stm32mp251

 .../bindings/clock/st,stm32mp25-rcc.yaml      |   72 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |   59 +-
 drivers/clk/Kconfig                           |   11 +-
 drivers/clk/Makefile                          |    1 -
 drivers/clk/stm32/Kconfig                     |   36 +
 drivers/clk/stm32/Makefile                    |    2 +
 drivers/clk/stm32/clk-stm32-core.c            |    5 +-
 drivers/clk/stm32/clk-stm32-core.h            |    5 +-
 drivers/clk/{ => stm32}/clk-stm32mp1.c        |  127 +-
 drivers/clk/stm32/clk-stm32mp13.c             |    9 +-
 drivers/clk/stm32/clk-stm32mp25.c             | 1125 ++++
 drivers/clk/stm32/reset-stm32.c               |   76 +-
 drivers/clk/stm32/reset-stm32.h               |   15 +-
 drivers/clk/stm32/stm32mp25_rcc.h             | 4977 +++++++++++++++++
 include/dt-bindings/clock/st,stm32mp25-rcc.h  |  492 ++
 include/dt-bindings/reset/st,stm32mp25-rcc.h  |  165 +
 16 files changed, 6996 insertions(+), 181 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
 create mode 100644 drivers/clk/stm32/Kconfig
 rename drivers/clk/{ => stm32}/clk-stm32mp1.c (95%)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25.c
 create mode 100644 drivers/clk/stm32/stm32mp25_rcc.h
 create mode 100644 include/dt-bindings/clock/st,stm32mp25-rcc.h
 create mode 100644 include/dt-bindings/reset/st,stm32mp25-rcc.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
