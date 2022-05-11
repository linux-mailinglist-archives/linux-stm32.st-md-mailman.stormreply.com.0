Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ECF5229B6
	for <lists+linux-stm32@lfdr.de>; Wed, 11 May 2022 04:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF704C03FC2;
	Wed, 11 May 2022 02:30:14 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3F32C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 02:30:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63871B8210D;
 Wed, 11 May 2022 02:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2567CC385D8;
 Wed, 11 May 2022 02:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652236212;
 bh=za8c6QfqMEnkEPDAQWWy5CRNgJf8Ry8Evlv2S0C6WZA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hGbGYL2DMJBSOGpssHCTX6FvGf+mokdSJ/DuZyMAXyYfXMiv8vtdCPAzwwndCPfOe
 UkpigM/mWOpekCjPivze67wdAElsqwYWsZDuniyrefSc/VzqH9bBcne91hamjmFhMZ
 54VdOz/eJvsAjeuIE6a6yOy3PP9kD7E20k4KvAsfubNsTSvBfuqFy4yJBwv+KCRReR
 q6bRkpY2S3oHFPyB9F4u3p3AZ6WfO3F0+Amrvx39jHxk38YPA7bqrC/VcECrgzgIIA
 Y2cgHaIul+YV2BFUYJoJivUHCiZBt0oLWsioyGlCL/8++PHfElx0E/gv93nYcYU5/8
 SnRZ67Vd6zeFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0BC74F0392C; Wed, 11 May 2022 02:30:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165223621204.26540.11895833024977665930.git-patchwork-notify@kernel.org>
Date: Wed, 11 May 2022 02:30:12 +0000
References: <20220510031316.1780409-1-yangyingliang@huawei.com>
In-Reply-To: <20220510031316.1780409-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 edumazet@google.com, kuba@kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix missing
 pci_disable_device() on error in stmmac_pci_probe()
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
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 May 2022 11:13:16 +0800 you wrote:
> Switch to using pcim_enable_device() to avoid missing pci_disable_device().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   v2: switch to using pcim_enable_device()
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: fix missing pci_disable_device() on error in stmmac_pci_probe()
    https://git.kernel.org/netdev/net/c/0807ce0b0104

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
