Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0255EC273D1
	for <lists+linux-stm32@lfdr.de>; Sat, 01 Nov 2025 01:00:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DB97C5F1F9;
	Sat,  1 Nov 2025 00:00:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED598C5F1E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Nov 2025 00:00:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A0E4143D9D;
 Sat,  1 Nov 2025 00:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794E6C4CEE7;
 Sat,  1 Nov 2025 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761955230;
 bh=yk3VPIdVlbmUTYp0UAYa5Xrpps2+T2/IAQpUgIigqeA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DlPuYkCbIncnNePeguGMl9kzj+u6izK/5C0oaLQGiBK3DL2/xB0bwRL/KxOd334xB
 J2UoCVHBO26eF4h/Jf2MZWvGCjFYXJSM+GUow2OQSZIE/GDRgeCsA8f5/6btYStaWg
 eb93Mb0E+6IwAd1GhU2QUVLcutfsjkcz8sWmFJtsgyyUdbz5qQCiSqLus9gyt+6y5M
 DhsZIU0UiChHvN4+O9Zgrj7bPXbupDgBQV1MK1GXBzsRKthyxYE/rd3akpy5p1bWCq
 RBP5ckng562+aGygmINndgCrKwXS6xHRkKCYCakn7MeuROJiekrAHdoXX85q4SRrIt
 WKUx6mk4iYIhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE0153809A00; Sat,  1 Nov 2025 00:00:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176195520650.673072.17303889570192464247.git-patchwork-notify@kernel.org>
Date: Sat, 01 Nov 2025 00:00:06 +0000
References: <E1vEPlg-0000000CFHY-282A@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vEPlg-0000000CFHY-282A@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: qcom-ethqos:
 remove MAC_CTRL_REG modification
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 30 Oct 2025 10:20:32 +0000 you wrote:
> When operating in "SGMII" mode (Cisco SGMII or 2500BASE-X), qcom-ethqos
> modifies the MAC control register in its ethqos_configure_sgmii()
> function, which is only called from one path:
> 
> stmmac_mac_link_up()
> +- reads MAC_CTRL_REG
> +- masks out priv->hw->link.speed_mask
> +- sets bits according to speed (2500, 1000, 100, 10) from priv->hw.link.speed*
> +- ethqos_fix_mac_speed()
> |  +- qcom_ethqos_set_sgmii_loopback(false)
> |  +- ethqos_update_link_clk(speed)
> |  `- ethqos_configure(speed)
> |     `- ethqos_configure_sgmii(speed)
> |        +- reads MAC_CTRL_REG,
> |        +- configures PS/FES bits according to speed
> |        `- writes MAC_CTRL_REG as the last operation
> +- sets duplex bit(s)
> +- stmmac_mac_flow_ctrl()
> +- writes MAC_CTRL_REG if changed from original read
> ...
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG modification
    https://git.kernel.org/netdev/net-next/c/9b443e58a896

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
