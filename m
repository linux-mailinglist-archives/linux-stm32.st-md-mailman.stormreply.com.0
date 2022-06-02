Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1D53BDF3
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jun 2022 20:20:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC192C0D2C2;
	Thu,  2 Jun 2022 18:20:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06E1BC03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 18:20:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 726A2B82130;
 Thu,  2 Jun 2022 18:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E11DC34114;
 Thu,  2 Jun 2022 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654194014;
 bh=aKofY/xii58Ay5t+eF5YX3hdOSJaq5bVkJH0FJWL58I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=McC1kwoOT0LAQdbQKyEAsr3Ke8BjvnMABZ8Xjgo4oInbmx0HniAiD4t6/m2tMG4es
 V/dilRUwGPXB2VL6hyim0nKfiKpkvmbq1EF8WumWDN6SOber7M9awdrb+4FP9YiWMO
 6xbEFNRkqQSITEmJUbcQLaKlmVvE2fC3+djA3okXre5krYMc+bvrEzktXfDxw3t0fX
 5aJtuy2YsP19+ARXPauDi9Iyu22tAlNlhQtxMTS3ZEVSOse8vXV9Bt3eAckwHQrGlw
 +heeqB97twnrEmv7pxj/Y36K64wKm3tUMlirYYRFcCuCmP8N4X2aVxh7sUiZGU66cY
 KrpC2YTrsS9Kw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 712DFF03953; Thu,  2 Jun 2022 18:20:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165419401446.24492.827425543522994299.git-patchwork-notify@kernel.org>
Date: Thu, 02 Jun 2022 18:20:14 +0000
References: <20220602073507.3955721-1-michael.wei.hong.sit@intel.com>
In-Reply-To: <20220602073507.3955721-1-michael.wei.hong.sit@intel.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Cc: vee.khee.wong@linux.intel.com, linux-kernel@vger.kernel.org,
 weifeng.voon@intel.com, netdev@vger.kernel.org, tee.min.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next 1/1] stmmac: intel: Add RPL-P PCI ID
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

On Thu,  2 Jun 2022 15:35:07 +0800 you wrote:
> Add PCI ID for Ethernet TSN Controller on RPL-P.
> 
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [net-next,1/1] stmmac: intel: Add RPL-P PCI ID
    https://git.kernel.org/netdev/net/c/83450bbafebd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
