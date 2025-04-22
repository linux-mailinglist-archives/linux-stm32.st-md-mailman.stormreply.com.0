Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B991EA963A8
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 11:10:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ADC4C78F68;
	Tue, 22 Apr 2025 09:10:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2CF6C78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 09:10:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 03758614AC;
 Tue, 22 Apr 2025 09:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F1CC4CEEB;
 Tue, 22 Apr 2025 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745313015;
 bh=dvvqu9VLExHyZ9ZpJuxQQarkDv+LB3yDV1x4fu+Cwlc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=iTJ9QcxT0so1Db8Fy7lsZ7VDn5rmlNLNMyPTXCQhzwqnPsuEuaKlHRvtyyXrnYKrI
 Tg3qXRKEqsZi4Pckz0IVQTEE0QGdcR+Ho/vJdrIbudtBzCezXagstworTNHwykUn6p
 p2n74qpUWvMwrgN7dKbjaTPQ+z28jdgibIyE7/A2HW5aYddYwzX26fmqJiFWx1tB4v
 4C5BbI5z7gdnIHLfzVGdeKeXuJh8so6HGHxzLhkIHu+nKehq8TdxtREv4IO3owMo75
 b6CoGfNHZ4L8viOzbGn+0Lf1ge0jj9hCXP9aQHt0EuELl1P5SXzOSAEnUoA3Cu992+
 U9AdTmBZa8NAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BFF39D6546; Tue, 22 Apr 2025 09:10:55 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174531305373.1477965.16027981733032970963.git-patchwork-notify@kernel.org>
Date: Tue, 22 Apr 2025 09:10:53 +0000
References: <aAE2tKlImhwKySq_@shell.armlinux.org.uk>
In-Reply-To: <aAE2tKlImhwKySq_@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/5] net: stmmac: socfpga: fix
 init ordering and cleanups
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

On Thu, 17 Apr 2025 18:13:24 +0100 you wrote:
> Hi,
> 
> This series fixes the init ordering of the socfpga probe function.
> The standard rule is to do all setup before publishing any device,
> and socfpga violates that. I can see no reason for this, but these
> patches have not been tested on hardware.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] net: stmmac: socfpga: init dwmac->stmmac_rst before registration
    https://git.kernel.org/netdev/net-next/c/9276bfc2df92
  - [net-next,v3,2/5] net: stmmac: socfpga: provide init function
    https://git.kernel.org/netdev/net-next/c/0dbd4a6f57c2
  - [net-next,v3,3/5] net: stmmac: socfpga: convert to stmmac_pltfr_pm_ops
    https://git.kernel.org/netdev/net-next/c/6bf70d999aa9
  - [net-next,v3,4/5] net: stmmac: socfpga: call set_phy_mode() before registration
    https://git.kernel.org/netdev/net-next/c/91255347bba9
  - [net-next,v3,5/5] net: stmmac: socfpga: convert to devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/1dbefd578d8b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
