Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A1411043
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Sep 2021 09:37:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0863AC5A4CF;
	Mon, 20 Sep 2021 07:37:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0D06C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 07:37:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18JI7ko8023627; 
 Mon, 20 Sep 2021 09:37:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=csd/N6OvkHUOTLzbCFOq3jmgdTL8+pwIoA8AaVziblo=;
 b=0Wg+5TgbwkdmfSLmqJUQDTeaQcky65n1SdtJUWVI/MejZsuzCUR0ni8iJ7uvjgTRwwT3
 cjqPWsMYzqBfwFbzndmBwcIbc4fKHDuqRpCu4z2cz3cbgyPZT0JMjnYn44mernV2td57
 Fa+vqO5TgKiIpypQhBjU29cLKgjYxm3WAmtzFlmTxIhWMCLBTMD12Ie/LZV44TkRIgrx
 qWZS1Zpnt9TEeOmoiARFqj6mPl06BaQZOR1OZVg21Z3H8JlgvGtKnlDyEsbJbChCxSc/
 jYSCz1EAvwtzZ9ntYMLHR8mepwJ5zZrCtzxE/EsXC6pGVLIxa09/OFEce0D5EUcvFbp7 AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b6a76j7bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 09:37:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E9CE710002A;
 Mon, 20 Sep 2021 09:37:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C04FB2128B6;
 Mon, 20 Sep 2021 09:37:08 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 09:37:08 +0200
To: Linus Walleij <linus.walleij@linaro.org>, <arnd@arndb.de>, Olof Johansson
 <olof@lixom.net>, <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <269e6f95-434c-7d55-0be5-5871298e194c@foss.st.com>
Date: Mon, 20 Sep 2021 09:37:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_03,2021-09-17_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/7] Add STM32MP13 SoCs and discovery
	board support
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

On 7/23/21 3:28 PM, Alexandre Torgue wrote:
> This series enhance the STM32 MPU family by adding STM32MP13 SoCs support.
> It adds machine support and device tree diversity to support the whole
> stm32mp13 family (STM32MP131/STM32MP133/STM32MP135, plus security feature
> diversity).
> 
> Basically STM32MP13 SoCs embeds one Cortex A7, storage (SD/MMC/SDIO, QSPI FMC),
> network (ETH, CAN), display (DCMIPP, LTDC, ...), audio(SAI, DFSDM, SPDIFRX),
> com (USB EHCI/OHCI, USB OTG, I2C, SPI/I2S, U(S)ART).
> 
> This series also adds STM32MP135F Discovery board support (stm32mp135f-dk). It
> embeds a STM32MP135f SOC with 512 MB of DDR3. Several connections are available
> on this board:
>   - 4*USB2.0, 1*USB2.0 typeC DRD, SDcard, 2*RJ45, HDMI, Combo Wifi/BT, ...
> 
> Only SD card, uart4 (console) and watchdog IPs are enabled in this commit.
> 
> Note that file stm32mp135.dtsi doesn't define nodes but I add it now to ease adding
> of new nodes in a (close) future.
> 
> regards
> Alex
> 
> Alexandre Torgue (7):
>    dt-bindings: pinctrl: stm32: add new compatible for STM32MP135 SoC
>    pinctrl: stm32: Add STM32MP135 SoC support
>    docs: arm: stm32: introduce STM32MP13 SoCs
>    ARM: stm32: add initial support for STM32MP13 family
>    ARM: dts: stm32: add STM32MP13 SoCs support
>    dt-bindings: stm32: document stm32mp135f-dk board
>    ARM: dts: stm32: add initial support of stm32mp135f-dk board
> 
>   Documentation/arm/index.rst                   |    1 +
>   .../arm/stm32/stm32mp13-overview.rst          |   37 +
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |    4 +
>   .../bindings/pinctrl/st,stm32-pinctrl.yaml    |    1 +
>   arch/arm/boot/dts/Makefile                    |    1 +
>   arch/arm/boot/dts/stm32mp13-pinctrl.dtsi      |   64 +
>   arch/arm/boot/dts/stm32mp131.dtsi             |  283 +++
>   arch/arm/boot/dts/stm32mp133.dtsi             |   37 +
>   arch/arm/boot/dts/stm32mp135.dtsi             |   12 +
>   arch/arm/boot/dts/stm32mp135f-dk.dts          |   56 +
>   arch/arm/boot/dts/stm32mp13xc.dtsi            |   17 +
>   arch/arm/boot/dts/stm32mp13xf.dtsi            |   17 +
>   arch/arm/mach-stm32/Kconfig                   |    8 +
>   arch/arm/mach-stm32/board-dt.c                |    3 +
>   drivers/pinctrl/stm32/Kconfig                 |    6 +
>   drivers/pinctrl/stm32/Makefile                |    1 +
>   drivers/pinctrl/stm32/pinctrl-stm32mp135.c    | 1679 +++++++++++++++++
>   17 files changed, 2227 insertions(+)
>   create mode 100644 Documentation/arm/stm32/stm32mp13-overview.rst
>   create mode 100644 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp131.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp133.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp135.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp135f-dk.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp13xc.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp13xf.dtsi
>   create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32mp135.c
> 

With minor changes (cryp@ to crypto@), patches 3 to 7 applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
