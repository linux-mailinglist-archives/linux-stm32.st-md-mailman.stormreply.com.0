Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 051FA5AD1DA
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 13:53:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8E00C55596;
	Mon,  5 Sep 2022 11:53:30 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6C04C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 09:55:29 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id g7so12325887lfe.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=m6bwvWKIYsYkkQiw6WkHW3VenkfYyqcqiN7fetf2fKA=;
 b=IHLIbQ5vHZQVIyqqjxII8xfEjM3Q6fZoeMqDFdIiU0vsFp6oi7h0IwMdNfx1vPlnFp
 ZPEemHQtgtDg6DfHplUdQ9jQ9sLqz7D7QN4FLqbsDi3rJNDxpjjlWDcgUMOkA9w2Tjs9
 x9VWcOV0/2DW1Hg36LsG6DteksM93YpJyP0rfadAndCJKb/yY4pF55KE51FqNTxioDRe
 KBJzVpsAFs2k6LKzsnJmjaNF0PAQrTJoMhIKZekTRu34MSjNFM9c+GyRzLjBHe1ybOQZ
 eLbeL6kyIXJDXmENmbtGhQKPn5KPfZrIYSXNEMQPhMhg5ikHY+XI6LCK0LoPM/K1/Mnt
 uzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=m6bwvWKIYsYkkQiw6WkHW3VenkfYyqcqiN7fetf2fKA=;
 b=Vv3hzT2f18n3SVu/inBBNitqR5glY3U/NFbPKv2/GZtMLzhF2kj5z8UK6qcDmKUM54
 5H+c882GpUzFM1OSLAnUDJK+m6VmuYK7Sz8QSIdNDJ+Me7BfldcdpGCx/lTuTT0pO30o
 4Kgl6wBlsu1I8Seh2D+gGCm8OmSqwYegIpAWYVUQkRj1PEGz9gTu5HvCjqk/Q8QC44pG
 4vmRn51KBEs8mB9jJRgt8LXekHyY6MS9vEjbSXrTF66+kUmpJVYkVp4vJlaV9y9dqmsu
 n0W2frdI/fd1KnWzaSthH5zERi9kQGV2uQ99UwY8jucm48DKFhyfItoYkqQOQ2r//oei
 af9Q==
X-Gm-Message-State: ACgBeo1ZT2DWW9qksS9UzNAW2jpGHYj74IOrzA9XQhwQI9sI1o3ONZSx
 FMRJ/NWoAT7wp0hbvYf1x28=
X-Google-Smtp-Source: AA6agR4gwPt5aivllJzzHsjCuIDbWlzFIp6/PHCkmSvNiw6IUsaZdTaionvGINkVRjZdKCtkzi3jFA==
X-Received: by 2002:a19:6b16:0:b0:48c:e218:7c51 with SMTP id
 d22-20020a196b16000000b0048ce2187c51mr15164353lfa.681.1662371728951; 
 Mon, 05 Sep 2022 02:55:28 -0700 (PDT)
Received: from [172.16.194.135] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 v27-20020ac258fb000000b0048b13d0b896sm1141980lfo.141.2022.09.05.02.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 02:55:28 -0700 (PDT)
Message-ID: <4a536310-3f79-d248-dc48-5cdbd640e04a@gmail.com>
Date: Mon, 5 Sep 2022 12:55:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>,
 Felipe Balbi <balbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Airlie <airlied@linux.ie>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-8-b29adfb27a6c@gmail.com>
X-Mailman-Approved-At: Mon, 05 Sep 2022 11:53:29 +0000
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 08/11] regulator: bd71815: switch to
 using devm_fwnode_gpiod_get()
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

On 9/5/22 09:31, Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> 
> diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
> index acaa6607898e..c2b8b8be7824 100644
> --- a/drivers/regulator/bd71815-regulator.c
> +++ b/drivers/regulator/bd71815-regulator.c
> @@ -571,11 +571,10 @@ static int bd7181x_probe(struct platform_device *pdev)
>   		dev_err(&pdev->dev, "No parent regmap\n");
>   		return -ENODEV;
>   	}
> -	ldo4_en = devm_gpiod_get_from_of_node(&pdev->dev,
> -					      pdev->dev.parent->of_node,
> -						 "rohm,vsel-gpios", 0,
> -						 GPIOD_ASIS, "ldo4-en");
>   
> +	ldo4_en = devm_fwnode_gpiod_get(&pdev->dev,
> +					dev_fwnode(pdev->dev.parent),
> +					"rohm,vsel", GPIOD_ASIS, "ldo4-en");
>   	if (IS_ERR(ldo4_en)) {
>   		ret = PTR_ERR(ldo4_en);
>   		if (ret != -ENOENT)
> 


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
