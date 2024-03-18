Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DB87E684
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Mar 2024 10:57:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62678C6DD60;
	Mon, 18 Mar 2024 09:57:39 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53035C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Mar 2024 09:57:38 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso386636166b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Mar 2024 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710755858; x=1711360658;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CvwiY2px09JBaPxmeT996zlVjpkjtFKPSJgCnMAlIOw=;
 b=T4Ff5nbDvemKh8A/Fuz3nnWAXlpBddWcU4RvNIh61W6IUb7c9lkjOU1JVbOO0xPEQe
 kFWx1LgRGU/KBExZGJuW9T5gSc3S7kOiuiOYGrMDIHMs/dMH6njy4AB9rZ8b/nEXR9pQ
 Xr7oD5uUftAOdtiCB2C97uozCKdt9mgU2/A3P6DT176yFYVvMwUxBVwc/otHA940kZiH
 kFM8PT4NSndoszDcpKLGNLlS3smy+CrE6Jz8kRNGTtz3P8BlLfYDiJvi3gZMDJ/M84/x
 m+vcq1RWgZ9W3Byxxx2yc56mUzTH/iuvrElP7PGSvxk5ivd4m7WSTUc7z8LDnkeTb3aq
 SlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710755858; x=1711360658;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CvwiY2px09JBaPxmeT996zlVjpkjtFKPSJgCnMAlIOw=;
 b=fFLoJWI8BDnFsOHWfnxSF/6b4IxFljJDwMEQQfcxa6dWIvfmXzFijPc6q7OfSaotyM
 o60wdcv2H0p15Zsj0tSSQn28IGQjT76AgaO/oqf+PAY+FWmEI8cq3Rzl5bEkeP9n/ZRc
 uK0S5jS2XyPy0VHPHvaLRY1WojnDczB9nP7Yob7Ww0FVCVc6haPA9S1vWBfRUEj3w1xG
 FY7Xg9V6QvhXmv9H33f2qnCAhLX7qpGr6xVDQLcbfW/bR5RnpaZd0tTqo7ifoc67PGqL
 JyeaTy3rUVjzU68+YFhvSBUmyJ0n4u6hjLGZ8h59O3aPQ54s6rhHmDSoMG3T9/y9IgG1
 Uepg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Pq3m/BzemRjf4Je+k3X/AVPb9BiG0xJkfikP18r+04xnuuj8lJgGF2J6rSERzC2gj6RqYoLsm/VLJYEto+DPmHsuxGhEm/9kX2gwHjnZ4GQaaePFEyaj
X-Gm-Message-State: AOJu0YzmSP2m5O4JXRU8lcNAiuZCFeWvVByGhjfcCMGhOC6fEJX04/oT
 q7UFTCXMBj6R+HyQ8IHzAVGGCDQKaoRa9FS8QbDIiVovSz3OW02mfDIz/gyvGeA=
X-Google-Smtp-Source: AGHT+IE4Vs4Pth77Ukq1Bp0ir9YHjxFLKSrIhmRE5Q697X+NEwv+mMFjjCPvm24dipjKUYd2nFDaww==
X-Received: by 2002:a17:906:528d:b0:a45:b91f:2f95 with SMTP id
 c13-20020a170906528d00b00a45b91f2f95mr7514842ejm.72.1710755857562; 
 Mon, 18 Mar 2024 02:57:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a1709062c0e00b00a455d78be5bsm4637433ejh.9.2024.03.18.02.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 02:57:37 -0700 (PDT)
Message-ID: <3bffa949-e85c-4309-9e77-9aca44039dbf@linaro.org>
Date: Mon, 18 Mar 2024 10:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wadim Mueller <wafgo01@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
References: <20240315222754.22366-1-wafgo01@gmail.com>
 <20240315222754.22366-2-wafgo01@gmail.com>
 <4e168fbc-8a13-4666-ab80-e3032f61ef38@oss.nxp.com>
 <20240318093418.GA20810@bhlegrsu.conti.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240318093418.GA20810@bhlegrsu.conti.de>
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-clk@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 1/3] arm64: dts: S32G3: Introduce device
 tree for S32G-VNP-RDB3
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

On 18/03/2024 10:34, Wadim Mueller wrote:
> On Mon, Mar 18, 2024 at 09:32:24AM +0200, Ghennadi Procopciuc wrote:
>> On 3/16/24 00:27, Wadim Mueller wrote:
>>> This commit adds device tree support for the NXP S32G3-based
>>> S32G-VNP-RDB3 Board (Vehicle Networking Platform - Reference Design Board) [1].
>>>
>>> The S32G3 features an 8-core ARM Cortex-A53 based SoC developed by NXP.
>>>
>>> The device tree files are derived from the official NXP downstream Linux tree [2].
>>>
>>> This addition encompasses a limited selection of peripherals that are upstream-supported. Apart from the ARM System Modules (GIC, Generic Timer, etc.), the following IPs have been validated:
>>>
>>>     UART: fsl-linflexuart
>>>     SDHC: fsl-imx-esdhc
>>>     Ethernet: synopsys gmac/stmac
>>>
>>> Clock settings for the chip rely on ATF Firmware [3]. Pin control integration into the device tree is pending and currently relies on Firmware/U-Boot settings [4].
>>>
>>> These changes were validated using the latest BSP39 Firmware/U-Boot from NXP [5].
>>>
>>> The modifications enable booting the official Ubuntu 22.04 from NXP on
>>> the RDB3 with default settings from the SD card and eMMC.
>>>
>>> [1] https://www.nxp.com/design/design-center/designs/s32g3-vehicle-networking-reference-design:S32G-VNP-RDB3
>>> [2] https://github.com/nxp-auto-linux/linux
>>> [3] https://github.com/nxp-auto-linux/arm-trusted-firmware
>>> [4] https://github.com/nxp-auto-linux/u-boot
>>> [5] https://github.com/nxp-auto-linux/auto_yocto_bsp
>>>
>>> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
>>
>> This patch seems to be heavily based on the downstream version of the
>> kernel. Many of the changes originate from NXP. Therefore, shouldn't the
>> authors also be mentioned here?
>>
> 
> Yes, it definitely is, I also mentionaed it in the commit message. As
> Krzyszof mentioned, would you expect me to "git blame" the file and put
> all contributors into the commment part? Or would it be enough to put a
> Copyright of NXP as here [1]?
> 
> 
> [1] https://github.com/nxp-auto-linux/linux/blob/cdac0506874b7e6a277f12e72e3900d2a410d909/arch/arm64/boot/dts/freescale/s32g3.dtsi#L3

This has copyright from 2021, so 3 years is enough for NXP to prove they
care and upstream it. If they don't do it within 3 years, it is proof
NXP does not care enough, so I don't think you need to provide any
authorship remarks. Especially that many emails might be incorrect. Your
Cc-list here already creates 4 bounces..

But keep the copyright if you indeed based on that file.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
