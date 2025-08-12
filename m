Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5818B21B88
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 05:20:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 786BAC32EA8;
	Tue, 12 Aug 2025 03:20:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA52FC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 03:20:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 634B85C6596;
 Tue, 12 Aug 2025 03:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E46C4CEED;
 Tue, 12 Aug 2025 03:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754968803;
 bh=RWpIXohTMH+rLKlU0Q9IIWKlNizcxyUtaCMlb8/X/T8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rqFUv+h5p7BXqG3wQRl3h/371b7LINHtZlFCII5AQOTSMSulDHuS4n8THBqaQcYTA
 l9D02iS++8PHE1T5DXed3WzUWVTkFwHgx6SxKbFBNLTtuwhQOyVriEhttuZqpPJdmv
 F23LAkqJgDr14mkenFPkbGXYo+bNxbtBsUcWek5DL1xXDFOOlv5zqpoWMYMIM4qmmR
 ou0iSlbKjKvG81PohbYBpSpBkJZbYC1Ld2xc0NZtGNtYjauu3MpJtBvh4e5w+NIb+R
 cZ7N/WScjyocPXu0D1fk4X2FJ4n6LOhSUMR35+dqyfoSB/IDtUHVmFX6DvZI5zP9tw
 4wA6cUelkgrUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C04383BF51; Tue, 12 Aug 2025 03:20:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175496881499.1990527.15915957162598750086.git-patchwork-notify@kernel.org>
Date: Tue, 12 Aug 2025 03:20:14 +0000
References: <E1ukM1X-0086qu-Td@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1ukM1X-0086qu-Td@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jonathanh@nvidia.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, treding@nvidia.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwc-qos: fix clk
 prepare/enable leak on probe failure
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 08 Aug 2025 13:16:39 +0100 you wrote:
> dwc_eth_dwmac_probe() gets bulk clocks, and then prepares and enables
> them. Unfortunately, if dwc_eth_dwmac_config_dt() or stmmac_dvr_probe()
> fail, we leave the clocks prepared and enabled. Fix this by using
> devm_clk_bulk_get_all_enabled() to combine the steps and provide devm
> based release of the prepare and enable state.
> 
> This also fixes a similar leakin dwc_eth_dwmac_remove() which wasn't
> correctly retrieving the struct plat_stmmacenet_data. This becomes
> unnecessary.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: dwc-qos: fix clk prepare/enable leak on probe failure
    https://git.kernel.org/netdev/net/c/89886abd0734

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
