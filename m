Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F64A70878
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 18:50:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15853C78F68;
	Tue, 25 Mar 2025 17:50:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BA19CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 17:50:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 198865C5482;
 Tue, 25 Mar 2025 17:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70770C4CEEA;
 Tue, 25 Mar 2025 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742925001;
 bh=/xbN3SNGco9nfK5R9dddb1UbuYDo9yRpHGHHAEqgBn0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IoPEUwymEujnt8i+mKcczKvDjfZawp9uTNJ9k9Kx+Qv+UpEWD9M1EYq43TUxSn00P
 y/zz50dAGVM/Tt9zC7Wlzx28ATFVFvpy6fGg2b3tVORBCuoQR6IdKPZ/vTJeb8zvwH
 4jYaHgtim4q9s9oPD5l7B03k9wyosvImI/dvryu9FY3QoXnnrPgtAmaHXosyVaibl6
 PF3ba/klijgsvREj87Gcc2+JhZ6HAAE5qMkYcvRQohg3KDtkdpcvb5QN70hggnMt6W
 kWGE/a7qdrU1cExJdQo7EuwDFmO1RTJhBnJMEyjIjDZR+Uge2VuNoyfv/upsRMXpkC
 GUaIb6UglNPSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB614380CFE7; Tue, 25 Mar 2025 17:50:38 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174292503778.665771.17608780007246481323.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 17:50:37 +0000
References: <20250324092928.9482-2-phasta@kernel.org>
In-Reply-To: <20250324092928.9482-2-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: si.yanteng@linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 guyinggang@loongson.cn, chenhuacai@kernel.org, fancer.lancer@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/3] stmmac: Several
	PCI-related improvements
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

On Mon, 24 Mar 2025 10:29:26 +0100 you wrote:
> Resend of v4, rebased onto net-next due to a merge conflict.
> 
> Changes in v4:
>   - Add missing full stop. (Yanteng)
>   - Move forgotten unused-variable-removes to the appropriate places.
>   - Add applicable RB / TB tags
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/3] stmmac: loongson: Remove surplus loop
    https://git.kernel.org/netdev/net-next/c/9db2426a324e
  - [net-next,v4,2/3] stmmac: Remove pcim_* functions for driver detach
    https://git.kernel.org/netdev/net-next/c/d327a12e636e
  - [net-next,v4,3/3] stmmac: Replace deprecated PCI functions
    https://git.kernel.org/netdev/net-next/c/45b761689a28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
