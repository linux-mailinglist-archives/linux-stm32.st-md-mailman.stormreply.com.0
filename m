Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7E4F1431
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Apr 2022 14:00:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B457C6047C;
	Mon,  4 Apr 2022 12:00:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7504C5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Apr 2022 12:00:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60B9060FF5;
 Mon,  4 Apr 2022 12:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37741C3411B;
 Mon,  4 Apr 2022 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649073615;
 bh=qUidViL1LvhqdQqpS2FVmNOwiqg49fGf8cAlxjDQ3qI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fN8sCUeazir5IPtGfNoEkbMwx1QZQNzUj9gtq9xB3mDd5r2WoK8Qj3DCFTwPe8EkH
 nREXReexspqQYlTg7d2SnEuP4owi3CFCXusMxBAqN2AdhG0JZjfW3n97Uvbpu+YXmy
 nbd/zqz/AIPeioxzx4vGksDnUVoKHTEQB+Po5HjGA31Ne9cXR7hYqrcqegrmVivoKP
 Qz83X9nCm6yXdxCsy9H1PgqWLBGYypZtGTPJ0zUx1GOAOIVlRXYFR4N2Qma0CNmOHT
 jfv/kLKAaXR7Orx4wN/OaKPpFVRyJLqLUZfzoSs6iR+6xOOkp2/UHdQ6MPZKY31Lih
 Ez2gRSUrk5nNA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 199CCE85B8C; Mon,  4 Apr 2022 12:00:15 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164907361510.19769.8704118113413570807.git-patchwork-notify@kernel.org>
Date: Mon, 04 Apr 2022 12:00:15 +0000
References: <20220403140202.2191516-1-trix@redhat.com>
In-Reply-To: <20220403140202.2191516-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: dwmac-loongson: change
 loongson_dwmac_driver from global to static
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
by David S. Miller <davem@davemloft.net>:

On Sun,  3 Apr 2022 10:02:02 -0400 you wrote:
> Smatch reports this issue
> dwmac-loongson.c:208:19: warning: symbol
>   'loongson_dwmac_driver' was not declared.
>   Should it be static?
> 
> loongson_dwmac_driver is only used in dwmac-loongson.c.
> File scope variables used only in one file should
> be static. Change loongson_dwmac_driver's
> storage-class-specifier from global to static.
> 
> [...]

Here is the summary with links:
  - stmmac: dwmac-loongson: change loongson_dwmac_driver from global to static
    https://git.kernel.org/netdev/net/c/2baed4f9b085

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
