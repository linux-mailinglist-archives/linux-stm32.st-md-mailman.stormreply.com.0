Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E14A1479F
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2025 02:40:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5330C78F80;
	Fri, 17 Jan 2025 01:40:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A557CC78F7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 01:40:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2C2C5C60BB;
 Fri, 17 Jan 2025 01:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079B4C4CED6;
 Fri, 17 Jan 2025 01:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737078010;
 bh=nUDkxS+SGF5HsEiC9K3lpphe6D0MmMbjsns/C57QoOA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=t4Lwg1q08IwDzcCM3K+0chPwYs1wTXYjeypEtV2YcfEhdETnhRlSAmurTALOmHnBS
 R77blJDNzrHegRhLVCCDuoXUqeAq2csQt0xx/kEj5Ovn7RALPe6M5NLpZqUBdgXr9G
 lapL2Vb6+Zw28lAGQxO60RFgsPhQ/a6d1haPXSxWiuBoyVjRkMA6rDMcC6qOADFbUF
 19usKybJhWNMosmDHStEWxsrWO4j5nVS/ueGSaogdMOXdquT/BHnsm6qLPYalct3UQ
 i0Dz4bhHKy6UZpJAvVPPRgNrCoWLZ3cYTRcX3BzBXe//jBSfdVxm3RjyYAKjvYqxIH
 HOK00wjfH06Eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E66380AA63; Fri, 17 Jan 2025 01:40:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173707803298.1652211.8068749856450177077.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jan 2025 01:40:32 +0000
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
In-Reply-To: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, UNGLinuxDriver@microchip.com,
 bryan.whitehead@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: add phylink managed EEE
	support
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

On Wed, 15 Jan 2025 20:42:28 +0000 you wrote:
> Hi,
> 
> Adding managed EEE support to phylink has been on the cards ever since
> the idea in phylib was mooted. This overly large series attempts to do
> so. I've included all the patches as it's important to get the driver
> patches out there.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: mdio: add definition for clock stop capable bit
    https://git.kernel.org/netdev/net-next/c/3ba0262a8fed
  - [net-next,2/9] net: phy: add support for querying PHY clock stop capability
    https://git.kernel.org/netdev/net-next/c/a00e0d34c036
  - [net-next,3/9] net: phylink: add phylink_link_is_up() helper
    https://git.kernel.org/netdev/net-next/c/a17ceec62f81
  - [net-next,4/9] net: phylink: add EEE management
    https://git.kernel.org/netdev/net-next/c/03abf2a7c654
  - [net-next,5/9] net: mvneta: convert to phylink EEE implementation
    https://git.kernel.org/netdev/net-next/c/ac79927dc84f
  - [net-next,6/9] net: mvpp2: add EEE implementation
    https://git.kernel.org/netdev/net-next/c/b53b14786ed8
  - [net-next,7/9] net: lan743x: use netdev in lan743x_phylink_mac_link_down()
    https://git.kernel.org/netdev/net-next/c/a66447966f03
  - [net-next,8/9] net: lan743x: convert to phylink managed EEE
    https://git.kernel.org/netdev/net-next/c/bd691d5ca918
  - [net-next,9/9] net: stmmac: convert to phylink managed EEE support
    https://git.kernel.org/netdev/net-next/c/4218647d4556

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
