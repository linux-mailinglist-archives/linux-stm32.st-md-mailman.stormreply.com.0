Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C24B49EB4
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 03:30:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F05CC36B38;
	Tue,  9 Sep 2025 01:30:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F407C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 01:30:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E97444B27;
 Tue,  9 Sep 2025 01:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBE7C4CEF1;
 Tue,  9 Sep 2025 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757381433;
 bh=LW/aTIf77jl0JmfF2/xesj80TUgUyZIZrteGn5xgTdY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=N2LmF253IP2fFjntS60H1EYz6n0oEhQ5SgNReZZZmm3iqr6QI3hTSvNSk5bBn87IN
 Nm7e6KWeH/dJMvr3InUPJE5nIKSenKb2OPVhh1h7OHDKEoKGmVWSJZcdEbfSic/Frt
 fbCSclpBOXPLrO/ExMrE8fSwyZTVCbcGgWh2j/15/JOz934kzuyl9l0jBRAi/8MdNN
 nb6Twcs4Ic29o2KgYjuNrkaWHbPQu7nNRzfJu7c4lmFYu/3MCnaBPME07q1IqL/c+A
 +90B59i+nRriO0ExgWvZJpS3ql/ZedNtYlLNoswTgajTIPSPz+i4G/p9OGTKjaRu7d
 15DhRXbwi0YiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C8F383BF69; Tue,  9 Sep 2025 01:30:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175738143698.108077.11508219910437568266.git-patchwork-notify@kernel.org>
Date: Tue, 09 Sep 2025 01:30:36 +0000
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
In-Reply-To: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/11] net: stmmac: mdio
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

On Thu, 4 Sep 2025 13:10:42 +0100 you wrote:
> On Wed, Sep 03, 2025 at 01:38:57PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> Clean up the stmmac MDIO code:
> - provide an address register formatter to avoid repeated code
> - provide a common function to wait for the busy bit to clear
> - pre-compute the CR field (mdio clock divider)
> - move address formatter into read/write functions
> - combine the read/write functions into a common accessor function
> - move runtime PM handling into common accessor function
> - rename register constants to better reflect manufacturer names
> - move stmmac_clk_csr_set() into stmmac_mdio
> - make stmmac_clk_csr_set() return the CR field value and remove
>   priv->clk_csr
> - clean up if() range tests in stmmac_clk_csr_set()
> - use STMMAC_CSR_xxx definitions in initialisers
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/11] net: stmmac: mdio: provide address register formatter
    https://git.kernel.org/netdev/net-next/c/16e03235d51b
  - [net-next,v2,02/11] net: stmmac: mdio: provide stmmac_mdio_wait()
    https://git.kernel.org/netdev/net-next/c/9eb633ad1d69
  - [net-next,v2,03/11] net: stmmac: mdio: provide priv->gmii_address_bus_config
    https://git.kernel.org/netdev/net-next/c/6717746f33ab
  - [net-next,v2,04/11] net: stmmac: mdio: move stmmac_mdio_format_addr() into read/write
    https://git.kernel.org/netdev/net-next/c/6cb3d67ad624
  - [net-next,v2,05/11] net: stmmac: mdio: merge stmmac_mdio_read() and stmmac_mdio_write()
    https://git.kernel.org/netdev/net-next/c/9b0ed33a4256
  - [net-next,v2,06/11] net: stmmac: mdio: move runtime PM into stmmac_mdio_access()
    https://git.kernel.org/netdev/net-next/c/9b88194a3b68
  - [net-next,v2,07/11] net: stmmac: mdio: improve mdio register field definitions
    https://git.kernel.org/netdev/net-next/c/3581acbb789a
  - [net-next,v2,08/11] net: stmmac: mdio: move initialisation of priv->clk_csr to stmmac_mdio
    https://git.kernel.org/netdev/net-next/c/661a868937a1
  - [net-next,v2,09/11] net: stmmac: mdio: return clk_csr value from stmmac_clk_csr_set()
    https://git.kernel.org/netdev/net-next/c/231e2b016fb2
  - [net-next,v2,10/11] net: stmmac: mdio: remove redundant clock rate tests
    https://git.kernel.org/netdev/net-next/c/78c91bec8fb9
  - [net-next,v2,11/11] net: stmmac: use STMMAC_CSR_xxx definitions in platform glue
    https://git.kernel.org/netdev/net-next/c/fc8f62c827ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
