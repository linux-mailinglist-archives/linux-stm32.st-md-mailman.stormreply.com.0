Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3883E7CF558
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 12:30:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4640C6B44D;
	Thu, 19 Oct 2023 10:30:27 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 751BEC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 10:30:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 351F7CE2AFE;
 Thu, 19 Oct 2023 10:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C948C433CB;
 Thu, 19 Oct 2023 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697711423;
 bh=ISlzwNBz4S/jH+y76V1s9eoZT46G5gS6n3EopdgQWHA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MS7usoPGfOXtFgpfdTA4GpSCDCKwDC2R+9mnJT0e3cISZPXFPK8kFSxrbYKmZDQJy
 x1t4PYCaUCYoh1mdWlO2za66uoHDtV0qEkYR+h5ynkiCbVv8HHgB7DBIe6tKs5TUP5
 Or6bJeHYQ+fEZuUjC1iNcEN+huiuJcmH9j0R6NcxcyDNCbLQfuwXwsUTFS3NZhQCW1
 TJWyV6/FhXtxRP0rfhTqdVhSH9IQTE1YJ97Hz1yqyGtM5I0RPSBwDIEablfKGrQZB9
 TlJnDwH8ZaS4efuYH+BuXpr5F/3D4h7m00/3Mux7Bv0SjxXVAg8ufvMzr2V+4mKdzF
 4rRqsIp945Ivw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 51100C73FE1; Thu, 19 Oct 2023 10:30:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169771142332.4277.11760009172331855104.git-patchwork-notify@kernel.org>
Date: Thu, 19 Oct 2023 10:30:23 +0000
References: <20231018030802.741923-1-yi.fang.gan@intel.com>
In-Reply-To: <20231018030802.741923-1-yi.fang.gan@intel.com>
To: Gan@ci.codeaurora.org, Yi Fang <yi.fang.gan@intel.com>
Cc: linux-kernel@vger.kernel.org, yoong.siang.song@intel.com,
 weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 hong.aun.looi@intel.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/1] net: stmmac: Remove
 redundant checking for rx_coalesce_usecs
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Oct 2023 11:08:02 +0800 you wrote:
> From: Gan Yi Fang <yi.fang.gan@intel.com>
> 
> The datatype of rx_coalesce_usecs is u32, always larger or equal to zero.
> Previous checking does not include value 0, this patch removes the
> checking to handle the value 0. This change in behaviour making the
> value of 0 cause an error is not a problem because 0 is out of
> range of rx_coalesce_usecs.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/1] net: stmmac: Remove redundant checking for rx_coalesce_usecs
    https://git.kernel.org/netdev/net-next/c/392c226cda94

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
