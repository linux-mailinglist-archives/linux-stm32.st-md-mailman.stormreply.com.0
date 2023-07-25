Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DE8760E04
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 11:10:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE095C6B442;
	Tue, 25 Jul 2023 09:10:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0B22C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 09:10:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EB4F6156D;
 Tue, 25 Jul 2023 09:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C5DC433A9;
 Tue, 25 Jul 2023 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690276225;
 bh=+I3MrAkozYgkZ/ft0JFCrt2ovq1ZVfIjLtRLYDP33Co=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=RpOeLjq0O8uuZNCUT4tikvPjADpnk+kFZFoJVVM/QcmqtAYeffGu3ONdhASc9sXYm
 djR9jWSd1hMWApUKRc3D6nanYBiTd0HkVir3lLUP+9xuAQgrH55mHQD8vKLz5KSSsG
 boDmbuZoALT+F0txVEPrGeaEDH/SImFOv7WTF67TE89j6QSvIWJ2IZjXD6FUlIEiJX
 cD4+BNjXPtiRAJhWfx6qtDbjd49qY96ESkFqsj5GYsGXbiScbz3GHvySjzNx/zmAbO
 h7v9KBWhCe6paxAtWVhOjlft3V16p7s9bSu/Fx8HsYUTfP23b+i3rLuNc1+4f5R4Ir
 HkWfCQohpD2Ng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CCDC7C595D0; Tue, 25 Jul 2023 09:10:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169027622483.7192.11650697551791902221.git-patchwork-notify@kernel.org>
Date: Tue, 25 Jul 2023 09:10:24 +0000
References: <20230721-stmmac-tx-workaround-v1-1-9411cbd5ee07@axis.com>
In-Reply-To: <20230721-stmmac-tx-workaround-v1-1-9411cbd5ee07@axis.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, kernel@axis.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Apply redundant write
 work around on 4.xx too
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 21 Jul 2023 15:39:20 +0200 you wrote:
> commit a3a57bf07de23fe1ff779e0fdf710aa581c3ff73 ("net: stmmac: work
> around sporadic tx issue on link-up") worked around a problem with TX
> sometimes not working after a link-up by avoiding a redundant write to
> MAC_CTRL_REG (aka GMAC_CONFIG), since the IP appeared to have problems
> with handling multiple writes to that register in some cases.
> 
> That commit however only added the work around to dwmac_lib.c (apart
> from the common code in stmmac_main.c), but my systems with version
> 4.21a of the IP exhibit the same problem, so add the work around to
> dwmac4_lib.c too.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: Apply redundant write work around on 4.xx too
    https://git.kernel.org/netdev/net/c/284779dbf4e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
