Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3026C54DCB2
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 10:20:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D633DC5E2CC;
	Thu, 16 Jun 2022 08:20:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AC1DC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 08:20:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B5AD61D3F;
 Thu, 16 Jun 2022 08:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60F48C3411B;
 Thu, 16 Jun 2022 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655367616;
 bh=dB/CPPMhNm1buUrV4IgV1CCH8HWEcDujPAHshjsbK04=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nCzhGbpDvd2LNSYKc2BtB7/N94nxXV17DzGact8Wx1iYSFSTYJk9/2HedKZYA/wEn
 vLNIs1qRodYLq6KXei3EsrajIVEiPPXdEybjbx/EV8IYInvOOuII/D18mu4HhFZCfp
 FH8gXMulbvzByI38ojJQGUoREtTDlNuWlVE37KB1Uhf2W3zIsQDYu2bLQ5AuzSXzY5
 QWgdm+wLDkiflfM5CxT8c70O8uK25Vbvw20+RkKssrfh1aeIBR63L1/PR5JbUZiZCn
 vFWp0SlspscG8/H5RZS9yGtEBWdST/9prIkc+v4RwIuNYekuyBnastmWt74LpflRrv
 +58fOG1ASLZEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3C581FD99FF; Thu, 16 Jun 2022 08:20:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165536761624.29035.5999130282955171127.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jun 2022 08:20:16 +0000
References: <20220614112228.1998-1-ansuelsmth@gmail.com>
In-Reply-To: <20220614112228.1998-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH v2 1/2] net: ethernet: stmmac:
 add missing sgmii configure for ipq806x
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

This series was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 14 Jun 2022 13:22:27 +0200 you wrote:
> The different gmacid require different configuration based on the soc
> and on the gmac id. Add these missing configuration taken from the
> original driver.
> 
> Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  1 +
>  .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 93 +++++++++++++++----
>  2 files changed, 78 insertions(+), 16 deletions(-)

Here is the summary with links:
  - [net-next,v2,1/2] net: ethernet: stmmac: add missing sgmii configure for ipq806x
    https://git.kernel.org/netdev/net-next/c/9ec092d2feb6
  - [net-next,v2,2/2] net: ethernet: stmmac: reset force speed bit for ipq806x
    https://git.kernel.org/netdev/net-next/c/8bca458990dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
