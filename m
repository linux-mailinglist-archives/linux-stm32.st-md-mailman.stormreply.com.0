Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7C7B42C8
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Sep 2023 19:41:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0216DC6B479;
	Sat, 30 Sep 2023 17:41:22 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12D3FC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 17:41:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 88981B80010;
 Sat, 30 Sep 2023 17:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958E0C433C8;
 Sat, 30 Sep 2023 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696095679;
 bh=+etRTCZPNPJTHh+N1MKyjYR8NQe0gI1JFDlR+ExjRJM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mBeARBSn8fmfsR2i08eGBTauyugnNT7jKXny6cHo6Y6UuKmLBwA7OE1hzwLzty89c
 m3TMncW+2/Y+MrwZQ7ZPMSQDMs771zemoTlLVNF0ky0hbF1ZuKXbHW0Mp7RyWLypGt
 fUnA3jvf6gMkX2ySekmdZrxt2ghgjJkTbbl7RbZARkYQlhazUWdBJOQG8bA/FuZEaS
 ydjyOYcA4ifQOqIRtf75va8Sko3Vu8tsOD/68syYDf3eN5hxqiwY3JIBfD5vVF9Qkg
 5iEwRZPV2DNNyDWEYHAtd8KAt6sowjLeULvNm20d/f1Z/J2NfDolaPvIt3T7pLNPLJ
 Lf2vIDHQ3qHBA==
Date: Sat, 30 Sep 2023 18:41:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20230930184118.73d7465a@jic23-huawei>
In-Reply-To: <202309232006.690F89A@keescook>
References: <20230921-strncpy-drivers-iio-adc-stm32-adc-c-v1-1-c50eca098597@google.com>
 <202309232006.690F89A@keescook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Justin Stitt <justinstitt@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: replace deprecated
	strncpy
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

On Sat, 23 Sep 2023 20:15:09 -0700
Kees Cook <keescook@chromium.org> wrote:

> On Thu, Sep 21, 2023 at 04:54:00AM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> > 
> > We should prefer more robust and less ambiguous string interfaces.
> > 
> > We expect adc->chan_name[val] to be NUL-terminated based on ch_name's
> > use within functions that expect NUL-terminated strings like strncmp and
> > printf-likes:
> > | 	if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
> > | 		/* Check internal channel availability */
> > | 		switch (i) {
> > | 		case STM32_ADC_INT_CH_VDDCORE:
> > | 			if (!adc->cfg->regs->or_vddcore.reg)
> > | 				dev_warn(&indio_dev->dev,
> > | 					 "%s channel not available\n", ch_name);
> > ...
> > 
> > There is no evidence that NUL-padding is needed either.  
> 
> Agreed -- it's used as a C string everywhere I can see.
> 
> > 
> > Considering the above, a suitable replacement is `strscpy` [2] due to
> > the fact that it guarantees NUL-termination on the destination buffer
> > without unnecessarily NUL-padding. If, for any reason, NUL-padding _is_
> > required we should go for `strscpy_pad`.
> > 
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Note: build-tested
> > ---
> >  drivers/iio/adc/stm32-adc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > index f7613efb870d..9cdcf396d901 100644
> > --- a/drivers/iio/adc/stm32-adc.c
> > +++ b/drivers/iio/adc/stm32-adc.c
> > @@ -2209,7 +2209,7 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
> >  				ret = -EINVAL;
> >  				goto err;
> >  			}
> > -			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
> > +			strscpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);  
> 
> I still prefer sizeof($dst), but yes, these are the same:
> 
>         char chan_name[STM32_ADC_CH_MAX][STM32_ADC_CH_SZ];
> 
> If this needs a v2, please improve the Subject, but it is technically
> correct, so:

Hi Kees,

I can tweak the subject whilst applying.  What did you have in mind
as a better one?

Jonathan

> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> :)
> 
> -Kees
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
