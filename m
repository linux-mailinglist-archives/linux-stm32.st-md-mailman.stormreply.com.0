Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A326A3AA494
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jun 2021 21:50:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50C17C59780;
	Wed, 16 Jun 2021 19:50:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A97FCC58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 19:50:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 071C7613C2;
 Wed, 16 Jun 2021 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623873005;
 bh=xnPGz+j4qT0oXamCndg9kIHjVv0P6tZaWNZ0E/82KsI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QQWizqaLNhYNoTdU1Bla41FvnFND/9qLETNWx/Otdb2hthol8la3OkPqBw1tqmCC/
 of96g9TSATu9uTSFMHmx5OcXcIgvDIzX+aOOpL7iDUJHNbc1aPBqy+01ISXbHWLzJe
 3TxXBuyfUBsqfliS+pnkiDpASd8BALrPzcRXn70OwxZKDitbMQnuSy2T3AwqU7oKGR
 3RZoB/mkIhWks2mBZRoclvQXOezD6q0vngsLnf05pwnK62AbNSOAwA9V3DLYiZzA7g
 +k+/N/BEjow5qxxopU4UTJENEMcDrIjGrlnLV6o8mK69Mx4A/na/p1B/XVJ9CKFfsN
 UUBmkqt98ZHcg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 006D5609E7;
 Wed, 16 Jun 2021 19:50:05 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162387300499.13042.8545046199906380662.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jun 2021 19:50:04 +0000
References: <20210616091426.13694-1-qiangqing.zhang@nxp.com>
In-Reply-To: <20210616091426.13694-1-qiangqing.zhang@nxp.com>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, linux-imx@nxp.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/2] net: fixes for fec ptp
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

On Wed, 16 Jun 2021 17:14:24 +0800 you wrote:
> Small fixes for fec ptp.
> 
> Fugang Duan (1):
>   net: fec_ptp: add clock rate zero check
> 
> Joakim Zhang (1):
>   net: fec_ptp: fix issue caused by refactor the fec_devtype
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: fec_ptp: add clock rate zero check
    https://git.kernel.org/netdev/net/c/cb3cefe3f3f8
  - [net,2/2] net: fec_ptp: fix issue caused by refactor the fec_devtype
    https://git.kernel.org/netdev/net/c/d23765646e71

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
