Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 526564F4B1
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 11:30:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06939C5DBEE
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 09:30:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 441C3C5DBED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2019 09:30:33 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99BE52075E;
 Sat, 22 Jun 2019 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561195831;
 bh=kbmCfu7JLsyXc4sM8ZXB5nDnTJqCjT6QBaFydFU721s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pa2Vu7lkVZwkpSflRfCLgEGIhVKq0c7U3HPg80K9Mxp5wVRP6RPgHAtuZ0maQRMZj
 soXCn4HcV0waXflscgQQfrwVLe2AMutnTH7J3IYCySB/zUh2u7T0MgGZ4XRoZyuyh6
 i4IVa52lZdErnOJLxarPixfXU+zgA/n0HYCSOxDo=
Date: Sat, 22 Jun 2019 10:30:26 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20190622103026.0617d30e@archlinux>
In-Reply-To: <1560949431-22948-5-git-send-email-olivier.moysan@st.com>
References: <1560949431-22948-1-git-send-email-olivier.moysan@st.com>
 <1560949431-22948-5-git-send-email-olivier.moysan@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
Subject: Re: [Linux-stm32] [PATCH 4/5] iio: adc: stm32-dfsdm: add fast mode
	support
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

On Wed, 19 Jun 2019 15:03:50 +0200
Olivier Moysan <olivier.moysan@st.com> wrote:

> The use of fast mode allows to get a larger set of solution
> for filter parameters. This can be useful to reach a better
> output sample resolution, when fast mode can be used.
> 
> Fast mode is selected at startup if it is relevant.
> The startup is performed in postenable callback context,
> where there are too tight time constraints for filter parameters
> computation. For this reason both fast and non fast filter parameters
> are pre-computed previously.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
I've no problem with precomputing these but I'm curious.
What is the use model where postenable is performance critical?

