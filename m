Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A96EAAD6628
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 05:28:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53245C36B16;
	Thu, 12 Jun 2025 03:28:50 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E0BAC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 03:28:49 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-553a4f3ae42so374788e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 20:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749698928; x=1750303728;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:from:to:cc:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=py2x/3nEfcl/m+IfkfLCFYgC9n67Yc5sv7N0ha3Enew=;
 b=H3ENi8LeT5KW13zSLYNnKrrWLRJPrNM8EJZVtc/RTCg3a8yThF43s86p4TDyE2K7P4
 oo/6SOMN1A+FxOxlCXFwap/6VNmf6hVJHzvrorx5W1jMmpfHagfqj8joAYxDMrw59v3g
 Ew/w2BGWUwAasMfy8LQa4JhlTjKNh+3BBe56+3+qle7hwtwaT4FQ94PIjQoyR0ZEI3Bp
 3PoE0Ek9nLHP+rXT4bIq/2KmmGKigKfvYCp2zPzldK+P5MUHPWtO31JKL4z87H+8MK6P
 lA/tmlUgsJkBNPot0wE7aTXqXprp9a2+4COaBw/IyMzmk/77bfsPw8WybIZ1H1GM8oHP
 UKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749698928; x=1750303728;
 h=in-reply-to:references:from:to:cc:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=py2x/3nEfcl/m+IfkfLCFYgC9n67Yc5sv7N0ha3Enew=;
 b=tSBR0RinJW/eBpgCdIMfb1acP+Ny9uhevv3yV33u4ivjXaBVjjZsTZzXkduJKjTTOr
 CYNETv2klj1zh7l89tGoS1x2zXUxNofJKK8jGLy0FGy9yUB+c8frU/qwaZU0ai81kHAB
 6xvvHOwF+mVshqhYm1DDX+bebHdXXBIPcOmkMmpXsd6l34s6cim0JaD5Cznka3LXYawg
 p2kMIxLj4M+t7n/2SJplyzaW5Z3MoCQS+r2SpWWiURyYjXA4dSS3nNfSqjRUjWuTPq3R
 4KrxmodcKTMSpXEthzxS8to0ekZhniB5N5oeXh1qZDc+Vz59viFeogNeUcS+ovHS1WWi
 ffuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1hz9WwIRizIIjFC5karoVrajSWVR8GYY3H93unbvSWNOiQ90o4+9NWau1gflkxtWSZh1WPz2msUb7KQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yydijdu8F4vfCkREq8+ef+YBPtB8zEXGy/y/SySYktd1rnGlQnX
 RRx2XYpANRfiHPto9CWWiyI+fCfijj22r2/aJeBAtk5v8xrm116F7H3k
X-Gm-Gg: ASbGncvFapacvZ+T/hcozVcaYAEaoJ7q2KBtkT+cS0TwIw5P5+d0T94BpvOvR9cZmqf
 zpEoEO27Jr/09lq5EiZNGV5Kv4bYQSwlvMFTTdl5T4BHD6bNK8OLsvDdUK12v72U2YzeCLhGO/Y
 cLpcQVAzxX6F9dyRUqcp1+c6KqkX/cNKzL9SmUJe9OqZKsHQvogFRRGAqEhD5EKORR1kmyF1pqr
 iC0K9pY6D2d1JxVmADPUH4qg6AvipsRAzGSh2HwBwtlOjb53vD1LrG2P7il7N3HMSCr3m11nvpl
 icXo5GUHalqGivkHETn3I/ZShPakBgIqJ5QlDsx2E0ef7Bm+ZoSWvOPmRfRD8Pltd/Ff1KaU
X-Google-Smtp-Source: AGHT+IFzDApZL1pHjb5MwmdwMyKHvI7xFwnWpTu5M5Pu8keW8CYw7rmotHQw4lDjGUz6wII2O1nwJA==
X-Received: by 2002:a05:6512:1047:b0:553:25b2:357d with SMTP id
 2adb3069b0e04-5539c269200mr1758603e87.52.1749698927857; 
 Wed, 11 Jun 2025 20:28:47 -0700 (PDT)
Received: from localhost ([62.89.208.175]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553a7003ee4sm87044e87.123.2025.06.11.20.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 20:28:47 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 12 Jun 2025 08:28:21 +0500
Message-Id: <DAK8HUY0VT5Y.1YRMH2LOHDY8X@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Michael Hennerich"
 <michael.hennerich@analog.com>, "Lars-Peter Clausen" <lars@metafoo.de>,
 "Jonathan Cameron" <jic23@kernel.org>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Heiko Stuebner"
 <heiko@sntech.de>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Francesco Dolcini"
 <francesco@dolcini.it>, =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, =?utf-8?q?Leonard_G=C3=B6hrs?=
 <l.goehrs@pengutronix.de>, <kernel@pengutronix.de>, "Oleksij Rempel"
 <o.rempel@pengutronix.de>, "Roan van Dijk" <roan@protonic.nl>, "Tomasz
 Duszynski" <tomasz.duszynski@octakon.com>, "Jacopo Mondi"
 <jacopo@jmondi.org>, "Jean-Baptiste Maneyrol"
 <jean-baptiste.maneyrol@tdk.com>, "Mudit Sharma"
 <muditsharma.info@gmail.com>, =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 "Andreas Klinger" <ak@it-klinger.de>, "Petre Rodan"
 <petre.rodan@subdimension.ro>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.20.1-4-g02324e9d9cab
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <20250611-iio-zero-init-stack-with-instead-of-memset-v1-21-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-21-ebb2d0a24302@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 21/28] iio: light: veml6030: use = { }
 instead of memset()
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

On Thu Jun 12, 2025 at 3:39 AM +05, David Lechner wrote:
> Use { } instead of memset() to zero-initialize stack memory to simplify
> the code.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/light/veml6030.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
> index 473a9c3e32a3a53f373595a5113b47e795f5366c..0945f146bedbda79511e704158122acaac5e60c1 100644
> --- a/drivers/iio/light/veml6030.c
> +++ b/drivers/iio/light/veml6030.c
> @@ -892,9 +892,7 @@ static irqreturn_t veml6030_trigger_handler(int irq, void *p)
>  	struct {
>  		u16 chans[2];
>  		aligned_s64 timestamp;
> -	} scan;
> -
> -	memset(&scan, 0, sizeof(scan));
> +	} scan = { };
>  
>  	iio_for_each_active_channel(iio, ch) {
>  		ret = regmap_read(data->regmap, VEML6030_REG_DATA(ch),

Thank you for the patch, it looks cleaner and simpler :) I trust the
sources you provided, but I tested it with real hardware just in case.

Tested-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
