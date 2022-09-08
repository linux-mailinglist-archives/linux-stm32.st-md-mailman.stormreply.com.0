Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A25B16C1
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Sep 2022 10:20:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5479AC63328;
	Thu,  8 Sep 2022 08:20:21 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7437C63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 08:20:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 067A1B8204D;
 Thu,  8 Sep 2022 08:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8A06C433D7;
 Thu,  8 Sep 2022 08:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662625217;
 bh=tt5pNw545GGdWzNyJNvr5Ao3R4SZx3Fnq+mjQE1DDa4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QTuuvW4pJR3vRD1U0L8w4dClBOWPHwES7PbNmb8t2VbTCkXFLO+/JYckTmxZHvX1n
 V+cqGUfuxcJbhuYKbidIayuTpz1UmILDKtWZSbxoyWVwazHQYe4QZQFHwRLluqHLBo
 usKH+cS6ESkWPvn2hsOeynhL7MBlI4AXVOr9za6/zsBAxyIIZVKAhXWeXbRnNAipLT
 gryjSKr5r8PwD9tlqmDwtyYHgM1w8WMdLM2ZxRQC53ZhDy3xmJr6JCKuvRlImI1bg8
 VrFlingN7rDZyYvmx7seVOySrQOBICaKBfAntsF4eVBY/UIG1KnocEzHSsG/ta82+u
 shgGz8HA/iRaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 926FAC73FEF; Thu,  8 Sep 2022 08:20:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166262521759.28234.1058076387389491092.git-patchwork-notify@kernel.org>
Date: Thu, 08 Sep 2022 08:20:17 +0000
References: <20220905130155.193640-1-kurt@linutronix.de>
In-Reply-To: <20220905130155.193640-1-kurt@linutronix.de>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 vivien.didelot@gmail.com, edumazet@google.com, olteanv@gmail.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Disable
	automatic FCS/Pad stripping
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon,  5 Sep 2022 15:01:55 +0200 you wrote:
> The stmmac has the possibility to automatically strip the padding/FCS for IEEE
> 802.3 type frames. This feature is enabled conditionally. Therefore, the stmmac
> receive path has to have a determination logic whether the FCS has to be
> stripped in software or not.
> 
> In fact, for DSA this ACS feature is disabled and the determination logic
> doesn't check for it properly. For instance, when using DSA in combination with
> an older stmmac (pre version 4), the FCS is not stripped by hardware or software
> which is problematic.
> 
> [...]

Here is the summary with links:
  - [net-next,v1] net: stmmac: Disable automatic FCS/Pad stripping
    https://git.kernel.org/netdev/net-next/c/929d43421ee5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
