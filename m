Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC67502CD
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 11:20:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBB76C6B459;
	Wed, 12 Jul 2023 09:20:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46823C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 09:20:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 148DB61719;
 Wed, 12 Jul 2023 09:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B844C433C7;
 Wed, 12 Jul 2023 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689153621;
 bh=Ex71MzvqnoPSUmJRcXm5WZyi4T6gvlCMkVAhvg0LzGE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P2zHdNl2EydNK3q5sGc+nCH2LtNPsa7JIIjoTAxTlKKh7qQ07gNuX6wUisB9DoVQl
 ENjdh05laikc2HkDUjtU7cMbtKj7eEQ9uqVDmfk5khfmej5ymKVwe/u0C9BaK4yAHb
 oUD6ujNzjFukKAZgg9IcurQYyyPx78FEKUsaDX/q90pS3f9EpBA5TnZ7RfdrvZrGYh
 M9bZqdA3aBKhP1bLtCyGjciDzFohNdIJO7ZPKYpeHQ1kaSvI3tyBJWwfPUhkcnsTk1
 hI89322GvO7MdbIPsy4Gi2916nDEb2ydr8eVbynXyDDuoLMz91KWazPkk620WNtl/G
 +4jUjPfrA1mEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 47AD5E29F44; Wed, 12 Jul 2023 09:20:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168915362128.1981.13684727730813685010.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jul 2023 09:20:21 +0000
References: <20230710201636.200412-1-ahalaney@redhat.com>
In-Reply-To: <20230710201636.200412-1-ahalaney@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 simon.horman@corigine.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac:
 dwmac-qcom-ethqos: Improve error handling
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

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 10 Jul 2023 15:06:36 -0500 you wrote:
> This series includes some very minor quality of life patches in the
> error handling.
> 
> I recently ran into a few issues where these patches would have made my
> life easier (messing with the devicetree, dependent driver of this
> failing, and incorrect kernel configs resulting in this driver not
> probing).
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: stmmac: dwmac-qcom-ethqos: Use of_get_phy_mode() over device_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/a8aa20a64ef2
  - [net-next,v2,2/3] net: stmmac: dwmac-qcom-ethqos: Use dev_err_probe()
    https://git.kernel.org/netdev/net-next/c/b2f3d915b4fe
  - [net-next,v2,3/3] net: stmmac: dwmac-qcom-ethqos: Log more errors in probe
    https://git.kernel.org/netdev/net-next/c/27381e72a2db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
