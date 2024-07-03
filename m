Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2492553C
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 10:20:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D69BC71282;
	Wed,  3 Jul 2024 08:20:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67A40C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 08:20:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0FB6C62117;
 Wed,  3 Jul 2024 08:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1EE1C4AF0A;
 Wed,  3 Jul 2024 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719994829;
 bh=viXPB+KN5mQIGD+W6w4r2tqDMk4TlmS7iJ9UlZtlFm4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Apk2MmmVn9sh9RMoI+mrNHIUFT5A4cTKWdg5dgHjyLdU8jxwhJEHcWj9+6VTwilqq
 D/0Q2KNo3gs4k5srJB3RlwPXbu3t84/CoQh0oLG2XrdDAEWCSSu9AmB14EYWKilmi7
 b7adrNZb4nUPELlwXrQbuTpqMRhFpWPRQdzwNCqn1VxYYMEGPGE8L8ep12DLNFH8BE
 3ftJ0TnmMPuoJ9unOFFJBj3jUrEhNWS/S9rdwRusmxkHTwWjGLDegS45c3uc/k5P9+
 JAbw7Z44Mc8c+gC7gEXQoB3zYGTkK6psQaQ2/F7TMkomw2Lkd69q8kbyxVnushmf74
 Z6oJTaIff2GfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A083AC43612; Wed,  3 Jul 2024 08:20:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171999482965.7447.6028188737402874466.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jul 2024 08:20:29 +0000
References: <20240701081936.752285-1-0x1207@gmail.com>
In-Reply-To: <20240701081936.752285-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com, jpinto@synopsys.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 jun.ann.lai@intel.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: enable HW-accelerated
 VLAN stripping for gmac4 only
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
by David S. Miller <davem@davemloft.net>:

On Mon,  1 Jul 2024 16:19:36 +0800 you wrote:
> Commit 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN
> stripping") enables MAC level VLAN tag stripping for all MAC cores, but
> leaves set_hw_vlan_mode() and rx_hw_vlan() un-implemented for both gmac
> and xgmac.
> 
> On gmac and xgmac, ethtool reports rx-vlan-offload is on, both MAC and
> driver do nothing about VLAN packets actually, although VLAN works well.
> 
> [...]

Here is the summary with links:
  - [net,v1] net: stmmac: enable HW-accelerated VLAN stripping for gmac4 only
    https://git.kernel.org/netdev/net/c/8eb301bd7b0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
