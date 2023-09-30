Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB07B42D5
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Sep 2023 19:57:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC97FC6B479;
	Sat, 30 Sep 2023 17:57:10 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6010C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 17:57:09 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1c737d61a00so26430415ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696096628; x=1696701428;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ye4XTAWb4daUNWZiDSISaHwk+X7iJoEzGWCL7sgi0rE=;
 b=d48/8L/AqWoYC/48gg1HMm4VT2tjqCicav/zotrjG6EDuqvQRQQMhfmUdmUAd2ovz4
 iUWpyt4F+c7/o5suE4Gw8trgPHRt314TDRuj3rx0ZnUOxe5m5QOuIoLabtJj0V0IJj0C
 K8Q8LHKC4ELNZHjKEkO7qP6aNyGa4Wpj34egs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696096628; x=1696701428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ye4XTAWb4daUNWZiDSISaHwk+X7iJoEzGWCL7sgi0rE=;
 b=vxxAOvlEcYkdSSve5L/6srmO5RZxbMW8okC68CMG/zb9J+cC/OAuROEOu330mXzdCw
 GO8ZxqzxW4MaYHnxWOomjZkS1mOkdfRg3nyZDkOBOxt415R59/dCed0JmClQJdbqRgAf
 Fk5eBOEC5HjgqT+K+8LfHteDMCAa+7CDXTcYAcNkCxVrScFsEEXrrWhk83E9hd1IMpUT
 RTR9xkET667YN6olBYk0lkj3n3Xu6QPg7YnAPez8QZA/3l72+Sj8otJOH+5oivn75sAQ
 QW4u0A12Hk4bn2M7ZkIM0U6dhKIDqMr71zvkH2mmf1zg/26rVA0o1wSe6NSk7AgtEvkt
 rGoA==
X-Gm-Message-State: AOJu0YyiIYcXhpSlgiKYb9i+u6TzB/j4rwaXBvF58WGqhXlIvReLzbmL
 TbjFdQj4QiGA3RjXR8meGJhIqw==
X-Google-Smtp-Source: AGHT+IFTEuvq+b7y368t9GEXwnKx90oqxSX/2b3AsPpSe1C2LnJOYtXNrap0hYgQfFUMDxuxcnPy6A==
X-Received: by 2002:a17:902:ee89:b0:1c5:f68d:cec3 with SMTP id
 a9-20020a170902ee8900b001c5f68dcec3mr6686648pld.64.1696096628167; 
 Sat, 30 Sep 2023 10:57:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 x10-20020a170902820a00b001c1f161949fsm18920114pln.96.2023.09.30.10.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 10:57:07 -0700 (PDT)
Date: Sat, 30 Sep 2023 10:57:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <202309301056.5A21C37D5@keescook>
References: <20230921-strncpy-drivers-iio-adc-stm32-adc-c-v1-1-c50eca098597@google.com>
 <202309232006.690F89A@keescook>
 <20230930184118.73d7465a@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930184118.73d7465a@jic23-huawei>
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

On Sat, Sep 30, 2023 at 06:41:18PM +0100, Jonathan Cameron wrote:
> On Sat, 23 Sep 2023 20:15:09 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
> > On Thu, Sep 21, 2023 at 04:54:00AM +0000, Justin Stitt wrote:
> > > `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> > > 
> > > We should prefer more robust and less ambiguous string interfaces.
> > > 
> > > We expect adc->chan_name[val] to be NUL-terminated based on ch_name's
> > > use within functions that expect NUL-terminated strings like strncmp and
> > > printf-likes:
> > > | 	if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
> > > | 		/* Check internal channel availability */
> > > | 		switch (i) {
> > > | 		case STM32_ADC_INT_CH_VDDCORE:
> > > | 			if (!adc->cfg->regs->or_vddcore.reg)
> > > | 				dev_warn(&indio_dev->dev,
> > > | 					 "%s channel not available\n", ch_name);
> > > ...
> > > 
> > > There is no evidence that NUL-padding is needed either.  
> > 
> > Agreed -- it's used as a C string everywhere I can see.
> > 
> > > 
> > > Considering the above, a suitable replacement is `strscpy` [2] due to
> > > the fact that it guarantees NUL-termination on the destination buffer
> > > without unnecessarily NUL-padding. If, for any reason, NUL-padding _is_
> > > required we should go for `strscpy_pad`.
> > > 
> > > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> > > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> > > Link: https://github.com/KSPP/linux/issues/90
> > > Cc: linux-hardening@vger.kernel.org
> > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > ---
> > > Note: build-tested
> > > ---
> > >  drivers/iio/adc/stm32-adc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > > index f7613efb870d..9cdcf396d901 100644
> > > --- a/drivers/iio/adc/stm32-adc.c
> > > +++ b/drivers/iio/adc/stm32-adc.c
> > > @@ -2209,7 +2209,7 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
> > >  				ret = -EINVAL;
> > >  				goto err;
> > >  			}
> > > -			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
> > > +			strscpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);  
> > 
> > I still prefer sizeof($dst), but yes, these are the same:
> > 
> >         char chan_name[STM32_ADC_CH_MAX][STM32_ADC_CH_SZ];
> > 
> > If this needs a v2, please improve the Subject, but it is technically
> > correct, so:
> 
> Hi Kees,
> 
> I can tweak the subject whilst applying.  What did you have in mind
> as a better one?

I would use "iio: adc: stm32-adc: Replace deprecated strncpy() with strscpy()"

Thanks!

-Kees

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
