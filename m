Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05DA55C34
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 01:50:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FFB0C78F8B;
	Fri,  7 Mar 2025 00:50:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A15CC78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 00:50:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3FB075C569F;
 Fri,  7 Mar 2025 00:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42C9C4CEE5;
 Fri,  7 Mar 2025 00:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741308606;
 bh=5E7QrRtVE031fm+0oQBlEfIWLHzTajXqxBcwX74S8Q4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=frIgPf6wI9fVxTERiWPafyss4uNcBrf+ieJqOGr/EklkxPj8AM+kQ+DlxgC4qnXxK
 F32IvEiXGrSp7TH99vvRvJ83UoD2CQgUwoBld7Gs1nrNQS53jO+MBJhoir1dhh/XKT
 6y7BHdLmtpl9X9y6rfM1T/f5uC3japAQ267W0fkIysS3yGBP0W4BsYQLB9ItFZN2RS
 pzG/9Uzc3Urxk5Fo2wxHUJi33DxXsWRvtzLGZhrFkJOmGfzQ003C/Tv+6xBBze5dPG
 xMRI3t3jSd4oAFITDWyqjdzrqBmO4zd0/J7pZo4NPKI9+iTsQPP3N/rdknhgpomLAi
 3xOBZ8PEp+dZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70BD1380CFF6; Fri,  7 Mar 2025 00:50:41 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174130864025.1835493.2395705293072394933.git-patchwork-notify@kernel.org>
Date: Fri, 07 Mar 2025 00:50:40 +0000
References: <E1tpswi-005U6C-Py@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tpswi-005U6C-Py@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 john.fastabend@gmail.com, ast@kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: avoid shadowing
	global buf_sz
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

On Wed, 05 Mar 2025 17:54:16 +0000 you wrote:
> stmmac_rx() declares a local variable named "buf_sz" but there is also
> a global variable for a module parameter which is called the same. To
> avoid confusion, rename the local variable.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: avoid shadowing global buf_sz
    https://git.kernel.org/netdev/net-next/c/876cfb20e889

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
