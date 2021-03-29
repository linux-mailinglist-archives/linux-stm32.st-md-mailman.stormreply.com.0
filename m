Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E16B34D8F9
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Mar 2021 22:20:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25D24C5719E;
	Mon, 29 Mar 2021 20:20:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33496C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 20:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EAB6061990;
 Mon, 29 Mar 2021 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617049210;
 bh=jlCwWmeXYijmJcPJaPtCi0cFsmSyEb1quFTEDPF8e5w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=s4+ATsuFkqEuE3JTQV0OwV2cppEZFIJ3aWs+gmKxQvpnCHDtbeElsEZ9Jl+REjxwD
 MzuXd9zwvZ/8RggS/6jtyF79UEjHUXwNeIebx0Gb9yRt7TM0ptE/TGmGrZdW70jWMr
 Vle34UXLIzEtDWYMOHHs4HllyKGwRf/2bWqZvL9IRNcrxSsze5M6zSHiNC6QoYFuET
 blTp45p1dKP3Orq7gu4t9zY0vIjd4s4WfPPkHI0gc8OOD9152zLuxxOuLMUMLNNZ40
 M4KN4c4eLt3ooDN+nVprU+z+xIoy1nhj6iJ5gdhytwPTgtGjfRyBFzE9wuHCXdF45G
 WOH31nbB6KNjw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E0A7960A5B;
 Mon, 29 Mar 2021 20:20:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161704920991.7047.8155983568330471416.git-patchwork-notify@kernel.org>
Date: Mon, 29 Mar 2021 20:20:09 +0000
References: <1616982572-14473-1-git-send-email-huangguobin4@huawei.com>
In-Reply-To: <1616982572-14473-1-git-send-email-huangguobin4@huawei.com>
To: Huang Guobin <huangguobin4@huawei.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 vkoul@kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: remove redundant
 dev_err call in qcom_ethqos_probe()
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

On Mon, 29 Mar 2021 09:49:32 +0800 you wrote:
> From: Guobin Huang <huangguobin4@huawei.com>
> 
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Guobin Huang <huangguobin4@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: remove redundant dev_err call in qcom_ethqos_probe()
    https://git.kernel.org/netdev/net-next/c/3d0dbd546345

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
