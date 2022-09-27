Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ACF5EBDC5
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 10:50:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93225C63326;
	Tue, 27 Sep 2022 08:50:18 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9883C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 08:50:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55800B81A7D;
 Tue, 27 Sep 2022 08:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFA8DC433B5;
 Tue, 27 Sep 2022 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664268615;
 bh=qMdK7NLyMVV2IraowNNECpM/+mO8CR7/5v5YJjjGs2w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Yag8duBNCP4igT24u4e05HRse6iMq9hcUuU5gFBfe1e40RFUXHtz8SjUCANRB4Zjq
 S+YULQWwB1+MgxRLU2BE6r3fVtrY1beAt1AjhpR3XvpDHR61C4Kdj6QOvvJmcmbdyQ
 yAn/Rfhyy96VOQPrZtJfg3Atsd+lDAqiuBkDdVDzuymQqiKCYsrPlvJto2KtWfQccv
 Eaxq81XMAlWOYtUQLnKQXI+L8EqMDqG4M5ES2a6YONq0qQ0+Tpwm461uVCVC+873J/
 dyuOer6CDXj2ZnKJ/YWq7c9ZBonz3POZ3AHyg0D3UYBEgvCQ9Y01ymYSNvco8Zm6bm
 pB2EQIfHNARbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D3720E21EC2; Tue, 27 Sep 2022 08:50:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166426861486.17620.1374697720917378752.git-patchwork-notify@kernel.org>
Date: Tue, 27 Sep 2022 08:50:14 +0000
References: <20220923050448.1220250-1-junxiao.chang@intel.com>
In-Reply-To: <20220923050448.1220250-1-junxiao.chang@intel.com>
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: linux-kernel@vger.kernel.org, weifeng.voon@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux@armlinux.org.uk, edumazet@google.com, joabreu@synopsys.com,
 jimmyjs.chen@adlinktech.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, hong.aun.looi@intel.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net,
	v3] net: stmmac: power up/down serdes in stmmac_open/release
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 23 Sep 2022 13:04:48 +0800 you wrote:
> This commit fixes DMA engine reset timeout issue in suspend/resume
> with ADLink I-Pi SMARC Plus board which dmesg shows:
> ...
> [   54.678271] PM: suspend exit
> [   54.754066] intel-eth-pci 0000:00:1d.2 enp0s29f2: PHY [stmmac-3:01] driver [Maxlinear Ethernet GPY215B] (irq=POLL)
> [   54.755808] intel-eth-pci 0000:00:1d.2 enp0s29f2: Register MEM_TYPE_PAGE_POOL RxQ-0
> ...
> [   54.780482] intel-eth-pci 0000:00:1d.2 enp0s29f2: Register MEM_TYPE_PAGE_POOL RxQ-7
> [   55.784098] intel-eth-pci 0000:00:1d.2: Failed to reset the dma
> [   55.784111] intel-eth-pci 0000:00:1d.2 enp0s29f2: stmmac_hw_setup: DMA engine initialization failed
> [   55.784115] intel-eth-pci 0000:00:1d.2 enp0s29f2: stmmac_open: Hw setup failed
> ...
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: power up/down serdes in stmmac_open/release
    https://git.kernel.org/netdev/net/c/49725ffc15fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
