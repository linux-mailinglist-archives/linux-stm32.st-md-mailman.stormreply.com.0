Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29992989B
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jul 2024 17:22:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C51E0C6DD96;
	Sun,  7 Jul 2024 15:22:02 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE6D5C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jul 2024 15:21:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 26700CE09B8;
 Sun,  7 Jul 2024 15:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85403C3277B;
 Sun,  7 Jul 2024 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720365713;
 bh=ZTHfu8WHstnTq0iDPJMZVpdzuIPlhUF3qHQYwWj77zU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VTCxanOfSSdDkk/8LHOTeJaccNd8RmSEyaD7BHh08G2W/sbdqo7u9Iow51ikJEREv
 AAHFJzDu1oV4jm63Z7nPyNWOn2xmpPAo0Uehm/+5dtWktLZQ6gnTnHSQ5AKJFzLVZm
 kj/1Sv4aCeBSBFEXkWPZvbcoof3USbQy1Pkl+0JT8/nivShAngLiJ3kKsiXoBLKSqa
 P+hW6Ptm7CaPrXmhl2UdLBEkVCRzYgN4nHAheSrTyK++g5jjAW40lrg9q0hgQSyTC4
 u5n/T/c6INdcILMbeN5ftx6XCPzS555heAYeFwpzzUtAR+gnlcm7nsKCCb63A6mNqk
 bt4UA8ZydhLpQ==
Date: Sun, 7 Jul 2024 16:21:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240707162144.19ffc0eb@jic23-huawei>
In-Reply-To: <20240704155338.2387858-9-olivier.moysan@foss.st.com>
References: <20240704155338.2387858-1-olivier.moysan@foss.st.com>
 <20240704155338.2387858-9-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno Sa <nuno.sa@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 8/8] iio: adc: stm32-dfsdm: add scaling
 support to dfsdm
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

On Thu, 4 Jul 2024 17:53:36 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add scaling support to STM32 DFSDM.
> 
> When used in an analog context, a DFSDM filter typically converts the data
> from a sigma delta modulator. The IIO device associated to the DFSDM
> filter provides these data as raw data.
> The IIO device can provide scaling information (voltage and offset) to
> allow conversion of raw data into physical values.
> 
> With the new binding based on IIO backend framework, the sigma delta
> modulators are defined as backends providing scaling information.
> 
> The scaling is not supported with legacy binding.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Acked-by: Nuno Sa <nuno.sa@analog.com>

One really minor thing inline.

Jonathan

> @@ -1278,7 +1308,14 @@ static int stm32_dfsdm_read_raw(struct iio_dev *indio_dev,
>  				int *val2, long mask)
>  {
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> -	int ret;
> +
> +	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[adc->fl_id];
> +	struct stm32_dfsdm_filter_osr *flo = &fl->flo[fl->fast];
> +	u32 max = flo->max << (flo->lshift - chan->scan_type.shift);
> +	int ret, idx = chan->scan_index;
Trivial but I've been grumping at others about this today so you get it too ;)
Don't mix declarations that include assignments with ones that don't.
It isn't good for general readability.
	int idx = chan->scan_index;
	int ret;

I'm not interested in patches to 'fix' this in other code, but nice to not
introduce more cases in new code.

> +
> +	if (flo->lshift < chan->scan_type.shift)
> +		max = flo->max >> (chan->scan_type.shift - flo->lshift);
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
