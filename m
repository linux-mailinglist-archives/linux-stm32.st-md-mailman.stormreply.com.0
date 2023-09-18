Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97E7A48BE
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Sep 2023 13:50:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4849C6B45B;
	Mon, 18 Sep 2023 11:50:32 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC37C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 11:50:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46CD0B80DE3;
 Mon, 18 Sep 2023 11:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAD37C433C7;
 Mon, 18 Sep 2023 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695037829;
 bh=oT5snbuM6TfIDJhxJsWR/PSxNRbw+iiiuFc7Xp3a8+I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uZ7FGpqOOOW4QGMAG4E31OhORIcesAUkf7+AMd+dsPzh46DiEGuFjAIIhigCjpVJL
 DwbZLMUVDePIq6nrbjOfTbzXtettFFgIyY2rnnqxkUb/zAQgp+ndayV41JWxb1zLMo
 AbI3ombnz9obEikffx68Z0fVqGGNkZQKYCDV1P39O8JxfbAfmD/97IyEGrtWpqGfsP
 5sR9Uc4vWEZJBRM/S+0t5Q8N7s9KRKP6pCpKx6h60qwQV1CKH3ulLO4OQM8TnaNqdb
 K5zs590+yp6+YrY9ggF3Ph/91j0zolaKDFIYLi5JTOTbhB+mIXrp/jkzKzlYTTCB0Q
 EXB1uzYcbpgnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B4871E11F41; Mon, 18 Sep 2023 11:50:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169503782973.2272.13506822186977436052.git-patchwork-notify@kernel.org>
Date: Mon, 18 Sep 2023 11:50:29 +0000
References: <20230916075829.1560-1-jszhang@kernel.org>
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: kernel@esmil.dk, linux-tegra@vger.kernel.org, edumazet@google.com,
 thierry.reding@gmail.com, linux-amlogic@lists.infradead.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 samuel@sholland.org, khilman@baylibre.com, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 samin.guo@starfivetech.com, linux-imx@nxp.com, kuba@kernel.org,
 pabeni@redhat.com, linux-sunxi@lists.linux.dev, mcoquelin.stm32@gmail.com,
 martin.blumenstingl@googlemail.com, s.hauer@pengutronix.de, vz@mleia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org,
 davem@davemloft.net
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

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Sat, 16 Sep 2023 15:58:06 +0800 you wrote:
> Russell pointed out there's a new devm_stmmac_probe_config_dt()
> helper now when reviewing my starfive gmac error handling patch[1].
> After greping the code, this nice helper was introduced by Bartosz in
> [2], I think it's time to convert all dwmac users to this helper and
> finally complete the TODO in [2] "but once all users of the old
> stmmac_pltfr_remove() are converted to the devres helper, it will be
> renamed back to stmmac_pltfr_remove() and the no_dt function removed."
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/23] net: stmmac: dwmac-anarion: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/6f799fd9dda7
  - [net-next,v2,02/23] net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/0485825dd6a8
  - [net-next,v2,03/23] net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d53b19d2a1a8
  - [net-next,v2,04/23] net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/14ec0fc582c5
  - [net-next,v2,05/23] net: stmmac: dwmac-imx: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/115c9248b19b
  - [net-next,v2,06/23] net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/6bb53b2abf30
  - [net-next,v2,07/23] net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/abea8fd5e801
  - [net-next,v2,08/23] net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/72ab86c27d4e
  - [net-next,v2,09/23] net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d30c08a3b001
  - [net-next,v2,10/23] net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d7209c056a49
  - [net-next,v2,11/23] net: stmmac: dwmac-meson: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/780b63ae208e
  - [net-next,v2,12/23] net: stmmac: dwmac-meson8b: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/551022d680ec
  - [net-next,v2,13/23] net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/8eee20e10d6f
  - [net-next,v2,14/23] net: stmmac: dwmac-socfpga: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/9086d3f2b560
  - [net-next,v2,15/23] net: stmmac: dwmac-starfive: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/6d6c11937359
  - [net-next,v2,16/23] net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/c9445e0bd729
  - [net-next,v2,17/23] net: stmmac: dwmac-stm32: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/373845154618
  - [net-next,v2,18/23] net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/9bdf6909877c
  - [net-next,v2,19/23] net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/291595337626
  - [net-next,v2,20/23] net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/acf73ccff08e
  - [net-next,v2,21/23] net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d336a117b593
  - [net-next,v2,22/23] net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
    https://git.kernel.org/netdev/net-next/c/2c9fc838067b
  - [net-next,v2,23/23] net: stmmac: make stmmac_{probe|remove}_config_dt static
    https://git.kernel.org/netdev/net-next/c/b2504f649bda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
