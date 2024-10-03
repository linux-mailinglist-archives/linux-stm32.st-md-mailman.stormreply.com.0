Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EF298E7D3
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 02:40:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95418C78023;
	Thu,  3 Oct 2024 00:40:55 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12007C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2024 00:40:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ABFC5A4261A;
 Thu,  3 Oct 2024 00:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3B6C4CEC2;
 Thu,  3 Oct 2024 00:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727916046;
 bh=i/FMF02enEnePUBhsRhePuABn3dvoRaPyTeUzcX7aLs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=u0a0JEJAG/opP7SPHOtwHERp/LfvG7SafcO8cSj0+oT18tUtfqa236cRLZaTWH+Th
 pSHMFN73OPxEhfhCfo2kh9Dbtal3YpzvYhEnhIeTItgaZWJjfcR22mzbfoxd07NqW5
 Sb6Uy+B/Jz/UwX6R9q8rnkXAioxXHR+bQVu+fcpdjLzg+ZoIA7DL6U1hKy+csR1fJp
 QmuWyszZF9q7wr7tYmBRXIKsl0qBF63odie5pm7GosO6dIN9TstlYzYK/75cB26c/4
 T06M2eZjVHIGvwhA4DX+aTd58RnuZCay7QSS7c0a5I47xYfcFg2yairgw0SlbpZc7N
 28d76c5x56/JA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33CD0380DBD1; Thu,  3 Oct 2024 00:40:51 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172791604974.1387504.2549279838290764330.git-patchwork-notify@kernel.org>
Date: Thu, 03 Oct 2024 00:40:49 +0000
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
In-Reply-To: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, pabeni@redhat.com, netdev@vger.kernel.org,
 joabreu@synopsys.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, jiawenwu@trustnetic.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, mengyuanlou@net-swift.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 00/10] net: pcs: xpcs: cleanups
	batch 1
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

On Tue, 1 Oct 2024 17:02:48 +0100 you wrote:
> Hi,
> 
> First, sorry for the bland series subject - this is the first in a
> number of cleanup series to the XPCS driver. This series has some
> functional changes beyond merely cleanups, notably the first patch.
> 
> This series starts off with a patch that moves the PCS reset from
> the xpcs_create*() family of calls to when phylink first configures
> the PHY. The motivation for this change is to get rid of the
> interface argument to the xpcs_create*() functions, which I see as
> unnecessary complexity. This patch should be tested on Wangxun
> and STMMAC drivers.
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: pcs: xpcs: move PCS reset to .pcs_pre_config()
    https://git.kernel.org/netdev/net-next/c/277b339c4ba5
  - [net-next,02/10] net: pcs: xpcs: drop interface argument from internal functions
    https://git.kernel.org/netdev/net-next/c/92fb8986083a
  - [net-next,03/10] net: pcs: xpcs: get rid of xpcs_init_iface()
    https://git.kernel.org/netdev/net-next/c/a487c9e7cfc4
  - [net-next,04/10] net: pcs: xpcs: add xpcs_destroy_pcs() and xpcs_create_pcs_mdiodev()
    https://git.kernel.org/netdev/net-next/c/bedea1539acb
  - [net-next,05/10] net: wangxun: txgbe: use phylink_pcs internally
    https://git.kernel.org/netdev/net-next/c/155c499ffd1d
  - [net-next,06/10] net: dsa: sja1105: simplify static configuration reload
    https://git.kernel.org/netdev/net-next/c/a18891b55703
  - [net-next,07/10] net: dsa: sja1105: call PCS config/link_up via pcs_ops structure
    https://git.kernel.org/netdev/net-next/c/907476c66d73
  - [net-next,08/10] net: dsa: sja1105: use phylink_pcs internally
    https://git.kernel.org/netdev/net-next/c/41bf58314b17
  - [net-next,09/10] net: pcs: xpcs: drop interface argument from xpcs_create*()
    https://git.kernel.org/netdev/net-next/c/bf5a61645bb2
  - [net-next,10/10] net: pcs: xpcs: make xpcs_do_config() and xpcs_link_up() internal
    https://git.kernel.org/netdev/net-next/c/faefc9730d07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
