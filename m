Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E97AE0F9B
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jun 2025 00:29:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DC1CC3089D;
	Thu, 19 Jun 2025 22:29:47 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5778DC30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 22:29:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8AF18A52A96;
 Thu, 19 Jun 2025 22:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BADC4CEEA;
 Thu, 19 Jun 2025 22:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750372184;
 bh=uE1h3VBCq9FkWTRsFDM4zWbkP/DJUBaz2aRme8X4Zcg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Qpoing9+7HNARwvNmhkAEPndGAgl3F0B9yk/yLR2qdZvw7rhrSoc5ImniCmLgKv0Z
 014KsUD2lTwV0cmovedpd1DOQ1UM+dZHvqB2zpWnAv+RCvnmzs8kbUsDvdLTdw/u7I
 IS5mfpRuU+ZlmkpXWvl1HHY4FlPGgVruoPPhB/cJNrQW86Afynf1dBpWysqil5f9di
 X/ddP6M33PcmWVQHf+unpRQxhfSLI6xBDyc9pxng58P4empGzMaDqsvFVFx5vJ8skm
 +3KhEml66/T+/+TvGzFRpuUg05d3TTbaRYknFLxmV4b1Dl74IJKDLQ2Wiv8lGSj/3k
 FesZDO0UOzs6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70F8D38111DD; Thu, 19 Jun 2025 22:30:13 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175037221224.1006270.683992000903480141.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jun 2025 22:30:12 +0000
References: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: replace ioaddr with
 stmmac_priv for pcs_set_ane() method
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Jun 2025 12:05:12 +0100 you wrote:
> Pass the stmmac_priv structure into the pcs_set_ane() MAC method rather
> than having callers dereferencing this structure for the IO address.
> 
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c    | 6 +++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c       | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/hwif.h              | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c    | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: replace ioaddr with stmmac_priv for pcs_set_ane() method
    https://git.kernel.org/netdev/net-next/c/c8e32755ba2b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