Patch looks fine to me.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 65 ++++++++++++++++++++++++++++++---------
>  drivers/iio/adc/stm32-dfsdm.h     |  4 +--
>  2 files changed, 53 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 5b19a88412a6..d855a605eab6 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -196,7 +196,7 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
>  	int bits, shift;
>  	unsigned int m = 1;	/* multiplication factor */
>  	unsigned int p = fl->ford;	/* filter order (ford) */
> -	struct stm32_dfsdm_filter_osr *flo = &fl->flo;
> +	struct stm32_dfsdm_filter_osr *flo = &fl->flo[fast];
>  
>  	pr_debug("%s: Requested oversampling: %d\n",  __func__, oversamp);
>  	/*
> @@ -217,7 +217,6 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
>  	 * Look for filter and integrator oversampling ratios which allows
>  	 * to maximize data output resolution.
>  	 */
> -	flo->res = 0;
>  	for (fosr = 1; fosr <= DFSDM_MAX_FL_OVERSAMPLING; fosr++) {
>  		for (iosr = 1; iosr <= DFSDM_MAX_INT_OVERSAMPLING; iosr++) {
>  			if (fast)
> @@ -309,6 +308,28 @@ static int stm32_dfsdm_compute_osrs(struct stm32_dfsdm_filter *fl,
>  	return 0;
>  }
>  
> +static int stm32_dfsdm_compute_all_osrs(struct iio_dev *indio_dev,
> +					unsigned int oversamp)
> +{
> +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> +	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[adc->fl_id];
> +	int ret0, ret1;
> +
> +	memset(&fl->flo[0], 0, sizeof(fl->flo[0]));
> +	memset(&fl->flo[1], 0, sizeof(fl->flo[1]));
> +
> +	ret0 = stm32_dfsdm_compute_osrs(fl, 0, oversamp);
> +	ret1 = stm32_dfsdm_compute_osrs(fl, 1, oversamp);
> +	if (ret0 < 0 && ret1 < 0) {
> +		dev_err(&indio_dev->dev,
> +			"Filter parameters not found: errors %d/%d\n",
> +			ret0, ret1);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int stm32_dfsdm_start_channel(struct stm32_dfsdm_adc *adc)
>  {
>  	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> @@ -433,11 +454,25 @@ static int stm32_dfsdm_channels_configure(struct stm32_dfsdm_adc *adc,
>  	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
>  	struct regmap *regmap = adc->dfsdm->regmap;
>  	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[fl_id];
> -	struct stm32_dfsdm_filter_osr *flo = &fl->flo;
> +	struct stm32_dfsdm_filter_osr *flo = &fl->flo[0];
>  	const struct iio_chan_spec *chan;
>  	unsigned int bit;
>  	int ret;
>  
> +	fl->fast = 0;
> +
> +	/*
> +	 * In continuous mode, use fast mode configuration,
> +	 * if it provides a better resolution.
> +	 */
> +	if (adc->nconv == 1 && !trig &&
> +	    (indio_dev->currentmode & INDIO_BUFFER_SOFTWARE)) {
> +		if (fl->flo[1].res >= fl->flo[0].res) {
> +			fl->fast = 1;
> +			flo = &fl->flo[1];
> +		}
> +	}
> +
>  	if (!flo->res)
>  		return -EINVAL;
>  
> @@ -463,7 +498,7 @@ static int stm32_dfsdm_filter_configure(struct stm32_dfsdm_adc *adc,
>  	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
>  	struct regmap *regmap = adc->dfsdm->regmap;
>  	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[fl_id];
> -	struct stm32_dfsdm_filter_osr *flo = &fl->flo;
> +	struct stm32_dfsdm_filter_osr *flo = &fl->flo[fl->fast];
>  	u32 cr1;
>  	const struct iio_chan_spec *chan;
>  	unsigned int bit, jchg = 0;
> @@ -490,6 +525,12 @@ static int stm32_dfsdm_filter_configure(struct stm32_dfsdm_adc *adc,
>  	if (ret)
>  		return ret;
>  
> +	ret = regmap_update_bits(regmap, DFSDM_CR1(fl_id),
> +				 DFSDM_CR1_FAST_MASK,
> +				 DFSDM_CR1_FAST(fl->fast));
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * DFSDM modes configuration W.R.T audio/iio type modes
>  	 * ----------------------------------------------------------------
> @@ -636,7 +677,6 @@ static int dfsdm_adc_set_samp_freq(struct iio_dev *indio_dev,
>  				   unsigned int spi_freq)
>  {
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> -	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[adc->fl_id];
>  	unsigned int oversamp;
>  	int ret;
>  
> @@ -646,11 +686,10 @@ static int dfsdm_adc_set_samp_freq(struct iio_dev *indio_dev,
>  			"Rate not accurate. requested (%u), actual (%u)\n",
>  			sample_freq, spi_freq / oversamp);
>  
> -	ret = stm32_dfsdm_compute_osrs(fl, 0, oversamp);
> -	if (ret < 0) {
> -		dev_err(&indio_dev->dev, "No filter parameters that match!\n");
> +	ret = stm32_dfsdm_compute_all_osrs(indio_dev, oversamp);
> +	if (ret < 0)
>  		return ret;
> -	}
> +
>  	adc->sample_freq = spi_freq / oversamp;
>  	adc->oversamp = oversamp;
>  
> @@ -783,7 +822,7 @@ static inline void stm32_dfsdm_process_data(struct stm32_dfsdm_adc *adc,
>  					    s32 *buffer)
>  {
>  	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[adc->fl_id];
> -	struct stm32_dfsdm_filter_osr *flo = &fl->flo;
> +	struct stm32_dfsdm_filter_osr *flo = &fl->flo[fl->fast];
>  	unsigned int i = adc->nconv;
>  	s32 *ptr = buffer;
>  
> @@ -1171,7 +1210,6 @@ static int stm32_dfsdm_write_raw(struct iio_dev *indio_dev,
>  				 int val, int val2, long mask)
>  {
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> -	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[adc->fl_id];
>  	struct stm32_dfsdm_channel *ch = &adc->dfsdm->ch_list[chan->channel];
>  	unsigned int spi_freq;
>  	int ret = -EINVAL;
> @@ -1181,7 +1219,7 @@ static int stm32_dfsdm_write_raw(struct iio_dev *indio_dev,
>  		ret = iio_device_claim_direct_mode(indio_dev);
>  		if (ret)
>  			return ret;
> -		ret = stm32_dfsdm_compute_osrs(fl, 0, val);
> +		ret = stm32_dfsdm_compute_all_osrs(indio_dev, val);
>  		if (!ret)
>  			adc->oversamp = val;
>  		iio_device_release_direct_mode(indio_dev);
> @@ -1430,8 +1468,7 @@ static int stm32_dfsdm_adc_init(struct iio_dev *indio_dev)
>  	int ret, chan_idx;
>  
>  	adc->oversamp = DFSDM_DEFAULT_OVERSAMPLING;
> -	ret = stm32_dfsdm_compute_osrs(&adc->dfsdm->fl_list[adc->fl_id], 0,
> -				       adc->oversamp);
> +	ret = stm32_dfsdm_compute_all_osrs(indio_dev, adc->oversamp);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/drivers/iio/adc/stm32-dfsdm.h b/drivers/iio/adc/stm32-dfsdm.h
> index 18b06ee6ed7b..5dbdae4ed881 100644
> --- a/drivers/iio/adc/stm32-dfsdm.h
> +++ b/drivers/iio/adc/stm32-dfsdm.h
> @@ -263,13 +263,13 @@ struct stm32_dfsdm_filter_osr {
>  /**
>   * struct stm32_dfsdm_filter - structure relative to stm32 FDSDM filter
>   * @ford: filter order
> - * @flo: filter oversampling structure
> + * @flo: filter oversampling data table indexed by fast mode flag
>   * @sync_mode: filter synchronized with filter 0
>   * @fast: filter fast mode
>   */
>  struct stm32_dfsdm_filter {
>  	enum stm32_dfsdm_sinc_order ford;
> -	struct stm32_dfsdm_filter_osr flo;
> +	struct stm32_dfsdm_filter_osr flo[2];
>  	unsigned int sync_mode;
>  	unsigned int fast;
>  };

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
