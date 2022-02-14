Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F64B48DE
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 11:03:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 099DDC5F1F2;
	Mon, 14 Feb 2022 10:03:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DD79C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 10:03:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21E86fcW022932;
 Mon, 14 Feb 2022 11:02:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zBXICPv5YGDXCve/KOSXwXFvMmf1sH/hj0bAI5GxYVo=;
 b=EDzvvd/pFTWvooKLuYkeUIe99KBk+BJGKcjGoooMobeLklfhVE52vjADfET8qq9eMneR
 tepiqHXGE8QIFRuWGM7cIrs78E0e1+xyb/W7y3nVcM2tjrjmBDJHcQKIaJqe+Jpb4UMy
 6wxW6+eAQgmRnhHtVnky7JpNNCvCAifMngR0OSSPTTaHGCT4LH9PQCZznxDD/L2ea35h
 txGgky7AWYHxRUr4RhqDRXF4YQv7jociSHi5GDhQZLjo8KeTpixWTH+ufkn+qzdkC2f/
 zgH5k9B7etZvNnZleKmO8QXfJ6Kqxnr+GvSCkXejVFnpNAvf3q3H2nT1vfpVQrcgiazh 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e72j13pam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 11:02:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D243A10002A;
 Mon, 14 Feb 2022 11:02:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C195D2194F3;
 Mon, 14 Feb 2022 11:02:32 +0100 (CET)
Received: from [10.48.0.252] (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 14 Feb
 2022 11:02:32 +0100
Message-ID: <8e42cb99-a442-062a-cf0a-2f8d8aff0ab3@foss.st.com>
Date: Mon, 14 Feb 2022 11:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Erwan Le Ray <erwan.leray@foss.st.com>
References: <20220203171114.10888-1-erwan.leray@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220203171114.10888-1-erwan.leray@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_02,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/16] STM32 configure UART nodes for DMA
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

On 2/3/22 18:10, Erwan Le Ray wrote:
> Add DMA configuration to UART nodes in stm32mp15x (SOC level) and
> remove it at board level to keep current PIO behavior when needed.
> For stm32-ed1 and stm32-dkx boards, UART4 (console) and UART7
> (no HW flow control pin available) are kept in PIO mode, while USART3
> is now configured in DMA mode.
> UART4 (console UART) has to be kept in irq mode, as DMA support for
> console has been removed from the driver by commit e359b4411c28
> ("serial: stm32: fix threaded interrupt handling").
> 
> For other stm32mp15x-based boards, current configuration is kept for
> all UART instances.
> 
> Erwan Le Ray (16):
>    ARM: dts: stm32: add DMA configuration to UART nodes on stm32mp151
>    ARM: dts: stm32: keep uart4 behavior on stm32mp157c-ed1
>    ARM: dts: stm32: keep uart4 and uart7 behavior on stm32mp15xx-dkx
>    ARM: dts: stm32: keep uart4 behavior on icore-stm32mp1-ctouch2
>    ARM: dts: stm32: keep uart4 behavior on icore-stm32mp1-edimm2.2
>    ARM: dts: stm32: keep uart4 behavior on stm32mp157a-iot-box
>    ARM: dts: stm32: keep uart nodes behavior on stm32mp1-microdev2.0-of7
>    ARM: dts: stm32: keep uart nodes behavior on stm32mp1-microdev2.0
>    ARM: dts: stm32: keep uart nodes behavior on stm32mp157a-stinger96
>    ARM: dts: stm32: keep uart4 behavior on stm32mp157c-lxa-mc1
>    ARM: dts: stm32: keep uart4 behavior on stm32mp157c-odyssey
>    ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-drc02
>    ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-pdk2
>    ARM: dts: stm32: keep uart nodes behavior on stm32mp15xx-dhcom-picoitx
>    ARM: dts: stm32: keep uart4 behavior on stm32mp15xx-dhcom-som
>    ARM: dts: stm32: keep uart nodes behavior on
>      stm32mp15xx-dhcor-avenger96
> 
>   arch/arm/boot/dts/stm32mp151.dtsi             | 21 +++++++++++++++++++
>   .../stm32mp157a-icore-stm32mp1-ctouch2.dts    |  2 ++
>   .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  2 ++
>   arch/arm/boot/dts/stm32mp157a-iot-box.dts     |  2 ++
>   ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  4 ++++
>   ...32mp157a-microgea-stm32mp1-microdev2.0.dts |  4 ++++
>   arch/arm/boot/dts/stm32mp157a-stinger96.dtsi  |  6 ++++++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts         |  2 ++
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts     |  2 ++
>   arch/arm/boot/dts/stm32mp157c-odyssey.dts     |  2 ++
>   .../arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi |  4 ++++
>   arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi |  4 ++++
>   .../boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   |  4 ++++
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  |  2 ++
>   .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  6 ++++++
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        |  4 ++++
>   16 files changed, 71 insertions(+)
> 
Series applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
