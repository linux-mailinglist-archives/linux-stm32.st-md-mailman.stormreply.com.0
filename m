Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D344F4AB
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 11:23:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32A45C030C1
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 09:23:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B5C2C030C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2019 09:23:22 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8572206BA;
 Sat, 22 Jun 2019 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561195401;
 bh=8MdsXVlMi4vSBSz+Up33KUEB/PHAE+taEljjGpQ1cvo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ssmbRe9ttHQo0BO0o0UJlKAZDtHHdgGh4RQRJ3UeaAli22V7anbUE0Hu2y+O7Fruf
 OqzozYlIa/SB9yPtNZH5vGuKCugOXK4K0O4AXLUF0VjC72QrGY0xMpz9lOkEIM0PT8
 nC9VS9JyFcfqATYAspQpwxBZcB6pqyndFRd4Cagw=
Date: Sat, 22 Jun 2019 10:23:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20190622102315.2484d6de@archlinux>
In-Reply-To: <1560949431-22948-4-git-send-email-olivier.moysan@st.com>
References: <1560949431-22948-1-git-send-email-olivier.moysan@st.com>
 <1560949431-22948-4-git-send-email-olivier.moysan@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
Subject: Re: [Linux-stm32] [PATCH 3/5] iio: adc: stm32-dfsdm: manage data
 resolution in trigger mode
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

On Wed, 19 Jun 2019 15:03:49 +0200
Olivier Moysan <olivier.moysan@st.com> wrote:

> Add output sample resolution management in scan mode.
> Add stm32_dfsdm_process_data() function to share sample
> processing between continuous and trigger modes.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Makes sense, though I would have preferred a little bit more info
on what the user visible effects fo this change are in
the patch description.  I think I know from reading the code,
but not every one will do that ;)

Applied to the togreg branch of iio.git and pushed out as
testing for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 41 ++++++++++++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 6b90a40882f2..5b19a88412a6 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -779,6 +779,30 @@ static unsigned int stm32_dfsdm_adc_dma_residue(struct stm32_dfsdm_adc *adc)
>  	return 0;
>  }
>  
> +static inline void stm32_dfsdm_process_data(struct stm32_dfsdm_adc *adc,
> +					    s32 *buffer)
> +{
> +	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[adc->fl_id];
> +	struct stm32_dfsdm_filter_osr *flo = &fl->flo;
> +	unsigned int i = adc->nconv;
> +	s32 *ptr = buffer;
> +
> +	while (i--) {
> +		/* Mask 8 LSB that contains the channel ID */
> +		*ptr &= 0xFFFFFF00;
> +		/* Convert 2^(n-1) sample to 2^(n-1)-1 to avoid wrap-around */
> +		if (*ptr > flo->max)
> +			*ptr -= 1;
> +		/*
> +		 * Samples from filter are retrieved with 23 bits resolution
> +		 * or less. Shift left to align MSB on 24 bits.
> +		 */
> +		*ptr <<= flo->lshift;
> +
> +		ptr++;
> +	}
> +}
> +
>  static irqreturn_t stm32_dfsdm_adc_trigger_handler(int irq, void *p)
>  {
>  	struct iio_poll_func *pf = p;
> @@ -787,7 +811,9 @@ static irqreturn_t stm32_dfsdm_adc_trigger_handler(int irq, void *p)
>  	int available = stm32_dfsdm_adc_dma_residue(adc);
>  
>  	while (available >= indio_dev->scan_bytes) {
> -		u32 *buffer = (u32 *)&adc->rx_buf[adc->bufi];
> +		s32 *buffer = (s32 *)&adc->rx_buf[adc->bufi];
> +
> +		stm32_dfsdm_process_data(adc, buffer);
>  
>  		iio_push_to_buffers_with_timestamp(indio_dev, buffer,
>  						   pf->timestamp);
> @@ -806,8 +832,6 @@ static void stm32_dfsdm_dma_buffer_done(void *data)
>  {
>  	struct iio_dev *indio_dev = data;
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> -	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[adc->fl_id];
> -	struct stm32_dfsdm_filter_osr *flo = &fl->flo;
>  	int available = stm32_dfsdm_adc_dma_residue(adc);
>  	size_t old_pos;
>  
> @@ -832,16 +856,7 @@ static void stm32_dfsdm_dma_buffer_done(void *data)
>  	while (available >= indio_dev->scan_bytes) {
>  		s32 *buffer = (s32 *)&adc->rx_buf[adc->bufi];
>  
> -		/* Mask 8 LSB that contains the channel ID */
> -		*buffer &= 0xFFFFFF00;
> -		/* Convert 2^(n-1) sample to 2^(n-1)-1 to avoid wrap-around */
> -		if (*buffer > flo->max)
> -			*buffer -= 1;
> -		/*
> -		 * Samples from filter are retrieved with 23 bits resolution
> -		 * or less. Shift left to align MSB on 24 bits.
> -		 */
> -		*buffer <<= flo->lshift;
> +		stm32_dfsdm_process_data(adc, buffer);
>  
>  		available -= indio_dev->scan_bytes;
>  		adc->bufi += indio_dev->scan_bytes;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
