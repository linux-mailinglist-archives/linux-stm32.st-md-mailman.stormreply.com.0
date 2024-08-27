Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B50399618C0
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 22:47:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61537C6DD9A;
	Tue, 27 Aug 2024 20:47:33 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6532EC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 20:47:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3EF6BA429CA;
 Tue, 27 Aug 2024 20:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5324C4DE03;
 Tue, 27 Aug 2024 20:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724791230;
 bh=amNQT/VxWUy7VWv80n0WN7qgd2O+vHViMddE7CoLX4o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uORUqKvYIKr0CkNsCVy+SoZhql6MTFE24wL5FoidSG4j77xWjy7fL3P5Ul1bjJa2y
 UxUSKCPedbg51ruQeZTLZRFVwdAbrF3neGHd1oCZ147SesZEq3V41Wh1Y8APOAqZ6v
 3nADBVjZBLhC0g3qIkyLHWKAZL5SspC7w/KQesIBe8Pmd17CCbPKa1hxgwxGA3BzKw
 N9tNgFfSkREpQE0Y96Gi8GB8OMaxnYJu8eNiH44K1PUBLmMw7JcIdhzOdHl7cDOb1k
 rMz1PSdBnioiR0BNcT9geagPICu/HqAlv3F751TGmxUeJDqB64EZVI57J5XCeypyug
 wqEpQ/9exHOpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 341353822D6D; Tue, 27 Aug 2024 20:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172479123102.757308.5208156223047265532.git-patchwork-notify@kernel.org>
Date: Tue, 27 Aug 2024 20:40:31 +0000
References: <20240823141318.51201-1-detlev.casanova@collabora.com>
In-Reply-To: <20240823141318.51201-1-detlev.casanova@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, kernel@collabora.com, heiko@sntech.de,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, david.wu@rock-chips.com, kuba@kernel.org,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/3] Add GMAC support for rk3576
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 Aug 2024 10:11:12 -0400 you wrote:
> Add the necessary constants and functions to support the GMAC devices on
> the rk3576.
> 
> Changes since v2:
> - Fix typos in RK3576_GMAC_CLK_SELET_*
> - Also fix typo for RK3588_GMAC_CLK_SELET_*
> 
> [...]

Here is the summary with links:
  - [v3,1/3] ethernet: stmmac: dwmac-rk: Fix typo for RK3588 code
    https://git.kernel.org/netdev/net-next/c/78a60497a020
  - [v3,2/3] dt-bindings: net: Add support for rk3576 dwmac
    https://git.kernel.org/netdev/net-next/c/299e2aefb159
  - [v3,3/3] ethernet: stmmac: dwmac-rk: Add GMAC support for RK3576
    https://git.kernel.org/netdev/net-next/c/f9cc9997cba9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
