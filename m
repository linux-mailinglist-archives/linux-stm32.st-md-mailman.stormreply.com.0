Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D847E244
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Dec 2021 12:30:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34271C5F1F7;
	Thu, 23 Dec 2021 11:30:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A4FCC5F1F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Dec 2021 11:30:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CC6761E45;
 Thu, 23 Dec 2021 11:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10FF0C36AE9;
 Thu, 23 Dec 2021 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640259011;
 bh=8kb38L1MaWKcmKK3bOhkpFTFUVb66W9Ad8UXKRnX214=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=j3VgpMOu8wCL+VVDkn+5+WZjt8CIe2G1MNzCsbTS4FukNs8h4rjVl6bf+hkfGHRzd
 MhwHW4cOT3Y6luF5dmZPmAlb+9Rg5rPYBmZuxSn6FzHZ9Vy83+p+n2bkPydUvREs4K
 EERs6ydJq9ka1EmQxiquUt6yT/8GZnaY32HEUHdOloeuoLClxuvBmZdcuvAX+9FDH/
 ZOOrqaY0ZlH33CJCxzOBThyvtuV//aisu3MDGTCuMnc7n3/pXz8QVLHILQjTHGMDfE
 maBKuyimsvQtDPKR4ClWZN/jeBBVDuDR9HUcJfIW7ErYj9xyEkkSYaKdih41x7D/qb
 Osib+mz1x59rA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EBD16EAC060; Thu, 23 Dec 2021 11:30:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164025901096.907.10306154000549571254.git-patchwork-notify@kernel.org>
Date: Thu, 23 Dec 2021 11:30:10 +0000
References: <20211222144310.2761661-1-boon.leong.ong@intel.com>
In-Reply-To: <20211222144310.2761661-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, bigeasy@linutronix.de,
 alexandre.torgue@foss.st.com, kurt.kanzenbach@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/1] net: stmmac: add EthType
	Rx Frame steering
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

On Wed, 22 Dec 2021 22:43:09 +0800 you wrote:
> Hi,
> 
> Now that VLAN priority RX steering issue patch [1] is merged, this is
> the remaining patch from the original series to add LLDP and IEEE1588
> EtherType RX frame steering in tc flower.
> 
> As before, below are the test steps for checking out the newly added
> features (LLDP and PTP) together with VLAN priority:-
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/1] net: stmmac: add tc flower filter for EtherType matching
    https://git.kernel.org/netdev/net-next/c/e48cb313fde3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
