Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4591082CCB7
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jan 2024 13:50:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2B09C6B460;
	Sat, 13 Jan 2024 12:50:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7E3AC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jan 2024 12:50:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 432CBB82472;
 Sat, 13 Jan 2024 12:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BACB9C43390;
 Sat, 13 Jan 2024 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705150224;
 bh=yY2rSlGkjZflGrirYZMdUgFNa1m+E+eJl0XsX5awu5Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZBShBegLwtLPNOhPak1h3TWRx4ILNmarEXhzGj9vxyIaHFHIbTCdZm8naNEKCFG2y
 FWqMxqPNIVID1gOcaHEpjn3hCBME0kDxn6jb3chMBoPD26l+p9/rt65efjy0Rxscsa
 QSkFNpAaIBs2fSOd02lGlNxfEUPBB+yIJFfuE7p0kTstJ+wcT4B2R+3ZvkdAfIxB0A
 cIK0DjDBu5buLBzNccT1JP6cNq8JX0refs41OPWQsV0IP7aEb+O6XcJVaXxcD23Vyi
 8D2UX0ta/oafo4Q71SJq/mKSmt9JbHPm3f4qFf2I28hqnQx+NvGxvb33y7+qdwg9Ck
 K60u/vPSvtJow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A12E4D8C972; Sat, 13 Jan 2024 12:50:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170515022465.6254.17374650237895775131.git-patchwork-notify@kernel.org>
Date: Sat, 13 Jan 2024 12:50:24 +0000
References: <20240109144729.26102-1-quic_snehshah@quicinc.com>
In-Reply-To: <20240109144729.26102-1-quic_snehshah@quicinc.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org, bhupesh.sharma@linaro.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, vkoul@kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: Fix ethool link
 settings ops for integrated PCS
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
by David S. Miller <davem@davemloft.net>:

On Tue,  9 Jan 2024 20:17:29 +0530 you wrote:
> Currently get/set_link_ksettings ethtool ops are dependent on PCS.
> When PCS is integrated, it will not have separate link config.
> Bypass configuring and checking PCS for integrated PCS.
> 
> Fixes: aa571b6275fb ("net: stmmac: add new switch to struct plat_stmmacenet_data")
> Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: Fix ethool link settings ops for integrated PCS
    https://git.kernel.org/netdev/net/c/08300adac3b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
