Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E893A9A940
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 11:59:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E33FC78F68;
	Thu, 24 Apr 2025 09:59:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2E7BC7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 09:59:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1F04F68455;
 Thu, 24 Apr 2025 09:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926ADC4CEE3;
 Thu, 24 Apr 2025 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745488792;
 bh=0tvvSnk8ULXJWC8UVXdj328qfDMVzDjjl0icK/+r8Pg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=h1zDvKUJt1IfwS1/Fel+frXyQnAD1Gj5eHUh89C36XTplozRDivahhNeTqKdzqEPa
 ZSjVpW6cWkBwey63ozOw7bxm/Ym/CcE0GOkIyEX4q7d/0wYugu3WDN1uu0+2hXoxN+
 M99VZ5T2p2OAJp1oscN7ckbOZTB2TY/HcQByBv/zICFNxwPKv+kk0EooORq3+jmRdZ
 H7e7R53US23RIlqOTCpV5xV8MOYhRTvgzVTnNPDOULdZ6BzYEaUQPlrNPv2xxyF5dT
 TPzn3rlGq/wKOurcyXUweMyCbHcoMvLrqSw9sZxP0WiFtdSnb5jczuAZ7dyJD9Hrhk
 n1fNf1vds2BYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70EC5380CFD9; Thu, 24 Apr 2025 10:00:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174548883125.3289294.6660302727268151005.git-patchwork-notify@kernel.org>
Date: Thu, 24 Apr 2025 10:00:31 +0000
References: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
In-Reply-To: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9_=3Calexis=2Elothore=40bootlin=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-kernel@vger.kernel.org, daniel.machon@microchip.com,
 linux@armlinux.org.uk, thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 0/2] net: stmmac: fix timestamp
 snapshots on dwmac1000
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 23 Apr 2025 09:12:08 +0200 you wrote:
> Hello,
> 
> this is the v2 of a small series containing two small fixes for the
> timestamp snapshot feature on stmmac, especially on dwmac1000 version.
> Those issues have been detected on a socfpga (Cyclone V) platform. They
> kind of follow the big rework sent by Maxime at the end of last year to
> properly split this feature support between different versions of the
> DWMAC IP.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: stmmac: fix dwmac1000 ptp timestamp status offset
    https://git.kernel.org/netdev/net/c/73fa4597bdc0
  - [net,v2,2/2] net: stmmac: fix multiplication overflow when reading timestamp
    https://git.kernel.org/netdev/net/c/7b7491372f8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
