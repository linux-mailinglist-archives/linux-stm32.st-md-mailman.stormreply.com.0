Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C7854AA7
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 14:42:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E65BC57194;
	Wed, 14 Feb 2024 13:42:48 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36724C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 13:42:47 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41ECKIHK025049; Wed, 14 Feb 2024 14:42:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=63ccJdkmYj60Sx0VF1iQ9ToU2xIdXBSWALt0f6lAonM=; b=sQ
 Vn/JNrCwCL1yvVvfxCInR4HZow6dCVibArvy5c/Myj4zD4aWOJNx0Tw6gJBGmJy2
 kr7mrK98ISDsF+jrRl9YB4d7t+54kafIu2kN/44/DeX54+cd+CoWLBibaoZL0IAB
 SGBS2jgAG9sF6pzQmZp41odZ2n7KF6JX217efB/UfkcQRw4NJ22HqGODSnZqKi5w
 RKmhnOOB2LddukuWAc2hx3p95W4bG3OFhaSoCyGqJfCx8eiJ7hF1BlBPOZZ5b2XC
 ijvqAXFpcw8xkOoq+/3gIUST/DZNU+rU3eYl6/HURQQWALt7WOrD7g8hH7/O8Tdy
 c/rpIteNx2dVCEtgTGYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6mynmqee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 14:42:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6AEEE4002D;
 Wed, 14 Feb 2024 14:42:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F06A264AF6;
 Wed, 14 Feb 2024 14:41:00 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 14 Feb
 2024 14:40:58 +0100
Message-ID: <0c551a84-5c4a-4d79-ae59-d5b0d34b017d@foss.st.com>
Date: Wed, 14 Feb 2024 14:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_06,2024-02-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] Add display support for
	stm32mp135f-dk board
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

Hi Raphael

On 2/5/24 10:06, Raphael Gallais-Pou wrote:
> This serie aims to enable display support for the stm32mp135f-dk board
> 
> Those are only patches of the device-tree since the driver support has
> already been added [1].
> 
> It respectivelly:
> 	- adds support for the display controller on stm32mp135
> 	- adds pinctrl for the display controller
> 	- enables panel, backlight and display controller on
> 	  stm32mp135f-dk
> 
> Finally it fixes the flags on the panel default mode in the
> 'panel-simple' driver, allowing to override the default mode by one
> described in the device tree, and push further the blanking limit on the
> panel.
> 
> [1] commit 1726cee3d053 ("drm/stm: ltdc: support of new hardware version")
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Raphael Gallais-Pou (5):
>        ARM: dts: stm32: add LTDC support for STM32MP13x SoC family
>        ARM: dts: stm32: add LTDC pinctrl on STM32MP13x SoC family
>        ARM: dts: stm32: enable display support on stm32mp135f-dk board
>        drm/panel: simple: fix flags on RK043FN48H
>        drm/panel: simple: push blanking limit on RK32FN48H
> 
>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 57 +++++++++++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp135.dtsi        | 11 ++++++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts     | 55 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/panel/panel-simple.c        |  7 ++--
>   4 files changed, 127 insertions(+), 3 deletions(-)
> ---
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> change-id: 20240124-ltdc_mp13-2f86a782424c
> 
> Best regards,

I got the following errors during YAML verification:

arch/arm/boot/dts/st/stm32mp135f-dk.dtb: /soc/i2c@40012000/pinctrl@21: 
failed to match any schema with compatible: ['microchip,mcp23017']
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb: 
panel-backlight: 'default-brightness-level' does not match any of the 
regexes: 'pinctrl-[0-9]+'
	from schema $id: 
http://devicetree.org/schemas/leds/backlight/gpio-backlight.yaml#
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb: 
panel-rgb: data-mapping:0: 'bgr666' is not one of ['jeida-18', 
'jeida-24', 'vesa-24']
	from schema $id: 
http://devicetree.org/schemas/display/panel/panel-simple.yaml#
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb: 
panel-rgb: compatible: ['rocktech,rk043fn48h', 'panel-dpi'] is too long
	from schema $id: 
http://devicetree.org/schemas/display/panel/panel-simple.yaml#
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb: 
panel-rgb: data-mapping: False schema does not allow ['bgr666']
	from schema $id: 
http://devicetree.org/schemas/display/panel/panel-simple.yaml#
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb: 
panel-rgb: 'height-mm', 'panel-timing', 'width-mm' do not match any of 
the regexes: 'pinctrl-[0-9]+'
	from schema $id: 
http://devicetree.org/schemas/display/panel/panel-simple.yaml#
/local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb: 
panel-rgb: 'data-mapping' does not match any of the regexes: 
'pinctrl-[0-9]+'
	from schema $id: 
http://devicetree.org/schemas/display/panel/panel-dpi.yaml#

Do I miss something ?

Alex


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
