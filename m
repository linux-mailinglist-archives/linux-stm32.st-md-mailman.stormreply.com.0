Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D048E923
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 12:30:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D2DFC5F1F5;
	Fri, 14 Jan 2022 11:30:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2683EC5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 11:30:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96375B825C7;
 Fri, 14 Jan 2022 11:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96872C36AEC;
 Fri, 14 Jan 2022 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642159810;
 bh=iv/QOvqC9qyOc3SjCNDYCNqSP2ggbWCYneFvulLQWxU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KPaPzLdhx70hl13pH+duFJ6n1hyfe8GkTm2aPHupCMzKUd2NO2AKWeYlBiipnJ6nb
 o7+0SBH8cmFsGwuNhCS2i5y9Pko/E4zdyzdRdflCKGfZqwicNCwIZJYRmYxnTRpjiT
 1WOTDtjb7bHUsjbgj1nfWe2y8v6v1uq70J+HpV/14HdEH/nHW5eSje9j5U9ThVWyBN
 F9/PtdLHXAr8PVdGItqm7V4yd1qExjaPxnP8nCzW9hhb+4vLk98YdgMfaK0xLWCaFT
 rmTneiUahxV+8FpJKM8ZFVIjemqY0SRRcEzTZZ5Tz5+2MPSeUzN4MoXvw1uEfDmlPy
 t146DtBccTnvg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6FAD6F60799; Fri, 14 Jan 2022 11:30:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164215981045.30922.3548719266097575473.git-patchwork-notify@kernel.org>
Date: Fri, 14 Jan 2022 11:30:10 +0000
References: <20220114071430.1335872-1-kai.heng.feng@canonical.com>
In-Reply-To: <20220114071430.1335872-1-kai.heng.feng@canonical.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix "Unbalanced
	pm_runtime_enable!" warning
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 14 Jan 2022 15:14:30 +0800 you wrote:
> If the device is PCI based like intel-eth-pci, pm_runtime_enable() is
> already called by pci_pm_init().
> 
> So only pm_runtime_enable() when it's not already enabled.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: Fix "Unbalanced pm_runtime_enable!" warning
    https://git.kernel.org/netdev/net/c/d90d0c175cf2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
