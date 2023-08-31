Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2608F78E473
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Aug 2023 03:40:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF105C6B442;
	Thu, 31 Aug 2023 01:40:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C950C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 01:40:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08C4F62B1B;
 Thu, 31 Aug 2023 01:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B727C433C7;
 Thu, 31 Aug 2023 01:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693446024;
 bh=CfO8wrM4aM6M3RP9MbA+9BROze+UyQ1O3OHXFA3gX+Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Rl1CP6RbGd2Xa+qYNKI1SDCaSC6qzCWZSG8lqCy3Om69Im2JTTTHljTWt0OccxsK3
 pH+EDI9vTEhpHPBQhcJS7YFiBR87Ws3r/6Ju3nj1fTchxcShm81SeKLmRfJw5Xk+xp
 2QF9pWnfJsrpqxgMZsKbfRH8QyPdPftuAvA/gyzS4bO/IDcqV6y2HJfNJxrUq4TeaP
 pghI+Nk+dP5gtUMMxyMHIe23UJFhv53W2EahCoai9Iuzejz2rctoLl0zelVrhvp3S3
 rjVA5CxLBiKdbZb6QZd29CCAbuostuJaVndL5XEfRUMfzK8lsD9oQVGlWyauY/omBE
 KORkOxKG54aoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3D989E29F34; Thu, 31 Aug 2023 01:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169344602424.11127.17956246580456140435.git-patchwork-notify@kernel.org>
Date: Thu, 31 Aug 2023 01:40:24 +0000
References: <E1qayn0-006Q8J-GE@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1qayn0-006Q8J-GE@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: failure to probe
 without MAC interface specified
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

On Tue, 29 Aug 2023 14:29:50 +0100 you wrote:
> Alexander Stein reports that commit a014c35556b9 ("net: stmmac: clarify
> difference between "interface" and "phy_interface"") caused breakage,
> because plat->mac_interface will never be negative. Fix this by using
> the "rc" temporary variable in stmmac_probe_config_dt().
> 
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: failure to probe without MAC interface specified
    https://git.kernel.org/netdev/net/c/b5947239bfa6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
