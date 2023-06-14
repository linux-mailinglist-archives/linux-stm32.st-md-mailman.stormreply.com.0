Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F715714DB9
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 18:02:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E000C6A608;
	Mon, 29 May 2023 16:02:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89B98C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 16:02:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34TBP6U8020334; Mon, 29 May 2023 18:01:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=R7roW/pXBm1AzX1ECpv0Ow4olyyWijd6fAx4mT/U654=;
 b=EKpI+Ml/9CzbSv+0r9wyIwDQkobCJlkxAj3T2qbNKkdtu45oaADa7HeKAOwytpbaZxJZ
 wr/R7yR3q224DGgRlBYGRjxNcSYT20/hYUAjsP6jCn0dH/zRxFixLUy6LKYqHGlkv62A
 sRr8EueSS0ZTvkoUA7P+pkah6TlTw1iaE+dZRuuXwgXjTQubFExgkAInHgXUxocxUaeG
 FSQxCOlBogs/Oo/SlDjC8o2W9bv7oBLRN8fgyGvRPnwWhFpjkaLfKqP/3pjiUhcBsWNy
 W/Fs3/p9sIB4K/TVaQ0kwkA7gQOqE8J/5Wp8OXZtslRRHwJoOttvO02jExEj4sPkecL+ VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quakpas41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 May 2023 18:01:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E7EB10002A;
 Mon, 29 May 2023 18:01:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F3A2232FF4;
 Mon, 29 May 2023 18:01:40 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 18:01:39 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, <soc@kernel.org>
Date: Mon, 29 May 2023 18:01:19 +0200
Message-ID: <20230529160130.18940-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_10,2023-05-29_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/11] Add STM32MP25 support
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

I'm pleased to announce extension of the STM32 MPU family with the addition of
the STM32MP25 Armv8 based SoCs.

STM32MP25 family is composed of 4 SoCs defined as following:

  -STM32MP251: common part composed of 1*Cortex-A35, common peripherals like
   SDMMC, UART, SPI, I2C, PCIe, USB3, parallel and DSI display, 1*ETH ...

  -STM32MP253: STM32MP251 + 1*Cortex-A35 (dual CPU), a second ETH, CAN-FD and
   LVDS display.

  -STM32MP255: STM32MP253 + GPU/AI and video encode/decode.
  -STM32MP257: STM32MP255 + ETH TSN switch (2+1 ports).

  A second diversity layer exists for security features/ A35 frequency:
  -STM32MP25xY, "Y" gives information:
    -Y = A means A35@1.2GHz + no cryp IP and no secure boot.
    -Y = C means A35@1.2GHz + cryp IP and secure boot.
    -Y = D means A35@1.5GHz + no cryp IP and no secure boot.
    -Y = F means A35@1.5GHz + cryp IP and secure boot.

This series adds the STM32MP257F EV1 board support. This board embeds a
STM32MP257FAI SoC, with 4GB of DDR4, TSN switch (2+1 ports), 2*USB typeA,
1*USB2 typeC, SNOR OctoSPI, mini PCIe, STPMIC2 for power distribution ...

Thanks
Alex

Alexandre Torgue (10):
  dt-bindings: pinctrl: stm32: support for stm32mp257 and additional
    packages
  pinctrl: stm32: add stm32mp257 pinctrl support
  dt-bindings: stm32: add st,stm32mp25 compatibles to the stm32 family
  arm64: introduce STM32 family on Armv8 architecture
  arm64: dts: st: introduce stm32mp25 SoCs family
  arm64: dts: st: introduce stm32mp25 pinctrl files
  dt-bindings: stm32: document stm32mp257f-ev1 board
  arm64: dts: st: add stm32mp257f-ev1 board support
  arm64: defconfig: enable ARCH_STM32 and STM32 serial driver
  MAINTAINERS: add entry for ARM/STM32 ARCHITECTURE

Patrick Delaunay (1):
  dt-bindings: stm32: add st,stm32mp25-syscfg compatible for syscon

 .../bindings/arm/stm32/st,stm32-syscon.yaml   |    1 +
 .../devicetree/bindings/arm/stm32/stm32.yaml  |   12 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |    4 +-
 MAINTAINERS                                   |    1 +
 arch/arm64/Kconfig.platforms                  |   14 +
 arch/arm64/boot/dts/Makefile                  |    1 +
 arch/arm64/boot/dts/st/Makefile               |    2 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |   38 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  279 ++
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |   23 +
 arch/arm64/boot/dts/st/stm32mp255.dtsi        |    9 +
 arch/arm64/boot/dts/st/stm32mp257.dtsi        |    9 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |   50 +
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |    8 +
 arch/arm64/boot/dts/st/stm32mp25xf.dtsi       |    8 +
 .../boot/dts/st/stm32mp25xxai-pinctrl.dtsi    |   83 +
 .../boot/dts/st/stm32mp25xxak-pinctrl.dtsi    |   71 +
 .../boot/dts/st/stm32mp25xxal-pinctrl.dtsi    |   71 +
 arch/arm64/configs/defconfig                  |    3 +
 drivers/pinctrl/stm32/Kconfig                 |    6 +
 drivers/pinctrl/stm32/Makefile                |    1 +
 drivers/pinctrl/stm32/pinctrl-stm32.h         |    3 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c    | 2581 +++++++++++++++++
 include/dt-bindings/pinctrl/stm32-pinfunc.h   |    3 +
 24 files changed, 3280 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/st/Makefile
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp251.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp253.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xf.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32mp257.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
