Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F3BA6E4A5
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 21:50:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09870C78F65;
	Mon, 24 Mar 2025 20:50:10 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15787C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 20:50:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 007CEA4A522;
 Mon, 24 Mar 2025 20:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBADEC4CEDD;
 Mon, 24 Mar 2025 20:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742849407;
 bh=+ou0UbncUs03M6sufG6N3xTDsMBOOlOxZOY7cw8WuOw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fCJ47wN1+6+QohEGuqVMAAGxKIxnmr77Sz6Lx5TpDQX+4kl3ZcS1W7ZYR/KIoIGWo
 Qc8FVEBTEFp6FlYB2AD6znBsWXDAaXtUFFk5R3uR+6JkMMmX4g4i4NLr+W2gdhH0Ru
 NEsIkcdrUlbQnoKgCWLs8vPaqCf3BsqbqniTpdR/N9eD42A+8wwOQf1fMZ7a3JoJZn
 /s/G3/AYQEorFapa+7V9PwohFTJ7lDuuN6AME9/Pm8+9Tj8LjsK1XguSvqJ6S3cnLB
 Eh5/USzW7nZ1GAW88iH8WPMX0ThF8XUUcodgNHmIaoOXLE/HoYgrMw1Lz6CS63qFja
 stHr7WqJHlzLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33F0E380664D; Mon, 24 Mar 2025 20:50:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174284944375.4167801.10275229682419761555.git-patchwork-notify@kernel.org>
Date: Mon, 24 Mar 2025 20:50:43 +0000
References: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Call
 xpcs_config_eee_mult_fact() only when xpcs is present
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

On Fri, 21 Mar 2025 11:35:01 +0100 you wrote:
> Some dwmac variants such as dwmac_socfpga don't use xpcs but lynx_pcs.
> 
> Don't call xpcs_config_eee_mult_fact() in this case, as this causes a
> crash at init :
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 00000039 when write
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: Call xpcs_config_eee_mult_fact() only when xpcs is present
    https://git.kernel.org/netdev/net-next/c/53cd6820f5a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
