Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19377B214
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 09:10:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F2F7C6B472;
	Mon, 14 Aug 2023 07:10:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF510C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 07:10:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B15562FAF;
 Mon, 14 Aug 2023 07:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67F33C433D9;
 Mon, 14 Aug 2023 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691997023;
 bh=HVwZ5wQmMpQjBYIgbnBdLCimB2FJTBsZAHAd8NHFlwU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=D6N0ZqGBtjjYTYg0BF0LJnUeCjtg4w3jWMYjtw95+kfNBjRFWx5QaHFRpbQM8IdRa
 ytiRdQFPHo9pe/GESoSk5fhjP1RjVDtqKJhAew4iFqQaSHBgKYPgg6CWANE9xTh/ZD
 vbQe6jQwufRhXDioJqe2ObFcC++cB0HT1ElEK+VoI0aO9Fy6r9hN9wPEUTHsd4q2cI
 CYhiJl2Lvsm4mY4G7Nwj5y+evn9AhXRzDZXoZpH6tPW+MpiHBfFM7coiy86B0fe+9A
 NOVsmpYrWaGDY4v03RvUpxwyiG4Rl/iD6tY5IubxpvYJe31RpA1zjP/kS7WRezAxO0
 qCbCFCsh4oywQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4DBFAC395F3; Mon, 14 Aug 2023 07:10:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169199702331.11756.17114238819765963207.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 07:10:23 +0000
References: <20230811125139.284272-1-0x1207@gmail.com>
In-Reply-To: <20230811125139.284272-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, horms@kernel.org, jpinto@synopsys.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/1] net: stmmac: xgmac: show
 more MAC HW features in debugfs
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

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri, 11 Aug 2023 20:51:39 +0800 you wrote:
> 1. Show TSSTSSEL(Timestamp System Time Source),
> ADDMACADRSEL(additional MAC addresses), SMASEL(SMA/MDIO Interface),
> HDSEL(Half-duplex Support) in debugfs.
> 2. Show exact number of additional MAC address registers for XGMAC2 core.
> 3. XGMAC2 core does not have different IP checksum offload types, so just
> show rx_coe instead of rx_coe_type1 or rx_coe_type2.
> 4. XGMAC2 core does not have rxfifo_over_2048 definition, skip it.
> 
> [...]

Here is the summary with links:
  - [net-next,v1,1/1] net: stmmac: xgmac: show more MAC HW features in debugfs
    https://git.kernel.org/netdev/net-next/c/58c1e0bace59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
