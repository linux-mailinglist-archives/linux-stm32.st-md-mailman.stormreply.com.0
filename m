Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B513AA45B
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jun 2021 21:30:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32B8FC59780;
	Wed, 16 Jun 2021 19:30:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51744C58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 19:30:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 877EA61246;
 Wed, 16 Jun 2021 19:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623871803;
 bh=f9H14eCfhOjvGvGE7xKVI0N3PyCwuQDCxqlmu4asqo0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BqdBAE2TFTBgmA+TcCJvVRAPxQ352ku5ISlA1NipNhTIvt2TlDFARtlh1ViuFWgAP
 4rQljHMoazXSpr7dt9/G4KRaw4BvPVYZDF8K836Ewun/jERwF6ZaRr0jepn9CFYjKR
 OcG6jEgkixEO33hK7qJZ96S0v43vsI/wt+8To/9j9qxFRmEOVfytsOaMZ77s5/q3/n
 qopJILBhq+8Yt2BnWoBknrFbhlA5soPPtTzLfSQVUDtSFUwQntMFmKKBlA5bcygfp8
 2BrVwOgG1iY2SCQuMQ8SCAX6sajdXDORxZJXwifIIROrSmGE7/xkWSsnvLC/cq4wbv
 YoOoAdMkqHZKA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7B86060A54;
 Wed, 16 Jun 2021 19:30:03 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162387180350.2076.2488923511178824990.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jun 2021 19:30:03 +0000
References: <20210616091024.13412-1-qiangqing.zhang@nxp.com>
In-Reply-To: <20210616091024.13412-1-qiangqing.zhang@nxp.com>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, linux-imx@nxp.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: disable clocks in
	stmmac_remove_config_dt()
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

On Wed, 16 Jun 2021 17:10:24 +0800 you wrote:
> Platform drivers may call stmmac_probe_config_dt() to parse dt, could
> call stmmac_remove_config_dt() in error handing after dt parsed, so need
> disable clocks in stmmac_remove_config_dt().
> 
> Go through all platforms drivers which use stmmac_probe_config_dt(),
> none of them disable clocks manually, so it's safe to disable them in
> stmmac_remove_config_dt().
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: disable clocks in stmmac_remove_config_dt()
    https://git.kernel.org/netdev/net/c/8f269102baf7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
