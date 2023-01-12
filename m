Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43422666ABD
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 06:20:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC6C7C64109;
	Thu, 12 Jan 2023 05:20:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8A53C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 05:20:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2EC26B81DBE;
 Thu, 12 Jan 2023 05:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C21AAC433F0;
 Thu, 12 Jan 2023 05:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673500816;
 bh=Hcd5U67VJsibz/ZoBZjvua6nJb0h/zNvZUfjlALqBXM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=i+vwN/+2MPRDYIX0KzsOh8/6LPZbIzLI0ecvylFx4m/6+Z1zSbi6deXP+W4sdDsdc
 bBnWyu0UzgELKHE0ZZ0LZJnPgg79Y1682EQRHpYqmJmvA/xgU4Bs3nCiLFmHdmrZlv
 bcBDkfN+8vMJ5Vn3OjQYXVHvTfDtQLRaVWkA2DhfiCDTUdY76N4aRJDAkMb2uApsk/
 yOqThwtLAatQLEvSOPXbZ8BpyFfEXWRhXW/7KPu9DeQZi6FntAxg5Gieqc1HQpGwyM
 VBRm5GPT6tlRdkRpJ2vZv6NlBf0O/zLEA7lwHNtuzHSnMP0RAN71HRRUgaK7yK/tur
 38w2rpZiVwA/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A1DAFC395C8; Thu, 12 Jan 2023 05:20:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167350081665.21073.1228450610276293938.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jan 2023 05:20:16 +0000
References: <20230111050200.2130-1-noor.azura.ahmad.tarmizi@intel.com>
In-Reply-To: <20230111050200.2130-1-noor.azura.ahmad.tarmizi@intel.com>
To: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
Cc: noor.azura.ahmad.tarmizi@linux.intel.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, richardcochran@gmail.com, tee.min.tan@intel.com,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, muhammad.husaini.zulkifli@intel.com, peppe.cavallaro@st.com,
 hong.aun.looi@intel.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: add aux
 timestamps fifo clearance wait
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Jan 2023 13:02:00 +0800 you wrote:
> Add timeout polling wait for auxiliary timestamps snapshot FIFO clear bit
> (ATSFC) to clear. This is to ensure no residue fifo value is being read
> erroneously.
> 
> Fixes: f4da56529da6 ("net: stmmac: Add support for external trigger timestamping")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
> 
> [...]

Here is the summary with links:
  - [net,v2,1/1] net: stmmac: add aux timestamps fifo clearance wait
    https://git.kernel.org/netdev/net/c/ae9dcb91c606

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
