Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B9D4EB177
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 18:10:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CE58C5EC6B;
	Tue, 29 Mar 2022 16:10:46 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38B64C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 16:10:45 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 p12-20020a05600c430c00b0038cbdf52227so1791620wme.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 09:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5KGmATQjbYA+t55uqFGpr9FQL9ODvt7ipMp6+gLdwR0=;
 b=cTl9Z/Z2B7Zis3KdOrxkgb6rLWuK8OXOTKEVukyoy14MzjaVUOgidYcqGlBeXN3/E6
 gRQ1zHZJ+Go7tFeKRHrn3WvCudR1HQ3QEd2kps/5pOj73DFAHqIWyO8Tztdl0H4PFp/h
 wZwgN2nuKIaLkKml6sTalVL+qv9GazbFXvZKc8dQFD0GOXaVPohy1y1s5S2dnxRqyYAv
 xlpP5zY23rwrpFRIxtHcwT6QWTtn+okFiIYcLEbRYDygJbvmWP3hNF273+ClZgqVP4Q2
 y0H5zcSSJJNLIV8WAK2NVV0FI7zc+o158PrNWzOQQo6gCD0tTb5djvNiTfADBT/nWwsh
 uBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5KGmATQjbYA+t55uqFGpr9FQL9ODvt7ipMp6+gLdwR0=;
 b=A+BhP3JQiUFq66bq35vQlnXFOoATGisHu6t3leGk+fMF9oYvC/q2M5Ho1Ja7jl4e3J
 ABfVBhYAIPe/UjstKX4PTisiXSnkWEfpEbikDSczbCHoDczySGRiZo6qhTmRxuKhvEBC
 WBbrD1HSQSkNC5q/JhN60LqyygdrFsmwrYNL5HffYhu/YmQhfV4q9PcgSXWvU7LkooYD
 9OARpJ7eqALYALJ9oSyg8+O+otAZysE5W1SHYDPQdA2L9Aw/IQ72jkF2uD2n+rhmUD7A
 7irP7gj10nhXPpMpfJbqJbQYpwKUe1cNcFLMLU/N6x1remw7vJikj8aIdWT0hQE/hMpt
 nmtg==
X-Gm-Message-State: AOAM532NBDSFzAFyLSqP/e+k8GVVdGLmcUVIkyhFRYGfvgd1EkvDRIyJ
 M7YrGZI2UQ0VOq9+rY5Hnypcxg==
X-Google-Smtp-Source: ABdhPJyMMortSDOevzw0MwKMNsxauJgQiSDN5PF4JM0VcTIixYewWhKKjOdSbKNzXDYclvxOx1qwOw==
X-Received: by 2002:a05:600c:20a:b0:38c:95bf:3289 with SMTP id
 10-20020a05600c020a00b0038c95bf3289mr514205wmi.134.1648570244412; 
 Tue, 29 Mar 2022 09:10:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a663:978b:3ffb:7dc3?
 ([2001:861:44c0:66c0:a663:978b:3ffb:7dc3])
 by smtp.gmail.com with ESMTPSA id
 i15-20020adffdcf000000b00203efad1d89sm21772577wrs.9.2022.03.29.09.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 09:10:43 -0700 (PDT)
Message-ID: <35708f5e-efe5-5948-181f-8adf7d466647@baylibre.com>
Date: Tue, 29 Mar 2022 18:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-11-andriy.shevchenko@linux.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220329152926.50958-11-andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Nancy Yuen <yuenn@google.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Figa <tomasz.figa@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin Fair <benjaminfair@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrick Venture <venture@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v2 10/13] pinctrl: meson: Enable
	COMPILE_TEST
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 29/03/2022 17:29, Andy Shevchenko wrote:
> Enable COMPILE_TEST for a better test coverage.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> index d1955c65b4b6..64fb9e074ac6 100644
> --- a/drivers/pinctrl/meson/Kconfig
> +++ b/drivers/pinctrl/meson/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   menuconfig PINCTRL_MESON
>   	tristate "Amlogic SoC pinctrl drivers"
> -	depends on ARCH_MESON
> +	depends on ARCH_MESON || COMPILE_TEST
>   	depends on OF
>   	default y
>   	select PINMUX

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
