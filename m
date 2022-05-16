Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E88527E0A
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 09:06:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57AD8C03FE4;
	Mon, 16 May 2022 07:06:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75EC4C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 07:06:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24FMsEUP022160;
 Mon, 16 May 2022 09:06:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=IolJtT2ryCjPmaN5VNl5R2UNokUQzXRUwkZ1MBuzsUw=;
 b=7ivhMK6g8s9+MycclAr9g+yJJQAEBaPUiBkfcLPcfaHY/6I68C03vCQ5NgMqArEIkpzq
 Zwhih8rBDJ3oZ0t8vSjn5cH+T2HASzXASXVkhFK+qWsglq8DVVFIHoVsVckfKaH3MLAh
 +Rt5lV9jv5yWu3YQSMTTQ1/4YC4lthBQNyZsL41rooImvtA+mQKGNd9KWNB+J19dkOF8
 EfJDBEmJs0ISB7lmmMzdK6Lqpg6ZkcnByiSNDCXiET7TpKTPWwBP7hd7IuoqS2nanaHK
 JmPzDM42LleMK0lU96qoMEg7EWsDejSqOKSupPzZh8uxT2o5DI6Gep4y/UtwPbYLwJYt jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23ah8qcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 09:06:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03C69100034;
 Mon, 16 May 2022 09:06:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E38992122FE;
 Mon, 16 May 2022 09:06:02 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 16 May 2022 09:06:02
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
Date: Mon, 16 May 2022 09:05:46 +0200
Message-ID: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_03,2022-05-13_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 00/14] Introduction of STM32MP13 RCC driver
	(Reset Clock Controller)
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

v4: (rebased on next-20220512)
  - rename scmi_shm@0 node into scmi-sram@0
  - move sram node
  - add reserved memory for optee

v3:
  - cosmetic change from Stephen Boyd
  - rename some functions in clk-stm32-core
  - add missing static for variables or functions

v2:
  - Resend because patch 9,10,12,13 has not been sent
  - add Reviewed by Krzysztof Kozlowski for patch 1

Gabriel Fernandez (14):
  dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC
  clk: stm32: Introduce STM32MP13 RCC drivers (Reset Clock Controller)
  clk: stm32mp13: add stm32_mux clock management
  clk: stm32mp13: add stm32_gate management
  clk: stm32mp13: add stm32 divider clock
  clk: stm32mp13: add composite clock
  clk: stm32mp13: manage secured clocks
  clk: stm32mp13: add all STM32MP13 peripheral clocks
  clk: stm32mp13: add all STM32MP13 kernel clocks
  clk: stm32mp13: add multi mux function
  clk: stm32mp13: add safe mux management
  ARM: dts: stm32: enable optee firmware and SCMI support on STM32MP13
  ARM: dts: stm32: add RCC on STM32MP13x SoC family
  ARM: dts: stm32: add optee reserved memory on stm32mp135f-dk

 .../bindings/clock/st,stm32mp1-rcc.yaml       |    2 +
 arch/arm/boot/dts/stm32mp131.dtsi             |  142 +-
 arch/arm/boot/dts/stm32mp133.dtsi             |    4 +-
 arch/arm/boot/dts/stm32mp135f-dk.dts          |   16 +
 arch/arm/boot/dts/stm32mp13xf.dtsi            |    3 +-
 drivers/clk/Kconfig                           |    5 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/stm32/Makefile                    |    1 +
 drivers/clk/stm32/clk-stm32-core.c            |  695 +++++++
 drivers/clk/stm32/clk-stm32-core.h            |  188 ++
 drivers/clk/stm32/clk-stm32mp13.c             | 1620 +++++++++++++++
 drivers/clk/stm32/reset-stm32.c               |  122 ++
 drivers/clk/stm32/reset-stm32.h               |    8 +
 drivers/clk/stm32/stm32mp13_rcc.h             | 1748 +++++++++++++++++
 include/dt-bindings/clock/stm32mp13-clks.h    |  229 +++
 include/dt-bindings/reset/stm32mp13-resets.h  |  100 +
 16 files changed, 4813 insertions(+), 71 deletions(-)
 create mode 100644 drivers/clk/stm32/Makefile
 create mode 100644 drivers/clk/stm32/clk-stm32-core.c
 create mode 100644 drivers/clk/stm32/clk-stm32-core.h
 create mode 100644 drivers/clk/stm32/clk-stm32mp13.c
 create mode 100644 drivers/clk/stm32/reset-stm32.c
 create mode 100644 drivers/clk/stm32/reset-stm32.h
 create mode 100644 drivers/clk/stm32/stm32mp13_rcc.h
 create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
 create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
