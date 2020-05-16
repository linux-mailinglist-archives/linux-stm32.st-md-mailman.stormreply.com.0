Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B91D62E5
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2020 19:12:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17E5CC36B20;
	Sat, 16 May 2020 17:12:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73807C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2020 17:12:50 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D9E8206D8;
 Sat, 16 May 2020 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589649169;
 bh=6IJY4KxDuWPHH1o658HGioayIj3kO/S0obPuk7kZ6mU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=STLdi0QoDx5qKD4mjTSUI0w8gqa09q+XkcRAlqIajis1bhP/yjdMgL5GfnID13mXG
 BBjJ6101DlofeKYd3TIyMzLQ01BPWN7aQMhu+bjpzro1KL4aeQkp2r2kKlv2GmQ4/V
 0OnH77GGibp4wG/Bpvc9DiX+lQeesvHCgsq6wqxU=
Date: Sat, 16 May 2020 18:12:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Message-ID: <20200516181244.4d22c60b@archlinux>
In-Reply-To: <20200514131710.84201-2-alexandru.ardelean@analog.com>
References: <20200514131710.84201-1-alexandru.ardelean@analog.com>
 <20200514131710.84201-2-alexandru.ardelean@analog.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alexandre.belloni@bootlin.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, ak@it-klinger.de, mcoquelin.stm32@gmail.com,
 eugen.hristev@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/8] iio: proximity: ping: pass
 reference to IIO device via call-stack
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

On Thu, 14 May 2020 16:17:03 +0300
Alexandru Ardelean <alexandru.ardelean@analog.com> wrote:

> Since there will be some changes to how iio_priv_to_dev() is implemented,
> it could be that the helper becomes a bit slower, as it will be hidden away
> in the IIO core.
> 
> For this driver, the IIO device can be passed directly as a parameter to
> the ping_read() function, thus making it immune to the change of
> iio_priv_to_dev().
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Patch makes sense and I should have spotted this one during original
review :( Going backwards and forwards is never a good idea even without
the rework you have.

But... (you knew that was coming :), there is no need to pass
data to the the read function.  It is the structure returned by
iio_priv() and not used anywhere else in the read_raw callback.
So might as well just pass the iio_dev and get the data structure
with in the read function via iio_priv(indio_dev)

Thanks,

J

> ---
>  drivers/iio/proximity/ping.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/proximity/ping.c b/drivers/iio/proximity/ping.c
> index 12b893c5b0ee..ddc43a5a2ef8 100644
> --- a/drivers/iio/proximity/ping.c
> +++ b/drivers/iio/proximity/ping.c
> @@ -89,14 +89,13 @@ static irqreturn_t ping_handle_irq(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static int ping_read(struct ping_data *data)
> +static int ping_read(struct iio_dev *indio_dev, struct ping_data *data)
>  {
>  	int ret;
>  	ktime_t ktime_dt;
>  	s64 dt_ns;
>  	u32 time_ns, distance_mm;
>  	struct platform_device *pdev = to_platform_device(data->dev);
> -	struct iio_dev *indio_dev = iio_priv_to_dev(data);
>  
>  	/*
>  	 * just one read-echo-cycle can take place at a time
> @@ -236,7 +235,7 @@ static int ping_read_raw(struct iio_dev *indio_dev,
>  
>  	switch (info) {
>  	case IIO_CHAN_INFO_RAW:
> -		ret = ping_read(data);
> +		ret = ping_read(indio_dev, data);
>  		if (ret < 0)
>  			return ret;
>  		*val = ret;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
