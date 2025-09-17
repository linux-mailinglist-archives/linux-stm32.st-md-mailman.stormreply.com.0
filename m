Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD644B82282
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 00:30:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57E55C32EA8;
	Wed, 17 Sep 2025 22:30:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3909DC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 22:30:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E04374050A;
 Wed, 17 Sep 2025 22:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE635C4CEE7;
 Wed, 17 Sep 2025 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758148206;
 bh=s76GbDrYFwwZwSum2VWjLTNSOLDqXR0ee9PKdLqdIN4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XTF+07cY9h6ulIkYEmSAadUHSirIAkCR8PdSvFN1oItDmlNlxKzY+kznsK77kbpFE
 BN1YJFtQ6eGSftAWvNzyYAEnBRlE0bEMhx91x/tm5D6MfP72y7vPB0B/M49qZrgSmX
 XOVTqEYu5g7KbyvgnV1JbFjn2WVl8IqNrgIAqYSuN6Firz9MpGdPKhwbB42bik2GTM
 jsch48DbkuV4HnJeV4OtZuIE2LgVxFI+D7+HI0olM7xXbyjkGeQst1hhMqTvs9LCH7
 kGlq57ypU2AErDcAWg2ta4F74R6tI1v8bSCS050Vne2FjYx8PXe9LeTETfj8iU6WUA
 DqpLpcLGV++kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70CCB39D0C28; Wed, 17 Sep 2025 22:30:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175814820725.2170568.16324588910347581106.git-patchwork-notify@kernel.org>
Date: Wed, 17 Sep 2025 22:30:07 +0000
References: <0A3F1D1604FEE424+20250916012628.1819-1-kernel@airkyi.com>
In-Reply-To: <0A3F1D1604FEE424+20250916012628.1819-1-kernel@airkyi.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: linux-kernel@vger.kernel.org, ziyao@disroot.org, jonas@kwiboo.se,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 sebastian.reichel@collabora.com, linux-rockchip@lists.infradead.org,
 andrew+netdev@lunn.ch, edumazet@google.com, chaoyi.chen@rock-chips.com,
 mcoquelin.stm32@gmail.com, david.wu@rock-chips.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] Revert "net: ethernet: stmmac:
 dwmac-rk: Make the clk_phy could be used for external phy"
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

On Tue, 16 Sep 2025 09:26:28 +0800 you wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This reverts commit da114122b83149d1f1db0586b1d67947b651aa20.
> 
> As discussed, the PHY clock should be managed by PHY driver instead
> of other driver like dwmac-rk.
> 
> [...]

Here is the summary with links:
  - [net-next] Revert "net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy"
    https://git.kernel.org/netdev/net-next/c/a09655dde754

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
