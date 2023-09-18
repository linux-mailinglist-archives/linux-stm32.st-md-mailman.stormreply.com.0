Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CDD7A5384
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Sep 2023 22:14:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6DDDC6B474;
	Mon, 18 Sep 2023 20:14:23 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03FF0C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 20:14:21 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-502153ae36cso7927136e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 13:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068061; x=1695672861;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M+e7RPlNIEbnCE6SNaWUDYK3xS0AglRAD4OXd3Ulb6s=;
 b=IBBTxC24/fn9parTU0CNBqkXvYA1PRSgrcT703zmgHL0seWNf4G1/SVxMAT0mzvBMx
 8h0ODZBoEW8IxjLMpRDrC01uJRex/WF0Uc0aE90/XCmh9Q/IzfmRHctL9H+6baSuA1Md
 Avha+nIRSwBVmy/nXhFpE/V6Qd4AZbnOlFuMvhX2/KtY3jX3xsiGvrhsU7wHGLfdeYuT
 VBo+pBWn+uhg6WgPwhLd5cUfzpXjJfrRhUg5vafMiLVzI0WOp0rvY946SN5ep75pNwu+
 S+B/ZWvZhTF24ZnC5UEtdOiR0wOrQi2JjiGkAB43a1H8BwZUuE1Fh60X4ADBtylJIJpK
 hwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068061; x=1695672861;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+e7RPlNIEbnCE6SNaWUDYK3xS0AglRAD4OXd3Ulb6s=;
 b=qIXUGe28fU5ffaGTg2QSp+98/wFX+wvk58iwrfbSyCVdDCQoeHAlH4J2qy595Fn6di
 j71Ud8fEIBSnbu/i2+n4IJOpVwokaW8irSPShoOmOQJvSFuoIDo3kw8jIp+N49GBF6E/
 E5uNX7AVIQXix1eptwsfLAsU6ElmLtnSvRhBmYqdXhMD7I8JKdqYbNmhei16aiklcqpO
 4alitzccsZWmgSe1wb8vYP4cWo/WATYMejmOfI+du0LFesrSATLP+2yb2fVo0b6Aryw7
 PluvRkQPDZM7pIxzgJEM+W+XlfqSUNxPZFl6V8jYf91CU/z2jlJenPzOZBOJmgA9brCt
 Hehw==
X-Gm-Message-State: AOJu0YxUXyxcNtj86HDLHkPldiUPAaOwM+VlYYPAYkMq6q+4DP8dFlp4
 Y1oFKi/erdiyCHoI+2nhABg=
X-Google-Smtp-Source: AGHT+IFn+LYvQSp5rZn6lhfAzGXnJK7HIJKtSCz+mspnLIkIgmBXG+lSxqLriZhpKyj97znopumt4A==
X-Received: by 2002:a05:6512:33c8:b0:4fe:d0f:b4f7 with SMTP id
 d8-20020a05651233c800b004fe0d0fb4f7mr10927733lfg.65.1695068061007; 
 Mon, 18 Sep 2023 13:14:21 -0700 (PDT)
Received: from mobilestation ([178.178.81.241])
 by smtp.gmail.com with ESMTPSA id
 d33-20020a0565123d2100b0050317d2b0f3sm563142lfv.61.2023.09.18.13.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:20 -0700 (PDT)
Date: Mon, 18 Sep 2023 23:14:06 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <nqa7g7x3alrcbnbgkyalg5h26na6rzwid3jxdqviisi2pnkdrn@b4qvgamj4urr>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-tegra@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-amlogic@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/22] convert to
	devm_stmmac_probe_config_dt
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

On Sat, Sep 16, 2023 at 03:58:06PM +0800, Jisheng Zhang wrote:
> Russell pointed out there's a new devm_stmmac_probe_config_dt()
> helper now when reviewing my starfive gmac error handling patch[1].
> After greping the code, this nice helper was introduced by Bartosz in
> [2], I think it's time to convert all dwmac users to this helper and
> finally complete the TODO in [2] "but once all users of the old
> stmmac_pltfr_remove() are converted to the devres helper, it will be
> renamed back to stmmac_pltfr_remove() and the no_dt function removed."
> 
> Link: https://lore.kernel.org/netdev/ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk/ [1]
> Link: https://lore.kernel.org/all/20230623100417.93592-1-brgl@bgdev.pl/  [2]

I see the series is already merged in. In anyway here is my tag:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks for submitting the set.

-Serge(y)

> 
> Since v1:
>  - rebase on new net-next
>  - add make stmmac_{probe|remove}_config_dt static as suggested by Russell.
> 
> Jisheng Zhang (23):
>   net: stmmac: dwmac-anarion: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
>   net: stmmac: dwmac-imx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson8b: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-socfpga: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-starfive: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-stm32: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
>   net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
>   net: stmmac: make stmmac_{probe|remove}_config_dt static
> 
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   | 10 +--
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 15 +---
>  .../ethernet/stmicro/stmmac/dwmac-generic.c   | 15 +---
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 13 ++--
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++------
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 25 +++----
>  .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 27 +++----
>  .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   | 19 ++---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-meson.c | 25 ++-----
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 53 +++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 14 ++--
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 16 ++---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 10 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 14 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 17 ++---
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 23 +++---
>  .../net/ethernet/stmicro/stmmac/dwmac-tegra.c | 10 ++-
>  .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 18 ++---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 70 ++++++-------------
>  .../ethernet/stmicro/stmmac/stmmac_platform.h |  5 --
>  22 files changed, 127 insertions(+), 317 deletions(-)
> 
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
