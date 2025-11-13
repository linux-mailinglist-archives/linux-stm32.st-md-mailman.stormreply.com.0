Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D2C589C5
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 17:10:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77D71C628D5;
	Thu, 13 Nov 2025 16:10:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B82A1C628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 16:10:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F063B604D1;
 Thu, 13 Nov 2025 16:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92349C19424;
 Thu, 13 Nov 2025 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763050240;
 bh=veR8/nbDtLvQOcg0BwdTy39yB/WVz1ADHJK/sjmFuRY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hZ/w9DlzOSe155fEEvNIKgEaJAfii5826P755bO5SGR6Inmfarl8sWNLaK8wVLJ3V
 6/nyyb+pM3M78fa3dtzU7kF7nZCviHQ8G66us/WC7nynQ72xVshcSPM1rNaY9+xRIB
 /GEx2457CxujiDZJ9/CUOp00QqjpXbtyMw3NC2QoHbkgyjRSH8Alipk9T/Tayy0tug
 gALnDJ+bd9H46n84MFtObcf3eW/tRH1qqszz/w7KiOmOEuEmdd+veSYp3CzwIoUe6T
 gkOiZG7kdYZd9X5rZ+oeRphjhl/ytJKrLMbWuT6r0RRx4szDetORNhN3cU2DLnhOrQ
 +mYyBnVCd/82A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAD9C380DBD2; Thu, 13 Nov 2025 16:10:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176305020974.908070.1045942084214006271.git-patchwork-notify@kernel.org>
Date: Thu, 13 Nov 2025 16:10:09 +0000
References: <E1vImWK-0000000DrIx-28vO@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vImWK-0000000DrIx-28vO@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, edumazet@google.com, samuel@sholland.org,
 netdev@vger.kernel.org, jernej.skrabec@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch, wens@csie.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 linux-sunxi@lists.linux.dev, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: always allocate
	mac_device_info
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 11 Nov 2025 11:26:44 +0000 you wrote:
> The ->setup() method implemented by dwmac-loongson and dwmac-sun8i
> allocate the mac_device_info structure, as does stmmac_hwif_init().
> This makes no sense.
> 
> Have stmmac_hwif_init() always allocate this structure, and pass it to
> the ->setup() method to initialise when it is provided. Rename this
> method to "mac_setup" to more accurately describe what it is doing.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: always allocate mac_device_info
    https://git.kernel.org/netdev/net-next/c/f694d215d340

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
