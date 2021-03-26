Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F034B25A
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Mar 2021 00:00:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C15CCC5718D;
	Fri, 26 Mar 2021 23:00:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E365C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 23:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BED2D61A48;
 Fri, 26 Mar 2021 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616799612;
 bh=ot+7owfL+GI3GOc/wfSCv75+AhS2i6dAC6xmX2c3JAQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BCJNlmnHUkQp1ORnCWFGVSkIetH3kibCJHaIEeuXNqD6X/wuZuLeyJSNg/F3FtiF+
 oPU59hVsjCACVEEqKgRjFoBCL2LARfxHFy3cT6dkVJdpzvnL2v4ekeRtzZhhHctrFJ
 BFH85oXG6OF48zk6I/OOjtv22qcghVyr7kpZpxaAG7x2tBmVvpLYwgEnBwtX2tOJgh
 PLbefh8B6Z5uCG2nrQO/sWLPIX+dcVEYEopv7Gt5B8Fm/F3OwxLsoM0QI+6GrI1Xvv
 AMCjoCSS+/x6qlG22QLWtIJgUAXizJpBPKkVzfJqvNUk6LjesRnOemMVzcOjauDHqJ
 C5+5uZ2PumlwA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A5D066096E;
 Fri, 26 Mar 2021 23:00:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161679961267.14639.4413249532749146951.git-patchwork-notify@kernel.org>
Date: Fri, 26 Mar 2021 23:00:12 +0000
References: <20210326091046.26391-1-mohammad.athari.ismail@intel.com>
In-Reply-To: <20210326091046.26391-1-mohammad.athari.ismail@intel.com>
To: Ismail@ci.codeaurora.org,
 Mohammad Athari <mohammad.athari.ismail@intel.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@st.com,
 weifeng.voon@intel.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 tee.min.tan@intel.com, linux@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Fix kernel panic
 due to NULL pointer dereference of fpe_cfg
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

On Fri, 26 Mar 2021 17:10:46 +0800 you wrote:
> From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
> 
> In this patch, "net: stmmac: support FPE link partner hand-shaking
> procedure", priv->plat->fpe_cfg wouldn`t be "devm_kzalloc"ed if
> dma_cap->frpsel is 0 (Flexible Rx Parser is not supported in SoC) in
> tc_init(). So, fpe_cfg will be remain as NULL and accessing it will cause
> kernel panic.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: Fix kernel panic due to NULL pointer dereference of fpe_cfg
    https://git.kernel.org/netdev/net-next/c/63c173ff7aa3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
