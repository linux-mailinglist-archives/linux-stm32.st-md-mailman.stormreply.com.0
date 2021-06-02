Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954C397D7C
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jun 2021 02:10:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 200D0C57B74;
	Wed,  2 Jun 2021 00:10:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A963C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 00:10:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7E16E613E7;
 Wed,  2 Jun 2021 00:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622592608;
 bh=SyFNUV2l6tmGkPboaz4rroWwDLleamp7lPyj+ufFBp4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hMi/62+26cGvHnljDHuZD5x0W4LJfeyuMxfOPCm7vbLWuvoTpWNkkDrdrAlsEcf4T
 v2djqhzX+MlAdxtPChLrl6bParQj93WukxjNkXV5EXeQxs8T4rJPfAV8P7No2/Jp4R
 NgDLaCuHS/EtDfUsw4jMdOgiO7hznUBY7Y00W8yfgNtLX8HA1epG55RRudW9JtVP72
 mXbtzwRxDjZFef7+QRZKP2S+eQ/GQD4pgZbokwRqY25gKS1JpKg3rxOKOB1ES9MJrQ
 Ts6MpjCNYY2pqlR8M0cMGRaabRGYzQ36XumiEcK9YKvPuF0T3v6NJCbkG3N8qfprg2
 h390ifS4Qwiow==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7703760A6F;
 Wed,  2 Jun 2021 00:10:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162259260848.22595.3435009042583708673.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jun 2021 00:10:08 +0000
References: <20210601135235.1058841-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210601135235.1058841-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: enable platform
 specific safety features
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue,  1 Jun 2021 21:52:35 +0800 you wrote:
> On Intel platforms, not all safety features are enabled on the hardware.
> The current implementation enable all safety features by default. This
> will cause mass error and warning printouts after the module is loaded.
> 
> Introduce platform specific safety features flag to enable or disable
> each safety features.
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: enable platform specific safety features
    https://git.kernel.org/netdev/net-next/c/5ac712dcdfef

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
