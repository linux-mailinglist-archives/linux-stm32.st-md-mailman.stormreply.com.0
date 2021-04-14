Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B709735FC18
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Apr 2021 22:00:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C4D0C57B79;
	Wed, 14 Apr 2021 20:00:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54784C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 20:00:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CE33C61154;
 Wed, 14 Apr 2021 20:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618430410;
 bh=EbCR73hTmasaxW7y6jUvE4FvFPo0Fm+mX5csPYP4qk8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=EGr3JThFN6cNAfKMlY1ucQ2qNbZH4lF4AOoKsl7eUSIgcVjYByI4eY68Rgqs/VnUj
 fyPHbCc5pXdhokr/wyEwqT7DRjow8p96S3B2unqrFbspvTWXrFjyqPueTytU0GPPiX
 7diiCKrYX/zof0cczgFeqo1J5diVciMNsU6uC15SR1MXL9Ysd0FCjXR2F08jYd3jk+
 caOnxw6ob9ipxyZzbVOrYHX1dXWhtUSfuKz4MLIBWKGRRIsQi6Wzm1dDuZDHJtMAcO
 XIP27Xqe4G+aSSctj7iEH+7UyUR5JtbGBkGqcncB576D7XVe84KXmFI66FaqLeWpba
 wYuT34GFdBt+g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BF37B60CD1;
 Wed, 14 Apr 2021 20:00:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161843041077.5559.2620169684665757690.git-patchwork-notify@kernel.org>
Date: Wed, 14 Apr 2021 20:00:10 +0000
References: <20210414001617.3490-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210414001617.3490-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/1] net: stmmac: Add support
 for external trigger timestamping
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 14 Apr 2021 08:16:17 +0800 you wrote:
> From: Tan Tee Min <tee.min.tan@intel.com>
> 
> The Synopsis MAC controller supports auxiliary snapshot feature that
> allows user to store a snapshot of the system time based on an external
> event.
> 
> This patch add supports to the above mentioned feature. Users will be
> able to triggered capturing the time snapshot from user-space using
> application such as testptp or any other applications that uses the
> PTP_EXTTS_REQUEST ioctl request.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/1] net: stmmac: Add support for external trigger timestamping
    https://git.kernel.org/netdev/net-next/c/f4da56529da6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
