Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 066FF3BC232
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 19:20:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2E6CC57B53;
	Mon,  5 Jul 2021 17:20:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4ECCC424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 17:20:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CDB9C6196C;
 Mon,  5 Jul 2021 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625505603;
 bh=Kdm1QRA1v5jpFpHW2SlQG+K4nJeQ/1fZZM9yGGKe6lw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZZR4oEAWlOS7sY1Ot72plRxmYtSYA0xOiqrjnMMotM5eLSgDWFbqRbGfwZ/X/uMqM
 Ka8s30NIy1uAQFMPk7+oSGrKobHA8I+QbKgZmh16yyXVfAfEx0HRsq5uc0ZuZL5sqt
 vZqRJNUYZ/z2RE18ilwSo03RxcTUPppsFDhs/FOzDtm5ljy5lsd1xQKi8YoVBiEufU
 qFyfQbTaJYkt4lOUCwX8ki4RCV/zfWkXpk7WWV/uXeRJDSMPHz22y+zABlk9qjyu3M
 8h5VB8X7zsC/VOCPnMw/zWug0gBoOctzYjJLLPOv7OFw7RRWKiG7KQV/0twnXQ/u9E
 TbeGO3/SwH0gg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BB2A1609EF;
 Mon,  5 Jul 2021 17:20:03 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162550560376.14411.831006675509469053.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jul 2021 17:20:03 +0000
References: <20210705102655.6280-1-xiaoliang.yang_1@nxp.com>
In-Reply-To: <20210705102655.6280-1-xiaoliang.yang_1@nxp.com>
To: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Cc: qiangqing.zhang@nxp.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, tee.min.tan@intel.com,
 mohammad.athari.ismail@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 boon.leong.ong@intel.com, kuba@kernel.org, leoyang.li@nxp.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, rui.sousa@nxp.com
Subject: Re: [Linux-stm32] [PATCH v2 net-next 0/3] net: stmmac: re-configure
 tas basetime after ptp time adjust
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

On Mon,  5 Jul 2021 18:26:52 +0800 you wrote:
> If the DWMAC Ethernet device has already set the Qbv EST configuration
> before using ptp to synchronize the time adjustment, the Qbv base time
> may change to be the past time of the new current time. This is not
> allowed by hardware.
> 
> This patch calculates and re-configures the Qbv basetime after ptp time
> adjustment.
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/3] net: stmmac: separate the tas basetime calculation function
    https://git.kernel.org/netdev/net/c/81c52c42afd9
  - [v2,net-next,2/3] net: stmmac: add mutex lock to protect est parameters
    https://git.kernel.org/netdev/net/c/b2aae654a479
  - [v2,net-next,3/3] net: stmmac: ptp: update tas basetime after ptp adjust
    https://git.kernel.org/netdev/net/c/e9e3720002f6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
