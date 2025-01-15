Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C1A11706
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 03:10:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B77E1C78F64;
	Wed, 15 Jan 2025 02:10:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E6D1C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 02:10:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 36F115C5A9E;
 Wed, 15 Jan 2025 02:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A632EC4CEDD;
 Wed, 15 Jan 2025 02:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736907009;
 bh=VkD0rcWwKLY34VeqN/EnCIzaNzNTN+EiI+U6FIg54dM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WMgDowTqRPpbE57sxITSzs/kv1ehXK1gTO23zp8BZbecDWQc0eAcp6YLK85IGhlWI
 XG9NokMApljZw4MpAguV2jINE7uVcMsvRxasVIXR9zmy7POqMnTn9Yjt0NAO+G8uWw
 t1BOa82Z04DnOA/6lbKvNWx3fBT9k7qtg+lo675KgzLhqHn5xkMC2mQoXQVBeKOq3e
 gstguUqUKDFkVT0l5Ax6/3xEKBTbWjCQ5MzACJV5uL7vMkWpNvEDb2bb/wadS5bcKz
 hwqVpJYUD0xppn4PLKxTpFs5VbFP/Pkrkfd+KsvhxEvug5S5Xnq+uu3lIWlrtxxSHK
 r7Ah36iSz4htA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE10A380AA5F; Wed, 15 Jan 2025 02:10:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173690703250.220881.14038994805665516239.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 02:10:32 +0000
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: imx@lists.linux.dev, kernel@pengutronix.de, festevam@gmail.com,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 danishanwar@ti.com, linux-kernel@vger.kernel.org, rogerq@kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, shawnguo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/5] net: ethernet: Simplify few
	things
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

On Sun, 12 Jan 2025 14:32:42 +0100 you wrote:
> Few code simplifications without functional impact.  Not tested on
> hardware.
> 
> Best regards,
> Krzysztof
> 
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: ti: icssg-prueth: Do not print physical memory addresses
    https://git.kernel.org/netdev/net-next/c/136fff12a759
  - [net-next,2/5] net: ti: icssg-prueth: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/621c88a39276
  - [net-next,3/5] net: stmmac: imx: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/1e38b398b671
  - [net-next,4/5] net: stmmac: sti: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/92ef3e4b3a5b
  - [net-next,5/5] net: stmmac: stm32: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/6e9c6882f9ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
