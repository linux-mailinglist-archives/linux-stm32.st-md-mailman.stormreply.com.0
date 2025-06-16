Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E9ADBC9F
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jun 2025 00:10:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39A26C32E8D;
	Mon, 16 Jun 2025 22:10:12 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E543AC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 22:10:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C71C0A51F54;
 Mon, 16 Jun 2025 22:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BD9C4CEEE;
 Mon, 16 Jun 2025 22:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750111809;
 bh=BMyJEqIXakUu8Q/coxq6kmO0L2hveQX8mNILFSh4PbA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jbgP+hzOemklZH/U/OZ92sg+8eipjkq6+P+29+RCAk8JWiX9BkK75uXwPSY7uj4wm
 FzuRjW85xJhtppKC7oGCqEkh0nPq8bNX86HjvnZVxRZU+gaQGx3JEcfZSvxmLDS/Qt
 Q7Jtt0jD9aPsKR6NGRee0/kwUhuokf6NYT6gcD8u4QZoZfV29/4n+W3N5tJzu4Lz4v
 xvF9RlyTRdIuRGBNWOheZ3UAw/FGvvOUgv99QCxxBioU+GiBXun02mO1L+z9kp1M3f
 gHzUnN2lEq06LnJKAPbENWAqM7U579ZRG5QFaBcmQEo0rI+fbU7HOLta5x836fXUWf
 RFx5fHfEOBeYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D6A38111D8; Mon, 16 Jun 2025 22:10:39 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175011183824.2530350.4880030632930663714.git-patchwork-notify@kernel.org>
Date: Mon, 16 Jun 2025 22:10:38 +0000
References: <E1uPkbT-004EyG-OQ@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uPkbT-004EyG-OQ@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: remove
	pcs_get_adv_lp() support
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

On Thu, 12 Jun 2025 17:16:35 +0100 you wrote:
> It appears that the GMAC_ANE_ADV and GMAC_ANE_LPA registers are only
> available for TBI and RTBI PHY interfaces. In commit 482b3c3ba757
> ("net: stmmac: Drop TBI/RTBI PCS flags") support for these was dropped,
> and thus it no longer makes sense to access these registers.
> 
> Remove the *_get_adv_lp() functions, and the now redundant struct
> rgmii_adv and STMMAC_PCS_* definitions.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: remove pcs_get_adv_lp() support
    https://git.kernel.org/netdev/net-next/c/883af78926c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
