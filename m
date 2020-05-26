Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6571AFD1E
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Apr 2020 20:15:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9D08C36B0C;
	Sun, 19 Apr 2020 18:15:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F249BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Apr 2020 18:15:20 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BC5D20771;
 Sun, 19 Apr 2020 18:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587320119;
 bh=p4n++5U0A4OCyfDu3fVqzBUhH4zBoXeoQg5Bhyjk5vs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=RmRFpgh9qOnCZcBjur/bkO1wxz/Io0VUZRVX9CVb6z+EdzgjT/udTJBdTVjGD2kKt
 5W/mfVhMfxRmQDNmeSobboeL1B0AOsKg6aKQG6X8KtW/eCqhdMm7SObo/IXpu5XC8a
 amuXOAvjV+246gBjLzZUgEN7lSf6GsXiOxk2wF2Q=
MIME-Version: 1.0
In-Reply-To: <1587030553-5990-1-git-send-email-hadar.gat@arm.com>
References: <1587030553-5990-1-git-send-email-hadar.gat@arm.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	David S.Miller <davem@davemloft.net>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hadar Gat <hadar.gat@arm.com>, Heiko Stübner <heiko@sntech.de>,
	JC Kuo <jckuo@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <"lore nzo.pieralisi"@arm.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Richard Weinberger <richard@nod.at>, Rob Clark <robdclark@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Sean Paul <sean@poorly.run>,
	Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>
Date: Sun, 19 Apr 2020 11:15:18 -0700
Message-ID: <158732011837.132238.3255039844840932086@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Cc: linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Hadar Gat <hadar.gat@arm.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ofir Drang <ofir.drang@arm.com>, Gilad Ben-Yossef <gilad@benyossef.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dmaengine@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH v2] of_device: removed #include that
	caused a recursion in included headers
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

Quoting Hadar Gat (2020-04-16 02:49:03)
> Both of_platform.h and of_device.h were included each other.
> In of_device.h, removed unneeded #include to of_platform.h
> and added include to of_platform.h in the files that needs it.
> 
> Signed-off-by: Hadar Gat <hadar.gat@arm.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
