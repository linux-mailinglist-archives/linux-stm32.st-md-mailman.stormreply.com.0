Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAFCAD996E
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 03:30:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4525FC36B3F;
	Sat, 14 Jun 2025 01:30:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 698CAC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 01:30:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5377A4AB6B;
 Sat, 14 Jun 2025 01:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3502AC4CEED;
 Sat, 14 Jun 2025 01:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749864617;
 bh=QIV+0F7UZEbXQVCCIS9fHsBk/4g/yEoVPJWLkDhWNBo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Qqtu94yfZ2DfHot5pwD3vPDL5d2cNUN1FDRalN7UwtNAXuBHTNxbibyfZriuRde1A
 EsW/+NPfQgMmzB6g+H0d5iOD5ahWTLUhy2eUXXJzfbhxgTj4DChuj5CY/+/MpQb2Kd
 YSyuzt540/ABCkexn4DGgJ0mibZEmpVVnJUT2/oHhENZ8f3ULqRF6qhDzfA/CgOsI/
 gqMmb/TQU0n/YTBBhq/nfYoXgTYD+Gs7mcM7LRxFtOCXsqcAJN8Ck8bZInSsSohsNp
 /FAoYZkYmr1jHlkY5azzPPwvX3VuyLsfYxMj2RVIh52WuwCcyJQVARi2D5oRkrGpl8
 N2tqyQ2apoWaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAF1C380AAD0; Sat, 14 Jun 2025 01:30:47 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174986464674.950968.7803319715888152554.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jun 2025 01:30:46 +0000
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: rk: much needed
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

On Thu, 12 Jun 2025 16:40:54 +0100 you wrote:
> Hi,
> 
> This series starts attacking the reams of fairly identical duplicated
> code in dwmac-rk. Every new SoC that comes along seems to need more
> code added to this file because e.g. the way the clock is controlled
> is different in every SoC.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: stmmac: rk: add get_interfaces() implementation
    https://git.kernel.org/netdev/net-next/c/1f59e30403a7
  - [net-next,2/9] net: stmmac: rk: simplify set_*_speed()
    https://git.kernel.org/netdev/net-next/c/e6e9e837d312
  - [net-next,3/9] net: stmmac: rk: add struct for programming register based speeds
    https://git.kernel.org/netdev/net-next/c/3de607d13b6b
  - [net-next,4/9] net: stmmac: rk: combine rv1126 set_*_speed() methods
    https://git.kernel.org/netdev/net-next/c/29f0aca13914
  - [net-next,5/9] net: stmmac: rk: combine clk_mac_speed rate setting functions
    https://git.kernel.org/netdev/net-next/c/d8d6096f8161
  - [net-next,6/9] net: stmmac: rk: combine .set_*_speed() methods
    https://git.kernel.org/netdev/net-next/c/3930c2cca657
  - [net-next,7/9] net: stmmac: rk: simplify px30_set_rmii_speed()
    https://git.kernel.org/netdev/net-next/c/c5cddcdbd2af
  - [net-next,8/9] net: stmmac: rk: convert px30_set_rmii_speed() to .set_speed()
    https://git.kernel.org/netdev/net-next/c/9165487d21a4
  - [net-next,9/9] net: stmmac: rk: remove obsolete .set_*_speed() methods
    https://git.kernel.org/netdev/net-next/c/0f3a079786ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
