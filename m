Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E1ADDFA9
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 01:30:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70E51C3087A;
	Tue, 17 Jun 2025 23:30:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CFE9C32EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jun 2025 23:30:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDCBB4351C;
 Tue, 17 Jun 2025 23:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF843C4CEE3;
 Tue, 17 Jun 2025 23:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750203024;
 bh=tcMHWk4FkgjU/bW20uI6112m4lCsw+x2BSh1ZhtUv2w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lwGoNx2HcdoFIqXfNx2lyArccnRGQvr9Cbvt01sXr/oLXvauWbaCk71QzAFv9YQMz
 fbtEU3kqLl3nno0scsgd/MYZ+kqIEJei7DwVEl3y2jj2BCF+elOaPWF9OVtY2bWbdF
 eYHJu1VFJ3Z3EivQdMmBS9b0K9Ky+1yvhx6llYBuY009Jwhh/cDwkaDz8qOmDdEGJk
 LKsfeABU/tnIP0x0k2eNWjZQnPNYTgdh8y6RYevgF8MWavZrcAFy6utYFb90s1EJ/o
 NPW0I3dBICjMhLJZm9C1/CevHnSth/DGZuFbwl3oj/7G7SUFJRdZWUnScmMdda7RX0
 4FFDgoecp44/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D2E38111DD; Tue, 17 Jun 2025 23:30:54 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175020305298.3735715.14567227448478806213.git-patchwork-notify@kernel.org>
Date: Tue, 17 Jun 2025 23:30:52 +0000
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
In-Reply-To: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/4] nte: stmmac: visconti:
	cleanups
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

On Mon, 16 Jun 2025 22:05:41 +0100 you wrote:
> Hi,
> 
> A short series of cleanups to the visconti dwmac glue.
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   | 129 ++++++++++++---------
>  1 file changed, 74 insertions(+), 55 deletions(-)

Here is the summary with links:
  - [net-next,1/4] net: stmmac: visconti: re-arrange speed decode
    https://git.kernel.org/netdev/net-next/c/7d7525876b5a
  - [net-next,2/4] net: stmmac: visconti: reorganise visconti_eth_set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/1923c6c3a8b7
  - [net-next,3/4] net: stmmac: visconti: clean up code formatting
    https://git.kernel.org/netdev/net-next/c/1a3a638d2d23
  - [net-next,4/4] net: stmmac: visconti: make phy_intf_sel local
    https://git.kernel.org/netdev/net-next/c/d54d42a41b65

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
