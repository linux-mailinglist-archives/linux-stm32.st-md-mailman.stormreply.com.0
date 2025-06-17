Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A005ADDF68
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 01:10:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1289FC3087A;
	Tue, 17 Jun 2025 23:10:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5E5DC32EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jun 2025 23:10:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 55C01439B8;
 Tue, 17 Jun 2025 23:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328ACC4CEED;
 Tue, 17 Jun 2025 23:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750201813;
 bh=NLmZbAINQrKpTqQpqNfxPgtqEb0sB7XeT47yiorXI6w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MeY+/BRnKSJtQIpfkUgm5S90dpg8BaAd3E9/X4zxA9F3zdFVm0v82Low6gsBPBOHe
 iFFOjUJp1giTMHEe0SPayfjJOKYUIxYagHv0n+AAF2ilgYK90TtH9zlfBog6ugcEP4
 WGcwTuQGzAKLT2wW8gItRfMw2MulwZU5f0u1o+1KwDaGyGvmel+8JA6h0vXVDdI8gk
 l9MlsvBi9aRk9Ja+hujhrKFI28BcH+xjVLN2PqAHEsl+vVZhgrIub71qvkzsxR9Jo8
 O87Frd6uUIw9izt1Omd0Md27fdFbmaeiOWUrV/l5WX85U49iWn+A4vTD0mJzoCV/eV
 HsEiOX7K/5QfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAEB638111DD; Tue, 17 Jun 2025 23:10:42 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175020184173.3730251.3213755803607439009.git-patchwork-notify@kernel.org>
Date: Tue, 17 Jun 2025 23:10:41 +0000
References: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
In-Reply-To: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: rk: more
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

On Mon, 16 Jun 2025 11:16:18 +0100 you wrote:
> Hi,
> 
> Another couple of cleanups removing pointless code.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Here is the summary with links:
  - [net-next,1/3] net: stmmac: rk: fix code formmating issue
    https://git.kernel.org/netdev/net-next/c/a44769c97e9a
  - [net-next,2/3] net: stmmac: rk: use device rather than platform device in rk_priv_data
    https://git.kernel.org/netdev/net-next/c/8f6503993911
  - [net-next,3/3] net: stmmac: rk: remove unnecessary clk_mac
    https://git.kernel.org/netdev/net-next/c/cf283fd6b8be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
