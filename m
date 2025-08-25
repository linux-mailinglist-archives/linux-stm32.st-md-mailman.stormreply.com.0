Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 601FCB33E24
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 13:35:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2687BC36B3E;
	Mon, 25 Aug 2025 11:35:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B3E7C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 11:35:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BBFE441B07;
 Mon, 25 Aug 2025 11:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C408C4CEED;
 Mon, 25 Aug 2025 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756121723;
 bh=G/61tsIfBpP7VYIx9gVTeDZEHhYHjn2CEFnLTjnYXG4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nvDuF3H6+1NBwrq7nZs/ZMfcyEsTv0fFs/ZGXeBCsb37uLyju05gFfzD//QLGlI6k
 dN5TLXERIujUDB7a11P+FR9WpiDdaT+rdNC/SxeiC8E7q7ZJMOs2SnNRalD5wq4oJ2
 GfD60mM6gf3O35IKU0qXi+39/nFXFqF8KObK26Ms4aLRiDkSe1wrjXfTrbuWuCfnQF
 yhK5zdjN+hHyKEHEChellx6Y+VKnIvrQIJaO5OifVqw+Y/TFH5PW2vPHSdLcbUUCXN
 xmwaU56ZZ3e7t5NnKD4P8uVz4EJuGe63faWTe5HhcnmpxjyDyMjVu4CgFnsTHSgFuh
 RIHHXiOP8pK0g==
Date: Mon, 25 Aug 2025 12:35:08 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dixit Parmar <dixitparmar19@gmail.com>
Message-ID: <20250825123508.7f9e9271@jic23-huawei>
In-Reply-To: <20250822-enomam_logs-v1-4-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250822-enomam_logs-v1-4-db87f2974552@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Haibo Chen <haibo.chen@nxp.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Lechner <dlechner@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-samsung-soc@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 04/10] iio: health: Drop unnecessary
	-ENOMEM messages
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

On Fri, 22 Aug 2025 09:19:52 +0530
Dixit Parmar <dixitparmar19@gmail.com> wrote:

> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
Some code movement in here so I had applied the equivalent.

J
> ---
>  drivers/iio/health/afe4403.c | 4 +---
>  drivers/iio/health/afe4404.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/health/afe4403.c b/drivers/iio/health/afe4403.c
> index 1582cfc03579..8e5db2235de0 100644
> --- a/drivers/iio/health/afe4403.c
> +++ b/drivers/iio/health/afe4403.c
> @@ -531,10 +531,8 @@ static int afe4403_probe(struct spi_device *spi)
>  						   "%s-dev%d",
>  						   indio_dev->name,
>  						   iio_device_id(indio_dev));
> -		if (!afe->trig) {
> -			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
> +		if (!afe->trig)
>  			return -ENOMEM;
> -		}
>  
>  		iio_trigger_set_drvdata(afe->trig, indio_dev);
>  
> diff --git a/drivers/iio/health/afe4404.c b/drivers/iio/health/afe4404.c
> index 99ff68aed27c..11a0f465fd68 100644
> --- a/drivers/iio/health/afe4404.c
> +++ b/drivers/iio/health/afe4404.c
> @@ -538,10 +538,8 @@ static int afe4404_probe(struct i2c_client *client)
>  						   "%s-dev%d",
>  						   indio_dev->name,
>  						   iio_device_id(indio_dev));
> -		if (!afe->trig) {
> -			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
> +		if (!afe->trig)
>  			return -ENOMEM;
> -		}
>  
>  		iio_trigger_set_drvdata(afe->trig, indio_dev);
>  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
