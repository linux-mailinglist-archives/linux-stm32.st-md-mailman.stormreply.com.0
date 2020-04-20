Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF41B1735
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 22:36:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3F7AC36B0C;
	Mon, 20 Apr 2020 20:36:53 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2168EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 20:36:53 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id e20so9386427otl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 13:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0kqh5Q9Co3AbSPBrTmVcdN3oyZQj3KIAbrC9Aw9Jey8=;
 b=VMilr46SrT7iCC2kZ4qzsLIj1MI7mkwL9/2kHWFj2mQ8yPGIFMX90okVTV8pE/KJjh
 gs06c83B0MyFTtIA0pdtE/3ney0cpkn8iO55RiRFTptPCX8vkUgh2MM0qxZzqIxI9hPC
 7sUlvH9CNXSp1qqkr0OvLivzi+49c/VGNjZVB+nYdW72s9n8Im/3xdd+jHJMlE7VCXM3
 7S4fIKv5kWQARUNNwkVv/G3rKikiVlvjwbS4vOcUSoyEK1jis/T6Z2a+LcVniAWWoAkG
 JWo/HKyyra3B8ohjmwYNSlDuO70wOo+d/kashD75BFioG2aKpdtQ7Xp2YhdFLoy5uDCn
 gKyA==
X-Gm-Message-State: AGi0PuaoXXz+93pqthAfpX2A5xlIr+NxunMBuHvx2TI9YccouyjFiz4Y
 vj+s1HtJ3HMEt9dk8bgHvg==
X-Google-Smtp-Source: APiQypIKf0vB7yfwu8rT/KxQM+HvZK1R4I7Apur0UzYjSjNLrYCJKeDB/Ne3EnK+UZ4pWSPP25JeDQ==
X-Received: by 2002:a9d:6a02:: with SMTP id g2mr11554009otn.196.1587415011744; 
 Mon, 20 Apr 2020 13:36:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r21sm190334otg.67.2020.04.20.13.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 13:36:50 -0700 (PDT)
Received: (nullmailer pid 18971 invoked by uid 1000);
 Mon, 20 Apr 2020 20:36:47 -0000
Date: Mon, 20 Apr 2020 15:36:47 -0500
From: Rob Herring <robh@kernel.org>
To: Hadar Gat <hadar.gat@arm.com>
Message-ID: <20200420203647.GA23189@bogus>
References: <1586784960-22692-1-git-send-email-hadar.gat@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586784960-22692-1-git-send-email-hadar.gat@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jose Abreu <joabreu@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 netdev@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-samsung-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-rockchip@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Joerg Roedel <joro@8bytes.org>,
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Ofir Drang <ofir.drang@arm.com>, linux-gpio@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] of_device: removed #include that caused a
 recursion in included headers
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

On Mon, Apr 13, 2020 at 04:35:53PM +0300, Hadar Gat wrote:
> Both of_platform.h and of_device.h were included each other.
> In of_device.h, removed unneeded #include to of_platform.h
> and added include to of_platform.h in the files that needs it.

Guess we forgot about that temporary comment!

Both of these headers have a lot of things we don't want 'normal' 
drivers calling. The most common thing needed from of_device.h is 
of_match_device/of_device_get_match_data. A good number are only for 
ibmebus. Maybe the header should be split or the former just moved 
to of.h.

For of_platform.h, it seems we have a bunch of unneeded includes:

$ git grep 'of_platform\.h' drivers/ | wc
    560    1120   36049
$ git grep -E 'of_(platform_(pop|def)|find_device)' drivers/ | wc
    248    1215   20630

Would nice to drop those (or switch to of_device.h?) too.

Be sure to build on Sparc. It's the oddball.

> 
> Signed-off-by: Hadar Gat <hadar.gat@arm.com>
> ---
>  drivers/base/platform.c                           | 1 +
>  drivers/bus/vexpress-config.c                     | 1 +
>  drivers/dma/at_hdmac.c                            | 1 +
>  drivers/dma/stm32-dmamux.c                        | 1 +
>  drivers/dma/ti/dma-crossbar.c                     | 1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c                   | 1 +
>  drivers/gpu/drm/msm/msm_drv.c                     | 1 +
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 1 +
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                | 1 +
>  drivers/iio/adc/stm32-adc-core.c                  | 1 +
>  drivers/iio/adc/stm32-dfsdm-adc.c                 | 1 +
>  drivers/iio/adc/stm32-dfsdm-core.c                | 1 +
>  drivers/iommu/tegra-smmu.c                        | 1 +
>  drivers/memory/atmel-ebi.c                        | 1 +
>  drivers/mfd/palmas.c                              | 1 +
>  drivers/mfd/ssbi.c                                | 1 +
>  drivers/mtd/nand/raw/omap2.c                      | 1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  drivers/net/ethernet/ti/cpsw.c                    | 1 +
>  drivers/phy/tegra/xusb.c                          | 1 +
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c         | 1 +
>  drivers/soc/samsung/exynos-pmu.c                  | 1 +
>  drivers/soc/sunxi/sunxi_sram.c                    | 1 +
>  include/linux/of_device.h                         | 2 --
>  lib/genalloc.c                                    | 1 +
>  26 files changed, 25 insertions(+), 2 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
