Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA24648139
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Dec 2022 12:00:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6C71C65E6D;
	Fri,  9 Dec 2022 11:00:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84B83C65E63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Dec 2022 11:00:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 116AB62211;
 Fri,  9 Dec 2022 11:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70FE4C43392;
 Fri,  9 Dec 2022 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670583616;
 bh=0NWOume5v1ZpkeFfqBb0Axg7sceeXJuKJlhRzJ4rwHE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nPPrEEcJF2riSnHvi3FgSdJhg5wnqOqAE8izqKoZ4XwBwsmj4AnHTQhlIr52PM0i8
 mVtvVA10wdSs0PYlMicwvOhmUVLQ67CCxOwY/1W62k77+suVYlLsi3Fox6NTwBFzZ0
 aEZFB1LgpiG9RZxDdhaGp13HjRWepNvgwNLmgZ9XrklDxCAltuzRJKljYarje9hMsC
 Q538kvlAqswtXHorZjpWTxOmCpEGvscNw5GA8sOD7sHnuiv8o1DD+lt06R2rryuiGe
 hXj4sxg13DBPR96WPhjQVvi50lHC/FfOFAbeTx2nkc5+uNEh5ImvakGJVTZN+luWFG
 zspAhXyqw9v0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 57F46C41612; Fri,  9 Dec 2022 11:00:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167058361635.21061.2629319765403507972.git-patchwork-notify@kernel.org>
Date: Fri, 09 Dec 2022 11:00:16 +0000
References: <20221207083413.1758113-1-cuigaosheng1@huawei.com>
In-Reply-To: <20221207083413.1758113-1-cuigaosheng1@huawei.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, john.fastabend@gmail.com,
 ast@kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix possible memory leak
 in stmmac_dvr_probe()
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

On Wed, 7 Dec 2022 16:34:13 +0800 you wrote:
> The bitmap_free() should be called to free priv->af_xdp_zc_qps
> when create_singlethread_workqueue() fails, otherwise there will
> be a memory leak, so we add the err path error_wq_init to fix it.
> 
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix possible memory leak in stmmac_dvr_probe()
    https://git.kernel.org/netdev/net/c/a137f3f27f92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
