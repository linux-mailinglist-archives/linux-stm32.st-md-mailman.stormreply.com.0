Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F485FF9D5
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Oct 2022 13:40:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77C7FC6411F;
	Sat, 15 Oct 2022 11:40:18 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41F6EC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Oct 2022 11:40:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A18DDB8076B;
 Sat, 15 Oct 2022 11:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EEFCC433D6;
 Sat, 15 Oct 2022 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665834015;
 bh=HWzOIdm/SXZX57mUR2lF9IlBwqXaNsfG5gQlazsAX14=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kJmyrpxEUYr0l9swkQYcPX1k8aIP0Oky7kUnYWUtwOA38ZYLW447BUrBQm86FAWM9
 6ukBK60mAOXn7GmiEjfIoWglN71Nr0fqAEvBf5chbUOwiS0E7p2LLqkVwEUlkhyQPZ
 xjzwmjNGR4cMmPS2VG4ZKWWqArfse6DelXmID8GfSMBW+fzD2XcfsJ/5lb6iNImD+O
 84Rv9TzjlE1JxF5dK1JfUJ4P5PSDv2Qg1EWjYRiz6uT8GS6KVvYd0U7jfEYOQw+BlQ
 sncToAKBKSVLvIMCeloNZitRuWx0Bz1N+ChBBzsykZiJdMldG8osYhk+gPA51Y4npa
 +n3ZyrQnfcSFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 30B4BE4D00C; Sat, 15 Oct 2022 11:40:15 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166583401519.3126.7962999627489450739.git-patchwork-notify@kernel.org>
Date: Sat, 15 Oct 2022 11:40:15 +0000
References: <20221014144729.1159257-1-shenwei.wang@nxp.com>
In-Reply-To: <20221014144729.1159257-1-shenwei.wang@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux@armlinux.org.uk, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH NET v6 0/2] net: phylink: add
	phylink_set_mac_pm() helper
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

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 14 Oct 2022 09:47:27 -0500 you wrote:
> Per Russell's suggestion, the implementation is changed from the helper
> function to add an extra property in phylink_config structure because this
> change can easily cover SFP usecase too.
> 
> Changes in v6:
>  - update the fix tag hash and format
> 
> [...]

Here is the summary with links:
  - [NET,v6,1/2] net: phylink: add mac_managed_pm in phylink_config structure
    https://git.kernel.org/netdev/net/c/96de900ae78e
  - [NET,v6,2/2] net: stmmac: Enable mac_managed_pm phylink config
    https://git.kernel.org/netdev/net/c/f151c147b3af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
