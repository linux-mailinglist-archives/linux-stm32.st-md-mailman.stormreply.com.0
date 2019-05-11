Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 661611A75B
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 11:58:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19010C54B14
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 09:58:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8E43C54B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2019 09:58:20 +0000 (UTC)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1620D21479;
 Sat, 11 May 2019 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557568699;
 bh=w06xIIDrPLNrUYunIGSuFxnclJ9Ts8pgisvyPGIll0c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KpuAxiSrFCRO5aA7AgDmR6XNEY/HgQMzyfHQlLiLaqKhuXAve4OUfzRbsxkC9lgoo
 u/KWxxXhC0NdI3bWI0AQ+Kfxm8DqpWmK0ppR3q+pBOeKkQK7DDyIvUC1u5+4tbpxef
 pPvH/wpW2lxtd4V+kNlF6XUZ8GeqTyFZu7QD9EZA=
Date: Sat, 11 May 2019 10:58:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Philippe Schenker <dev@pschenker.ch>
Message-ID: <20190511105812.54f6d5f0@archlinux>
In-Reply-To: <20190507143615.28477-1-dev@pschenker.ch>
References: <20190507143615.28477-1-dev@pschenker.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Philippe Schenker <philippe.schenker@toradex.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 David Laight <David.Laight@ACULAB.COM>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] iio: stmpe-adc: Add compatible name
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

On Tue,  7 May 2019 16:36:11 +0200
Philippe Schenker <dev@pschenker.ch> wrote:

> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> Add the compatible name to the driver so it gets loaded when the proper
> node in DT is detected.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Applied thanks,

Jonathan

> ---
> 
>  drivers/iio/adc/stmpe-adc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> index 37f4b74a5d32..9ec338ba3440 100644
> --- a/drivers/iio/adc/stmpe-adc.c
> +++ b/drivers/iio/adc/stmpe-adc.c
> @@ -354,9 +354,14 @@ static struct platform_driver stmpe_adc_driver = {
>  		.pm	= &stmpe_adc_pm_ops,
>  	},
>  };
> -
>  module_platform_driver(stmpe_adc_driver);
>  
> +static const struct of_device_id stmpe_adc_ids[] = {
> +	{ .compatible = "st,stmpe-adc", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, stmpe_adc_ids);
> +
>  MODULE_AUTHOR("Stefan Agner <stefan.agner@toradex.com>");
>  MODULE_DESCRIPTION("STMPEXXX ADC driver");
>  MODULE_LICENSE("GPL v2");

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
