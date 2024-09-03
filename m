Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CEE96ABF3
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 00:17:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02305C78013;
	Tue,  3 Sep 2024 22:17:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 125E3C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 22:16:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9F8295C4668;
 Tue,  3 Sep 2024 22:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8034BC4CEC4;
 Tue,  3 Sep 2024 22:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725401811;
 bh=u/TGDgT9nMGoSIjabJLW3PnQ9BU6/qBVyJyzNBpjKA0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ctev56XHYQrMTxPIN36pvA5ji059bJWHtvJO4u3nY/6RQ1NKpLkf3wmKgjl0pn3Hm
 GA0XR5S0Ix9Fs8eEHOaU0HoInL/Z4zW9M0SU0aYcHSX+16A/xh6c7sCIt6ZmgEFoGK
 vv9THsKS/7EtDD7qXK3wNxvcpvRMA8OePdoMwhzgC/7D7bWlkAhwQdtHnrfWOHynCW
 /+NIm/AEoNbl0jAgj8qn1/vSMXAolEUFLuYLgE/mX+byeMC+cLHMUkI5tkqROCjiPJ
 HlEdinz/2+T6DVUkaMLEJro5qq+Z5rkTdcYGmJ3N8FUqON2c2mAxfAsyFDy19Uj0K+
 Nf1uOZQD3k+0g==
Date: Tue, 3 Sep 2024 15:16:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20240903151649.1b466145@kernel.org>
In-Reply-To: <20240831021334.1907921-10-lizetao1@huawei.com>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-10-lizetao1@huawei.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, radhey.shyam.pandey@amd.com,
 ajay.kathat@microchip.com, florian.fainelli@broadcom.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, pabeni@redhat.com,
 yisen.zhuang@huawei.com, linux-sunxi@lists.linux.dev,
 jacky_chou@aspeedtech.com, hauke@hauke-m.de, kvalo@kernel.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 salil.mehta@huawei.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 claudiu.beznea@tuxon.dev, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 olteanv@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 09/12] net: ethernet: sunplus:
 Convert using devm_clk_get_enabled() in spl2sw_probe()
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

On Sat, 31 Aug 2024 10:13:31 +0800 Li Zetao wrote:
> +	comm->clk = devm_clk_get_enabled(&pdev->dev, NULL);

You can remove clk from the driver struct now.
Please check if the same applies to other patches.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
