Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952C35231B
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Apr 2021 01:00:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4FB7C58D5B;
	Thu,  1 Apr 2021 23:00:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFEF8C57A41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 23:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0118961131;
 Thu,  1 Apr 2021 23:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617318009;
 bh=UAJFQxDC9fAyvefKwsU/8DU/tR04q/XgCs8YPeDUtEY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gxk7tnoQDePKwRlp+xYaIH4NZBs0/p1Yy0JTxj+F2mZw6W9lAgDPXch1QEkchBURL
 GLYanmqCf7qHhWx7ogY3vG1fzoTlBj30G2+LNZRHLz83Pr09hvxZh2FSe5gbC6kxIA
 iFrC39/homgLLWnbJoXFj1igG3gqE4vZlUxpsXkZqDWF1+opbGj/hD+192lUIahJfc
 +ApS45yTRrWkwqL5hWN7qvLLPkOe5yM12TsYRbKGJbEFU5iC2KduoHmlr7LRZTgpnX
 7IJ6kJ5COwoImSpeIhLaofpzmyEX34hZuPBO78S7Q839jPQB2NDu/eIxNI3HtH4cMX
 sz3s2r8Fq/zXQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EA81C608FE;
 Thu,  1 Apr 2021 23:00:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161731800895.8028.1455207086826594661.git-patchwork-notify@kernel.org>
Date: Thu, 01 Apr 2021 23:00:08 +0000
References: <20210401060250.24109-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210401060250.24109-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: use managed
 PCI function on probe and resume
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

On Thu,  1 Apr 2021 14:02:50 +0800 you wrote:
> Update dwmac-intel to use managed function, i.e. pcim_enable_device().
> 
> This will allow devres framework to call resource free function for us.
> 
> Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [net-next,1/1] stmmac: intel: use managed PCI function on probe and resume
    https://git.kernel.org/netdev/net-next/c/8accc467758e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
