Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A027C579164
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jul 2022 05:40:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52831C0D2B9;
	Tue, 19 Jul 2022 03:40:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC19EC03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 03:40:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB8F2B81906;
 Tue, 19 Jul 2022 03:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B797C341D3;
 Tue, 19 Jul 2022 03:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658202014;
 bh=Ha+G7/QZOBlSIVc+THxNSr3mjDzy4K0v97LH89eHzqE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ctj02x3oBaDnFmMd+kKobIerGKxk0/SGRgEQq3YQDp3RzOOg5DBiPZS/2GHZ+MhlO
 243812RrjLPHgwtOS5EuzXPAj15bPOrFnDeQdt8ZXCRar1fBfrFEG62JMdALNYrbW6
 Fr6505jakd4QjY0n28/ppisuhCdGysLfyviJh7lqZlQBLWSd4BaKxaCwJmUVMa40RP
 hKGHgd7jLGct8I4oySBoxueDIfTDlWVFVOx8FRmCzSeumNGxekDH5ipQ08rX4evxD/
 Ln8ZUtE7cJCH2uEYuivLFf62dyFts7oUTz7Ic7ARJ8EmIc92iWoFTwFFUMVGDlsEL4
 R7GDF3niYREWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 32ADBE451BD; Tue, 19 Jul 2022 03:40:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165820201420.29134.3465900880511304469.git-patchwork-notify@kernel.org>
Date: Tue, 19 Jul 2022 03:40:14 +0000
References: <20220715122402.1017470-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20220715122402.1017470-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: remove redunctant
	disable xPCS EEE call
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 15 Jul 2022 20:24:02 +0800 you wrote:
> Disable is done in stmmac_init_eee() on the event of MAC link down.
> Since setting enable/disable EEE via ethtool will eventually trigger
> a MAC down, removing this redunctant call in stmmac_ethtool.c to avoid
> calling xpcs_config_eee() twice.
> 
> Fixes: d4aeaed80b0e ("net: stmmac: trigger PCS to turn off on link down")
> Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: remove redunctant disable xPCS EEE call
    https://git.kernel.org/netdev/net/c/da791bac104a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
