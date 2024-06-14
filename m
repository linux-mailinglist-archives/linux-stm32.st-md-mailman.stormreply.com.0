Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DE908A18
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 12:35:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C45FBC6C83A;
	Fri, 14 Jun 2024 10:35:53 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D9E0C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 10:35:52 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so6830701fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 03:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718361352; x=1718966152;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6FMH9kgG6GLU9nGWzxsHP28rIR4BzbcGX6Cg1+tBHV0=;
 b=ZNj4Mjzmi/j/Su0aaR/OE38OsRcQt2e4mObAeb0LRJVbucxrJumK6WKodstpKBgIfB
 J85w5CPR17OCJo4a97WPpmwfYQeKJKsbggQFSkR/aK7n5RM3RFrKaL6a8THqrKGUt1c/
 WZ5704dfmE7hbX9e0YMJehek/9Kxf/o5DoCFcRY9Ks6uxqRkBqx5UpZsm4E//p6qvhL5
 sJqyXMoIg/sTFWTAIjx5heZKqrHTj0KrxTYkCBQxsY+FhvTgVtBHBsuuays2+12FIo38
 AyOCJuvDxoeRFW+2AAj9HiVmjMBhPKsPgXbeqSignXlDGKchnFQPWP1IIov/IMnQ/eKG
 Ws2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718361352; x=1718966152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6FMH9kgG6GLU9nGWzxsHP28rIR4BzbcGX6Cg1+tBHV0=;
 b=p93l+FobIa09JkVf/zRKk2yEvw+k0goLbrBmA5u6mVOCt66OVwGqPepvmkLfcmiFQ8
 vw1l8xu/m6Ljzt2w3+C8aeAlUucIBXK1ZwA/avKxIz5Sqr4Fd1rakus1aqcG0RfKopVB
 ZsJ6SYXwvcy5uy9QYFjm2BbHuc1LM2S18qGQxSxrVjEOq7mcXWCimuhmxtIJKjfPky1p
 DveBfkXB/9KZLmyCJneObocexb828p1rZ4GNtfK5Yf+8bxOnRc9dWzGdiJtM5Q1bRGLF
 8EshGb/BR/saXXBpn8mocmPU+nMUpj2WqdRKroY2aVhdRwQnBXKpZJDvJDA7BfrFkTlE
 Gq8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX0ggpLiE3KqYJyjyfuXyv01Fi8JQ63G3XaFJyniORETI9fA50FhOe2/ifmDlx+HpF2ZnzLJb8itVNzbMWmHHt5YDZ0GRUDQwjVvnUgLSJx3sxlQB+CYtI
X-Gm-Message-State: AOJu0YyMtETWOhCvRexrkXPunZ1uryCHJXEDyUsqe0AjmNzom5eNPmuW
 XTheluQkVM4evYn8z3rW1odO7znFvGOazUES0DJglEwzDtJfMsh7rQ8ilOvdJCc=
X-Google-Smtp-Source: AGHT+IEbw6LK2rPBbVuJQJBgxOhegr+TV/18ANijB4Rchh5JfiMQ1/qs7DuIZLwqd6QzWtrSJTx22Q==
X-Received: by 2002:a2e:8386:0:b0:2ea:e26d:c9ba with SMTP id
 38308e7fff4ca-2ec0e5d0c09mr13495761fa.27.1718361351635; 
 Fri, 14 Jun 2024 03:35:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05bf438fsm4969921fa.24.2024.06.14.03.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 03:35:51 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <eesj54re2itzlcr3ctntqjued5mqucbfxuoiy64344qkzt5be7@2643dlhd4kpl>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-11-30b25a6ae24e@linaro.org>
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Pascal Paillet <p.paillet@foss.st.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Keerthy <j-keerthy@ti.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 11/22] dt-bindings: thermal: qcom-tsens:
 reference thermal-sensor schema
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

On Fri, Jun 14, 2024 at 11:46:10AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
