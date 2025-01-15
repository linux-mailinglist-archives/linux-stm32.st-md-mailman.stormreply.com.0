Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7222A11778
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 03:50:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A252C78F74;
	Wed, 15 Jan 2025 02:50:20 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0594C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 02:50:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9FC6BA416E6;
 Wed, 15 Jan 2025 02:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C91EC4CEDD;
 Wed, 15 Jan 2025 02:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736909412;
 bh=XZnxBk+FcFoHxx191qImvZNg7w+IyFMnBMHTXx6L5ZE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ro8Q5VSGF3ozPz8UtYtwIDdO3bUq+DZXh2zvyVFoMzBbsLYiAfm0Vhyg06qEZ6YAm
 hUU7XtQe6frBDOBahLq5YkoW0eCCXPnnQrKvt9HrlyJ7sADGmfRjJyL84Y7sVoDhEY
 xyeLkf5MwkMqaeLR2neatqE0uO95H+6LLQotiMElQEwL2hd20j4CxXyRxVq6b1CFhv
 1BDnko5EJzTjyqnD38D9cijquhOAfRudMIUk62JMZc55P0HJvHJCJ95c4bshAwlSYQ
 YWsmpNQDzQyrO8HcMLjOlVmpNMEoRPRe0QH71rBohz9nhmnTjuCtVBYevmCab+XFwS
 c5TgBbBqAT9Ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34A5F380AA5F; Wed, 15 Jan 2025 02:50:36 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173690943498.230797.5869251402223823826.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 02:50:34 +0000
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, ericwouds@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: further EEE
	cleanups (and one fix!)
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

On Mon, 13 Jan 2025 11:45:37 +0000 you wrote:
> Hi,
> 
> This series continues the EEE cleanup of the stmmac driver, and
> includes one fix.
> 
> As mentioned in the previous series, I wasn't entirely happy with the
> "stmmac_disable_sw_eee_mode" name, so the first patch renames this to
> "stmmac_stop_sw_lpi" instead, which I think better describes what this
> function is doing - stopping the transmit of the LPI state because we
> have a packet ot send.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: stmmac: rename stmmac_disable_sw_eee_mode()
    https://git.kernel.org/netdev/net-next/c/900782a029e5
  - [net-next,2/9] net: stmmac: correct priv->eee_sw_timer_en setting
    https://git.kernel.org/netdev/net-next/c/4fe09a0d64d5
  - [net-next,3/9] net: stmmac: simplify TX cleanup decision for ending sw LPI mode
    https://git.kernel.org/netdev/net-next/c/bfa9e131c9b2
  - [net-next,4/9] net: stmmac: check priv->eee_sw_timer_en in suspend path
    https://git.kernel.org/netdev/net-next/c/c920e6402523
  - [net-next,5/9] net: stmmac: add stmmac_try_to_start_sw_lpi()
    https://git.kernel.org/netdev/net-next/c/0cf44bd0c118
  - [net-next,6/9] net: stmmac: provide stmmac_eee_tx_busy()
    https://git.kernel.org/netdev/net-next/c/82f2025dda76
  - [net-next,7/9] net: stmmac: provide function for restarting sw LPI timer
    https://git.kernel.org/netdev/net-next/c/af5dc22bdb5f
  - [net-next,8/9] net: stmmac: combine stmmac_enable_eee_mode()
    https://git.kernel.org/netdev/net-next/c/ec8553673b1f
  - [net-next,9/9] net: stmmac: restart LPI timer after cleaning transmit descriptors
    https://git.kernel.org/netdev/net-next/c/d28e89244978

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
