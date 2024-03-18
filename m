Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB5087E429
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Mar 2024 08:39:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5BF2C6DD60;
	Mon, 18 Mar 2024 07:39:19 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7627C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Mar 2024 07:39:18 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-56829f41f81so5500815a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Mar 2024 00:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710747558; x=1711352358;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vpoJHq2kVU4cubYvHHTHZKWABpZl9dQPC/sCgzyCCfo=;
 b=BIzIaPHWUhoX0vz1MqlAwPZkeMZG56y03OwfVVBVVQucSgnYKtPrxvWxOdjOV+Mqdq
 v1tmGUPuJNYY0FBJSMMD1SsPahZhJrtLtigFrd2mc48fd2nlHIx29nrqMgR2LUOjMaFI
 VmgBw3Cq7KwB+hbBYmiFAb3o6XL58jUbjYWHhTEJ3FEzyXzK8D+weZ+SfKGaSlAzLymY
 BJB2aiFDS/ZZvNJwD3HMk9AZBHuasLJYFAdZohIx+tGzZHDHeGdPktVX7Z329fZlFUOf
 8xzQlZxc2rZw6IlYHu1j7b9hv2mipuooGDlBGX9N9IBUgIO9DM7pcfpXtKldj3QxCszI
 8ADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710747558; x=1711352358;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vpoJHq2kVU4cubYvHHTHZKWABpZl9dQPC/sCgzyCCfo=;
 b=OIBQSuIEJT+DNLJBthNsKBGWiX/TlB6ZxCHuayhFPlnpx3ICi3mU/HNVkCZois029a
 WWMSgnH4quQ8fcrx/c/liINyrDbnFvEb08mwHHS3jlpg3/94d8PdO0FcpSRvx0kdP1bb
 SllrJw/UmlGzseFU9dBAdCaP0LnvAKuC9wtxoooxFvhOVdXCC+UQImY6gXqXyTfSJtUZ
 QUMrj5OT/ZiNIH0hUcKqmeHRoaPjNhUoDRgbyjO6BUKiuQvXLlSQ7u5V3qzE3vk1RBZC
 AJb+Gt48LCkkJpaUbkkUkOqkm47JM7SMbQ/XkW9r8mbHL8WS2GsCVQFiCS3rX6VCoZRS
 zmWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa2RcX21l/YIbfCk94JopIIwGpIr5JBvitCvhetXP64Tx1K1sCez7BJ448hANdTWIaQYyqRJbpxGgh4b8Xx/Mn7VpjY2IMBGVK8SzeJOFEsTvYb50LHXYp
X-Gm-Message-State: AOJu0Yy21kdFQ3lU8a4UjFzqQHne8tYHMR62nrXhvMW9qbj/dTFDAbsh
 vZvuOrASs2R+546j7HG+zqdQ2c0KAmhphnwZLDQHRaJugnxbY+53Wb8JY6rJr84=
X-Google-Smtp-Source: AGHT+IFzRNxfhosEyI+rRgGgowaMy78jv75fcicSpz5Y5yLsGIrZvtYgBwFW7R2LulAEPEzO9jc+hw==
X-Received: by 2002:a05:6402:2401:b0:568:a05e:eafd with SMTP id
 t1-20020a056402240100b00568a05eeafdmr9346676eda.39.1710747558031; 
 Mon, 18 Mar 2024 00:39:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056402428d00b005689f3d6936sm4350727edc.53.2024.03.18.00.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 00:39:17 -0700 (PDT)
Message-ID: <85123b46-188c-47b3-88e9-3122ad67ec47@linaro.org>
Date: Mon, 18 Mar 2024 08:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Wadim Mueller <wafgo01@gmail.com>
References: <20240315222754.22366-1-wafgo01@gmail.com>
 <20240315222754.22366-2-wafgo01@gmail.com>
 <4e168fbc-8a13-4666-ab80-e3032f61ef38@oss.nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4e168fbc-8a13-4666-ab80-e3032f61ef38@oss.nxp.com>
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

On 18/03/2024 08:32, Ghennadi Procopciuc wrote:
> On 3/16/24 00:27, Wadim Mueller wrote:
>> This commit adds device tree support for the NXP S32G3-based
>> S32G-VNP-RDB3 Board (Vehicle Networking Platform - Reference Design Board) [1].
>>
>> The S32G3 features an 8-core ARM Cortex-A53 based SoC developed by NXP.
>>
>> The device tree files are derived from the official NXP downstream Linux tree [2].
>>
>> This addition encompasses a limited selection of peripherals that are upstream-supported. Apart from the ARM System Modules (GIC, Generic Timer, etc.), the following IPs have been validated:
>>
>>     UART: fsl-linflexuart
>>     SDHC: fsl-imx-esdhc
>>     Ethernet: synopsys gmac/stmac
>>
>> Clock settings for the chip rely on ATF Firmware [3]. Pin control integration into the device tree is pending and currently relies on Firmware/U-Boot settings [4].
>>
>> These changes were validated using the latest BSP39 Firmware/U-Boot from NXP [5].
>>
>> The modifications enable booting the official Ubuntu 22.04 from NXP on
>> the RDB3 with default settings from the SD card and eMMC.
>>
>> [1] https://www.nxp.com/design/design-center/designs/s32g3-vehicle-networking-reference-design:S32G-VNP-RDB3
>> [2] https://github.com/nxp-auto-linux/linux
>> [3] https://github.com/nxp-auto-linux/arm-trusted-firmware
>> [4] https://github.com/nxp-auto-linux/u-boot
>> [5] https://github.com/nxp-auto-linux/auto_yocto_bsp
>>
>> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> 
> This patch seems to be heavily based on the downstream version of the
> kernel. Many of the changes originate from NXP. Therefore, shouldn't the
> authors also be mentioned here?

Let's say there are 100 commits with 100 authors in downstream. Do you
expect to list them all? Please point to parts which are directly copied
(with references to original commits).

Anyway, Wadim's SoB is enough from DCO point of view. We do not keep
authorship of downstream sources. If downstream cared, they would
upstreamed it much earlier than the community.

However if original work has any copyright statements, they should be
retained if this is indeed derivative work.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
