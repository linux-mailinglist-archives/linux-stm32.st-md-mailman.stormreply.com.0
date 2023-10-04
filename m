Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7E97B96B8
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 23:59:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 438EFC6C831;
	Wed,  4 Oct 2023 21:59:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DDC3C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 21:59:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 351A461782;
 Wed,  4 Oct 2023 21:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACD8C433C8;
 Wed,  4 Oct 2023 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696456792;
 bh=h1wuJu7EQsw0ISUx0TDepOY/LS54P4l5en5rkpEd2fY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IQXXKp3mHSs7C3RpBvqk6NjjA3omclpdvfBr+th98AGd/jJHwr+SNYt3DrQA/tTC6
 CGVXbkPAeLNP+ogRrvru18i0GSibBl+w7HXMap5DQDuOrYmLdw+Tx1W6/MbCpIrsYq
 uQ3amhujSUY0KGp2MM38dxsXREQ33YXtIE15pnkYiOSaXPIiIUmxtBEpzyfZ9vgDDo
 bI7OyMePLY5CWCjr27kEoifclTlu1G2sjnuJ22oAvnoWRy9zz4MvD4Uf4V77e1j84o
 PZj8x033qUbHukwEnp7u6/RJOHhxm8BSYTwVY5olkQb+SrKjjXJGu8bwuLwx25JHMi
 kQ8hdjMEwCLSQ==
Date: Wed, 4 Oct 2023 14:59:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20231004145951.570a8ce4@kernel.org>
In-Reply-To: <20231004195442.414766-1-shenwei.wang@nxp.com>
References: <20231004195442.414766-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-imx: request high
	frequency mode
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

On Wed,  4 Oct 2023 14:54:42 -0500 Shenwei Wang wrote:
> Some i.MX SoCs like the i.mx8mq support adjusting the frequency of the
> DDR, AHB, and AXI buses based on system loading. If the dwmac interface
> in the driver does not request a HIGH frequency, it can significantly
> degrade performance when the system switches to a lower frequency to
> conserve power.
> 
> For example, on an i.MX8MQ EVK board, the throughput dropped to around
> 100Mbit/s on a 1Gbit connection:
> 
>     [ ID] Interval           Transfer     Bitrate
>     [  5]   0.00-10.00  sec   117 MBytes  97.9 Mbits/sec
> 
> However, throughput can return to expected levels after its driver requests
> the high frequency mode. Requesting high frequency in the dwmac driver is
> essential to maintain full throughput when the i.MX SoC adjusts bus speeds
> for power savings.

Oh, another one in one day :S Although this one feels much more like
a bug that escaped testing because testing didn't use power saving?
In any case, do you happen to have a user report you can mention here?
Quoting stable rules:

| Serious issues as reported by a user of a distribution kernel may also
| be considered if they fix a notable performance or interactivity
| issue. As these fixes are not as obvious and have a higher risk of a
| subtle regression they should only be submitted by a distribution
| kernel maintainer and include an addendum linking to a bugzilla entry
| if it exists and additional information on the user-visible impact.

And a Fixes tag would be good, please add.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
