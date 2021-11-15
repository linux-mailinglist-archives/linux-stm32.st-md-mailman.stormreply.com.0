Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9267245053E
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Nov 2021 14:20:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A640C5E2CC;
	Mon, 15 Nov 2021 13:20:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D6B2C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 13:20:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9A53F63210;
 Mon, 15 Nov 2021 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636982410;
 bh=2+6Q+ASYuJ/HE6E6L+Q/56BvaTJg2xvxyMzwjMoFnyA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XtaPSAGy3pYgG0lEpM5TQpiMXniUlA8IplRHkxyMJE6VMk+eX4Bn2B/buRcfFoAAc
 AbPMAMShnTmOJCEbTalDaqStUmKo1IrT1/BLQhc0trmEp4d60sHiM1793ELpKNUJFH
 z3gV5oVeEN9ldzgduV4cuNuXmKDPwp25vRGIeDH4LL9LRaSXLSJ7FaP7VOhe5zzchs
 MTs2MhtVeke115tOmokbmx9YjD6rp1TDshznOsu4RhORbAFO2V96/lzAq4ZC8UdAWV
 EOkGv/5RSW7ys9o/LcQD58c4NbaGcvULy7YY/xTY65gPLk1FOxlv6Bf/COGEX45jOd
 5du4W15VKpM3w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 92AD960A88;
 Mon, 15 Nov 2021 13:20:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163698241059.21342.15722076817804554278.git-patchwork-notify@kernel.org>
Date: Mon, 15 Nov 2021 13:20:10 +0000
References: <20211111143949.2806049-1-boon.leong.ong@intel.com>
In-Reply-To: <20211111143949.2806049-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@st.com, daniel@iogearbox.net,
 netdev@vger.kernel.org, john.fastabend@gmail.com, alexandre.torgue@foss.st.com,
 kurt.kanzenbach@linutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, bpf@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hawk@kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: enhance XDP ZC
 driver level switching performance
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 11 Nov 2021 22:39:49 +0800 you wrote:
> The previous stmmac_xdp_set_prog() implementation uses stmmac_release()
> and stmmac_open() which tear down the PHY device and causes undesirable
> autonegotiation which causes a delay whenever AFXDP ZC is setup.
> 
> This patch introduces two new functions that just sufficiently tear
> down DMA descriptors, buffer, NAPI process, and IRQs and reestablish
> them accordingly in both stmmac_xdp_release() and stammac_xdp_open().
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: enhance XDP ZC driver level switching performance
    https://git.kernel.org/netdev/net-next/c/ac746c8520d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
