Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B335231A
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Apr 2021 01:00:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 879AAC57B79;
	Thu,  1 Apr 2021 23:00:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1E35C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 23:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E79716112E;
 Thu,  1 Apr 2021 23:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617318008;
 bh=tSr+zGDSluwm5YWn2jN0KZi3KMNYKIeIsuiiZFz4PkI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Bd74D8KdBl9+NjVrc3KlWF3RDkEL8bCZ46tt4u60K3OC4d17ZFdEixaFm0bqrlwUS
 GEHmDrNXSlVZKVKPhcgk3qCIKQn/mbsBU7It93ODlc+F8thfYtnk6ooJHlxfJPoTfT
 1UXzvjYX3/BHVvSOUvABfsUc4iSLQ7pdFtBAibvcaGrNAD6/tcrsEo7g3C8yoj+DiN
 6yOxl6HDH+dkMe3cfKY35CGK22IrzuyiqyHIrGqy/+36s52C6rbpLpWZDH1eCurT0j
 H9m0FAiM5zbYR2UjCbPIDZcmkMsggxIaja79lBrqr4hptmrtjcIuk2sutMM+B3ksYh
 eTgaklKYzvYsg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DF301609CF;
 Thu,  1 Apr 2021 23:00:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161731800891.8028.4149863007531019665.git-patchwork-notify@kernel.org>
Date: Thu, 01 Apr 2021 23:00:08 +0000
References: <20210401060628.27339-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210401060628.27339-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: remove
 unnecessary pci_enable_msi() call
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

On Thu,  1 Apr 2021 14:06:28 +0800 you wrote:
> The commit d2a029bde37b ("stmmac: pci: add MSI support for Intel Quark
> X1000") introduced a pci_enable_msi() call in stmmac_pci.c.
> 
> With the commit 58da0cfa6cf1 ("net: stmmac: create dwmac-intel.c to
> contain all Intel platform"), Intel Quark platform related codes
> have been moved to the newly created driver.
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: remove unnecessary pci_enable_msi() call
    https://git.kernel.org/netdev/net-next/c/2237778d8c21

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
