Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B82F3A2047
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 00:40:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3869CC58D5B;
	Wed,  9 Jun 2021 22:40:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1117EC57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 22:40:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 31E3B6139A;
 Wed,  9 Jun 2021 22:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623278425;
 bh=ueQ8dqoZxOqzgAObx/mbqpSAUqVFJ53xqae5CBvGNpk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rCu9ipTJhSmBkLRU42NQaAK3TU4KNwPXFNgibjXvPYrbDp3w6eVoNyxQ7VfAYRU+v
 j0fHd2QoyRBYDL+zP5ft2JFJobqdeXBrbSMmNxFkRNBmGnYobLkUTkWShryHDba1lm
 A5vPsIeHRYcFzsCQP6iCJO6D+ausRo184in6EqI7c8n5QTE+e0y7AVQKgoKcc/1Kxi
 r/2ytPpyuDE7wMOsDmaD0yiXmCyWW/ZT5vqpdZy6HOb4JMr93aMPmqtjXLrFr4VJAz
 6XQS/emUREe1trpIaN02uOo+rrRfPii7cFgD2Mf07KEm4RMh9y/M01dFoEoR7dCkfc
 wslz557Rhw6+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 297AD60A53;
 Wed,  9 Jun 2021 22:40:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162327842516.25473.1151254563839233754.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jun 2021 22:40:25 +0000
References: <20210609170512.297623-1-colin.king@canonical.com>
In-Reply-To: <20210609170512.297623-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 weifeng.voon@intel.com, vladimir.oltean@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, netdev@vger.kernel.org,
 davem@davemloft.net, michael.wei.hong.sit@intel.com
Subject: Re: [Linux-stm32] [PATCH][next] net: stmmac: Fix missing { } around
 two statements in an if statement
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

On Wed,  9 Jun 2021 18:05:12 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are missing { } around a block of code on an if statement. Fix this
> by adding them in.
> 
> Addresses-Coverity: ("Nesting level does not match indentation")
> Fixes: 46682cb86a37 ("net: stmmac: enable Intel mGbE 2.5Gbps link speed")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - [next] net: stmmac: Fix missing { } around two statements in an if statement
    https://git.kernel.org/netdev/net-next/c/345502af4e42

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
