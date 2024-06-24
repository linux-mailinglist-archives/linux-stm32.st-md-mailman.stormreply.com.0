Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D059140EA
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 06:10:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E57BC71289;
	Mon, 24 Jun 2024 04:10:13 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83C17C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 04:10:06 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240624041002epoutp017f05577018b2eadddc8b8cb81ec3826f~b1Ut0SVjH1592015920epoutp01L;
 Mon, 24 Jun 2024 04:10:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240624041002epoutp017f05577018b2eadddc8b8cb81ec3826f~b1Ut0SVjH1592015920epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1719202202;
 bh=f8MsT2ydR8FVWHQfUu9aV03i/fvtgmg81rTBmx7wZtI=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=KrD5HtQJlXwla8TJO98EzEGmbC6U6iFckhBxukcjB1yovmR3lz02KUcrhstmuFHwP
 HlU6mB/4SedvqN4YiOBGO9STneKReT3yuKLSGYAj6kOz4v/+HseOzds5BjWWMSF78Z
 UX56cYaK573oQ0K1epKtk2kmiCwRbV6WxQq+ulZM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20240624041002epcas5p32f5ba38ddb47660961e77f59341cfae1~b1Utit_tu2048920489epcas5p3C;
 Mon, 24 Jun 2024 04:10:02 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp1.localdomain
 (Postfix) with ESMTP id 4W6vcp3M22z4x9Q8; Mon, 24 Jun 2024 04:10:02 +0000
 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240624040636epcas5p37dc56f380e9e84e273a040775a8e6f6a~b1RtorJGk1881818818epcas5p3e;
 Mon, 24 Jun 2024 04:06:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240624040636epsmtrp207b25ba1110f1c95c77dc40514d58f15~b1Rtmp5HY1015110151epsmtrp2s;
 Mon, 24 Jun 2024 04:06:36 +0000 (GMT)
X-AuditID: b6c32a29-72dff700000074f4-8b-6678f0cc0a0d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 76.5B.29940.CC0F8766; Mon, 24 Jun 2024 13:06:36 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20240624040628epsmtip2a5b53ed83b9eac43f0d7a7bd0cd4bb48~b1RlznvHY0728807288epsmtip2H;
 Mon, 24 Jun 2024 04:06:27 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Krzysztof Kozlowski'"
 <krzysztof.kozlowski@linaro.org>, "'Daniel Lezcano'"
 <daniel.lezcano@linaro.org>, "'Zhang Rui'" <rui.zhang@intel.com>, "'Lukasz
 Luba'" <lukasz.luba@arm.com>, "'Rob Herring'" <robh@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>, "'Guillaume La Roque'"
 <glaroque@baylibre.com>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
 "'Vasily Khoruzhick'" <anarsoul@gmail.com>, "'Chen-Yu Tsai'"
 <wens@csie.org>, "'Jernej Skrabec'" <jernej.skrabec@gmail.com>, "'Samuel
 Holland'" <samuel@sholland.org>, "'Shawn	Guo'" <shawnguo@kernel.org>,
 "'Sascha Hauer'" <s.hauer@pengutronix.de>, "'Pengutronix Kernel Team'"
 <kernel@pengutronix.de>, "'Fabio Estevam'" <festevam@gmail.com>, "'Anson
 Huang'" <Anson.Huang@nxp.com>, "'Thierry Reding'"
 <thierry.reding@gmail.com>, "'Jonathan Hunter'" <jonathanh@nvidia.com>,
 "'Dmitry Baryshkov'" <dmitry.baryshkov@linaro.org>, "'Amit Kucheria'"
 <amitk@kernel.org>, =?utf-8?Q?'Niklas_S=C3=B6derlund'?=
 <niklas.soderlund@ragnatech.se>, "'Heiko Stuebner'" <heiko@sntech.de>,
 "'Biju	Das'" <biju.das.jz@bp.renesas.com>, "'Orson Zhai'"
 <orsonzhai@gmail.com>, "'Baolin Wang'" <baolin.wang@linux.alibaba.com>,
 "'Chunyan Zhang'" <zhang.lyra@gmail.com>, "'Alexandre Torgue'"
 <alexandre.torgue@foss.st.com>, "'Pascal Paillet'" <p.paillet@foss.st.com>,
 "'Keerthy'" <j-keerthy@ti.com>, "'Broadcom internal kernel review list'"
 <bcm-kernel-feedback-list@broadcom.com>, "'Florian Fainelli'"
 <florian.fainelli@broadcom.com>, "'Scott Branden'" <sbranden@broadcom.com>,
 "'zhanghongchen'" <zhanghongchen@loongson.cn>, "'Matthias Brugger'"
 <matthias.bgg@gmail.com>, "'AngeloGioacchino Del Regno'"
 <angelogioacchino.delregno@collabora.com>, "'Bjorn Andersson'"
 <andersson@kernel.org>, "'Geert Uytterhoeven'" <geert+renesas@glider.be>
