Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9419C70257
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 17:40:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81292C36B3E;
	Wed, 19 Nov 2025 16:40:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 801D1C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 16:40:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4DD5F601F0;
 Wed, 19 Nov 2025 16:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECA6C113D0;
 Wed, 19 Nov 2025 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763570447;
 bh=iUjwqaammSlItw6iy0AGcOa7+3IBT44TGBC6u0+zcoQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BEBEeLg1vESjR0s8FUiMwIazpXhPwRquWGltWffJgUMmUC+O44PiandHyICVyMY4B
 vzRRi9opZ1ZEnFRqVqoT3iJiFATo2lBrPg8uu0xHOscWBA2DJidUHZC4VPFql8Sr5F
 YpXD8uHa3YVt6rbJuGILc4YUWbAmlBVNh07dK1nOEIL/CphqNtCVgQtcSHf/TF7V5k
 hjGVMLVu0fKb8nwBQNl0HqJ2pzxWz/elx0V+hc3g/0ycqvNcUC+8y0fUNkq1JBtebi
 IVVyerddZaXKA4OyOG09CP+3xTrs6qoybhIuDDDxwfUmoVeNe4eqonV1BndsNneo+b
 nLGDXSlNNm36Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB06239D0C22; Wed, 19 Nov 2025 16:40:13 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176357041250.873046.17131882776763838281.git-patchwork-notify@kernel.org>
Date: Wed, 19 Nov 2025 16:40:12 +0000
References: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
In-Reply-To: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: sanitise
	stmmac_is_jumbo_frm()
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

On Tue, 18 Nov 2025 10:00:08 +0000 you wrote:
> stmmac_is_jumbo_frm() takes skb->len, which is unsigned int, but the
> parameter is passed as an "int" and then tested using signed
> comparisons. This can cause bugs. Change the parameter to be unsigned.
> 
> Also arrange for it to return a bool.
> 
>  drivers/net/ethernet/stmicro/stmmac/chain_mode.c  | 9 ++++-----
>  drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/ring_mode.c   | 9 ++-------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>  4 files changed, 10 insertions(+), 16 deletions(-)

Here is the summary with links:
  - [net-next,1/2] net: stmmac: stmmac_is_jumbo_frm() len should be unsigned
    https://git.kernel.org/netdev/net-next/c/b5adada61e02
  - [net-next,2/2] net: stmmac: stmmac_is_jumbo_frm() returns boolean
    https://git.kernel.org/netdev/net-next/c/bf351bbec57f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
