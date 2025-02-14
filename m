Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC3A367C6
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 22:50:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6685C78F8D;
	Fri, 14 Feb 2025 21:50:18 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87F16C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 21:50:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 63B88A44BB3;
 Fri, 14 Feb 2025 21:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408DCC4CED1;
 Fri, 14 Feb 2025 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739569816;
 bh=Kckz2TLbEWVxhN4tyZx07MCeYrJg4RMfeph7RfTIB/I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cdOhJbgSdmNsof0RZWm2bNMcOgyMnbZt+W0tplE2Z42FRnhYN2MMjC/HZid4gAJnv
 cXzgJPNOG1t4PpQILLyjXxjR2iCMHRuT8dtOszNUaK1l7M+y1R5CXFcEWykXJVOqoq
 0oEZho2DelTmmNg7d7bolAS6148mq2/iyWr1V/ZAMtTvRYwBTFjA5j7AtiohUvk9SB
 JZhIv/eEYDTmSx7F9ZN8t38fGLyp2TjWZH+9fUVfjtyhwhBd9NrePCBudywVlg3KIy
 AWtEGEuJ2oo5x6guLSRmHSYSf331YWc5PdMca/CEcK/KScLXsHz1uuOA/biVVuPInb
 DirROEdI0JIfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB383380CEE8; Fri, 14 Feb 2025 21:50:46 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173956984555.2115208.11664802737268824641.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 21:50:45 +0000
References: <20250213041559.106111-1-swathi.ks@samsung.com>
In-Reply-To: <20250213041559.106111-1-swathi.ks@samsung.com>
To: Swathi K S <swathi.ks@samsung.com>
Cc: treding@nvidia.com, Joao.Pinto@synopsys.com, linux-kernel@vger.kernel.org,
 ajayg@nvidia.com, Jisheng.Zhang@synaptics.com, netdev@vger.kernel.org,
 fancer.lancer@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, krzk@kernel.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: refactor clock
 management in EQoS driver
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 13 Feb 2025 09:45:59 +0530 you wrote:
> Refactor clock management in EQoS driver for code reuse and to avoid
> redundancy. This way, only minimal changes are required when a new platform
> is added.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: refactor clock management in EQoS driver
    https://git.kernel.org/netdev/net-next/c/a045e40645df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
