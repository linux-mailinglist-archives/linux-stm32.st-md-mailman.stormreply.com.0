Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D231D33A24B
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Mar 2021 03:10:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41C62C57195;
	Sun, 14 Mar 2021 02:10:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4507DC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Mar 2021 02:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3172164ECE;
 Sun, 14 Mar 2021 02:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615687808;
 bh=0Ltd7ABkEJ0W33cjVaYlQ82uDAkSeGqOj0zFiXfcTiE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DydDAzGhv+0c/LPxfjj0onV1wv89NX3A2uMl46wCMjOSLFE50vMQUwjkQ0uYIWZZK
 yPEjRb/nbNguagrNptYDDkyMShMjegpedrxj0SfTOVYEvvvYvocZdVDLTvarvTACL2
 krDBIYiaLTXnw0hsS0Qrmz75281zhaX8KovxHDf6IbWAvATWu196T4zRxHFLip/ToX
 wx1JtsWcFMkEJ1nMmd6URJ4DF/G4HKlPPnNj5Y65c3aTV5aXBDlGUxr+an6bEpf2vE
 GDNWvb7nYwz1DTPAy5ZUH6v6E8WgIzAqNpSjaih2F9OToCNVWfxj/1uOz/l3DBBqk/
 YXhCB8w2KrZJQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 21F7760A6A;
 Sun, 14 Mar 2021 02:10:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161568780813.10930.14410536335791157714.git-patchwork-notify@kernel.org>
Date: Sun, 14 Mar 2021 02:10:08 +0000
References: <20210313131826.GA17553@earth.li>
In-Reply-To: <20210313131826.GA17553@earth.li>
To: Jonathan McDowell <noodles@earth.li>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Set FIFO sizes for
	ipq806x
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sat, 13 Mar 2021 13:18:26 +0000 you wrote:
> Commit eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
> started using the TX FIFO size to verify what counts as a valid MTU
> request for the stmmac driver.  This is unset for the ipq806x variant.
> Looking at older patches for this it seems the RX + TXs buffers can be
> up to 8k, so set appropriately.
> 
> (I sent this as an RFC patch in June last year, but received no replies.
> I've been running with this on my hardware (a MikroTik RB3011) since
> then with larger MTUs to support both the internal qca8k switch and
> VLANs with no problems. Without the patch it's impossible to set the
> larger MTU required to support this.)
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: Set FIFO sizes for ipq806x
    https://git.kernel.org/netdev/net-next/c/e127906b68b4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
