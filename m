Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4E344C320
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 15:40:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70D33C5EC71;
	Wed, 10 Nov 2021 14:40:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AEDEC5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 14:40:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9029561264;
 Wed, 10 Nov 2021 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636555208;
 bh=ERa8z50UzvcG4hoR2G8XB2JonjF2th8Q8cVgfCVS+Ek=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YVD3Hlqwf9ikZ4n1AxK7NU9zWluRyDZ7Z5C2+8Ae/i/BLVKz7/Hqj38qV1mRO4rtZ
 b+GQ3H3mJMxEWTcjOxC6vbPAgbOF43GwRubeMooTxGiuKfHRFkOBG/b4KrzuPp1iL3
 rCtLA1dvc8roBgIpEYB5ZeREjbfyIaWhjtE98M6Fq/so3bflO1Y0QwvUz8qyLMA68K
 L3hxJFaoX2J0kUw5J7UcFc3SQJjLD9DoI0d+ofI8o2BSG8Yb03mQCa+mUqv2XHLVZe
 T+G8SwVzCL5EQDgoniUnhkI9ic4ISH1Mh3MeCryzqqnV4kER6MXsBVoJaQn75yxZLw
 CwNTkI87/gCkg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7F89A60A5A;
 Wed, 10 Nov 2021 14:40:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163655520851.19242.2773768133414182756.git-patchwork-notify@kernel.org>
Date: Wed, 10 Nov 2021 14:40:08 +0000
References: <20211108202854.1740995-1-vladimir.oltean@nxp.com>
In-Reply-To: <20211108202854.1740995-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: yannick.vignon@nxp.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, xiaoliang.yang_1@nxp.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: allow a tc-taprio
	base-time of zero
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

On Mon,  8 Nov 2021 22:28:54 +0200 you wrote:
> Commit fe28c53ed71d ("net: stmmac: fix taprio configuration when
> base_time is in the past") allowed some base time values in the past,
> but apparently not all, the base-time value of 0 (Jan 1st 1970) is still
> explicitly denied by the driver.
> 
> Remove the bogus check.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: allow a tc-taprio base-time of zero
    https://git.kernel.org/netdev/net/c/f64ab8e4f368

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