In-Reply-To: <003b73f2-3b5d-40b7-a87c-2fc937e81bcd@kernel.org>
Date: Mon, 24 Jun 2024 09:36:22 +0530
Message-ID: <1296674576.21719202202469.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGhCdcVAXQc0tvKk5x9QOKQ/J0WewGh/L0BAiWHCW4CgfI42AIboMv/sgabD1A=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xbZRjH956ennPogp4VYs8gKiHRZBdgBGKeKcNLNj3ROJfMfcHorFAY
 chn2DIYzbqyAWjZGOybQMsrVcSsTWi6lBYblsjEHTFEYcpFroYMBAYKWIZXSaPj2ey7/3/N+
 eCmesITwoCJjz0mkseJob0KA17d5v+jzYCkx/FDH4LNgs2YhaMtPhNROC4L674Lg13IGGlSh
 YG/uRFCV3oGDxrCGgba5BwOreR9oVp6H/PYePih7bQSsL7STMP77B3C7fpQHebnXERRm5hFg
 n5jjg2o0lYD7DTIMZvJvI0hRF+FQ8X0jDlb1KAG9vdUkNM/VkVCQuxt0k/1byjvdJPQZbxLQ
 l/wLgpX0dgR11gUMlsfsPFAObQVyelswSOuf4sONFiMB8lU1AYWyFBJkKQFwN+saH7KXchG0
 TmfiYG8ykDA1fo2Afxp0OMxMyAlYqJxCMFsrAptRg4PN3ItB6ZiRhLX+Bt4bwGo1WsQuPkol
 2fLZXJJV/9lNsIaREsRWT1Ty2emMOpJVdvuwjeoRki1usmKsrkJOsMP9TQTbOH6Y1ZdcYmf1
 KsRelhVhJzxCBEFhkujIBInUL/hTwRmT5QmKqxUk6tqMvCRUTaUhF4qhA5lK/RNeGhJQQtqE
 mHm7CTkHnsxAjYJ0shtTvjmzzULaghj1Pc7BBO3DGIq/IRxhd3rwGaZqoZR0FDz6Mc7oF8r4
 Tu1djHk0YSUcERc6mCmxTG6fcKOPM5orU3gaoiicfolZVQU42q70YcYuv086eQ/TpXKsuGxJ
 DzDTg9P/863COZ7zdV6MbfoW38HuW0rt5lXCuSNirB3tpAK5qXeo1DtU6h0q9Y5IAcIr0F5J
 HBcTEcP5x/nHSs77cuIYLj42wjf0bIwObX/k/fsMqKFiydeMMAqZEUPxvN1dsy8lhAtdw8Rf
 XpBIz56WxkdLODPypHBvkatoNj1MSEeIz0miJJI4ifS/KUa5eCRhhfrqbzfHZJHK+RPvkMNe
 wW5rFxbPH4rZbdwbWfNKl19iYk5UskvJRenAg67VWvnf1Mb73Py8ebm5aS5izTPjdLop2e94
 q+jzEI61jNBfLRZ2vveR5cdTTzUvrAQykw8DPhw6om/N/ixHsaFYjzYkiF696nXAqPXfCBJM
 Hc2JbN38GAqUjZ9wsoGTip9VnjfeDfpCZdHuEq5nHFQ8N+y7p9Z0rLKsh91Aj9d6fug72vKb
 PmXm7eXc6rd08ofxYlNelPGPLCT3R389HbkXUiT9etfJ8s6q0KGiU6a66wgrO/Lam6Uv+17J
 Lr6zXpC0cvCy9WamsOb1Y+HKn2xpXPzQmCjwojfOnRH77+dJOfG/2JYK7DcEAAA=
X-CMS-MailID: 20240624040636epcas5p37dc56f380e9e84e273a040775a8e6f6a
X-Msg-Generator: CA
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20240614094638epcas5p115d52130f45e130652b6f1d946358d19
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <CGME20240614094638epcas5p115d52130f45e130652b6f1d946358d19@epcas5p1.samsung.com>
 <20240614-dt-bindings-thermal-allof-v1-1-30b25a6ae24e@linaro.org>
 <1891546521.01718433481489.JavaMail.epsvc@epcpadp4>
 <003b73f2-3b5d-40b7-a87c-2fc937e81bcd@kernel.org>
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Saturday, June 15, 2024 3:09 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>; 'Krzysztof Kozlowski'
> <krzysztof.kozlowski@linaro.org>; 'Daniel Lezcano'
[snip]
> On 14/06/2024 16:29, Alim Akhtar wrote:
> > Hi Krzysztof,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Sent: Friday, June 14, 2024 3:16 PM
> >> To: Daniel Lezcano <daniel.lezcano@linaro.org
> > .stormreply.com;
> >> Subject: [PATCH 01/22] dt-bindings: thermal: samsung,exynos: specify
> >> cells
> >>
> >> All Samsung Exynos SoCs Thermal Management Units have only one
> >> sensor, so make '#thermal-sensor-cells' fixed at 0.
> >>
> > This is not entirely true, there are SoCs which have multiple temp sensors.
> > It is true that currently only one sensor support is added though.
> 
> All supported by mainline. Others do not exist now :)
> 
> >
> > So we can leave this as is or you suggest to make it to support only
> > one sensor (to match the current DT support), and later (in near
> > future) change it again to match what HW actually support?
> 
> Yes, different devices can have different value (and bindings).
Ok, this is fine for now.

> Best regards,
> Krzysztof



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
