Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 818071BD6AC
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 09:57:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35A12C36B0D;
	Wed, 29 Apr 2020 07:57:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0115EC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 07:57:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T7qJAT024847; Wed, 29 Apr 2020 09:57:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=xx8kRde0lYZzEHpvs5LF95CF5clpUWEokyEoQEW0HZY=;
 b=UPiWO1xuI06+BfehbbCbANWIelm4CKW9QA0nL/uHBJrEma7ZlfWLtGBmIPJAe3Mk8//q
 JTby8NcNppK0D8xC0ZZhqd4bBjKXauHOUCl8ceuV5r4iB6fbYVRdAawAQ7yUvXmazKYT
 2WaZ64fZKZ1QV1084MrgohMGNTqTp6174XgAP+L9Pp57vXkZIOsNLp01gu0Qw/6LOW3U
 J8e0A6X4g8C8FkTA/Z+vuOtRnxt+PLfl4neqK+mmtmm0davjBx9Gb7Aspho9TDqL8Pj3
 SSfSB5BLqckyFyu8QQn12m2TZc1LRPLvbPy92BTcnDlf4R1am9k/qwS5nDJGvyaZcrcM 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j6100c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 09:57:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 562F010002A;
 Wed, 29 Apr 2020 09:57:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EC7920663E;
 Wed, 29 Apr 2020 09:57:06 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 09:57:02 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200422104613.96944-1-marex@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <e47b72fc-9591-021d-7abc-14a7166a4845@st.com>
Date: Wed, 29 Apr 2020 09:56:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200422104613.96944-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_02:2020-04-28,
 2020-04-29 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V5 00/20] ARM: dts: stm32: Repair AV96
	board
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

Hi Marek

On 4/22/20 12:45 PM, Marek Vasut wrote:
> The AV96 board device tree is completely broken and does not match the
> hardware. This series fixes it up.
> 
> Marek Vasut (20):
>    ARM: dts: stm32: Repair PMIC configuration on AV96
>    ARM: dts: stm32: Repair PMIC interrupt on AV96
>    ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
>    ARM: dts: stm32: Repair ethernet operation on AV96
>    ARM: dts: stm32: Add missing ethernet PHY reset on AV96
>    ARM: dts: stm32: Add missing ethernet PHY skews on AV96
>    ARM: dts: stm32: Add alternate pinmux for SDMMC pins
>    ARM: dts: stm32: Repair SDMMC1 operation on AV96
>    ARM: dts: stm32: Add eMMC attached to SDMMC2 on AV96
>    ARM: dts: stm32: Add QSPI NOR on AV96
>    ARM: dts: stm32: Add configuration EEPROM on AV96
>    ARM: dts: stm32: Enable WiFi on AV96
>    ARM: dts: stm32: Add alternate pinmux for USART2 pins
>    ARM: dts: stm32: Enable Bluetooth on AV96
>    ARM: dts: stm32: Add alternate pinmux for LTDC pins
>    ARM: dts: stm32: Add bindings for HDMI video on AV96
>    ARM: dts: stm32: Add alternate pinmux for SAI2 pins
>    ARM: dts: stm32: Add bindings for audio on AV96
>    ARM: dts: stm32: Add bindings for USB on AV96
>    ARM: dts: stm32: Rename LEDs to match silkscreen on AV96
> 
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi    | 280 +++++++++++++++++
>   arch/arm/boot/dts/stm32mp157a-avenger96.dts | 324 ++++++++++++++++++--
>   2 files changed, 572 insertions(+), 32 deletions(-)
> 
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> 

Series applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
