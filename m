Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5D1A3CFE2
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 04:10:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9415AC78F9C;
	Thu, 20 Feb 2025 03:10:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A45CC78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 03:10:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 564595C5D4B;
 Thu, 20 Feb 2025 03:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298CEC4CED1;
 Thu, 20 Feb 2025 03:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740021014;
 bh=pD8ROzU5v7v1zdafWRXLtlZbryQ4ts3yYyJZ3srYQyg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=G2oaMXVKsFb+JmWdJyesdE7HFJck9SKKH6+yl1iffdn7Jn4KoKlMyY5tsuvzOoKfl
 OsGvNE+vA6UPc8O9po9+irs/OY7dLy3a2YC1sEwltFWfEwFy9IylUSo+hsyDTe6Bmi
 HLsOqePxhNr53LF6jAyzP6+YTdameuuAUsJkDqKhWjSuJmtZvtsSdnp5NVZo7BiCzy
 bpPtC4jh3fChd4AXeeA2BTYgwMFz0iyO/oxtKLkEux9FsKW5pJCA9McLZ9gELXtsTD
 RWeVMDNzJmuWDYCyhdWyVIUUPKPDe28OJVUyO2WsK3cFb4y2B9QZ/cxj7s8EPlHxS+
 ozc6TvNglFVaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAFAA380AAEC; Thu, 20 Feb 2025 03:10:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174002104449.825980.800457478148266618.git-patchwork-notify@kernel.org>
Date: Thu, 20 Feb 2025 03:10:44 +0000
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
In-Reply-To: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: imx@lists.linux.dev, s32@nxp.com, kernel@esmil.dk, edumazet@google.com,
 guoren@kernel.org, linux-riscv@lists.infradead.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 nobuhiro1.iwamatsu@toshiba.co.jp, samuel@sholland.org, khilman@baylibre.com,
 jernej.skrabec@gmail.com, wens@csie.org, drew@pdp7.com, kuba@kernel.org,
 pabeni@redhat.com, linux-sunxi@lists.linux.dev, kernel@pengutronix.de,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, jan.petrous@oss.nxp.com, minda.chen@starfivetech.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 vkoul@kernel.org, mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 davem@davemloft.net, wefu@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: further cleanups
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

On Tue, 18 Feb 2025 10:24:25 +0000 you wrote:
> Hi,
> 
> This small series does further cleanups to the stmmac driver:
> 
> 1. Name priv->pause to indicate that it's a timeout and clarify the
> units of the "pause" module parameter
> 2. Remove useless priv->flow_ctrl member and deprecate the useless
> "flow_ctrl" module parameter
> 3. Fix long-standing signed-ness issue with "speed" passed around the
> driver from the mac_link_up method.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: clarify priv->pause and pause module parameter
    https://git.kernel.org/netdev/net-next/c/ff1a9b2e311f
  - [net-next,2/3] net: stmmac: remove useless priv->flow_ctrl
    https://git.kernel.org/netdev/net-next/c/bc9d75b0aaed
  - [net-next,3/3] net: stmmac: "speed" passed to fix_mac_speed is an int
    https://git.kernel.org/netdev/net-next/c/ac9a8587edc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
