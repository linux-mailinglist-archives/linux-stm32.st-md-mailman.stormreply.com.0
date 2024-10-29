Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E918C9B4712
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 11:40:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93FE9C71290;
	Tue, 29 Oct 2024 10:40:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CE5DC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 10:40:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F8755C58E0;
 Tue, 29 Oct 2024 10:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3A9C4CEE3;
 Tue, 29 Oct 2024 10:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730198424;
 bh=GKQOic+Iow43xdBlnF2TJONS4WKrXxqdtwInlxWhQUs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JVYVQ2L//XHfQqT9rYVWZdJK4YWnkUdMRkHJP+H1nd01+Yilf8tQmUeI8ZV92SoXD
 NUjCpC2yxYENqspHMXVneu2J6vqfjChP1Kw7jB1P6tE5ZVgpp9qzH2u07cOKFt00ds
 nWOSkidF4goOnTMDiubY+NZr9FvONLa6fSapF4mE7kMzrOONK7FUX1lIddZVIi7h1m
 dIHvGXFP/aYGs3RCg5oGHbKcH20zu9aYhmVSns5Uf4z1/IriYHSno/NpRfN1JKjS9j
 dYupPKoPkjukp5C71nNmkf1hCFCvHJSrUaXkuVGiIY7cW2DSowwN6JYIFBZRRAZnmI
 hWiVhsIeTW//w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD1D380AC00; Tue, 29 Oct 2024 10:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173019843151.651132.13756275797117288059.git-patchwork-notify@kernel.org>
Date: Tue, 29 Oct 2024 10:40:31 +0000
References: <20241021061023.2162701-1-0x1207@gmail.com>
In-Reply-To: <20241021061023.2162701-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: quic_jsuraj@quicinc.com, davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced
 DMA map/unmap for non-paged SKB data
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 21 Oct 2024 14:10:23 +0800 you wrote:
> In case the non-paged data of a SKB carries protocol header and protocol
> payload to be transmitted on a certain platform that the DMA AXI address
> width is configured to 40-bit/48-bit, or the size of the non-paged data
> is bigger than TSO_MAX_BUFF_SIZE on a certain platform that the DMA AXI
> address width is configured to 32-bit, then this SKB requires at least
> two DMA transmit descriptors to serve it.
> 
> [...]

Here is the summary with links:
  - [net,v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap for non-paged SKB data
    https://git.kernel.org/netdev/net/c/66600fac7a98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
