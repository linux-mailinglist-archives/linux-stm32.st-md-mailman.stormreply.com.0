Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4643695CC4
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Feb 2023 09:20:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64A8AC6A5F5;
	Tue, 14 Feb 2023 08:20:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11E25C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 08:20:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9FB31CE1F46;
 Tue, 14 Feb 2023 08:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A35DC4339C;
 Tue, 14 Feb 2023 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676362818;
 bh=KEg8Sfi9xjY1oiL55ZN8vK2MuOgVIXXa+WnRoJyLrRk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MsVhSEe6AaUyfI1Wld4oBuWf1WNIQsW2UqboOUga4WDgOX4eHGq65AuciZJqXqPAJ
 jR9hV2odzRBsR3OMJe2Cz81nHUHJKXOI2rodg8yUmWtWoQekVtzuaxN4MURn8xDsc1
 XF4A7ZTI2nTrce6efUrfb0uZWB8vbCMd5VYWsRnzgL6hef/y23sd87NGQrXmpHYTKS
 RMouvE8GQqDFkTV5jrNYfwi2tHzGaGLbw7bt/W6d364fEWMtIM0fP8w+fbhifewiuN
 XNR6LOKcGSk3EPARJbF7XJDRwiduBVRslrpWuMNQF7l0S37OveKBCBd3kb+/Zx+Pmt
 MyjFZEs1cu7aA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2D883C4166F; Tue, 14 Feb 2023 08:20:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167636281818.8537.7827873287858808714.git-patchwork-notify@kernel.org>
Date: Tue, 14 Feb 2023 08:20:18 +0000
References: <20230210202126.877548-1-cristian.ciocaltea@collabora.com>
In-Reply-To: <20230210202126.877548-1-cristian.ciocaltea@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: sonic.zhang@analog.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, kernel@collabora.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] net: stmmac: Restrict warning on
 disabling DMA store and fwd mode
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

On Fri, 10 Feb 2023 22:21:26 +0200 you wrote:
> When setting 'snps,force_thresh_dma_mode' DT property, the following
> warning is always emitted, regardless the status of force_sf_dma_mode:
> 
> dwmac-starfive 10020000.ethernet: force_sf_dma_mode is ignored if force_thresh_dma_mode is set.
> 
> Do not print the rather misleading message when DMA store and forward
> mode is already disabled.
> 
> [...]

Here is the summary with links:
  - [1/1] net: stmmac: Restrict warning on disabling DMA store and fwd mode
    https://git.kernel.org/netdev/net/c/05d7623a892a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
