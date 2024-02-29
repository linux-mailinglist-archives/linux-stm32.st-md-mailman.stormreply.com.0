Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA486C466
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Feb 2024 10:01:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8BADC6C838;
	Thu, 29 Feb 2024 09:01:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44A07C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Feb 2024 09:01:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41T4huaR020905; Thu, 29 Feb 2024 10:00:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=WqasNkugCYHmCbUQtRLId+t0ZOPdmhx4ImM59TrtYG0=; b=PY
 ay3daQ4GMhtSWIfFDGLmS3mxULzRt144e6oupaRv6Mx3tRmRgYSSgTWO/5I/qY+0
 om45XexYD4zz87L1VmgmVK3eHroMBRuPNMvHr3r86gvbE8uiWNMLFX63LBAv8j2a
 C3Wp2CIoBiCBu81kfEP8PTu3FeDBFbCMgWiupStb1EObM/MVYck0v2Oc1FYzKDdy
 WtUYL5PuUrs9Y9p96/Z8kNghqIfntuhNBfZfs6vHFnv0krOmQgmgVDCurYECr2R/
 XSGrROjH3u9iSiTgViYWoRJxihwtjHdYwdsZ2DAV/DoU8iwpip/ucquBX41PDCBL
 SAn/jyF4BGWvsf+2E5Vg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4d143v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Feb 2024 10:00:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3A55640048;
 Thu, 29 Feb 2024 10:00:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61EC9249DEE;
 Thu, 29 Feb 2024 09:59:16 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 29 Feb
 2024 09:59:15 +0100
Message-ID: <c990453c-f43a-48a7-9285-f8b391604f57@foss.st.com>
Date: Thu, 29 Feb 2024 09:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20240127152853.65937-1-dario.binacchi@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240127152853.65937-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_01,2024-02-27_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Nyekjaer <sean@geanix.com>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10 0/5] Add display support for
	stm32f769-disco board
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

Hi Dario

On 1/27/24 16:28, Dario Binacchi wrote:
> The series adds display support for the stm32f769-disco board. It has been
> tested on hardware revisions MB1225-B03 and MB1166-A09. This required
> modifications to the nt35510 driver that have already been applied.
> 
> Changes in v10:
> - Drop backlight. From a closer analysis of the schematics
>    en.MB1225-F769I-B01_Schematic.pdf and en.mb1166-default-a09-schematic.pdf,
>    it is noticed that the GPIO I14 is connected to an unmounted
>    resistor (n/a), making the backlight functionality via GPIO unusable.
> - Drop backlight references
> 
> Changes in v9:
> - Drop 'interrupts' property to fix yaml checks
> - Rename vcc_3v3 to to vcc-3v3
> - Rename panel-dsi@0 to panel@0 to fix yaml warnings
> - Change commit message
> - Rename stm32f769-disco-mb1225-revb03-mb1166-reva09 to
>    stm32f769-disco-mb1166-reva09
> 
> Changes in v8:
> - Add Acked-by tag of Lee Jones
> - Add Reviewed-by tag of Raphael Gallais-Pou
> - Add Reviewed-by tag of Raphael Gallais-Pou
> - Remove unit name from 'ltdc/port/endpoint@0' to fix the compiling
>    warning:
>    ../arch/arm/boot/dts/st/stm32f769-disco.dts:189.28-191.5: Warning
>    (unit_address_vs_reg): /soc/display-controller@40016800/port/endpoint@0: node
>    has a unit name, but no reg or ranges property
> - Add Reviewed-by tag of Linus Walleij
> - Add Reviewed-by tag of Raphael Gallais-Pou
> 
> Changes in v7:
> - Replace .dts with .dtb in the Makefile
> 
> Changes in v6:
> - Drop patches
>    - [5/8] dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
>    - [7/8] drm/panel: nt35510: move hardwired parameters to configuration
>    - [8/8] drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK
>    because applied by the maintainer Linus Walleij
> 
> Changes in v5:
> - Replace GPIOD_ASIS with GPIOD_OUT_HIGH in the call to devm_gpiod_get_optional().
> 
> Changes in v2:
> - Add Acked-by tag of Conor Dooley
> - Change the status of panel_backlight node to "disabled"
> - Delete backlight property from panel0 node.
> - Re-write the patch [8/8] "drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK"
>    in the same style as the original driver.
> 
> Dario Binacchi (5):
>    dt-bindings: mfd: stm32f7: Add binding definition for DSI
>    ARM: dts: stm32: add DSI support on stm32f769
>    ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
>    ARM: dts: stm32: add display support on stm32f769-disco
>    ARM: dts: add stm32f769-disco-mb1166-reva09
> 
>   arch/arm/boot/dts/st/Makefile                 |  1 +
>   .../dts/st/stm32f769-disco-mb1166-reva09.dts  | 13 ++++
>   arch/arm/boot/dts/st/stm32f769-disco.dts      | 70 +++++++++++++++++--
>   arch/arm/boot/dts/st/stm32f769.dtsi           | 20 ++++++
>   include/dt-bindings/mfd/stm32f7-rcc.h         |  1 +
>   5 files changed, 101 insertions(+), 4 deletions(-)
>   create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1166-reva09.dts
>   create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi
> 

Series applied on stm32-next.

Thanks for your efforts.

Alex


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
