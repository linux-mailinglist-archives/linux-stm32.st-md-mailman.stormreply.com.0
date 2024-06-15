Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8842A90974E
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Jun 2024 11:39:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 301C2C712A1;
	Sat, 15 Jun 2024 09:39:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48722C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jun 2024 09:39:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B779460B6E;
 Sat, 15 Jun 2024 09:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD748C116B1;
 Sat, 15 Jun 2024 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718444366;
 bh=VnEJAKlueI1gVsR28BDxfyG4IIsWQe276Q/5t4EIwiI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=adP+eWpDAo3ogc3xH8HvRct3q4nGLVjHAQ+9XYoAyKbLksW+2M3hkGFxC97c9ABf1
 YmMoJtp2km315ipyKHOLATXYYZsYNXv0LBpLXx0CCbQp2pD2sNmjKGiOClSvLMlQxm
 3iHgUUw0llAYnMR09VjsZszMwB7dRh/oUrQgKtwqoB7JlvTdozUe8OqvlrJbzdzGpr
 jEbeTI+55alP5cIoJnqAMMMR4ZVknYcX9Vab0xQBRtKdksziTmG2fKYQ9cr9Nm0MHb
 EBscKmOnnmeNQe0XTINhhBy/c0EvSg205h7v4vgr62ka0KBIIJMbso2EvfR47SJHCb
 tidPZob6oHU1Q==
Message-ID: <003b73f2-3b5d-40b7-a87c-2fc937e81bcd@kernel.org>
Date: Sat, 15 Jun 2024 11:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alim Akhtar <alim.akhtar@samsung.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 'Daniel Lezcano' <daniel.lezcano@linaro.org>,
 'Zhang Rui' <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Guillaume La Roque' <glaroque@baylibre.com>,
 'Krzysztof Kozlowski' <krzk+dt@kernel.org>,
 'Vasily Khoruzhick' <anarsoul@gmail.com>, 'Chen-Yu Tsai' <wens@csie.org>,
 'Jernej Skrabec' <jernej.skrabec@gmail.com>,
 'Samuel Holland' <samuel@sholland.org>, 'Shawn Guo' <shawnguo@kernel.org>,
 'Sascha Hauer' <s.hauer@pengutronix.de>,
 'Pengutronix Kernel Team' <kernel@pengutronix.de>,
 'Fabio Estevam' <festevam@gmail.com>, 'Anson Huang' <Anson.Huang@nxp.com>,
 'Thierry Reding' <thierry.reding@gmail.com>,
 'Jonathan Hunter' <jonathanh@nvidia.com>,
 'Dmitry Baryshkov' <dmitry.baryshkov@linaro.org>,
 'Amit Kucheria' <amitk@kernel.org>,
 =?UTF-8?Q?=27Niklas_S=C3=B6derlund=27?= <niklas.soderlund@ragnatech.se>,
 'Heiko Stuebner' <heiko@sntech.de>, 'Biju Das' <biju.das.jz@bp.renesas.com>,
 'Orson Zhai' <orsonzhai@gmail.com>,
 'Baolin Wang' <baolin.wang@linux.alibaba.com>,
 'Chunyan Zhang' <zhang.lyra@gmail.com>,
 'Alexandre Torgue' <alexandre.torgue@foss.st.com>,
 'Pascal Paillet' <p.paillet@foss.st.com>, 'Keerthy' <j-keerthy@ti.com>,
 'Broadcom internal kernel review list'
 <bcm-kernel-feedback-list@broadcom.com>,
 'Florian Fainelli' <florian.fainelli@broadcom.com>,
 'Scott Branden' <sbranden@broadcom.com>,
 'zhanghongchen' <zhanghongchen@loongson.cn>,
 'Matthias Brugger' <matthias.bgg@gmail.com>,
 'AngeloGioacchino Del Regno' <angelogioacchino.delregno@collabora.com>,
 'Bjorn Andersson' <andersson@kernel.org>,
 'Geert Uytterhoeven' <geert+renesas@glider.be>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <CGME20240614094638epcas5p115d52130f45e130652b6f1d946358d19@epcas5p1.samsung.com>
 <20240614-dt-bindings-thermal-allof-v1-1-30b25a6ae24e@linaro.org>
 <1891546521.01718433481489.JavaMail.epsvc@epcpadp4>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <1891546521.01718433481489.JavaMail.epsvc@epcpadp4>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 'Florian Fainelli' <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, cpgs@samsung.com,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/22] dt-bindings: thermal: samsung,
	exynos: specify cells
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

On 14/06/2024 16:29, Alim Akhtar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, June 14, 2024 3:16 PM
>> To: Daniel Lezcano <daniel.lezcano@linaro.org
> .stormreply.com;
>> Subject: [PATCH 01/22] dt-bindings: thermal: samsung,exynos: specify cells
>>
>> All Samsung Exynos SoCs Thermal Management Units have only one sensor, so
>> make '#thermal-sensor-cells' fixed at 0.
>>
> This is not entirely true, there are SoCs which have multiple temp sensors.
> It is true that currently only one sensor support is added though.

All supported by mainline. Others do not exist now :)

> 
> So we can leave this as is or you suggest to make it to support only one sensor
> (to match the current DT support), and later (in near future) change it again to
> match what HW actually support?

Yes, different devices can have different value (and bindings).
Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
