Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B03AC08890
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 04:11:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F19E1C5F1F4;
	Sat, 25 Oct 2025 02:10:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D4C3C57B73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 02:10:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B138A4523F;
 Sat, 25 Oct 2025 02:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B53EC4CEF1;
 Sat, 25 Oct 2025 02:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761358256;
 bh=mCPoHtHlO0sapP4Re17dwckEUzpCJ4F8z89uuFCqu0Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=X0je+6y5nPpzgYupq5+dgtahZgIOJb4dskI1lP7bde+T/WckmlVpgTqkILW09L0Rq
 7n9N/R1wa1FdVfWAZ/tIEwQTFSJQsqXZCod1rLnlkb1vMBhf1Wnl2hFrR9lHJJfZIc
 CyqnNCtO4IWnqMRQ1hg2y+fCBHfLSW7RDdTlQOmKdQ/Kg0Gxr85zHETe1FntPypm6a
 RwEWB5FB83QYKBdtuYVr7x3xqxinK3FU06vXvgdyVQa4mF9EwNh2ilcU5YcwFSoIsa
 ThuNMXV8dH8jM6HJWodq3JKt9Onfj4HYw27Pr8T/CzLWcH9iVBg1rEY78pVHz4Q9lE
 TCHbZegaMf1mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70DAB380AA59; Sat, 25 Oct 2025 02:10:37 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176135823625.4124588.6828085723534144457.git-patchwork-notify@kernel.org>
Date: Sat, 25 Oct 2025 02:10:36 +0000
References: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
In-Reply-To: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: pcs support
	part 2
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

On Thu, 23 Oct 2025 10:46:09 +0100 you wrote:
> Hi,
> 
> This is the next part of stmmac PCS support. Not much here, other than
> dealing with what remains of the interrupts, which are the PCS AN
> complete and PCS Link interrupts, which are just cleared and update
> accounting.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: add stmmac_mac_irq_modify()
    https://git.kernel.org/netdev/net-next/c/442a8c68f083
  - [net-next,2/2] net: stmmac: add support for controlling PCS interrupts
    https://git.kernel.org/netdev/net-next/c/eed68edac508

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
