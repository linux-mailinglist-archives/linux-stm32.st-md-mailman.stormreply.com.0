Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F2308043
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Jan 2021 22:10:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 101BBC57183;
	Thu, 28 Jan 2021 21:10:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9876CC57180
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Jan 2021 21:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 576DA64DE6;
 Thu, 28 Jan 2021 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611868210;
 bh=DowqKo9gfbes78VknKzpUfMf+fG+DmvWsC6/wBJusa4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=m3NhHf30E3NWhKyvdL7kf0VM9D/9B7Dyyvchu2DmKfeSbWorXer+QZhPdgOMP/YXx
 rErGLTQHgS6j8BnISEMc9diVcFcL06W7FhSDDRezppT7rdZ46OFiZh8DGO1UUDlKQz
 TNV5Z0iflLLOOzj++k+mP3QjWGYPbVlTmX33utdd5CsEHCFNP3wUWam2MyGcDtxG0c
 S3eV/cfWiK+6vSHPHzVykBawNecWqmdpX0X0qiF5mhJEXkzYJg2d90/SuUFAmFs+TM
 QTxfvVYApfv4CZ3XMmxJRf/7muFNsSoqpMww6szopJGPzCYypRIx1tBiT2g2WdYT81
 S+eWraSe6JeeA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 52CD76530E;
 Thu, 28 Jan 2021 21:10:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161186821033.20635.6438134736508926068.git-patchwork-notify@kernel.org>
Date: Thu, 28 Jan 2021 21:10:10 +0000
References: <20210126085832.3814-1-vee.khee.wong@intel.com>
In-Reply-To: <20210126085832.3814-1-vee.khee.wong@intel.com>
To: Wong Vee Khee <vee.khee.wong@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: Add ADL-S
	1Gbps PCI IDs
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

On Tue, 26 Jan 2021 16:58:32 +0800 you wrote:
> From: "Wong, Vee Khee" <vee.khee.wong@intel.com>
> 
> Added PCI IDs for both Ethernet TSN Controllers on the ADL-S.
> 
> Also, skip SerDes programming sequences as these are being carried out
> at the BIOS level for ADL-S.
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] stmmac: intel: Add ADL-S 1Gbps PCI IDs
    https://git.kernel.org/netdev/net-next/c/88af9bd4efbd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
