Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AAD7FB8C0
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 12:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBD36C6B44B;
	Tue, 28 Nov 2023 11:00:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AAB6C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 11:00:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D849AB839D7;
 Tue, 28 Nov 2023 11:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5A0DC433CA;
 Tue, 28 Nov 2023 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701169226;
 bh=QOg3KVTER4epeAO54p/axbPEeNoukAl/3jVlyfyz5pA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LFFLS0Xz8X0pIlB57Xsfgt90E0QExzL9hJa7HWEiUpc/HddEdCCyjz71sgEgiJCOc
 GOEC22grZxMqOGDRg3tSAi1xhuQgzATZwyFefdVM9ucxBp+PJ32S7suBas2iy72Z4s
 xc4ZHLzkfPU1O/4Ru/wkKxQLcQfiKsRmpMw/XMuJlvhoxCJkbAY0rQz5dTqjsBAjFu
 1yv3HBx0s3ZVuu1l+JePwYNYUBvmSbLZ9Q7ocrQ1nz587G+oLXJs81jaNAXEWarh23
 eDcPkd1CnJ+Otl2VBGnqrFK5W0I663nqwFD66RQwpDnIX6dzY8+7CVxpTJbSH/czjC
 tVT1Qxlnf1zeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C79DCC39562; Tue, 28 Nov 2023 11:00:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170116922581.4807.10674635347082642377.git-patchwork-notify@kernel.org>
Date: Tue, 28 Nov 2023 11:00:25 +0000
References: <20231125060126.2328690-1-0x1207@gmail.com>
In-Reply-To: <20231125060126.2328690-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, horms@kernel.org, larysa.zaremba@intel.com,
 jpinto@synopsys.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, xfr@outlook.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: xgmac: Disable FPE
	MMC interrupts
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

On Sat, 25 Nov 2023 14:01:26 +0800 you wrote:
> Commit aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts
> by default") tries to disable MMC interrupts to avoid a storm of
> unhandled interrupts, but leaves the FPE(Frame Preemption) MMC
> interrupts enabled, FPE MMC interrupts can cause the same problem.
> Now we mask FPE TX and RX interrupts to disable all MMC interrupts.
> 
> Fixes: aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts by default")
> Reviewed-by: Larysa Zaremba <larysa.zaremba@intel.com>
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: xgmac: Disable FPE MMC interrupts
    https://git.kernel.org/netdev/net/c/e54d628a2721

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
