Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440741DADD
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Sep 2021 15:20:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E92A8C5A4CD;
	Thu, 30 Sep 2021 13:20:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB052C597AB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 13:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1F04B61882;
 Thu, 30 Sep 2021 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633008008;
 bh=0pemjILUKW3P8ap2Jjm3YvSixx5+FFMy1g4WdQOdk4Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=h5ay83ItK8/eXeyvw+cL9+XSXxEJ0/fT/PYGAAlvYiI/yD+TWtghCOZGVKZwN/p4O
 PX3sGpYlpnGW6o4JrlphfVOZpZqpLFeOtQwVIz0eftowlBqDJachVxTwkXadg997gI
 1KaHC9S2OG0FlvITSGR8QqHZzao3HPfQQIYVvaM/U65yXrPEj/05CcBRQ2erZ8TjPM
 /C1ecbWwbr5B/iYekkBHTCudpynZnx/6kuQAHL5KhhVmWIC4H437wafuYkxdQAf+Kb
 fdbozgOFCmaJlgEbUGqnd0XWe6IpCt0cA6zY2FKYni6/myU2j3WXAZeDp0/qEbxB7u
 Er3zoR8rGGioA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0E51260A7E;
 Thu, 30 Sep 2021 13:20:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163300800805.14372.10172640805730469120.git-patchwork-notify@kernel.org>
Date: Thu, 30 Sep 2021 13:20:08 +0000
References: <20210930064436.1502516-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210930064436.1502516-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 veekhee@gmail.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, michael.wei.hong.sit@intel.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1 1/1] net: stmmac: fix EEE init
 issue when paired with EEE capable PHYs
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

This patch was applied to netdev/net.git (refs/heads/master):

On Thu, 30 Sep 2021 14:44:36 +0800 you wrote:
> When STMMAC is paired with Energy-Efficient Ethernet(EEE) capable PHY,
> and the PHY is advertising EEE by default, we need to enable EEE on the
> xPCS side too, instead of having user to manually trigger the enabling
> config via ethtool.
> 
> Fixed this by adding xpcs_config_eee() call in stmmac_eee_init().
> 
> [...]

Here is the summary with links:
  - [net,v1,1/1] net: stmmac: fix EEE init issue when paired with EEE capable PHYs
    https://git.kernel.org/netdev/net/c/656ed8b015f1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
