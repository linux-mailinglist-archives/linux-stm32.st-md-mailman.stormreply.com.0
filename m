Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B67968C28
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 18:39:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51932C71292;
	Mon,  2 Sep 2024 16:39:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA7C3C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 16:39:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E10035C589C;
 Mon,  2 Sep 2024 16:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0BFC4CEC2;
 Mon,  2 Sep 2024 16:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725295141;
 bh=THOWirjnif2PCoJgyUp+GH1dq/VbXAjyaMqmMGMYEYY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=LZYQXRGGQMR4i8GrOz6Nvk9Mte2YR2JtOQ1HrrFs5dAU8NvnvkHkaLwCyexWjYdts
 ubDoH6lTtoo3lJ3OMooT1HxkdZbjY2OsIB0QGT+ktHIytZ698mxNnQSS8fPTDY28G0
 5iLvTPev/gqdUwsbixADfRCPPrbNp+3GDl8hm+nImdtoSaWa86BcbY+6Ei0RES8iLl
 AOAwElrHsMcPFBvhvaafng1q0jE4Zz3SNXjQ9ZSUpJjLV86fRRbNj1QLcKXHOUcSMx
 k95sFsMmx4WARbzCI8l80Ur743CDSkT9rtMZLfnPR3DkVwewHV8LU00ZRabUpGsRS/
 frSCIn8VVw79Q==
From: Kalle Valo <kvalo@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-12-lizetao1@huawei.com>
Date: Mon, 02 Sep 2024 19:38:53 +0300
In-Reply-To: <20240831021334.1907921-12-lizetao1@huawei.com> (Li Zetao's
 message of "Sat, 31 Aug 2024 10:13:33 +0800")
Message-ID: <87a5gqko2q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, radhey.shyam.pandey@amd.com,
 ajay.kathat@microchip.com, florian.fainelli@broadcom.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, kuba@kernel.org,
 pabeni@redhat.com, yisen.zhuang@huawei.com, linux-sunxi@lists.linux.dev,
 jacky_chou@aspeedtech.com, hauke@hauke-m.de, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 claudiu.beznea@tuxon.dev, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 olteanv@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 11/12] wifi: wilc1000: Convert
 using devm_clk_get_optional_enabled() in wilc_sdio_probe()
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

Li Zetao <lizetao1@huawei.com> writes:

> Use devm_clk_get_optional_enabled() instead of devm_clk_get_optional() +
> clk_prepare_enable(), which can make the clk consistent with the device
> life cycle and reduce the risk of unreleased clk resources. Since the
> device framework has automatically released the clk resource, there is
> no need to execute clk_disable_unprepare(clk) on the error path, drop
> the clk_disable_unprepare label, and the original error process can change
> to dispose_irq.
>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/net/wireless/microchip/wilc1000/sdio.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

wifi patches (patches 11 and 12) go via wireless-next, please submit
those separately.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
