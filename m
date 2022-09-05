Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 195535AD1DB
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 13:53:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9C5FC640FE;
	Mon,  5 Sep 2022 11:53:30 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2386AC0C920
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 09:56:31 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id q7so12380862lfu.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RdubYDDix+oOh2a0h//nboO40BpZ5xfyyxVZCNAs3B0=;
 b=et2BStfuMMuGC6Hmc0ahP2YMtl2IOvVs82z7fBLtShtRiNOLZEUcKr2FN+yvHNZxWj
 hUQof0CelJPy6k645QZnNEtobw55lyLfO/xzbj7BHjhPUtrr6ZyyJrZD5+wJPU8x4s/V
 wDTG6XP1BvwPE/YT5IW93WWtvTubg44nQ/U2m0Ukxn8zuXPeusqOLZkrZIQo7BaTII3T
 tjpw7YIxVKZOVR6ozOO29YwJBQZS8KoqWz1HV/AEJBiJwCnjVlLgAcdY8jrwxwGrjJtw
 gmvPsEX0owb2idPOc8tLiT8uceUOa827MJ139sBCmc4Km7ZtH35OknAdtVpmn61dpmua
 LvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RdubYDDix+oOh2a0h//nboO40BpZ5xfyyxVZCNAs3B0=;
 b=ceRDMUGW5QIv9GZcDmAs28dcEmZdZXazCp/PwL9Q/gpPF6tXCqRpLanvTV4PJB/Qi4
 Mqcv5Mcj1IVzSi8yfh9c8upJ7VRGyYdPHBsNZytfgjxFFHD997LN6prXW5HuF2rbBEFk
 OLfrUATiegawGB+Fh6L2j80L96ODfjGboZsdGOWTJAChn5XLvHcNdtjJWpOBLBOqKy/B
 MqtVchXQebYJ1LAMd8NesGPm/yF+PFTjThUSED2cvzT3aEcJa21qQ2CcM1gJm6uKdZKU
 +kSav4v4VA31Kstx95MohAh9K9KdSv/Zxsk3tGi2lVZ3pIINjtj953bqVJeO5QpYbGJp
 OTfA==
X-Gm-Message-State: ACgBeo0i0PMkgQzp3AJHaoAMRe7EHieSvQTZBtRjw0PSE7Vw0hCKl2RS
 KpyP9ihaPnY8ABx219paocY=
X-Google-Smtp-Source: AA6agR49m1znt1xCwEgykIjaaYQRJwjqD0WPTDOx4N16eYQFUBRnr5DGteFNKPh7H42GT7aHHRsE7g==
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr15342515lfa.380.1662371790521; 
 Mon, 05 Sep 2022 02:56:30 -0700 (PDT)
Received: from [172.16.194.136] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 o4-20020ac25e24000000b004965e80b761sm40259lfg.224.2022.09.05.02.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 02:56:30 -0700 (PDT)
Message-ID: <0b051f7e-1754-cb69-c0df-0bae08c967fd@gmail.com>
Date: Mon, 5 Sep 2022 12:56:28 +0300
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
 <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-9-b29adfb27a6c@gmail.com>
X-Mailman-Approved-At: Mon, 05 Sep 2022 11:53:29 +0000
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 09/11] regulator: bd9576: switch to
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
> While at it switch the rest of the calls to read properties in
> bd957x_probe() to the generic device property API as well.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>


Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
