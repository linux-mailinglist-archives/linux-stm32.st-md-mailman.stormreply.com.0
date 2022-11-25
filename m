Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C976384FC
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Nov 2022 09:10:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B660C65E4B;
	Fri, 25 Nov 2022 08:10:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5636C65E43
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Nov 2022 08:10:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F6A1622E4;
 Fri, 25 Nov 2022 08:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 412A5C433C1;
 Fri, 25 Nov 2022 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669363816;
 bh=Xr/V0T+sz+5XuLdVL7uNnDXJytegZnrsBP4V8QXFwPc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rd+1lWPKagjfs7yf6k38VNKiTFZQGaADKVHJu3zuJVX0Keh1aTXFTykSiLL6PZRcw
 vVmvZLRUUjSxSKZL5tfZvfsXGige4a3Lv0Wdz843/sM9LKPNSWD7J4MxMS/hOmYUuo
 sTog49g4fmXpIpFyc/E4Am56Wdv9y8D3SoVSds2KrVCxDdton19l7CVRApbTe11dnG
 vrq1YJTS1HhNWValt895kehe8pHE10kBqusR//K8j6bOczr0ySiDh6GtjL/2MUnink
 qQFT77ZtWHM8MjFNAvJlzX9fYQ1SuXC9eGfGKlbciVQQEiXJTf4WgexHBCTmE6544X
 aG/ms5vl2sJRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1BAFEE270C7; Fri, 25 Nov 2022 08:10:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166936381610.2494.9740628316490671479.git-patchwork-notify@kernel.org>
Date: Fri, 25 Nov 2022 08:10:16 +0000
References: <202211222009239312149@zte.com.cn>
In-Reply-To: <202211222009239312149@zte.com.cn>
To: Yang Yang <yang.yang29@zte.com.cn>
Cc: xu.panda@zte.com.cn, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32]
	=?utf-8?q?=5BPATCH_linux-next=5D_net=3A_stmmac=3A_u?=
	=?utf-8?q?se_sysfs=5Fstreq=28=29_instead_of_strncmp=28=29?=
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 22 Nov 2022 20:09:23 +0800 (CST) you wrote:
> From: Xu Panda <xu.panda@zte.com.cn>
> 
> Replace the open-code with sysfs_streq().
> 
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> Signed-off-by: Yang Yang <yang.yang29@zte.com>
> 
> [...]

Here is the summary with links:
  - [linux-next] net: stmmac: use sysfs_streq() instead of strncmp()
    https://git.kernel.org/netdev/net-next/c/f72cd76b05ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
