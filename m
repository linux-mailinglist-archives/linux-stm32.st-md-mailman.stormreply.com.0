Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D19715541
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 08:04:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC6B1C6A61A;
	Tue, 30 May 2023 06:04:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FD8EC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 05:00:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9770462A35;
 Tue, 30 May 2023 05:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DECDEC433D2;
 Tue, 30 May 2023 05:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685422822;
 bh=TxoAKQUpaSTUcWD6k5DOKp6LeV3n0eo7papce8MsvHw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ECiwvDDE3EeGZ16Qw6v0DrO25JZW6C6Gc+ghpw04YHV2vSRcpBThiPi6i+Eks4RRn
 d5V0YR9iUZVtt+cPUqZM3ncvWEEwLgfUBxbIttbP2t4weD/5wslWomeYx6mQoJ+obm
 KyALYqZOij3tKj/XCnzoA7Hwa+GFkB+S8lVY3PMacOZlHMhoUWcHCDR5xiPkcByjDx
 28p/9s1FbX1vWbVl0PpmE02vwD4y18RYPtwcgKXGcVNtbBuYqQXdWTWC5dQJ/oPnIT
 MPoOEhyr//M0+sl3WF8/M/cvLrpHBvPoLZN+PaVm0fB8ZocIgw33BCVdKKRZxMVFLN
 oPDWbaQfwFNMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B0A08E52BF4; Tue, 30 May 2023 05:00:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168542282171.21395.3855041574885674177.git-patchwork-notify@kernel.org>
Date: Tue, 30 May 2023 05:00:21 +0000
References: <ZHCGZ8IgAAwr8bla@shell.armlinux.org.uk>
In-Reply-To: <ZHCGZ8IgAAwr8bla@shell.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Tue, 30 May 2023 06:04:19 +0000
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, simon.horman@corigine.com,
 edumazet@google.com, ioana.ciornei@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 joabreu@synopsys.com, vladimir.oltean@nxp.com, kuba@kernel.org,
 pabeni@redhat.com, Jose.Abreu@synopsys.com, claudiu.manoil@nxp.com,
 jiawenwu@trustnetic.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, davem@davemloft.net,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: pcs: add helpers to
 xpcs and lynx to manage mdiodev
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

On Fri, 26 May 2023 11:13:59 +0100 you wrote:
> Hi,
> 
> This morning, we have had two instances where the destruction of the
> MDIO device associated with XPCS and Lynx has been wrong. Rather than
> allowing this pattern of errors to continue, let's make it easier for
> driver authors to get this right by adding a helper.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: mdio: add mdio_device_get() and mdio_device_put()
    https://git.kernel.org/netdev/net-next/c/c4933fa88a68
  - [net-next,2/6] net: pcs: xpcs: add xpcs_create_mdiodev()
    https://git.kernel.org/netdev/net-next/c/9a5d500cffdb
  - [net-next,3/6] net: stmmac: use xpcs_create_mdiodev()
    https://git.kernel.org/netdev/net-next/c/727e373f897d
  - [net-next,4/6] net: pcs: lynx: add lynx_pcs_create_mdiodev()
    https://git.kernel.org/netdev/net-next/c/86b5f2d8cd78
  - [net-next,5/6] net: dsa: ocelot: use lynx_pcs_create_mdiodev()
    https://git.kernel.org/netdev/net-next/c/5767c6a8d9b7
  - [net-next,6/6] net: enetc: use lynx_pcs_create_mdiodev()
    https://git.kernel.org/netdev/net-next/c/b7d5d0438e01

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
