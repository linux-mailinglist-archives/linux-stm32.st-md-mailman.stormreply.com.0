Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57467B376C3
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 03:20:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB65AC3F953;
	Wed, 27 Aug 2025 01:20:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 205BBC3F952
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 01:20:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CFB4D419EB;
 Wed, 27 Aug 2025 01:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8285C4CEF4;
 Wed, 27 Aug 2025 01:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756257602;
 bh=p+ihllgmoY+nsmIVwqerK8uRJ7BnZjZqB4wY9eVZWy4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FEHm7nRf0liNFVqr6IVBtN+Llmi1Z4YAbD2qMwydFCjWh2geKyAneXXuk17OyxvJ1
 Y9F9xSU0dGkd9F5z0plz08DKXmEIb++k1irI8ke+THqNR7W1RaztyC52sr4YAdtA9W
 qDiBV8d1/cY/xO8eL6qDHpHVmd1I1iUE4W351RuAUWhQeq3yUrgjza7ntOSKTd6IZo
 LEciZ8b7cmkoOK5wqKaHgFgXQAjsTJNKDEdiELdI3abqBkWwFeX/61lM++xTlA0R+/
 fG9SadpAePOC9negjclit5RgltKkOvfZljDJrvFB4AOyJCY8HDtkSDzDw7VnhsXjeb
 5pgK7pK2SKN1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D89383BF70; Wed, 27 Aug 2025 01:20:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175625761031.160020.12871390130445211831.git-patchwork-notify@kernel.org>
Date: Wed, 27 Aug 2025 01:20:10 +0000
References: <20250825-xgmac-minor-fixes-v3-0-c225fe4444c0@altera.com>
In-Reply-To: <20250825-xgmac-minor-fixes-v3-0-c225fe4444c0@altera.com>
To: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, linux-kernel@vger.kernel.org,
 romain.gantois@bootlin.com, netdev@vger.kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, boon.leong.ong@intel.com,
 kuba@kernel.org, pabeni@redhat.com, matthew.gerlach@altera.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 0/3] net: stmmac: xgmac: Minor fixes
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 25 Aug 2025 12:36:51 +0800 you wrote:
> This patch series includes following minor fixes for stmmac
> dwxgmac driver:
> 
>     1. Disable Rx FIFO overflow interrupt for dwxgmac
>     2. Correct supported speed modes for dwxgmac
>     3. Check for coe-unsupported flag before setting CIC bit of
>        Tx Desc3 in the AF_XDP flow
> 
> [...]

Here is the summary with links:
  - [net,v3,1/3] net: stmmac: xgmac: Do not enable RX FIFO Overflow interrupts
    https://git.kernel.org/netdev/net/c/4f23382841e6
  - [net,v3,2/3] net: stmmac: xgmac: Correct supported speed modes
    https://git.kernel.org/netdev/net/c/42ef11b2bff5
  - [net,v3,3/3] net: stmmac: Set CIC bit only for TX queues with COE
    https://git.kernel.org/netdev/net/c/b1eded580ab2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
