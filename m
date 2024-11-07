Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B36C79C0101
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2024 10:20:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60223C6C83A;
	Thu,  7 Nov 2024 09:20:29 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57055C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 09:20:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5FB12A430E2;
 Thu,  7 Nov 2024 09:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A5EC4CECC;
 Thu,  7 Nov 2024 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730971219;
 bh=MzAtMnBa36cvwhj9J6ISxKGN8qWAOmIs4UqZoAWc1x8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nzZ/lzqqzJaLDXBN1l74ys9/c85Yaqeq3wvmQOwXthEaMxW+9whlB0DxNEKfhS2fx
 Vq5nIVqJvNG7wFBdfgljy4080TwcTq9XYX64WLEjrTDhB8vLb81A05E/KD/KyKjYA9
 Gox8Ev5qFK10ejsUSEHp3Wh7yQ8pKaCDzCIP+vC+wU2yI94zyDnkOzf7JWV9utuV8a
 XxtMQgat1ye6FLYP15oXodBdo8X4OoSx3bBHxXTTkUVgDxkuY5A5i/7BcScgSjfoiI
 kdVCjfqM/Y305cuisfX0+snkjIdg0VqzT7nKpwBLJcbsZBwDpKFsOtYMG4AjJaE69o
 rK41u5M2ZWQfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34EE13809A80; Thu,  7 Nov 2024 09:20:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173097122904.1579640.5010342385326557978.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 09:20:29 +0000
References: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
In-Reply-To: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_=3Cnfraprado=40collabora=2Ecom?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 =?utf-8?q?=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, maqianga@uniontech.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix unbalanced IRQ wake
 disable warning on single irq case
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 01 Nov 2024 17:17:29 -0400 you wrote:
> Commit a23aa0404218 ("net: stmmac: ethtool: Fixed calltrace caused by
> unbalanced disable_irq_wake calls") introduced checks to prevent
> unbalanced enable and disable IRQ wake calls. However it only
> initialized the auxiliary variable on one of the paths,
> stmmac_request_irq_multi_msi(), missing the other,
> stmmac_request_irq_single().
> 
> [...]

Here is the summary with links:
  - net: stmmac: Fix unbalanced IRQ wake disable warning on single irq case
    https://git.kernel.org/netdev/net/c/25d70702142a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
