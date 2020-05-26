Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A431E18B2
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 03:13:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7578EC36B23;
	Tue, 26 May 2020 01:13:22 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EEA4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 01:13:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 8D51C127AA591;
 Mon, 25 May 2020 18:13:18 -0700 (PDT)
Date: Mon, 25 May 2020 18:13:17 -0700 (PDT)
Message-Id: <20200525.181317.1216905484376882401.davem@davemloft.net>
To: fugang.duan@nxp.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <1590402554-13175-2-git-send-email-fugang.duan@nxp.com>
References: <1590402554-13175-1-git-send-email-fugang.duan@nxp.com>
 <1590402554-13175-2-git-send-email-fugang.duan@nxp.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 25 May 2020 18:13:18 -0700 (PDT)
Cc: p.zabel@pengutronix.de, netdev@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/2] net: ethernet: dwmac: add
 Ethernet glue logic for NXP imx8 chip
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

From: Fugang Duan <fugang.duan@nxp.com>
Date: Mon, 25 May 2020 18:29:13 +0800

> +static int imx_dwmac_init(struct platform_device *pdev, void *priv)
> +{
> +	struct imx_priv_data *dwmac = priv;
> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
> +	int ret;
> +

Please code these sequences as:

	struct plat_stmmacenet_data *plat_dat;
	struct imx_priv_data *dwmac = priv;
	int ret;

	plat_dat = dwmac->plat_dat;

In order to have reverse christmas three local variable ordering.

THank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
