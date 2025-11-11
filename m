Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D19C4AC46
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 02:41:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0DA2C5A4C4;
	Tue, 11 Nov 2025 01:40:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00054C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 01:40:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E1B54377A;
 Tue, 11 Nov 2025 01:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760D7C4CEFB;
 Tue, 11 Nov 2025 01:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762825257;
 bh=5fszHu+0NCe/j4FS6aCuGypK1jI8uEB60+HhsE1RoDM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ej5vH736g5NaLrNiPp3r8PZLRcIYOfQLNlEfvnPDfkI9IJSISWOA2ekr+xdlF31Zi
 9q5eoncrecK2zUGqVCWk3wVGtGHpnT4Vip7PtoPpWJe5wAHbbCk7XA7X1ZfQyADUxa
 3P851l+s5FAlKV4VLYc5MOgQ5AfQM8jvPiX9mpw3dyetXLvzToiApKSzGPIDDpNwaL
 l4h8BrAH8vSWPg3038O2LY0Nh49YFze0jWmJnaS5M/DnfFt1QpIMtUNfTEQSCavqab
 7IiuRqTmE/WO5aA3+vtoLgRRzMdfREkNVy6vR7+LkyHxW3WQQxVBRDwOfn15DF17h1
 FbvZ2F3a1dqmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33E2E380CFD7; Tue, 11 Nov 2025 01:40:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176282522801.2843765.16848615144063968700.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 01:40:28 +0000
References: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
In-Reply-To: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 00/11] net: stmmac: ingenic:
 convert to set_phy_intf_sel()
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

On Fri, 7 Nov 2025 08:27:44 +0000 you wrote:
> Convert ingenic to use the new ->set_phy_intf_sel() method that was
> recently introduced in net-next.
> 
> This is the largest of the conversions, as there is scope for cleanups
> along with the conversion.
> 
> v2: fix build warnings in patch 9 by rearranging the code
> v3: fix smatch warning in patch 11, added Maxime's r-b.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/11] net: stmmac: ingenic: move ingenic_mac_init()
    https://git.kernel.org/netdev/net-next/c/2dd63c364534
  - [net-next,v3,02/11] net: stmmac: ingenic: simplify jz4775 mac_set_mode()
    https://git.kernel.org/netdev/net-next/c/307a575775fd
  - [net-next,v3,03/11] net: stmmac: ingenic: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/da6e9fd1046f
  - [net-next,v3,04/11] net: stmmac: ingenic: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/dbf99dc7d166
  - [net-next,v3,05/11] net: stmmac: ingenic: prep PHY_INTF_SEL_x field after switch()
    https://git.kernel.org/netdev/net-next/c/14497aaa5eb6
  - [net-next,v3,06/11] net: stmmac: ingenic: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/0e2fa91c55c0
  - [net-next,v3,07/11] net: stmmac: ingenic: move "MAC PHY control register" debug
    https://git.kernel.org/netdev/net-next/c/35147b5c9e41
  - [net-next,v3,08/11] net: stmmac: ingenic: simplify mac_set_mode() methods
    https://git.kernel.org/netdev/net-next/c/608975d4d791
  - [net-next,v3,09/11] net: stmmac: ingenic: simplify x2000 mac_set_mode()
    https://git.kernel.org/netdev/net-next/c/2284cca0bced
  - [net-next,v3,10/11] net: stmmac: ingenic: pass ingenic_mac struct rather than plat_dat
    https://git.kernel.org/netdev/net-next/c/9352f74fd13d
  - [net-next,v3,11/11] net: stmmac: ingenic: use ->set_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/34bf68a69122

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
