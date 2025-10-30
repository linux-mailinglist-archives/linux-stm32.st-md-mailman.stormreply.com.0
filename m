Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C2C1DE98
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 01:30:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D11AFC62D64;
	Thu, 30 Oct 2025 00:30:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CA2BC62D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 00:30:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 088DD6033C;
 Thu, 30 Oct 2025 00:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B48C4CEF7;
 Thu, 30 Oct 2025 00:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761784239;
 bh=tQIruejwpKTnBaTSE8KgQ617sg7pjgA/bUfxzMS/3Mc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=K8kd55vjC1NG01Kdeh4jGuJmG/xyIbES63tC9TUeBMt2tYQTLzYa6MU4RACwGJ5mH
 7p6TaqzbMBhEG7JjyKuKkrYnU2kdwhKedaSUD644XDpbHMwMDX2yMndmJIiQr4BQBO
 JgwtKIRdypeKmf3V//RP/Jr+HxdVtDiyGfuxyg9dtoXLDhklqjAlkJegHPzPFeeZmc
 izDHIMn/QUtwD36ei0NengCxMAsJcO+T40YnfHTQ+JLIWVsBpxH9h43N9Vo16Wt7So
 AKQO6crKRES5HRK+wvofPWa2+bzZ30Q36TU9EU5WJpC6++NAGOkwd6cYPNuvzcwNcX
 WWlf6AFEBWosw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB1953A55EC7; Thu, 30 Oct 2025 00:30:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176178421675.3262354.14278133392680967130.git-patchwork-notify@kernel.org>
Date: Thu, 30 Oct 2025 00:30:16 +0000
References: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
In-Reply-To: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/8] net: stmmac: hwif.c
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

On Wed, 29 Oct 2025 00:01:25 +0000 you wrote:
> Hi,
> 
> This series cleans up hwif.c:
> 
> - move the reading of the version information out of stmmac_hwif_init()
>   into its own function, stmmac_get_version(), storing the result in a
>   new struct.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/8] net: stmmac: move version handling into own function
    https://git.kernel.org/netdev/net-next/c/fc18b6e98cce
  - [net-next,v3,2/8] net: stmmac: simplify stmmac_get_version()
    https://git.kernel.org/netdev/net-next/c/f49838f77cf6
  - [net-next,v3,3/8] net: stmmac: consolidate version reading and validation
    https://git.kernel.org/netdev/net-next/c/c36b97e4ca77
  - [net-next,v3,4/8] net: stmmac: move stmmac_get_*id() into stmmac_get_version()
    https://git.kernel.org/netdev/net-next/c/7b2e41fff76f
  - [net-next,v3,5/8] net: stmmac: use FIELD_GET() for version register
    https://git.kernel.org/netdev/net-next/c/b2fe9e29b5f6
  - [net-next,v3,6/8] net: stmmac: provide function to lookup hwif
    https://git.kernel.org/netdev/net-next/c/7b510ea8e58e
  - [net-next,v3,7/8] net: stmmac: use != rather than ^ for comparing dev_id
    https://git.kernel.org/netdev/net-next/c/f9326b139b4c
  - [net-next,v3,8/8] net: stmmac: reorganise stmmac_hwif_init()
    https://git.kernel.org/netdev/net-next/c/6436f408eb21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
