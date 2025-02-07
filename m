Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA1FA2CDA7
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 21:10:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07DF6C78025;
	Fri,  7 Feb 2025 20:10:18 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37DC3C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 20:10:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4A67DA43BDF;
 Fri,  7 Feb 2025 20:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB72FC4CED6;
 Fri,  7 Feb 2025 20:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738959009;
 bh=Rb6tOrngBKFH/uFi5jXEWLdvU2cKpJWevMKs0KTRLUs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jT6w/IUsDCfqAGE1rHixJpsbEIHsyac3G88pcgDVqhXoqbFDrA1nkLKZ8ExpVE13r
 Li6qq/Y7u12Tes8DnkPUqsTKQKfzQJjQjNcszTkWnjRwbZLiYwtJoCDpEVrqix/+KY
 MhzZzvc2bBkQtNCqstWeFWeZvK3MdmsnjjrfBUZ0Bnm5B1ClGLh9tpFfCoh9Tw1MYL
 /2QXkBfzA90nL66vXWQEyegL2bRju/KvIfgjaITLMhptU4uAgsFmKoqBpuUFrTzrjb
 AH9oPm3OAsKj43AdhK0j2BTCkeB7v22MA+0z+VYugZP0tXkmbl+EtpN9486RKWgCk3
 yhKI1qqmAYuFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAEAA380AAF4; Fri,  7 Feb 2025 20:10:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173895903778.2367164.15308538342588355637.git-patchwork-notify@kernel.org>
Date: Fri, 07 Feb 2025 20:10:37 +0000
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/14] net: stmmac: yet more EEE
	updates
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

On Wed, 5 Feb 2025 13:39:38 +0000 you wrote:
> Hi,
> 
> Continuing on with the STMMAC EEE cleanups from last cycle, this series
> further cleans up the EEE code, and fixes a problem with the existing
> implementation - disabling EEE doesn't immediately disable LPI
> signalling until the next packet is transmitted. It likely also fixes
> a potential race condition when trying to disable LPI vs the software
> timer.
> 
> [...]

Here is the summary with links:
  - [net-next,01/14] net: stmmac: delete software timer before disabling LPI
    https://git.kernel.org/netdev/net-next/c/a923378ab0c4
  - [net-next,02/14] net: stmmac: ensure LPI is disabled when disabling EEE
    https://git.kernel.org/netdev/net-next/c/64c9936330cc
  - [net-next,03/14] net: stmmac: dwmac4: ensure LPIATE is cleared
    https://git.kernel.org/netdev/net-next/c/6e9c71ee65eb
  - [net-next,04/14] net: stmmac: split stmmac_init_eee() and move to phylink methods
    https://git.kernel.org/netdev/net-next/c/cc3f4d5508c8
  - [net-next,05/14] net: stmmac: remove priv->dma_cap.eee test in tx_lpi methods
    https://git.kernel.org/netdev/net-next/c/4abd57687355
  - [net-next,06/14] net: stmmac: remove unnecessary priv->eee_active tests
    https://git.kernel.org/netdev/net-next/c/2cc8e6d30895
  - [net-next,07/14] net: stmmac: remove unnecessary priv->eee_enabled tests
    https://git.kernel.org/netdev/net-next/c/faafe39c77fb
  - [net-next,08/14] net: stmmac: clear priv->tx_path_in_lpi_mode when disabling LPI
    https://git.kernel.org/netdev/net-next/c/54f85e5221c3
  - [net-next,09/14] net: stmmac: remove unnecessary LPI disable when enabling LPI
    https://git.kernel.org/netdev/net-next/c/9b6649a81075
  - [net-next,10/14] net: stmmac: use common LPI_CTRL_STATUS bit definitions
    https://git.kernel.org/netdev/net-next/c/6e37877d222d
  - [net-next,11/14] net: stmmac: add new MAC method set_lpi_mode()
    https://git.kernel.org/netdev/net-next/c/395c92c0fe3e
  - [net-next,12/14] net: stmmac: dwmac4: clear LPI_CTRL_STATUS_LPITCSE too
    https://git.kernel.org/netdev/net-next/c/a323ed92e40e
  - [net-next,13/14] net: stmmac: use stmmac_set_lpi_mode()
    https://git.kernel.org/netdev/net-next/c/305a0f68cfbf
  - [net-next,14/14] net: stmmac: remove old EEE methods
    https://git.kernel.org/netdev/net-next/c/62b0a039cac2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
