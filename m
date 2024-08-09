Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBDC94CF3C
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 13:10:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08D12C7801E;
	Fri,  9 Aug 2024 11:10:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D7D8CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 11:10:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B835616B9;
 Fri,  9 Aug 2024 11:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBC8C32782;
 Fri,  9 Aug 2024 11:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723201832;
 bh=A8pQsQ6di4rD9L/EtXjxtoFGHujFl5v3FeWshS2LU6o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Z50ORPdgrK5Py2zz2Sxk1PQx+Pfk661LL1zGqRGUSzpi2lyFVM8UehEQ/CaFYzRVG
 hHIpaN7XNgpTG/GnFWXYbM36ZJZ6ZacyA0minomXvXA8uu3XQHP5Va0bFk81rW2iIi
 p/QMx51gAKVKlK31E4giBgQ69XciQV3Jsb2t9ryGQ0JvQRR5YjpJbaxNIJxYdMFFgk
 JciulCeQ3XHJfQfnyExiwl2gdEX0SIlj+AaK9Z31Bo0gepYR2Gp8nCM2gWrJIXYb1S
 0QPpqjvyBlzo2lAmFJlXyeV3SGRy2mWF6y6UtYgm/ZuVRQxP9jtIPwsAW0/4HqPXrR
 wzuvkMZ0D95cA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33CDF382333D; Fri,  9 Aug 2024 11:10:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172320183099.3757285.11855803483879000767.git-patchwork-notify@kernel.org>
Date: Fri, 09 Aug 2024 11:10:30 +0000
References: <20240806-xgmac-const-char-arrays-v1-1-8d91ec885d45@kernel.org>
In-Reply-To: <20240806-xgmac-const-char-arrays-v1-1-8d91ec885d45@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, jirislaby@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: xgmac: use const
 char arrays for string constants
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
by David S. Miller <davem@davemloft.net>:

On Tue, 06 Aug 2024 11:52:01 +0100 you wrote:
> Jiri Slaby advises me that the preferred mechanism for declaring
> string constants is static char arrays, so use that here.
> 
> This mostly reverts
> commit 1692b9775e74 ("net: stmmac: xgmac: use #define for string constants")
> 
> That commit was a fix for
> commit 46eba193d04f ("net: stmmac: xgmac: fix handling of DPP safety error for DMA channels").
> The fix being replacing const char * with #defines in order to address
> compilation failures observed on GCC 6 through 10.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: xgmac: use const char arrays for string constants
    https://git.kernel.org/netdev/net-next/c/36fb51479e3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
