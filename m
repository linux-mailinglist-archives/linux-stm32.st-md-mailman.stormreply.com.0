Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54858649B59
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Dec 2022 10:40:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 021DDC65E62;
	Mon, 12 Dec 2022 09:40:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA2E6C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 09:40:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EAB7CB80C75;
 Mon, 12 Dec 2022 09:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97988C43398;
 Mon, 12 Dec 2022 09:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670838016;
 bh=PFRwwAEE6T0Zl3Gpsu7MnXZ3cNnwcu75+uz54iDM9NU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lH2YSrreLrANfVftDnRJLJjrB2imMpsdCvhfIzxcGwnraRqVsCetjQ4FlJ+cXswhz
 TfBw1AJlKd1oSPmAUnrJ3SxsWP+hHChgymmxoOXDRKQLQGfxiGE/GX/7EYc8KbdOdg
 li2CPXThmmbQzJSq4dBMhD/nh1GCOie1cnbhf8Bu4hI+mPdUEgbNmu1/7uenV4yhGF
 BKHOFN+PvBrrfOEzRRE4XpFzYlTfdDYa1sTIIywMOuuFTyABsd3CdGJPkrAfIVud2a
 TELxhFieMdrYuV8OhTOAR3o3AAu/B/je67ddolFSWn+Fg8oGoPCIHrTAlzTxOckQHH
 HN/J3k3PpA7ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 79901C41612; Mon, 12 Dec 2022 09:40:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167083801649.1612.9436710695247859393.git-patchwork-notify@kernel.org>
Date: Mon, 12 Dec 2022 09:40:16 +0000
References: <1670490195-19367-1-git-send-email-jun.ann.lai@intel.com>
In-Reply-To: <1670490195-19367-1-git-send-email-jun.ann.lai@intel.com>
To: Lai Peter Jun Ann <jun.ann.lai@intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, michael.wei.hong.sit@intel.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Add check for
 taprio basetime configuration
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu,  8 Dec 2022 17:03:15 +0800 you wrote:
> From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> 
> Adds a boundary check to prevent negative basetime input from user
> while configuring taprio.
> 
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> Signed-off-by: Lai Peter Jun Ann <jun.ann.lai@intel.com>
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: Add check for taprio basetime configuration
    https://git.kernel.org/netdev/net-next/c/6d534ee057b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
