Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55432498887
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 19:43:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F278CC5F1D5;
	Mon, 24 Jan 2022 18:43:56 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E1FDC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 18:43:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C986FB81219;
 Mon, 24 Jan 2022 18:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03F6C340E5;
 Mon, 24 Jan 2022 18:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643049833;
 bh=fjJSY7FugE5Gp1KTxk0Zobf8q54Y/LM7PG/4KE3Tjb4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UCfBDborgjCRg9qTZ252s9MeFIaljnltkwv73lPNL5IDOBRJRNujJaZuSgRc4mbMG
 Xa0zNzG/X9lqY5RF4Nk273KuNDvTD7cUsbW7F6EcmHi+g5e6xvcoezUCb9bNmDmAL9
 X4VK6HcYU6JgH3x6u+nF5Snh4+868bjkaKeI3V39m/ByQAZ5DGfPxxkm0/lCgr0Oq7
 cc3Ln3jEKVpF6mCHFSeixXap8HeV+LVZjnt0APiJ2BWiDisFipoRtdp1h9GqTn0LGb
 Ot91vltjJd38nPLkBsIyKcwnmGgmBTKAZncplUAc352I6aCDDMDajSE7BDOpWlF8G7
 rOiwv+e5EilZg==
Date: Mon, 24 Jan 2022 10:43:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20220124104351.2d5cab46@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220123132805.758-1-jszhang@kernel.org>
References: <20220123132805.758-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S
 . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sun8i: fix double
 disable and unprepare "stmmaceth" clk
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

On Sun, 23 Jan 2022 21:28:05 +0800 Jisheng Zhang wrote:
> Fix warnings on Allwinner D1 platform:
> 
> [    1.604695] ------------[ cut here ]------------
> [    1.609328] bus-emac already disabled

Reading Samuel's feedback it sounds like the change will have to be
reposted with a different commit message (either explaining why the
fixes indeed works or as a clean up not a fix). 
Marking Changes Requested in patchwork.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
