Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47472A48EB6
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 03:40:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04B46CFAC47;
	Fri, 28 Feb 2025 02:40:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 778BFCFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 02:39:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EBF09615E7;
 Fri, 28 Feb 2025 02:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26155C4CEDD;
 Fri, 28 Feb 2025 02:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740710398;
 bh=n0lGgWpVMdnQZ8WaaunYSs+CDhI/VkhN2UbParMgr2A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lQQHrPpD+qj/hLOXAvWRKd+wUtlnOEvLwA1qNuPa0Xm5IeQ/ApRUE7/M4B38OJUMS
 UoiDSempoQesgGf/J74EmhD5qO7Mo+DWCWNcFzLU6+mM08kmZr7cJ4l0LsEuIIUJ1P
 hNgzdZWAlSS3XFGwO9njIS0gbOunwlhPhC7SoMZt5zxZ036v/gTh+81ARspORygJDx
 ahb415ZWI8n7o4OwrbaZuL0Y0TOOiDLt/2fbx8PXTVO30LyTFaRDwoLaDMbEHC8Jj6
 rzhwWa/+a4KryvShnTEUYuVPzG+jgN51Y5N2yZCmLirQbxUGdBKRUvneN5YHsqnq7W
 fjtLvWFYOFNrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 71F10380AACB; Fri, 28 Feb 2025 02:40:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174071043026.1661895.15370002818806136916.git-patchwork-notify@kernel.org>
Date: Fri, 28 Feb 2025 02:40:30 +0000
References: <20250226085208.97891-1-phasta@kernel.org>
In-Reply-To: <20250226085208.97891-1-phasta@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: chenfeiyang@loongson.cn, si.yanteng@linux.dev, linux-kernel@vger.kernel.org,
 pstanner@redhat.com, netdev@vger.kernel.org, guyinggang@loongson.cn,
 chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 zhangqing@loongson.cn, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/4] stmmac: Several
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 26 Feb 2025 09:52:04 +0100 you wrote:
> Changes in v4:
>   - Add missing full stop. (Yanteng)
>   - Move forgotten unused-variable-removes to the appropriate places.
>   - Add applicable RB / TB tags
> 
> Changes in v3:
>   - Several formatting nits (Paolo)
>   - Split up patch into a patch series (Yanteng)
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] stmmac: loongson: Pass correct arg to PCI function
    https://git.kernel.org/netdev/net/c/00371a3f4877
  - [net-next,v4,2/4] stmmac: loongson: Remove surplus loop
    (no matching commit)
  - [net-next,v4,3/4] stmmac: Remove pcim_* functions for driver detach
    (no matching commit)
  - [net-next,v4,4/4] stmmac: Replace deprecated PCI functions
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
