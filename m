Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A6B9BCA17
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 11:15:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BD30C6DD9F;
	Tue,  5 Nov 2024 10:15:15 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68064C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 10:15:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1t8GaH-00021Q-OL; Tue, 05 Nov 2024 11:14:49 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1t8GaG-0027zm-0C;
 Tue, 05 Nov 2024 11:14:48 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1t8GaF-0005OF-39;
 Tue, 05 Nov 2024 11:14:47 +0100
Message-ID: <8841158ed61b2b92a92ac6d2afcbd7cff12a6680.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Tue, 05 Nov 2024 11:14:47 +0100
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-3-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
 <20241105-csi_dcmipp_mp25-v2-3-b9fc8a7273c2@foss.st.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 03/15] media: stm32: csi: addition of
 the STM32 CSI driver
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

On Di, 2024-11-05 at 08:49 +0100, Alain Volmat wrote:
> The STM32 CSI controller is tightly coupled with the DCMIPP and act as an
> input stage to receive data coming from the sensor and transferring
> them into the DCMIPP.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2: correct data-lanes handling, using values 1 & 2
>     update yaml filename in MAINTAINERS
> ---
>  MAINTAINERS                                 |    8 +
>  drivers/media/platform/st/stm32/Kconfig     |   14 +
>  drivers/media/platform/st/stm32/Makefile    |    1 +
>  drivers/media/platform/st/stm32/stm32-csi.c | 1144 +++++++++++++++++++++++++++
>  4 files changed, 1167 insertions(+)
> 
[...]
> diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c7f47472c6b3699e94113ce0f38b280a2e45ce15
> --- /dev/null
> +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> @@ -0,0 +1,1144 @@
[...]
> +static int stm32_csi_get_resources(struct stm32_csi_dev *csidev,
> +				   struct platform_device *pdev)
> +{
> +	int irq, ret;
> +
> +	csidev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(csidev->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->base),
> +				     "Failed to ioremap resource\n");
> +
> +	csidev->pclk = devm_clk_get(&pdev->dev, "pclk");
> +	if (IS_ERR(csidev->pclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->pclk),
> +				     "Couldn't get pclk\n");
> +
> +	csidev->txesc = devm_clk_get(&pdev->dev, "txesc");
> +	if (IS_ERR(csidev->txesc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->txesc),
> +				     "Couldn't get txesc\n");
> +
> +	csidev->csi2phy = devm_clk_get(&pdev->dev, "csi2phy");
> +	if (IS_ERR(csidev->csi2phy))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->csi2phy),
> +				     "Couldn't get csi2phy\n");

Consider using devm_clk_bulk_get().

> +	csidev->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(csidev->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csidev->rstc),
> +				     "Couldn't get reset control\n");

If this wasn't in a separate function, rstc wouldn't have to be stored
on csidev as it's only ever used in stm32_csi_probe().

> +
> +	csidev->supplies[0].supply = "vdd";
> +	csidev->supplies[1].supply = "vdda18";
> +	ret = devm_regulator_bulk_get(&pdev->dev, ARRAY_SIZE(csidev->supplies),
> +				      csidev->supplies);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to request regulator vdd\n");
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +					stm32_csi_irq_thread, IRQF_ONESHOT,
> +					dev_name(&pdev->dev), csidev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Unable to request irq");
> +
> +	return 0;
> +}

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
