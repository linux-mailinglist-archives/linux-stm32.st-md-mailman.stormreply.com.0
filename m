Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12811A367C7
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 22:50:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9706DC78F65;
	Fri, 14 Feb 2025 21:50:18 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85DA1C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 21:50:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 57720A44BAE;
 Fri, 14 Feb 2025 21:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398C2C4CED1;
 Fri, 14 Feb 2025 21:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739569810;
 bh=z1h2wB2bK+0PVbZBqeWldkozYIvTn5nsgGbyj9aRZYY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DkPZa+0Us/PS8WiwvVjjlaCwyWXc39w7PpXtnVy9xncj1wibdPRNJVqFI3npd32Du
 xM7CjMfqg0sR8iPN8guuzGZR3U2mvHbeJqJOHVB3HjuDHi2wrmB0dXDBxG1f5S6F2+
 77jm573zI+itiQ/I7q1YxWW5NTB1TiH+B+bAt3tBIywq2hi5zSh7yoxxoT2YetENRS
 qtLCuayVtgTVWr7IOwrdKWQAsxdXKDLf9ks3xGGejmcf3q8Z7Pwea4NnxzQJcOexQb
 B0k0quSPRodsnc575vpREpeK5pv+kfKAzUyV9bVyTSKbXgU8AcBmKeqQgW16Qs4mhO
 kSd+tlqPxtY6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB3C2380CEE8; Fri, 14 Feb 2025 21:50:40 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173956983949.2115208.7960791375454243091.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 21:50:39 +0000
References: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
In-Reply-To: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: phylink, xpcs,
 stmmac: support PCS EEE configuration
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

On Mon, 10 Feb 2025 10:52:56 +0000 you wrote:
> Hi,
> 
> This series adds support for phylink managed EEE at the PCS level,
> allowing xpcs_config_eee() to be removed. Sadly, we still end up with
> a XPCS specific function to configure the clock multiplier.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 --
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  2 +
>  drivers/net/pcs/pcs-xpcs.c                        | 89 +++++++++++++++--------
>  drivers/net/pcs/pcs-xpcs.h                        |  1 +
>  drivers/net/phy/phylink.c                         | 25 ++++++-
>  include/linux/pcs/pcs-xpcs.h                      |  3 +-
>  include/linux/phylink.h                           | 22 ++++++
>  7 files changed, 107 insertions(+), 42 deletions(-)

Here is the summary with links:
  - [net-next,1/8] net: phylink: add support for notifying PCS about EEE
    https://git.kernel.org/netdev/net-next/c/e9f03a6a879b
  - [net-next,2/8] net: xpcs: add function to configure EEE clock multiplying factor
    https://git.kernel.org/netdev/net-next/c/8c841486674a
  - [net-next,3/8] net: stmmac: call xpcs_config_eee_mult_fact()
    https://git.kernel.org/netdev/net-next/c/060fb27060e8
  - [net-next,4/8] net: xpcs: convert to phylink managed EEE
    https://git.kernel.org/netdev/net-next/c/5a12b2cf29c1
  - [net-next,5/8] net: stmmac: remove calls to xpcs_config_eee()
    https://git.kernel.org/netdev/net-next/c/dba7441b3916
  - [net-next,6/8] net: xpcs: remove xpcs_config_eee() from global scope
    https://git.kernel.org/netdev/net-next/c/55faeb89968a
  - [net-next,7/8] net: xpcs: clean up xpcs_config_eee()
    https://git.kernel.org/netdev/net-next/c/760320145a5a
  - [net-next,8/8] net: xpcs: group EEE code together
    https://git.kernel.org/netdev/net-next/c/1d4c99a1ac12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
