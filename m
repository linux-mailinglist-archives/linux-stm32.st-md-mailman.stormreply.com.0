Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 166E973AEB3
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 04:40:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7889C65E42;
	Fri, 23 Jun 2023 02:40:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 774AEC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 02:40:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 280A461952;
 Fri, 23 Jun 2023 02:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DCB4C433CB;
 Fri, 23 Jun 2023 02:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687488021;
 bh=4hiiv6LScRba5gRm6+zidOGp6fL3y8sB78Jonq7Yi5o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Fx6mJKzWzurGakGjbLbiZNJRv8ANfgoWDY1jbcuzIFoyq9xPlZwGpF099Bu0ycueW
 rRBkXpQ8LrNUO6zLMsswwxoCAoqxIn4dxPDQQekEun9+ObmSAMdOI0x+5mTNlEzidG
 VpfsuoAs2/H5hF+mDOiJzWAynk4Kn5GpNFCLxqrVoW2KIWrFiGjXDhXMl8S/SjH1R4
 z4lIKs4FJqTdh1gPvATsRHfJpz6gGYyIr9UvmwgnYe/v99dMgY3MvzALCOSU47CHVI
 6UuPqak4OYTYx68mpIxMfwsc3rSj5xsjIa8i8wz1XUg7Nf9ao6WhsJ/kbtiNFnYLUj
 vYvM8wMA7BdlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D7DEAC691EE; Fri, 23 Jun 2023 02:40:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168748802087.26940.10386965323581685154.git-patchwork-notify@kernel.org>
Date: Fri, 23 Jun 2023 02:40:20 +0000
References: <20230621135537.376649-1-brgl@bgdev.pl>
In-Reply-To: <20230621135537.376649-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, bartosz.golaszewski@linaro.org,
 junxiao.chang@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, netdev@vger.kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix double serdes
	powerdown
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
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 21 Jun 2023 15:55:37 +0200 you wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Commit 49725ffc15fc ("net: stmmac: power up/down serdes in
> stmmac_open/release") correctly added a call to the serdes_powerdown()
> callback to stmmac_release() but did not remove the one from
> stmmac_remove() which leads to a doubled call to serdes_powerdown().
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix double serdes powerdown
    https://git.kernel.org/netdev/net/c/c4fc88ad2a76

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
