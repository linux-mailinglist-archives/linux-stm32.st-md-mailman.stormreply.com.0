Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4A20FDAE
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2020 22:30:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68E63C36B11;
	Tue, 30 Jun 2020 20:30:56 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7057FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 20:30:54 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id w6so21959648ejq.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=K3IWd4UOczfyNkWWyUS87fNAOE77K5rHLOtlJQ7STrg=;
 b=etZ7q+p4B2JFHM3KgC5RB2LKoUpfAVWQDOfoXe5kfFnF3sWFTpdsPYELXT8nRbRB8V
 5c31y2BRn1+HmCNdo1tmp3MfuAEy4DbPFs4TATQyhUTLx/qbfnjtDxgdEbovPSeSkVd3
 HCON9M+7BVdC606lmFGthsXOEIyJ1OCEqJh/TYsKGzxmQbVQJbQdMDwWp+75c4oitJu9
 e0AAGXCgi2g9MI7I5S5SYIcwD28Um6LlUd2sUgAbg3N87yQ/ufYEtsbVwedargaRYob/
 35RyETkHIdLM/27llnpBYTq0XeGhtpSfFmP/V0K8VzsYJIZa1aNjZT5FQm97TaOkQT8H
 B34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=K3IWd4UOczfyNkWWyUS87fNAOE77K5rHLOtlJQ7STrg=;
 b=plxrmy4gxa2yum2FvDiTPZpZxIbJjkRcdWtMtjv0injZGfTWMEKS9Qn7f0okhAvZIC
 mkBT28ddTgA93E8ihGXEfcbL5IQB0VwoMS4wbW7LD2koSoPm7o7WN83j4UQ6lC2CbmE7
 BjvdCfhKWaO8IrTKghmjIod5edBqRqD/V2jhYRZkq+qJ8Spjf8ontrPfx2bwIaQMLG2g
 lWf7t0FLc7k4IksjvrH7+S+NLGka7uTockSoYMEbXXTx/wuSb3q4VYdVW+J9Yhj5LIlL
 89W+RB98PfUPVCLHHbxxyi/cHZ0R6hA7x7QyvWwQo5RSzesrA9PNySjxcVpraLLOjBcv
 9qWQ==
X-Gm-Message-State: AOAM533K7+IuipSgttizfGnWEJOSIqE4u3F5KaqzRvaJWaCWKGFCcT5G
 mTv1ke7wZ+AcWbE+0y/zzwI=
X-Google-Smtp-Source: ABdhPJxSukwxBOIw9LOnc/r5bA5e2YJNHfx7DSS/vLi6YTJhehVxo3tDqN9KmjRn0mC68Sho61Xt2Q==
X-Received: by 2002:a17:906:f298:: with SMTP id
 gu24mr19537400ejb.302.1593549051139; 
 Tue, 30 Jun 2020 13:30:51 -0700 (PDT)
Received: from felia ([2001:16b8:2d31:bc00:cc6f:aee9:d326:7bf7])
 by smtp.gmail.com with ESMTPSA id w15sm2902179ejk.103.2020.06.30.13.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:30:50 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 30 Jun 2020 22:30:39 +0200 (CEST)
X-X-Sender: lukas@felia
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
In-Reply-To: <20200525142946.8268-1-lukas.bulwahn@gmail.com>
Message-ID: <alpine.DEB.2.21.2006302228320.4753@felia>
References: <20200525142946.8268-1-lukas.bulwahn@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joe Perches <joe@perches.com>
Subject: Re: [Linux-stm32] [PATCH SECOND RESEND] MAINTAINERS: adjust entries
 to moving CEC platform drivers
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



On Mon, 25 May 2020, Lukas Bulwahn wrote:

> Commit 4be5e8648b0c ("media: move CEC platform drivers to a separate
> directory") moved various files into a new directory structure, but did
> not adjust the entries in MAINTAINERS.
> 
> Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches F: drivers/media/platform/s5p-cec/
>   warning: no file matches F: drivers/media/platform/tegra-cec/
>   warning: no file matches F: drivers/media/platform/cec-gpio/
>   warning: no file matches F: drivers/media/platform/meson/ao-cec-g12a.c
>   warning: no file matches F: drivers/media/platform/meson/ao-cec.c
>   warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.c
>   warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.h
>   warning: no file matches F: drivers/media/platform/sti/cec/
> 
> Update the MAINTAINERS entries to the new file locations.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Mauro, please pick this non-urgent minor clean-up patch on top of the
> CEC platform driver moves.
>  

Just a short ping for you, Mauro. Can you pick up this minor clean-up 
patch?

Lukas

> applies cleanly on next-20200417, next-20200505 and still on next-20200525
> for this second resend.
> 
> v1 send here:
> https://lore.kernel.org/lkml/20200418093630.6149-1-lukas.bulwahn@gmail.com/
> 
> v1 first resend here:
> https://lore.kernel.org/lkml/20200506050744.4779-1-lukas.bulwahn@gmail.com/
> 
>  MAINTAINERS | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a442b48f24b..bf5cb149101b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2403,7 +2403,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/s5p-cec.txt
> -F:	drivers/media/platform/s5p-cec/
> +F:	drivers/media/cec/platform/s5p/
>  
>  ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
>  M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> @@ -2548,7 +2548,7 @@ L:	linux-tegra@vger.kernel.org
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/tegra-cec.txt
> -F:	drivers/media/platform/tegra-cec/
> +F:	drivers/media/cec/platform/tegra/
>  
>  ARM/TETON BGA MACHINE SUPPORT
>  M:	"Mark F. Brown" <mark.brown314@gmail.com>
> @@ -3969,7 +3969,7 @@ S:	Supported
>  W:	http://linuxtv.org
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/cec-gpio.txt
> -F:	drivers/media/platform/cec-gpio/
> +F:	drivers/media/cec/platform/cec-gpio/
>  
>  CELL BROADBAND ENGINE ARCHITECTURE
>  M:	Arnd Bergmann <arnd@arndb.de>
> @@ -11146,8 +11146,7 @@ S:	Supported
>  W:	http://linux-meson.com/
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
> -F:	drivers/media/platform/meson/ao-cec-g12a.c
> -F:	drivers/media/platform/meson/ao-cec.c
> +F:	drivers/media/cec/platform/meson/
>  
>  MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
>  M:	Liang Yang <liang.yang@amlogic.com>
> @@ -15212,8 +15211,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
>  SECO BOARDS CEC DRIVER
>  M:	Ettore Chimenti <ek5.chimenti@gmail.com>
>  S:	Maintained
> -F:	drivers/media/platform/seco-cec/seco-cec.c
> -F:	drivers/media/platform/seco-cec/seco-cec.h
> +F:	drivers/media/cec/platform/seco/
>  
>  SECURE COMPUTING
>  M:	Kees Cook <keescook@chromium.org>
> @@ -16249,7 +16247,7 @@ STI CEC DRIVER
>  M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/stih-cec.txt
> -F:	drivers/media/platform/sti/cec/
> +F:	drivers/media/cec/platform/sti/
>  
>  STK1160 USB VIDEO CAPTURE DRIVER
>  M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
