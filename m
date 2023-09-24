Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C05C7AC66D
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Sep 2023 05:15:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE6FAC6B44C;
	Sun, 24 Sep 2023 03:15:13 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D5A2C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 03:15:12 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1c3cbfa40d6so38400605ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Sep 2023 20:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695525311; x=1696130111;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=amfWmJu/D4QCQg50FQhzHOc1h7E/bVbjM0QuAI+Q2Gk=;
 b=QlukfdrCdPdhioJtd7UfOTDR7QULeCCi5SFt2cNGfe/Nw6UVeYz1sna2xfcknCrjY4
 r2Ln1Z1e4eXm9DlGh2dP1lVV1qniYqmiUUsPlBpJUixZiaunhFr1PNDifJOOx4oramIy
 5FsR/u7ZarHG7n1ttFUwM0pfpP0YqMdy00BdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695525311; x=1696130111;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=amfWmJu/D4QCQg50FQhzHOc1h7E/bVbjM0QuAI+Q2Gk=;
 b=A/NkJT/rTjBee6d3NYI5a3dipSFrjil6M89mNctlpfjH3W1F1AO0OY2x5uUtAQegoE
 Bl7tChhDH8c5YdlNVIPBLApyj6764Qd32twATE9ABrNgSidCcyK3WZfBP5PEjzypr1R3
 jh5q8YmfJfxkt5h03N1Ecq2rGTIaRpGVVS7hNQY/fKJx8wksF0gry071UgbSoezcTWqy
 G9p5Lg6geobGAWPgYIP8rt/OnbtoVFDRkUn2ev6T3ArbEJtNXRkCQceQEiXiXst7ELrt
 pM6X75tKqOK9WUCyWR2D5yf3hLB3KibokcBfPw1076kdTD6Jcl+XLZuTx+ETo1wWV2/d
 5pAQ==
X-Gm-Message-State: AOJu0Yx1GjsEkDY+1MV/unV3s5TqjCeVceTF2C06IfQCVSAWonRk5ww0
 Op1R38qCvs3xJPnYZN9ENkJICQ==
X-Google-Smtp-Source: AGHT+IGisq+WD0tay8J8+6P9QCEXyW0JTTlcVZMxuf3DfjOxdjEguwLeM2nc5M2gPZJSS04saXBlow==
X-Received: by 2002:a17:903:11c6:b0:1c4:4251:68b3 with SMTP id
 q6-20020a17090311c600b001c4425168b3mr4201343plh.54.1695525310870; 
 Sat, 23 Sep 2023 20:15:10 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 i18-20020a170902eb5200b001bbdd44bbb6sm700006pli.136.2023.09.23.20.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 20:15:10 -0700 (PDT)
Date: Sat, 23 Sep 2023 20:15:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Message-ID: <202309232006.690F89A@keescook>
References: <20230921-strncpy-drivers-iio-adc-stm32-adc-c-v1-1-c50eca098597@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921-strncpy-drivers-iio-adc-stm32-adc-c-v1-1-c50eca098597@google.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>,
 linux-hardening@vger.kernel.org
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

On Thu, Sep 21, 2023 at 04:54:00AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> We expect adc->chan_name[val] to be NUL-terminated based on ch_name's
> use within functions that expect NUL-terminated strings like strncmp and
> printf-likes:
> | 	if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
> | 		/* Check internal channel availability */
> | 		switch (i) {
> | 		case STM32_ADC_INT_CH_VDDCORE:
> | 			if (!adc->cfg->regs->or_vddcore.reg)
> | 				dev_warn(&indio_dev->dev,
> | 					 "%s channel not available\n", ch_name);
> ...
> 
> There is no evidence that NUL-padding is needed either.

Agreed -- it's used as a C string everywhere I can see.

> 
> Considering the above, a suitable replacement is `strscpy` [2] due to
> the fact that it guarantees NUL-termination on the destination buffer
> without unnecessarily NUL-padding. If, for any reason, NUL-padding _is_
> required we should go for `strscpy_pad`.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested
> ---
>  drivers/iio/adc/stm32-adc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index f7613efb870d..9cdcf396d901 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -2209,7 +2209,7 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>  				ret = -EINVAL;
>  				goto err;
>  			}
> -			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
> +			strscpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);

I still prefer sizeof($dst), but yes, these are the same:

        char chan_name[STM32_ADC_CH_MAX][STM32_ADC_CH_SZ];

If this needs a v2, please improve the Subject, but it is technically
correct, so:

Reviewed-by: Kees Cook <keescook@chromium.org>

:)

-Kees

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
