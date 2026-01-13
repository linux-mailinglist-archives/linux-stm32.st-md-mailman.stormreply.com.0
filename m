Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114AD16896
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 04:43:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F25C57B41;
	Tue, 13 Jan 2026 03:43:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 733FAC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 03:43:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4EDBC60055;
 Tue, 13 Jan 2026 03:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D9CC16AAE;
 Tue, 13 Jan 2026 03:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768275822;
 bh=1x0HV4CNdWNSF88xgwpmrzDRD5SQUGzjfVFk6VnyTH4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oae5OM2XV2Fs0m81Zf2oWR3PoGCMRnlvt4bkQwoXeyFUrfdKKjJwhmvCU1dg3EUpf
 /uGiWbthMfLHmkHWEEA6773EQOJG58wsrWLvmzE/dBM7wfh9UiQuVe3NjGIqzcs+Xz
 M+ExGVgbhDhIKWag221NXTrLaKROj/J9+/qh3XRGqjgZeEiI2k7GTPGI8aBNMPV+zl
 IUM1FI8a/k7q/VruSlUdb9cHWmLzlAU7IFg3+R5UvZtjEAQ8ElTcZvez9EVVSdI9T3
 WPWwseXUp6Y0x+NSl0QoC0/zZbZ6kGVDr1OO29M8Dd8KF0viRRvuPKqbYF0qs9fP+U
 KMsafm3RZOPxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F2A37380CFE5; Tue, 13 Jan 2026 03:40:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176827561577.1661897.15750852366703896309.git-patchwork-notify@kernel.org>
Date: Tue, 13 Jan 2026 03:40:15 +0000
References: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
In-Reply-To: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: pcs: clean up
 pcs interrupt handling
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

On Sun, 11 Jan 2026 13:14:33 +0000 you wrote:
> Hi,
> 
> Clean up the stmmac PCS interrupt handling:
> 
> - Avoid promotion to unsigned long from unsigned int by defining PCS
>   register bits/fields using u32 macros.
> - Pass struct stmmac_priv into the host_irq_status MAC core method.
> - Move the existing PCS interrupt handler (dwmac_pcs_isr) into
>   stmmac_pcs.c, change it's arguments, use dev_info() rather than
>   pr_info()
> - arrange to call phylink_pcs_change() on link state changes.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: stmmac: use BIT_U32() and GENMASK_U32() for PCS registers
    https://git.kernel.org/netdev/net-next/c/a2745a99ca4e
  - [net-next,2/5] net: stmmac: move and rename dwmac_pcs_isr()
    https://git.kernel.org/netdev/net-next/c/879070eb4cf7
  - [net-next,3/5] net: stmmac: pass struct stmmac_priv to host_irq_status() method
    https://git.kernel.org/netdev/net-next/c/aa9061269215
  - [net-next,4/5] net: stmmac: change arguments to PCS handler and use dev_info()
    https://git.kernel.org/netdev/net-next/c/52f37fd9f4dc
  - [net-next,5/5] net: stmmac: report PCS link changes to phylink
    https://git.kernel.org/netdev/net-next/c/ce24299b5b77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
