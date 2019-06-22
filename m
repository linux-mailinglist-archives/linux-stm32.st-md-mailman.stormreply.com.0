Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C84F4A8
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 11:21:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0596EC030BF
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 09:21:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68E39C030BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2019 09:21:25 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F86E205F4;
 Sat, 22 Jun 2019 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561195283;
 bh=wkdTMticKHUz+cqAK4HXYfHz22t3/vjmhA1xKNHdB30=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2b1Fs1wv3cLZcM3ddy5Imq5aX1oUyn4BskTADmRj3/zN0VqBAh8p4ZDaOdh4oivQ6
 Ef9+oE8oBzYGvMBa40/aB4e/iqxJ2ICfzNyPVnKuBxjc2YiNqy9uNgf5FH9Y1Oxd7P
 EytmmecSLYh0JNtWxL5ybfYBrpICRGVvz0MMTeoI=
Date: Sat, 22 Jun 2019 10:21:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20190622102117.5289e1e2@archlinux>
In-Reply-To: <1560949431-22948-3-git-send-email-olivier.moysan@st.com>
References: <1560949431-22948-1-git-send-email-olivier.moysan@st.com>
 <1560949431-22948-3-git-send-email-olivier.moysan@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
Subject: Re: [Linux-stm32] [PATCH 2/5] iio: adc: stm32-dfsdm: fix data type
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

On Wed, 19 Jun 2019 15:03:48 +0200
Olivier Moysan <olivier.moysan@st.com> wrote:

> Fix the data type as DFSDM raw output is complements 2,
> 24bits left aligned in a 32-bit register.
> This change does not affect AUDIO path
> - Set data as signed for IIO (as for AUDIO)
> - Set 8 bit right shift for IIO.
> The 8 LSBs bits of data contains channel info and are masked.
> 
> Fixes: e2e6771c6462 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with them.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index cb596f104919..6b90a40882f2 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1365,11 +1365,11 @@ static int stm32_dfsdm_adc_chan_init_one(struct iio_dev *indio_dev,
>  					BIT(IIO_CHAN_INFO_SAMP_FREQ);
>  
>  	if (adc->dev_data->type == DFSDM_AUDIO) {
> -		ch->scan_type.sign = 's';
>  		ch->ext_info = dfsdm_adc_audio_ext_info;
>  	} else {
> -		ch->scan_type.sign = 'u';
> +		ch->scan_type.shift = 8;
>  	}
> +	ch->scan_type.sign = 's';
>  	ch->scan_type.realbits = 24;
>  	ch->scan_type.storagebits = 32;
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
