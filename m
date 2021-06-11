Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 607E63A49F6
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:10:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C864C58D5B;
	Fri, 11 Jun 2021 20:10:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0AD3C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:10:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3229B613DD;
 Fri, 11 Jun 2021 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623442204;
 bh=WuTiQjeodNRfELT25Dm1Y4fiX/3qt6eu8otI/lMVgCg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=b55JqRmt7oGR5agfroZso3l9BvILmGZyV90LbgPQqApDQtI5/JnPpLEKzB3bxRTHn
 syv3RIPBt8W5s+GzrKjfT5c+EMY4zRaKUzulvcyi2WVyO8SawDuD+uyvzVttvjkY6e
 2cGYH2jjuw1fz75s70yJHRuz/8pAi0xkbbPHfPPy90uvNBuwNal/FcTneXpaZgGfpv
 WJcrBQoWG/FKe9U8Pr5jSovNCeidchgaSjzGkf5giI/Woe5CRivtpC1he/8xeQn080
 F5hD+xFaQDLeP3/vQmHNbwRJ+WnZM1aBsBlwwDOirImQzOD1D4uR1kIiq9DWKLBT6w
 r8NLpZ7G5pHHg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 23B3560972;
 Fri, 11 Jun 2021 20:10:04 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162344220414.8005.8449324972783579265.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jun 2021 20:10:04 +0000
References: <20210611071143.987866-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210611071143.987866-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, weifeng.voon@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, qiangqing.zhang@nxp.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/1] net: stmmac: Fix unused
	values warnings
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

On Fri, 11 Jun 2021 15:11:43 +0800 you wrote:
> The commit 8532f613bc78 ("net: stmmac: introduce MSI Interrupt routines
> for mac, safety, RX & TX") introduced the converity warnings:-
> 
>   1. Unused value (UNUSED_VALUE)
>      assigned_value: Assigning value REQ_IRQ_ERR_MAC to irq_err here,
>      but that stored value is not used.
> 
> [...]

Here is the summary with links:
  - [net-next,v1,1/1] net: stmmac: Fix unused values warnings
    https://git.kernel.org/netdev/net-next/c/3e6dc7b65025

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
