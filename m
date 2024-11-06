Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0735E9BDBB8
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 03:00:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA5DFC71292;
	Wed,  6 Nov 2024 02:00:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78B84C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 02:00:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 341585C4BB4;
 Wed,  6 Nov 2024 01:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97164C4CECF;
 Wed,  6 Nov 2024 02:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730858421;
 bh=iDGn6cF39S+5ch2f8pg8ENjGiBRJzy0HvH23scQjhcQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QPawd+Fx9U769Oe0hH0VRncvrDRfzDHq5qBMs7pShUOKH+0Xrzmx7OoJrTTJhcUHC
 0IcO6mQpKWVUE/z//2UqZH8lE+UtMZ1hjJBN1Pr8lRj+IiNIQ09LKwmGie5eMkYDSJ
 81PsQJu7PSsylnThW2p8U557I2VQVL8yKTS6m0lSL8oFBLXwVLgu93t1bOHpPFvPkC
 tlaNXJONb9+I5Djpm7cB71PiAlh+EAQu/xrUCbKEvfsY+FXGBzEzxDJc1hCmtTUmKN
 VIJZrX09TUDyPoR6T7HA4PQHyQWAgAcNXVPM0wrUYf92G5ZXj5EGyvuCq9pJ3Hxlfp
 yNpo92C769Brg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE12A3809A80; Wed,  6 Nov 2024 02:00:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173085843050.764350.5609116722213276708.git-patchwork-notify@kernel.org>
Date: Wed, 06 Nov 2024 02:00:30 +0000
References: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
In-Reply-To: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: andrew@lunn.ch, edumazet@google.com, guoren@kernel.org, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, joabreu@synopsys.com, drew@pdp7.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, emil.renner.berthing@canonical.com, davem@davemloft.net,
 wefu@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next v7 0/2] Add the dwmac driver
 support for T-HEAD TH1520 SoC
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

On Sun, 03 Nov 2024 08:57:58 -0800 you wrote:
> This series adds support for dwmac gigabit ethernet in the T-Head TH1520
> RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.
> 
> The gigabit ethernet on these boards does need pinctrl support to mux
> the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
> related dts patches are in linux-next. However, they are not yet in
> net-next/main.
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/2] dt-bindings: net: Add T-HEAD dwmac support
    https://git.kernel.org/netdev/net-next/c/f920ce04c399
  - [net-next,v7,2/2] net: stmmac: Add glue layer for T-HEAD TH1520 SoC
    https://git.kernel.org/netdev/net-next/c/33a1a01e3afa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
