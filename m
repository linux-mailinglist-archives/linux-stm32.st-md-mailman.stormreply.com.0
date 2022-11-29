Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCE63B6DF
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 02:10:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99C3CC65E60;
	Tue, 29 Nov 2022 01:10:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9FA9C65E5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 01:10:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E751B810F1;
 Tue, 29 Nov 2022 01:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFAA4C433B5;
 Tue, 29 Nov 2022 01:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669684215;
 bh=xdOIF4FtP3Kn7ii8PIDHrs0fsUcKrCPOZ/yWS5Hth0w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=caFFLviuooZ85na+RxkEa3DJpfm12J2Qh1i5W/3xQpl5o3dVrbcK5l4PASHxb3WrE
 frZoKLUwmEgv5d8SjfOV7S7gy0UL/ZjN4XE2p45yN3zQqHcMGUkpOBxchslbmJLSUs
 NbqpscBTljjoH7Jn9yRJCnzfByaDVnimx/J8QRawFhPooyfo7GMU13qkctyfi+Ffec
 EWG4aMeezB4UZ4xRvwiRuFtEb/lHXNdv1WL+VlpkXPjWfKikCvuPBWtXa+SkeJB4xc
 k2SwvB6hYcJJDaczFTvMDanhmqghhfKJGzCuFIak1jZ+dhGQn02XhNpW8pGVxiTx2b
 rvf/PUmbjfJ5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CBA3EE21EF7; Tue, 29 Nov 2022 01:10:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166968421482.15821.7452131414473151568.git-patchwork-notify@kernel.org>
Date: Tue, 29 Nov 2022 01:10:14 +0000
References: <20221125105304.3012153-1-vladimir.oltean@nxp.com>
In-Reply-To: <20221125105304.3012153-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: xu.panda@zte.com.cn, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 claudiu.manoil@nxp.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, yang.yang29@zte.com
Subject: Re: [Linux-stm32] [PATCH net-next] Revert "net: stmmac: use
 sysfs_streq() instead of strncmp()"
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 25 Nov 2022 12:53:04 +0200 you wrote:
> This reverts commit f72cd76b05ea1ce9258484e8127932d0ea928f22.
> This patch is so broken, it hurts. Apparently no one reviewed it and it
> passed the build testing (because the code was compiled out), but it was
> obviously never compile-tested, since it produces the following build
> error, due to an incomplete conversion where an extra argument was left,
> although the function being called was left:
> 
> [...]

Here is the summary with links:
  - [net-next] Revert "net: stmmac: use sysfs_streq() instead of strncmp()"
    https://git.kernel.org/netdev/net-next/c/469d258d9e11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
