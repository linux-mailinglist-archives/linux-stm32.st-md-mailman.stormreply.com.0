Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C9F423B61
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Oct 2021 12:20:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86C3CC597B4;
	Wed,  6 Oct 2021 10:20:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DAA7C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 10:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9089C6113E;
 Wed,  6 Oct 2021 10:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633515607;
 bh=AJtDo5u1fca9E/QnHXFoW07wSpG3oBRucBL795XEgUE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cd89ySXZr2/oUU04QvLyExtSUkalSqzQ105WFvMKIRA2D7sYqjbCp/ywne5BkDdA2
 TLFhL6SxUCMwcRz4aXlENK2AUamk+mPBSaZJQtqjqwqTcleqOqaI21s1ZZEFL1Aurd
 M01TIqGwUz+NNx3w1acOuapjrC1r59Oxg14iFjKZ2yggQnHfhM4jwLdYhOFWV2c/e8
 PLp97T+xhuuG4dLs6UbSOpnWBaiDPWPN/33fuNsFMMlg7uY1r6o3OgkiL3S5qQll+l
 39aweWJfv0ssJzmq3s1aTJOcoWyJCxBghvRbVZENyyqPDCwdNEvnrW++6pYwpffIhg
 OKtSu4W1TYgGQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 82BC560A39;
 Wed,  6 Oct 2021 10:20:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163351560752.22404.5478730456180115680.git-patchwork-notify@kernel.org>
Date: Wed, 06 Oct 2021 10:20:07 +0000
References: <20211005115100.1648170-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20211005115100.1648170-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux@armlinux.org.uk, alexandre.torgue@foss.st.com, veekhee@gmail.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, davem@davemloft.net,
 michael.wei.hong.sit@intel.com, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net 0/2] net: stmmac: Turn off EEE on MAC
	link down
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

This series was applied to netdev/net.git (refs/heads/master):

On Tue,  5 Oct 2021 19:50:58 +0800 you wrote:
> This patch series ensure PCS EEE is turned off on the event of MAC
> link down.
> 
> Tested on Intel AlderLake-S (STMMAC + MaxLinear GPY211 PHY).
> 
> Wong Vee Khee (2):
>   net: pcs: xpcs: fix incorrect steps on disable EEE
>   net: stmmac: trigger PCS EEE to turn off on link down
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: pcs: xpcs: fix incorrect steps on disable EEE
    https://git.kernel.org/netdev/net/c/590df78bc7d1
  - [net,2/2] net: stmmac: trigger PCS EEE to turn off on link down
    https://git.kernel.org/netdev/net/c/d4aeaed80b0e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
