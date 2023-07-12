Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4174FDB6
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 05:30:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBE85C6B457;
	Wed, 12 Jul 2023 03:30:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C64E3C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 03:30:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86CE760B9D;
 Wed, 12 Jul 2023 03:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6047EC433CA;
 Wed, 12 Jul 2023 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689132621;
 bh=nf8s+njeK8OMoPoLEn08q8t0z0oB7UZlF/uGzfV+kxQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uxU3r6W9obyLdEo5Qg2fFf+Yr/eImZxrHX8NjSw7HPFSShWnwX+JhEpvb/5V589qT
 jYNimClhQOiN5TLD7OasoZTeSwZYArJexemm4XQOJLCnCBsESSj1zbpt7qKn935un0
 y/u5xlRhi3lqB57AFG13I6Hr104tf6nCWI+FwEZwXivW+gLjUybX5CRDJAONvSNBNm
 uNzGIp8Wf//cTSX+Fb4oWHcfEWB5ukjF39qgCDIGSWtMq0Qp4O3Ooc9X43yy+avi4Z
 GGAYMWEmsi1NvSjWaRolqaYs1pzUWcz0xaZRAJ8GmAy5TSnVnbnLsUYk3noD9oW8Y3
 UhewL4cmnqeog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 46137E4D006; Wed, 12 Jul 2023 03:30:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168913262128.27250.10319125912738064702.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jul 2023 03:30:21 +0000
References: <20230710195240.197047-1-ahalaney@redhat.com>
In-Reply-To: <20230710195240.197047-1-ahalaney@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] MAINTAINERS: Add another mailing
 list for QUALCOMM ETHQOS ETHERNET DRIVER
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 10 Jul 2023 14:50:57 -0500 you wrote:
> linux-arm-msm is the list most people subscribe to in order to receive
> updates about Qualcomm related drivers. Make sure changes for the
> Qualcomm ethernet driver make it there.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net-next] MAINTAINERS: Add another mailing list for QUALCOMM ETHQOS ETHERNET DRIVER
    https://git.kernel.org/netdev/net/c/e522c1bd0ab4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
