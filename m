Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7041473DACF
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jun 2023 11:07:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24F6FC6A60E;
	Mon, 26 Jun 2023 09:07:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D11B5C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jun 2023 22:40:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5085060ABD;
 Sat, 24 Jun 2023 22:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9878AC433C9;
 Sat, 24 Jun 2023 22:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687646424;
 bh=wFuYPKBZDVE/KNCfDf5udJ5FGoqcIIHcICXY9FCaBa0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GQnPbwWsakuOPo9NzsCGnu7VNIBsah5Ar0vvOSOu4YvOtGm9lpi/EL4HqoankMgSk
 u53Ss4+2kPxA2IeJYK5BqFk3RcrMSdSEErTSz7iC3XPxgs6D9wzBy0ciln9FfI0Ex7
 UjsjzMayscYiFKLujaUqU00GpN/41SCRrZVqm4Vvwv8DMe78lgJPO3upHOIschQx3t
 qJTdVgj2u5Evpw/u0rwZUNwhUn+fXGdRIE0xLreoBqUbCu1BaMjNdY3Ws2i9L2TR7z
 89+Ho/l2s3/nanrku3QTTn/WZlQamw1sY2v//Cku+fxVTKTjds6CDQzl2EEeTzPk72
 mjmW5S/7uKrNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7C429C395C7; Sat, 24 Jun 2023 22:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168764642450.414.12816371572473277561.git-patchwork-notify@kernel.org>
Date: Sat, 24 Jun 2023 22:40:24 +0000
References: <20230623100417.93592-1-brgl@bgdev.pl>
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailman-Approved-At: Mon, 26 Jun 2023 09:07:40 +0000
Cc: vkoul@kernel.org, linux-kernel@vger.kernel.org, bhupesh.sharma@linaro.org,
 bartosz.golaszewski@linaro.org, junxiao.chang@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, netdev@vger.kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/11] net: stmmac: introduce
 devres helpers for stmmac platform drivers
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 Jun 2023 12:04:06 +0200 you wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The goal of this series is two-fold: to make the API for stmmac platforms more
> logically correct (by providing functions that acquire resources with release
> counterparts that undo only their actions and nothing more) and to provide
> devres variants of commonly use registration functions that allows to
> significantly simplify the platform drivers.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/11] net: stmmac: platform: provide stmmac_pltfr_init()
    https://git.kernel.org/netdev/net-next/c/97117eb51ec8
  - [net-next,v2,02/11] net: stmmac: dwmac-generic: use stmmac_pltfr_init()
    https://git.kernel.org/netdev/net-next/c/4450e7d4231a
  - [net-next,v2,03/11] net: stmmac: platform: provide stmmac_pltfr_exit()
    https://git.kernel.org/netdev/net-next/c/5b0acf8dd2c1
  - [net-next,v2,04/11] net: stmmac: dwmac-generic: use stmmac_pltfr_exit()
    https://git.kernel.org/netdev/net-next/c/40db9f1ddfcc
  - [net-next,v2,05/11] net: stmmac: platform: provide stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/3d5bf75d76ea
  - [net-next,v2,06/11] net: stmmac: dwmac-generic: use stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/0a68a59493e0
  - [net-next,v2,07/11] net: stmmac: platform: provide stmmac_pltfr_remove_no_dt()
    https://git.kernel.org/netdev/net-next/c/1be0c9d65e17
  - [net-next,v2,08/11] net: stmmac: platform: provide devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/d74065427374
  - [net-next,v2,09/11] net: stmmac: dwmac-qco-ethqos: use devm_stmmac_probe_config_dt()
    https://git.kernel.org/netdev/net-next/c/061425d933ef
  - [net-next,v2,10/11] net: stmmac: platform: provide devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/fc9ee2ac4f9c
  - [net-next,v2,11/11] net: stmmac: dwmac-qcom-ethqos: use devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/4194f32a4b2b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
