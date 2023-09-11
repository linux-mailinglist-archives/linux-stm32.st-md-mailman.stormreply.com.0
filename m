Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6B79A47F
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 09:30:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2659C6B467;
	Mon, 11 Sep 2023 07:30:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ADE6C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 07:30:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6CAC3B80EA3;
 Mon, 11 Sep 2023 07:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CD5EC433C9;
 Mon, 11 Sep 2023 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694417450;
 bh=WM/Let72K1wMRwb05Q5dSJO19Qx8XAwYxUcOvPl3aVI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IgyOQQajD2aHRq+JcNAxxLIAdTPiOJX6tiHAxrlsa/rOl9CZR0ygkhFiIHha48PVv
 UIZXBTDP8hQXPZsLuPn8RA+UYWAkaMmgSWMx5OnprjqiZilRA4h5oIwnnHWb+OzdBL
 Zmgd0YK4F/pe2bD4A0z7QMoFxuqW2VTY78NPkIXtnN6W+yEFJP2nIQRCHa74k1UdXM
 zqP7h+38qAKbPABBzlXRAkl98My7qmL6PcVKHsV0f5G0mU+NTRTbiunGe3LemNR6LX
 KH02KHr55lzk/GAuZExTu5FWqOlIWgFlK5n3JuHEC9KprIqWiWD0LbJ8qRWRhkA3f+
 b2n5ZJmFyRwfw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E0510C00446; Mon, 11 Sep 2023 07:30:49 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169441744991.31104.1654820093252613008.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 07:30:49 +0000
References: <20230907-stmmac-coaloff-v2-1-38ccfac548b9@axis.com>
In-Reply-To: <20230907-stmmac-coaloff-v2-1-38ccfac548b9@axis.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, maxtram95@gmail.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, kernel@axis.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: fix handling of zero
 coalescing tx-usecs
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

On Thu, 7 Sep 2023 12:46:31 +0200 you wrote:
> Setting ethtool -C eth0 tx-usecs 0 is supposed to disable the use of the
> coalescing timer but currently it gets programmed with zero delay
> instead.
> 
> Disable the use of the coalescing timer if tx-usecs is zero by
> preventing it from being restarted.  Note that to keep things simple we
> don't start/stop the timer when the coalescing settings are changed, but
> just let that happen on the next transmit or timer expiry.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: fix handling of zero coalescing tx-usecs
    https://git.kernel.org/netdev/net/c/fa60b8163816

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
