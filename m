Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8594185712D
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 00:12:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 239FFC65E42;
	Thu, 15 Feb 2024 23:12:20 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D143C6410C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 23:12:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AAF86CE291F;
 Thu, 15 Feb 2024 23:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FE2C433C7;
 Thu, 15 Feb 2024 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708038734;
 bh=Eb/9YuG1ExOw9aKA1oqZbr3X02sG3sH9UxVJp/eMEdU=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=VKWARMnYNviJPXiOtKuoccPiteYKCHSVFRLfobnKgCAmFe3rC2z0Wd3jsy6VvnDNO
 LU9halfyBb8j8Gtgt3x3Yl2qjLDsAaN4XWZY7vP2J42INqR9FJQbRW1OHvIkeGQQFp
 uBCYksmhH7HE6OaG4D9ym/b893RmduQl4SpP0JiZwyMF3BNC3fvmpvB1RmIpvsXepi
 DfFkHY0/gR6aJRNCjSdzlugiIA0yQlY7txVukxSAYJg5oBs5tW432Y/k7zJ3C35m36
 +j4EikR/4v5vFeyHEmEG7BhaHzvhhTsPRPWFIm8wrAx8nLp781+VxGDyfk8VT7NiAg
 cIy678urUpZjg==
Message-ID: <38e7e80f61f7c67c984735cf55c3dfb3.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jaroslav Kysela <perex@perex.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Nishanth Menon <nm@ti.com>,
 Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Shawn Guo <shawnguo@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 patches@opensource.cirrus.com
Date: Thu, 15 Feb 2024 15:12:12 -0800
User-Agent: alot/0.10
Subject: Re: [Linux-stm32] [PATCH] clk: constify the of_phandle_args
	argument of of_clk_provider
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

Quoting Krzysztof Kozlowski (2024-02-08 08:37:10)
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

This will almost certainly break the build once it is merged to
linux-next. What's your plan to merge this?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
