Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 805ABE1B3F
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2019 14:50:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 415BBC36B0B;
	Wed, 23 Oct 2019 12:50:58 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF846C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 12:50:56 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k2so4965061edx.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 05:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oT2q812vkwR6lQz5u4dP7bLM7jh35Rq8yHei8+lOv9w=;
 b=JSqx2kzo9rsNsLhfuXLMUts+6wwktQnHQ9Pp+n0qdKe/S6xYBJExvQEuP1YTjvjdCW
 VjaQ83le550mFpOwCcaNFmpwo0lYZfidpVOIhms9v28tsRS7JwcDwVdPdwADxGjzkMWR
 5L9ewby2lGVsjDcY05kuaXvvM7rz+q/gZvkhqtm2DnDFL8UY68rh1q6QH1kU+tD9K+Lr
 ojbcPbX6EZe6mD3XzLXcNteIO42Obxxxn3kz8DU/D4mDjYAVuEZoyrVqBdsifkzENlMD
 u1gQkLXlst+N4RQYhcKdX/FqUF4HjEyEn7moi7zkfDUsEb2xN5ab4GY5pZ9V/vE2+aa4
 Oy0w==
X-Gm-Message-State: APjAAAU5Vu7Gf+njJcRDEHyf9GwGZRZcYWAquqboj5T/hdxU7I+VhHag
 G547AWuymo6Q70xDjF1inac=
X-Google-Smtp-Source: APXvYqzLq1IwwtENOWtlyqBj9T2iqCV94L/4HoNoJFxSLjEVDtlX9NMAHQ1sSA9Bd3uXFYj6DR034w==
X-Received: by 2002:a05:6402:88c:: with SMTP id
 e12mr23305215edy.170.1571835056324; 
 Wed, 23 Oct 2019 05:50:56 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
 by smtp.googlemail.com with ESMTPSA id i63sm780337edi.65.2019.10.23.05.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 05:50:55 -0700 (PDT)
Date: Wed, 23 Oct 2019 14:50:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191023125053.GF11048@pi3>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-21-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010203043.1241612-21-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org,
 alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>,
 linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 21/36] ARM: s3c: move iis pinctrl config
	into boards
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

On Thu, Oct 10, 2019 at 10:30:05PM +0200, Arnd Bergmann wrote:
> The s3c_gpio_cfgall_range() function is an internal interface of
> the samsung gpio driver and should not be called directly by drivers,
> so move the iis pin initialization into the boards.
> 
> Note that the s3c2412-i2s driver has no boards using it in
> mainline linux, the driver gets selected for the jive machine
> but is never instantiated.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c24xx/mach-gta02.c    | 4 ++++
>  arch/arm/mach-s3c24xx/mach-h1940.c    | 3 +++
>  arch/arm/mach-s3c24xx/mach-mini2440.c | 5 +++++
>  arch/arm/mach-s3c24xx/mach-n30.c      | 5 +++++
>  arch/arm/mach-s3c24xx/mach-nexcoder.c | 5 +++++
>  arch/arm/mach-s3c24xx/mach-otom.c     | 6 ++++++
>  arch/arm/mach-s3c24xx/mach-qt2410.c   | 3 +++
>  arch/arm/mach-s3c24xx/mach-rx1950.c   | 3 +++
>  arch/arm/mach-s3c24xx/mach-rx3715.c   | 4 ++++
>  arch/arm/mach-s3c24xx/mach-smdk2410.c | 5 +++++
>  arch/arm/mach-s3c24xx/mach-smdk2413.c | 4 ++++
>  arch/arm/mach-s3c24xx/mach-smdk2440.c | 6 +++++-
>  arch/arm/mach-s3c24xx/mach-vstms.c    | 6 +++++-
>  arch/arm/mach-s3c24xx/simtec-audio.c  | 6 ++++++
>  sound/soc/samsung/s3c2412-i2s.c       | 7 -------
>  sound/soc/samsung/s3c24xx-i2s.c       | 7 -------
>  16 files changed, 63 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
> index 526fd0933289..1ca0460d82f4 100644
> --- a/arch/arm/mach-s3c24xx/mach-gta02.c
> +++ b/arch/arm/mach-s3c24xx/mach-gta02.c
> @@ -540,6 +540,10 @@ static void __init gta02_machine_init(void)
>  
>  	i2c_register_board_info(0, gta02_i2c_devs, ARRAY_SIZE(gta02_i2c_devs));
>  
> +	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
> +	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
> +			      S3C_GPIO_PULL_NONE);

This is not entirely equivalent move as before this was probe (so being
executed also on rebinds) and now it is init. I guess it should not make
any difference so let it be.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
