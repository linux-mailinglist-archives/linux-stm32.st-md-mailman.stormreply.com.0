Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1CC589C1
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 17:10:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AF8EC628D4;
	Thu, 13 Nov 2025 16:10:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2F72C628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 16:10:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E102600C4;
 Thu, 13 Nov 2025 16:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D50DC4CEF1;
 Thu, 13 Nov 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763050239;
 bh=ar/J7la8s0fj40xp4GiCiAlJdslTGn7uYA1smJ+0H1o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=n/iCAXXKC7XSO7b+UMgqZqQ2tnpepOXebi5CtmTlP+jqmaup8o9CUv2mjUFSGCso+
 nRaA/IwsE5JfZHKODj+imNGnNtYI4lO3kfKrO8KbmtG1AS2N4LQhd2zu2Y3SuykQC+
 VcbGhyeuk3jlas72rsmW2QCi0C/wEO87EygXOK/h4CyzbwQTr6mqwlNiRQpKafU6uK
 fQ0sBofZBox0zMJGG6M6X1Obnb2fYeI/0Wc+xpbR09R6Eo2tomZBuXBaqkzXl6KtRU
 uSXIfP2khZbjfJLF7LlpaTOuG1PKzbHHy35tiSm7YDOkBXfGD/xY+7AhijyRBxvMy5
 5SkiaGAtzFWBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADDD9380DBD2; Thu, 13 Nov 2025 16:10:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176305020851.908070.9331102777618461950.git-patchwork-notify@kernel.org>
Date: Thu, 13 Nov 2025 16:10:08 +0000
References: <E1vImWF-0000000DrIr-1fmn@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vImWF-0000000DrIr-1fmn@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: clean up
	stmmac_reset()
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 11 Nov 2025 11:26:39 +0000 you wrote:
> stmmac_reset() takes the stmmac_priv and an ioaddr. It has one call
> site, which passes the priv pointer, and dereferences priv for the
> ioaddr.
> 
> stmmac_reset() then checks whether priv is NULL. If it was, the caller
> would have oopsed. Remove the checks for NULL, and move the dereference
> for ioaddr into stmmac_reset().
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: clean up stmmac_reset()
    https://git.kernel.org/netdev/net-next/c/d0af55df5a78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
