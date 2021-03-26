Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3CF34B185
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 22:50:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED0CBC5718D;
	Fri, 26 Mar 2021 21:50:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA526C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 21:50:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 26F6C61A10;
 Fri, 26 Mar 2021 21:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616795411;
 bh=bcdCzp4pAv3xlxjBrP8WxheeUABuPbFUKDaRjd+VNZk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uU0IYMdgWeX8b8S7aPy22jpI7C7iMJt0e5stC3UK005X2EJ+e4uVcVBlWeRBwnUWH
 Ajwk42C3qPwI0t0+XoS6FE8lCi2ZioWY2Gn069e8R9KMP+5kGzJJ2MCn2ATmRPZ/Wn
 9XOhq2H2Slp783zF89uUP/QntHdq8mQTk06QP/0pqWYuSdP08Rjgm7V5Bw46Y8YCRq
 MC8QY9SQEqEf2dQgLhFjMga5sddCGR3dCPAdNOHMQeVPyOHDsRV7pR9fX3DKaueIX8
 /ROdY0ijj6LT2D9tPb6of6RBkFcCA31UWs0FQanBfzk+ljAgYtSBzj8emv/uiaj2Cw
 FRRmSgS4dYwqg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EF07260970;
 Fri, 26 Mar 2021 21:50:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161679541097.17455.17342387440492933878.git-patchwork-notify@kernel.org>
Date: Fri, 26 Mar 2021 21:50:10 +0000
References: <20210325173916.13203-1-weifeng.voon@intel.com>
In-Reply-To: <20210325173916.13203-1-weifeng.voon@intel.com>
To: Voon Weifeng <weifeng.voon@intel.com>
Cc: andrew@lunn.ch, alexandre.torgue@st.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, boon.leong.ong@intel.com,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next 0/5] net: stmmac: enable
	multi-vector MSI
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

This series was applied to netdev/net-next.git (refs/heads/master):

On Fri, 26 Mar 2021 01:39:11 +0800 you wrote:
> This patchset adds support for multi MSI interrupts in addition to
> current single common interrupt implementation. Each MSI interrupt is tied
> to a newly introduce interrupt service routine(ISR). Hence, each interrupt
> will only go through the corresponding ISR.
> 
> In order to increase the efficiency, enabling multi MSI interrupt will
> automatically select the interrupt mode configuration INTM=1. When INTM=1,
> the TX/RX transfer complete signal will only asserted on corresponding
> sbd_perch_tx_intr_o[] or sbd_perch_rx_intr_o[] without asserting signal
> on the common sbd_intr_o. Hence, for each TX/RX interrupts, only the
> corresponding ISR will be triggered.
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/5] net: stmmac: introduce DMA interrupt status masking per traffic direction
    https://git.kernel.org/netdev/net-next/c/7e1c520c0d20
  - [v2,net-next,2/5] net: stmmac: make stmmac_interrupt() function more friendly to MSI
    https://git.kernel.org/netdev/net-next/c/29e6573c61aa
  - [v2,net-next,3/5] net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX
    https://git.kernel.org/netdev/net-next/c/8532f613bc78
  - [v2,net-next,4/5] stmmac: intel: add support for multi-vector msi and msi-x
    https://git.kernel.org/netdev/net-next/c/b42446b9b37b
  - [v2,net-next,5/5] net: stmmac: use interrupt mode INTM=1 for multi-MSI
    https://git.kernel.org/netdev/net-next/c/6ccf12ae111e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
