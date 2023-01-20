Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B89675119
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jan 2023 10:30:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B67CFC6904C;
	Fri, 20 Jan 2023 09:30:22 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C725C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jan 2023 09:30:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD192B82146;
 Fri, 20 Jan 2023 09:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0D1FC433EF;
 Fri, 20 Jan 2023 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674207019;
 bh=97eI/DzcEUwW2P+NrxiMBczLVyLZV62pIyAx6vShmiQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aKs5JidAhcuZ+EXnrOFIMksDiys/RhVMeErD4zr60UiIuTIXEpL8fJjksgnDMSqNv
 oQCjZKthm/KIzXJdm64DJCTvS8fhvCLb0AkuvuJargLtHLVwNLodnfQDj+ggbJ7ZEI
 ewqSMnRZXUy1OVXhL+ktTMuv7tMJV7EW+9T8Uivxzzi36dfnYIpmJss2n8vuI1LnIs
 Vto+WIEr3tPHGg1H8ScMCpPaOIDvwYBNh9XXYfSh2TcFCA5IMrICc7x9XJZOnzMcw1
 B6tSAl8KdMPBg6odc4vMWxiU0DrfoUDhRvM8UqODB4Mj+ps9Chx8Nh+eDIeiufua1g
 4p6zDDdA8E8JA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D1A7BE54D2B; Fri, 20 Jan 2023 09:30:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167420701885.26805.13129690985056892754.git-patchwork-notify@kernel.org>
Date: Fri, 20 Jan 2023 09:30:18 +0000
References: <20230118165638.1383764-1-ahalaney@redhat.com>
In-Reply-To: <20230118165638.1383764-1-ahalaney@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: ncai@quicinc.com, vee.khee.wong@linux.intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, vijayakannan.ayyathurai@intel.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, michael.wei.hong.sit@intel.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, noor.azura.ahmad.tarmizi@intel.com
Subject: Re: [Linux-stm32] [PATCH net RESEND] net: stmmac: enable all safety
	features by default
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
by David S. Miller <davem@davemloft.net>:

On Wed, 18 Jan 2023 10:56:38 -0600 you wrote:
> In the original implementation of dwmac5
> commit 8bf993a5877e ("net: stmmac: Add support for DWMAC5 and implement Safety Features")
> all safety features were enabled by default.
> 
> Later it seems some implementations didn't have support for all the
> features, so in
> commit 5ac712dcdfef ("net: stmmac: enable platform specific safety features")
> the safety_feat_cfg structure was added to the callback and defined for
> some platforms to selectively enable these safety features.
> 
> [...]

Here is the summary with links:
  - [net,RESEND] net: stmmac: enable all safety features by default
    https://git.kernel.org/netdev/net/c/fdfc76a116b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
