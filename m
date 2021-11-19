Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA92456E90
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Nov 2021 13:00:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54544C5EC56;
	Fri, 19 Nov 2021 12:00:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA5DC5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 12:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7403B61A7D;
 Fri, 19 Nov 2021 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637323211;
 bh=kA2KK8YuXrw1PKsVWIH0KuhpSQ3a+ufOU+5LfFmrzow=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tjfDbQztzqGYUHWhFOZRQbi+eq69XsyvJ3R5WQ0lakEDGnwHyNbTW+tJADKsSCG8U
 GeGV1oPn2O2yksUkUZk5DX/0RUJd7YpR8CF61X1UzBlDbvcngy7bAKoolhrG61eOmA
 rWejxorlcLMasZVFK/7xl3t0IvC+SiecbSN5yaVZhUpg6J7eJGRSZxQh8BB+/jzj9o
 Pq0gWnvRyXB7aZNz0oLnMMO5wF0QrH14pyIDUt2xzuEj0obfYEbqRXjdx8LlkmkDAF
 GF5NhLCKU7VmlPWmVYy/RYBXJkEQJZzKg68UjIMEiVovEy8O0QP02/EDeCzCqejLBE
 QrZYOSU3zzc+w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 677E060A0F;
 Fri, 19 Nov 2021 12:00:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163732321141.14736.10382429911164710117.git-patchwork-notify@kernel.org>
Date: Fri, 19 Nov 2021 12:00:11 +0000
References: <YZbI12/g04GlzdIU@a-10-27-17-117.dynapool.vpn.nyu.edu>
In-Reply-To: <YZbI12/g04GlzdIU@a-10-27-17-117.dynapool.vpn.nyu.edu>
To: Zekun Shen <bruceshenzk@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, brendandg@nyu.edu, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac_pci: Fix underflow size in
	stmmac_rx
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 18 Nov 2021 16:42:47 -0500 you wrote:
> This bug report came up when we were testing the device driver
> by fuzzing. It shows that buf1_len can get underflowed and be
> 0xfffffffc (4294967292).
> 
> This bug is triggerable with a compromised/malfunctioning device.
> We found the bug through QEMU emulation tested the patch with
> emulation. We did NOT test it on real hardware.
> 
> [...]

Here is the summary with links:
  - stmmac_pci: Fix underflow size in stmmac_rx
    https://git.kernel.org/netdev/net/c/0f296e782f21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
