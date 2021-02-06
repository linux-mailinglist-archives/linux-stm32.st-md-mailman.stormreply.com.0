Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB46311AB3
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Feb 2021 05:10:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42B14C57B51;
	Sat,  6 Feb 2021 04:10:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C964C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Feb 2021 04:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 27E9664F05;
 Sat,  6 Feb 2021 04:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612584608;
 bh=wNYQu/XGEnEp/U0vSlR2d/tI2XllSHqm5QJmAMSR/Hc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZPA7h8UNjLg4JMlI7m2dAXpCKlIgftzuGnojlniUkUWHScnyeKc5xIDBvIsixKTyy
 TUGEHISiTglTrM6NBLpson4PWSG42qqy6GmcrEs/c5iMBxedLCgwvpKC95Uh2ZHo5f
 QvBQPhcHeFljn8I8rYF+phoqZCuhfS8diziSq7DTmsBInkrz2Go6F7/fYpsB4JkEG1
 JD0yOE4CFKIU3rxSZBK25t5d0J5Mv+FNw8S9OyTSvuOCbgONAfW0uI9BVl3ynuB7cT
 PKgk+vXgOGzq2ZRpGzj6ZEJy3XuGUUJNJkzri56iuS+GTPyylais1LGWwaD8UkKD9i
 6sry15QYibZ0Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0F677609F6;
 Sat,  6 Feb 2021 04:10:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161258460805.22008.14706374158148847125.git-patchwork-notify@kernel.org>
Date: Sat, 06 Feb 2021 04:10:08 +0000
References: <1612447396-20351-1-git-send-email-yoong.siang.song@intel.com>
In-Reply-To: <1612447396-20351-1-git-send-email-yoong.siang.song@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, vinicius.gomes@intel.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: set TxQ mode back to
 DCB after disabling CBS
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

This patch was applied to netdev/net.git (refs/heads/master):

On Thu,  4 Feb 2021 22:03:16 +0800 you wrote:
> From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
> 
> When disable CBS, mode_to_use parameter is not updated even the operation
> mode of Tx Queue is changed to Data Centre Bridging (DCB). Therefore,
> when tc_setup_cbs() function is called to re-enable CBS, the operation
> mode of Tx Queue remains at DCB, which causing CBS fails to work.
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: set TxQ mode back to DCB after disabling CBS
    https://git.kernel.org/netdev/net/c/f317e2ea8c88

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
