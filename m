Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A4E72BCFC
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:48:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84CB4C6A60F;
	Mon, 12 Jun 2023 09:48:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC72AC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:48:24 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35C94XtQ023174; Mon, 12 Jun 2023 11:48:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=2Qx2CtuWpd6wU61u7GYnr0BYYZdEthihPX9i62KeRYI=;
 b=Bjc/neRwJEfn48px91Daq/cdJYp9BSD6hB821FLFOjoNfB5ouftXCa10XdTpSFC59Q3+
 Xed/4oTjaY3HNO0U6g0VslEsK/EkdQT5snPOsPGG6xI5y78VkZcvrIuGv3vNsgQkr90C
 HoWRePt7Rl6I2KCq88sdV+U37t8MUWzlqmANQNcR4vx+zFKt8KNbR42i55uEezNFeMVi
 Ekuna61z1VzMoqfYBLxSiSjxFsxzhMCRHfkXat4jq4KsnOCzQLKeVbGG/q1JhsZO1fv7
 1pdkkS72UTltVNhCzHr3HmBMK0TOgdce3Xs6s98P68UE5SyThRDBkWEj0uRmmHdz9PbJ uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r60dqg9qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 11:48:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA57210002A;
 Mon, 12 Jun 2023 11:48:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E33A6222C8D;
 Mon, 12 Jun 2023 11:48:07 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 12 Jun
 2023 11:48:07 +0200
Message-ID: <080fc303-45c1-6cc0-4c5e-694e730896a6@foss.st.com>
Date: Mon, 12 Jun 2023 11:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, arm-soc <arm@kernel.org>, SoC Team
 <soc@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32MP25 support for v6.5 #1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi ARM SoC maintainers,

Please find this dedicated pull request for the addition of the 
STM32MP25 (ARM V8 based product).


Thanks
Alex

The following changes since commit 076c74c592cabe4a47537fe5205b5b678bed010d:

   ARM: dts: stm32: fix i2s endpoint format property for stm32mp15xx-dkx 
(2023-06-08 12:08:54 +0200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-mp25-for-v6.5-1

for you to fetch changes up to c9cb7e72e293141d0d6c1d74c26788d3a0605172:

   MAINTAINERS: add entry for ARM/STM32 ARCHITECTURE (2023-06-08 
16:01:45 +0200)

----------------------------------------------------------------
STM32 STM32MP25 for v6.5, round 1

Highlights:
----------

STM32MP25 family is composed of 4 SoCs defined as following:

   -STM32MP251: common part composed of 1*Cortex-A35,
    common peripherals like SDMMC, UART, SPI, I2C, PCIe, USB3,
    parallel and DSI display, 1*ETH ...

   -STM32MP253: STM32MP251 + 1*Cortex-A35 (dual CPU), a second ETH,
    CAN-FD and LVDS display.

   -STM32MP255: STM32MP253 + GPU/AI and video encode/decode.
   -STM32MP257: STM32MP255 + ETH TSN switch (2+1 ports).

   A second diversity layer exists for security features/A35 frequency:
   -STM32MP25xY, "Y" gives information:
     -Y = A means A35@1.2GHz + no cryp IP and no secure boot.
     -Y = C means A35@1.2GHz + cryp IP and secure boot.
     -Y = D means A35@1.5GHz + no cryp IP and no secure boot.
     -Y = F means A35@1.5GHz + cryp IP and secure boot.

This PR adds the STM32MP257F EV1 board support. This board embeds a
STM32MP257FAI SoC, with 4GB of DDR4, TSN switch (2+1 ports),
2*USB typeA, 1*USB2 typeC, SNOR OctoSPI, mini PCIe, STPMIC2 for power 
distribution ...

----------------------------------------------------------------
Alexandre Torgue (9):
       dt-bindings: pinctrl: stm32: support for stm32mp257 and 
additional packages
       pinctrl: stm32: add stm32mp257 pinctrl support
       arm64: introduce STM32 family on Armv8 architecture
       arm64: dts: st: introduce stm32mp25 SoCs family
       arm64: dts: st: introduce stm32mp25 pinctrl files
       dt-bindings: stm32: document stm32mp257f-ev1 board
       arm64: dts: st: add stm32mp257f-ev1 board support
       arm64: defconfig: enable ARCH_STM32 and STM32 serial driver
       MAINTAINERS: add entry for ARM/STM32 ARCHITECTURE

Patrick Delaunay (1):
       dt-bindings: stm32: add st,stm32mp25-syscfg compatible for syscon

  .../bindings/arm/stm32/st,stm32-syscon.yaml        |    7 +-
  .../devicetree/bindings/arm/stm32/stm32.yaml       |    6 +
  .../bindings/pinctrl/st,stm32-pinctrl.yaml         |    4 +-
  MAINTAINERS                                        |    1 +
  arch/arm64/Kconfig.platforms                       |   14 +
  arch/arm64/boot/dts/Makefile                       |    1 +
  arch/arm64/boot/dts/st/Makefile                    |    2 +
  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |   38 +
  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  279 +++
  arch/arm64/boot/dts/st/stm32mp253.dtsi             |   23 +
  arch/arm64/boot/dts/st/stm32mp255.dtsi             |    9 +
  arch/arm64/boot/dts/st/stm32mp257.dtsi             |    9 +
  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   50 +
  arch/arm64/boot/dts/st/stm32mp25xc.dtsi            |    8 +
  arch/arm64/boot/dts/st/stm32mp25xf.dtsi            |    8 +
  arch/arm64/boot/dts/st/stm32mp25xxai-pinctrl.dtsi  |   83 +
  arch/arm64/boot/dts/st/stm32mp25xxak-pinctrl.dtsi  |   71 +
  arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi  |   71 +
  arch/arm64/configs/defconfig                       |    3 +
  drivers/pinctrl/stm32/Kconfig                      |    6 +
  drivers/pinctrl/stm32/Makefile                     |    1 +
  drivers/pinctrl/stm32/pinctrl-stm32.h              |    3 +
  drivers/pinctrl/stm32/pinctrl-stm32mp257.c         | 2581 
++++++++++++++++++++
  include/dt-bindings/pinctrl/stm32-pinfunc.h        |    3 +
  24 files changed, 3277 insertions(+), 4 deletions(-)
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
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
