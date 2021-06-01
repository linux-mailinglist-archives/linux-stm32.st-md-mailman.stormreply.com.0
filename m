Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16017397196
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 12:37:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5975C57B5A;
	Tue,  1 Jun 2021 10:37:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E49E6C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 10:37:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151AVmNg029022; Tue, 1 Jun 2021 12:37:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3biXO/fpJflq2AcQCK76xAJA1BbX58Bg7funY9JCbm8=;
 b=gVGcDWpmFLi2vkt8ZSC1ZkyNDcWZlIPGQDgMzMN51/USVOX7Ci4eZovrXm/mWC7srra3
 7cKLpT5ixlVZQ1QzD4IAe/Ui68Brj7h1s6D+6S3Yv4o3eV3deR62/mKPAB2dPjSImVD2
 bKeA4Xhb8y94aO96qM2Gs0EsI/QJ6pqxwv/hoFiC+Ytcs+GHkzPHxi+v2wwIzJP+FQz0
 lbrNA2HFD7jGPmKX4/KwFcsE2eaJF3qLXhKcyzO/ndkxzRgqcCwtFsKW83PQRc0MoWzt
 O5oWJZw9awpOuUqE8clBzM6KDu/f5W3g8M23pNaMZuX4di3SQlYMaakCJj7zUwscVjmP Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38wjdg0aps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 12:37:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA73410002A;
 Tue,  1 Jun 2021 12:37:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D82721B514;
 Tue,  1 Jun 2021 12:37:11 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Jun
 2021 12:37:10 +0200
To: <arnd@arndb.de>, <robh+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 <jagan@amarulasolutions.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <a5a76fa8-fac5-556d-f272-4c471f3e7913@foss.st.com>
Date: Tue, 1 Jun 2021 12:37:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_05:2021-05-31,
 2021-06-01 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/13] ARM: dts: stm32: fix "make
	dtbs_check W=1" round1
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

Hi

On 4/15/21 12:10 PM, Alexandre Torgue wrote:
> Hi,
> 
> First round to cleanup warnings and yaml validation issues seen running
> "make dtbs_check W=1" command for STM32 platform. It concerns all SoC
> (MCU: f429/429, f746/769, h743, MPU) and all boards (ST reference boards,
> DH, Engicam, LxA ...).
> 
> Main fixes are done in device tree files but some imply a change in yaml
> dt-bindings file.
> 
> regards
> Alex
> 
> Alexandre Torgue (13):
>    ARM: dts: stm32: fix gpio-keys node on STM32 MCU boards
>    ARM: dts: stm32: fix RCC node name on stm32f429 MCU
>    ARM: dts: stm32: fix timer nodes on STM32 MCU to prevent warnings
>    dt-bindings: mfd: stm32-timers: remove #address/size cells from
>      required properties
>    ARM: dts: stm32: update pinctrl node name on STM32 MCU to prevent
>      warnings
>    ARM: dts: stm32: fix i2c node name on stm32f746 to prevent warnings
>    ARM: dts: stm32: move stmmac axi config in ethernet node on stm32mp15
>    dt-bindings: net: document ptp_ref clk in dwmac
>    ARM: dts: stm32: fix stpmic node for stm32mp1 boards
>    dt-bindings: mfd: add vref_ddr-supply to st,stpmic1 yaml
>    ARM: dts: stm32: fix LTDC port node on STM32 MCU ad MPU
>    ARM: dts: stm32: fix DSI port node on STM32MP15
>    ARM: dts: stm32: fix ltdc pinctrl on microdev2.0-of7
> 
>   .../bindings/mfd/st,stm32-timers.yaml         |  2 -
>   .../devicetree/bindings/mfd/st,stpmic1.yaml   |  2 +-
>   .../devicetree/bindings/net/snps,dwmac.yaml   |  4 +-
>   .../devicetree/bindings/net/stm32-dwmac.yaml  |  6 +-
>   arch/arm/boot/dts/stm32429i-eval.dts          |  8 +-
>   arch/arm/boot/dts/stm32746g-eval.dts          |  6 +-
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi        |  2 +-
>   arch/arm/boot/dts/stm32f429-disco.dts         |  6 +-
>   arch/arm/boot/dts/stm32f429-pinctrl.dtsi      | 72 +++++++++---------
>   arch/arm/boot/dts/stm32f429.dtsi              | 10 +--
>   arch/arm/boot/dts/stm32f469-disco.dts         |  8 +-
>   arch/arm/boot/dts/stm32f469-pinctrl.dtsi      | 74 +++++++++----------
>   arch/arm/boot/dts/stm32f7-pinctrl.dtsi        |  2 +-
>   arch/arm/boot/dts/stm32f746.dtsi              | 12 +--
>   arch/arm/boot/dts/stm32f769-disco.dts         |  6 +-
>   arch/arm/boot/dts/stm32h743.dtsi              |  4 -
>   arch/arm/boot/dts/stm32mp151.dtsi             | 16 ++--
>   arch/arm/boot/dts/stm32mp157.dtsi             |  2 -
>   arch/arm/boot/dts/stm32mp157a-dk1.dts         |  8 ++
>   ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  5 +-
>   arch/arm/boot/dts/stm32mp157a-stinger96.dtsi  |  7 +-
>   arch/arm/boot/dts/stm32mp157c-dk2.dts         | 12 ++-
>   arch/arm/boot/dts/stm32mp157c-ev1.dts         |  5 +-
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts     |  3 +-
>   .../arm/boot/dts/stm32mp157c-odyssey-som.dtsi |  5 +-
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  |  5 +-
>   .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  6 +-
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        |  7 --
>   arch/arm/boot/dts/stm32mp15xx-osd32.dtsi      |  7 +-
>   29 files changed, 130 insertions(+), 182 deletions(-)
> 

Patches 1 to 8 and 13 applied on stm32-next. I will send a v2 for 
vref-ddr supply. There is still an open point about #adress-size/cells 
check for DSI / LTDC ports.

Rob,
Can we consider to have "#adress-size/cells defined even if only one 
endpoint (child) is defined ? and then is it possible to update the 
checker ? Or do we have to keep patches [11][12]
and update #adress-size/cells in board dts files ?

Thanks
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
