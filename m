Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E136AA941E
	for <lists+linux-stm32@lfdr.de>; Mon,  5 May 2025 15:13:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0301AC78F63;
	Mon,  5 May 2025 13:13:01 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9C14C78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:12:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1uBvcr-0006PX-1O; Mon, 05 May 2025 15:12:53 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1uBvcq-001EYf-0D;
 Mon, 05 May 2025 15:12:52 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1uBvcp-000Jxu-3C;
 Mon, 05 May 2025 15:12:52 +0200
Message-ID: <3685c6351d8b940abe70ccf22d783e71ced6f6da.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Patrice Chotard <patrice.chotard@foss.st.com>, Mark Brown
 <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 05 May 2025 15:12:51 +0200
In-Reply-To: <20250411-b4-upstream_ospi_reset_update-v2-2-4de7f5dd2a91@foss.st.com>
References: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
 <20250411-b4-upstream_ospi_reset_update-v2-2-4de7f5dd2a91@foss.st.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
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

Hi Patrice,

On Fr, 2025-04-11 at 14:41 +0200, Patrice Chotard wrote:
> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
> acquire/release mechanism which ensure exclusive reset usage.
> 
> This avoid to call reset_control_get/put() in OMM driver each time
> we need to reset OSPI children and guarantee the reset line stays
> deasserted.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  drivers/spi/spi-stm32-ospi.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index d002b9c16714684e4e4623f9255a7f2660c46fd1..ef840f377459891b559be6d6c0435408fb58a1e9 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -804,7 +804,7 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ospi->rstc = devm_reset_control_array_get_exclusive(dev);
> +	ospi->rstc = devm_reset_control_array_get_exclusive_released(dev);
>  	if (IS_ERR(ospi->rstc))
>  		return dev_err_probe(dev, PTR_ERR(ospi->rstc),
>  				     "Can't get reset\n");
> @@ -936,11 +936,14 @@ static int stm32_ospi_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_pm_enable;
>  
> -	if (ospi->rstc) {
> -		reset_control_assert(ospi->rstc);
> -		udelay(2);
> -		reset_control_deassert(ospi->rstc);
> -	}
> +	ret = reset_control_acquire(ospi->rstc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
> +
> +	reset_control_assert(ospi->rstc);
> +	udelay(2);
> +	reset_control_deassert(ospi->rstc);
> +	reset_control_release(ospi->rstc);

Could you keep the reset control (mostly) acquired from probe() to
remove()? The reset control would have to be released/acquired in OSPI
suspend/resume so that OMM can temporarily acquire control during OMM
resume.

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
