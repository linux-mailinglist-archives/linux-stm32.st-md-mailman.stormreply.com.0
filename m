Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A58DED16474
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 03:30:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D25DC5A4CA;
	Tue, 13 Jan 2026 02:30:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2B4CC01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 02:30:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6B3A6443FA;
 Tue, 13 Jan 2026 02:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EBDC116D0;
 Tue, 13 Jan 2026 02:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768271434;
 bh=ykFPF5PfTurP6Wq683RO5rLVlwtTOfgUgkOw+O9Mh3s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fQEoT3phOQ5LmGcUFeuuh+77bkdrqi3yPAIXfuouf9aTd35aioNYUJOB/xkzG2C9Y
 E9hW5kVxXBSln5dBfJ+MI+dM42D6JBTXzUB1Kc09yUvSDNAGtZd5OoQV4rUGAvujow
 L6Ssbupn5SjChziAai1ZzkCGhFZixJ+2Y0Pi/p1C2jL6KDGs9uZVQJkrj88oQPaqew
 CVRWKfRgpEarzi4qIL1A/4oYYN6YnNZCl8b4kcKrmCb9O+Oz0vuDvtRlznyrJMoAaM
 2MPFgqWyZM6abDyMjHOmBsfyH83SfRRJDX1JV63vP5gdsEvpkeBaFPOXI5ZacMbbF6
 JCNs/UinR0Txg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3B96B380CFDE; Tue, 13 Jan 2026 02:27:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176827122776.1606835.6977840080640500582.git-patchwork-notify@kernel.org>
Date: Tue, 13 Jan 2026 02:27:07 +0000
References: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
In-Reply-To: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/9] net: stmmac: cleanups and
 low priority fixes
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

On Thu, 8 Jan 2026 17:35:20 +0000 you wrote:
> Hi,
> 
> Further cleanups and a few low priority fixes:
> 
> - Remove duplicated register definitions from header files
> - Fix harmless wrong definition used for PTP message type in
>   descriptors
> - Fix norm_set_tx_desc_len_on_ring() off-by-one error (and make
>   enh_set_tx_desc_len_on_ring() follow a similar pattern.)
>   Document the buffer size limits. I believe we never call
>   norm_set_tx_desc_len_on_ring() with 2KiB lengths.
> - use u32 rather than unsigned int for 32-bit quantities in
>   descriptors
> - modernise: convert to use FIELD_PREP() rather than separate mask
>   and shift definitions.
> - Reorganise register and register field definitions: registers
>   defined in address offset order followed by their register field
>   definitions.
> - Remove lots of unused register definitions.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/9] net: stmmac: dwmac4: remove duplicated definitions
    https://git.kernel.org/netdev/net-next/c/1fd3b573713a
  - [net-next,v2,2/9] net: stmmac: dwmac4: fix RX FIFO fill statistics
    https://git.kernel.org/netdev/net-next/c/65b21a7d4de4
  - [net-next,v2,3/9] net: stmmac: dwmac4: fix PTP message type field extraction
    https://git.kernel.org/netdev/net-next/c/e91a7e45bf0b
  - [net-next,v2,4/9] net: stmmac: descs: fix buffer 1 off-by-one error
    https://git.kernel.org/netdev/net-next/c/ec3fde9eead0
  - [net-next,v2,5/9] net: stmmac: descs: use u32 for descriptors
    https://git.kernel.org/netdev/net-next/c/d3b8c9b39356
  - [net-next,v2,6/9] net: stmmac: descs: remove many xxx_SHIFT definitions
    https://git.kernel.org/netdev/net-next/c/670d10509f85
  - [net-next,v2,7/9] net: stmmac: cores: remove many xxx_SHIFT definitions
    https://git.kernel.org/netdev/net-next/c/8409495bf6c9
  - [net-next,v2,8/9] net: stmmac: arrange register fields after register offsets
    https://git.kernel.org/netdev/net-next/c/58bc0f0bfc1b
  - [net-next,v2,9/9] net: stmmac: remove unused definitions
    https://git.kernel.org/netdev/net-next/c/5a78fd3debad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
