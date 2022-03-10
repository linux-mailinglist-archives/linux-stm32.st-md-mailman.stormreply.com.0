Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C64D4037
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Mar 2022 05:20:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 818ECC628A2;
	Thu, 10 Mar 2022 04:20:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F33BC6049E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Mar 2022 04:20:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EC4B6185C;
 Thu, 10 Mar 2022 04:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86FB1C340FB;
 Thu, 10 Mar 2022 04:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646886011;
 bh=yE8W9mRMdO2uhbRzLthfGmH4O4VZYLVLsEzAmz9J0xs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YT1qdoIIInN5/ngTHS6Rjnr86nh+TWI6l0AeZOFVYGG3iYdllWNraUKdsPocdrHM/
 dFwOCpWbqOxnI2RGC7s//0004qJePASFe0NntQsnfHx+BUBqZzkMsIkOy94i+3J2fi
 8FiaNH/oMkrCNnxOQ9ITg1IXc1OHqnldZ9lMk6iKV5ANGbuZlc45VunsbpPO8c5TxX
 F0iGiU39UUrHdNKvT9/X+mVTPoUDERVDevBHH2hapQRJ4iDid10PoNhOvJgCrwXhfd
 2rv7vpf+NCnlHIUNKeTaIntJQhQwVGzMLglVivMSEPmaef75I4J/4Mea9lzgFL9OYe
 lwIJxknqywxtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 66E40F03841; Thu, 10 Mar 2022 04:20:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164688601141.11305.7538223970424164595.git-patchwork-notify@kernel.org>
Date: Thu, 10 Mar 2022 04:20:11 +0000
References: <20220309033415.3370250-1-michael.wei.hong.sit@intel.com>
In-Reply-To: <20220309033415.3370250-1-michael.wei.hong.sit@intel.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Cc: vee.khee.wong@linux.intel.com, linux-kernel@vger.kernel.org,
 weifeng.voon@intel.com, netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: Add ADL-N PCI
	ID
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

On Wed,  9 Mar 2022 11:34:15 +0800 you wrote:
> Add PCI ID for Ethernet TSN Controller on ADL-N.
> 
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [net-next,1/1] stmmac: intel: Add ADL-N PCI ID
    https://git.kernel.org/netdev/net-next/c/30c5601fbf35

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
