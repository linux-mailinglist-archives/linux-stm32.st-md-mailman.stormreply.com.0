Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D374EEDD
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 14:30:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B0BAC6B457;
	Tue, 11 Jul 2023 12:30:28 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED160C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 12:30:26 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso89486061fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 05:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689078626; x=1691670626;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PF44NEqyxP0uEPvVdBdUhZoOyhnmXaRRtdBTolupizs=;
 b=SBnTfmlUAjKWCRn3fyds5WJnq/rFhCyNY0inIr58sbmQdnr0ekqm/rRHOpDPaGy/KO
 B5+bnED3EocI70B/1Liqfviz84UQamIYXCfhBLJdAwpngn8GsImdPLHw3RB6cx2k3qLl
 nSGU6gtvVw3/VsXZCkMPykBjpKDuKmimIVto3O71KEXoVSR8sXs9wWBC1yWjR9VJRV7y
 Wiz8QKW407Y9wEjIJVzHwlxfi2RJhdAg86N/DwGw/jxMsF0gA+NEhyREeEq19FirWzm/
 TqVILtBOKMHlbGVQP5ypx9ZxmExDySMPGPYIR/gAUwwQJjSdRAbKTqb1KbxEGl8qDyoh
 Eb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689078626; x=1691670626;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PF44NEqyxP0uEPvVdBdUhZoOyhnmXaRRtdBTolupizs=;
 b=baxwQq4CNct9Rlz4CyEhgHA5oJ2lwrpG4i5t4GNFd+ge9AKKzVhm+jrEysEyR8ZBOQ
 59MnuQuZcHgVjSDcIQcFygnTV1Gx8xNk1O2y14K8vrWM/8YTxA3QgfMjoMugj4dNxhPs
 XpTf/o+6XIe+d6ehm2L29PSSaAuyAPpDa2mR479niCxlTPsluPSZkDMs5bb2D1/5vDMm
 vnlS4pPYQA27m9TzsjgucWLvY5LW1nPwqgYJ3c7aYDTBXvTFQ67Qcn8b8gYWnTVaMOtU
 z9EnpK4xDdJ24cr327ncTO+8LzxffUFm+eJdkzZrxuHvZ8PKsZue91TAPZY30EbaHark
 Km2g==
X-Gm-Message-State: ABy/qLbiHxoZndLMqHUxbiO2S8xiLigV08MxyEWyWNyTBMMAPWYg5MI9
 G1QxOQxkxSA9e4l0w1x+8Uk=
X-Google-Smtp-Source: APBJJlEGAsotaRV20l259BaTNO1He84gEShKxa1gOSyhZTOSrSYKw2njibp5AmXp10CkNfmdPINRWg==
X-Received: by 2002:a2e:8eca:0:b0:2b6:dc50:19ac with SMTP id
 e10-20020a2e8eca000000b002b6dc5019acmr13901724ljl.31.1689078625694; 
 Tue, 11 Jul 2023 05:30:25 -0700 (PDT)
Received: from mobilestation ([85.249.18.12]) by smtp.gmail.com with ESMTPSA id
 j17-20020a2e6e11000000b002b6ee75648fsm441355ljc.12.2023.07.11.05.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 05:30:24 -0700 (PDT)
Date: Tue, 11 Jul 2023 15:30:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <tvm772o6uqndgyjvycv27qouqq76crpre5tyqcnanaautqjjwn@pydiwhjzhbgd>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-14-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710154932.68377-14-andriy.shevchenko@linux.intel.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-trace-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-spi@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 13/15] spi: Rename SPI_MASTER_GPIO_SS
 to SPI_CONTROLLER_GPIO_SS
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

On Mon, Jul 10, 2023 at 06:49:30PM +0300, Andy Shevchenko wrote:
> Rename SPI_MASTER_GPIO_SS to SPI_CONTROLLER_GPIO_SS and
> convert the users to SPI_CONTROLLER_GPIO_SS to follow

* I'm not an expert in English, but imo the next would look a
* bit more readable:
* convert s/the users to SPI_CONTROLLER_GPIO_SS/the code to using SPI_CONTROLLER_GPIO_SS

> the new naming shema.

s/shema/schema

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
[...]

>  drivers/spi/spi-dw-core.c  | 2 +-

[...]

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index a8ba41ad4541..45f5acc26b1d 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -932,7 +932,7 @@ int dw_spi_add_host(struct device *dev, struct dw_spi *dws)
>  	if (dws->mem_ops.exec_op)
>  		master->mem_ops = &dws->mem_ops;
>  	master->max_speed_hz = dws->max_freq;
> -	master->flags = SPI_MASTER_GPIO_SS;
> +	master->flags = SPI_CONTROLLER_GPIO_SS;
>  	master->auto_runtime_pm = true;
>  
>  	/* Get default rx sample delay */

For the DW APB/AHB SSI driver:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

[...]

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 06a92a3a5746..bcabae98cb7c 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -995,7 +995,7 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
>  				gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), activate);
>  		}
>  		/* Some SPI masters need both GPIO CS & slave_select */
> -		if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
> +		if ((spi->controller->flags & SPI_CONTROLLER_GPIO_SS) &&
>  		    spi->controller->set_cs)
>  			spi->controller->set_cs(spi, !enable);
>  	} else if (spi->controller->set_cs) {
> @@ -3020,7 +3020,7 @@ static int spi_get_gpio_descs(struct spi_controller *ctlr)
>  
>  	ctlr->unused_native_cs = ffs(~native_cs_mask) - 1;
>  
> -	if ((ctlr->flags & SPI_MASTER_GPIO_SS) && num_cs_gpios &&
> +	if ((ctlr->flags & SPI_CONTROLLER_GPIO_SS) && num_cs_gpios &&
>  	    ctlr->max_native_cs && ctlr->unused_native_cs >= ctlr->max_native_cs) {
>  		dev_err(dev, "No unused native chip select available\n");
>  		return -EINVAL;
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index cdc3addfe117..43f6c3f71a76 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -578,8 +578,7 @@ struct spi_controller {
>  #define SPI_CONTROLLER_NO_TX		BIT(2)	/* Can't do buffer write */
>  #define SPI_CONTROLLER_MUST_RX		BIT(3)	/* Requires rx */
>  #define SPI_CONTROLLER_MUST_TX		BIT(4)	/* Requires tx */
> -
> -#define SPI_MASTER_GPIO_SS		BIT(5)	/* GPIO CS must select slave */
> +#define SPI_CONTROLLER_GPIO_SS		BIT(5)	/* GPIO CS must select slave */
>  
>  	/* Flag indicating if the allocation of this struct is devres-managed */
>  	bool			devm_allocated;
> -- 
> 2.40.0.1.gaa8946217a0b
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
