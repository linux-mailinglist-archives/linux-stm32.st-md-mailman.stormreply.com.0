Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9009244BE40
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 11:05:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43A03C5EC6F;
	Wed, 10 Nov 2021 10:05:36 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 411E0C5EC6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 10:05:35 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mkkU1-0000DR-Lh; Wed, 10 Nov 2021 11:05:33 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mkkTy-0005Rw-GD; Wed, 10 Nov 2021 11:05:30 +0100
Message-ID: <47a188dcc1a16e6147cf403b5ce7781646a87203.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 10 Nov 2021 11:05:30 +0100
In-Reply-To: <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
 <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/renesas-ostm: Add
 RZ/G2L OSTM support
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

On Wed, 2021-11-10 at 08:31 +0000, Biju Das wrote:
[...]
> +#ifdef CONFIG_ARCH_R9A07G044
> +static int __init ostm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct reset_control *rstc;
> +	int ret;
> +
> +	rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get reset");
> +
> +	reset_control_deassert(rstc);
> +
> +	ret = ostm_init(dev->of_node);
> +	if (ret) {
> +		reset_control_assert(rstc);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ostm_of_table[] = {
> +	{ .compatible = "renesas,rzg2l-ostm", },
> +	{ }
> +};
> +
> +static struct platform_driver ostm_device_driver = {
> +	.driver		= {
> +		.name	= "rzg2l_ostm",
> +		.of_match_table = of_match_ptr(ostm_of_table),
> +	},
> +};
> +builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
> +#endif

I assuming the corresponding reset controller driver is builtin as well.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
