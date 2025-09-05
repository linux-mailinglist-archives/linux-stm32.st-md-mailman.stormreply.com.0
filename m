Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30644B45A74
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 16:28:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1148C35E2E;
	Fri,  5 Sep 2025 14:28:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FF4EC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 14:28:50 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-772488c78bcso2184097b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Sep 2025 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757082529; x=1757687329;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=xIBk01NdBuwsWQnnNXVdcn6j5JKGkVjqtQzEraCQviA=;
 b=NNH+KlvJaTLUx4KZsa20Zcmvm34K/m9U1jT1YKormzZ5D8+dVMVBIJfQxfyFYNFzQ+
 ZtqDsItXRUM56MfrdFNX+LtASVcf4IzsveR/NeAaHWBlRe8lqdvia1NKkRJWMLkn2QY7
 abXR0Kt2rbIEaSCeOh2gWpvHqjlcArrtBa4aqV4FN10K42pV4rh1vIsgOLw+K/Cf3MZv
 NP89iidTxSky0/DsOf9J4uXs+y75gR/sVncw4so2ygKeYLq7b0AqPhdTlXWPLzkqZ2/p
 turp/yt/+sDCSP6J0XtE+zdVQgmqNc5hcNwwwhdvqpkI/0vWl+yiM/wvik9Bck/u0Hn4
 dHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757082529; x=1757687329;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIBk01NdBuwsWQnnNXVdcn6j5JKGkVjqtQzEraCQviA=;
 b=iaVKAOim5f4Hn5P26z65DNR+OlY2yG+fC907e3qZtC0+pu6XY47jjp4LH6g+dJIdBi
 aCyxIbbuzd3P4wRITgGALX4i2UInYBI3/Z9v4xj1Rs46Km/dAMWv8XzI0G52WX4STeiG
 cktRZMgziSQqom+CQRlWhqTFZsdNpKw1l/FbGmviLdDxkr0f1nWt6JatJOc9qzt0Vqj8
 sz8Q3SAMZ3Nbou6cpU80jebmL+vXRbG3KbDyDXmYsv/+ZKn11Gzt0mpOqKSOwfIcnbV9
 7WuJf0RZtzuferlTwV8pP7zaTsT6gKTA5BSZKzjefnQwGomrYrsg30ZYU6F+62dQ8QjY
 bANw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdlc7BBobBAGUy6fcbPS6pIjgKOcbzYK+6k9QTlQABDMXp18RS73fKxQiNGzH11rC4JeASY7OkmChauQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz0af159lq99b7n/Gb104+kG1tQT8E+ZC9Jm0pYobuIebAxhAT5
 nFXMWPC1V5YVf91lgeGJMJp+RSdbYQlijeNKdOXehqUzWV8MDYixnrrc
X-Gm-Gg: ASbGncsr1K7yCgnZ0xCIo5X5MD+lNQz4qSccJr+qS7d2LU5K7LR6gnGr+1OF1/iNeM/
 AstBOmKEUBzT59a//nOjdN2/Ms8smldbpcBx4IsLgKEneaENYbxQNYFWhoRKZp8Yghn83s33Og+
 rPC8CQ2rPQDVegZYzXtrSnPyBjNzpoUUp1hGhuaObZHXDfwiFf6LlqIeS9QA67xAg2A2YjeVo6U
 ThHeBmwKUvrh+8zsydKdMhIYfY7cOEp/VnueOg3HpInkXKVcvkoVf35fxm5vMKGp7hhGung0xTH
 2lVfRNzZDy48f9w+tEhZYsb2pjKxboYEaA5ZmKKcELohSex2fWH/hKH94oxm+3BqYuygDs2++Pa
 Aj/v99lrzg779nQOCxkxkzqhs8kdTgluUWK+uhIHZoJK0R4JtrDbRNFyMDi2OcZ8fu3BA534=
X-Google-Smtp-Source: AGHT+IGmtjyZd11+KjNwJeufcA4YJgYYRhNDfsNkfD6VHk0PEhzxkDj8A/25DdwjoogzCAHLZqAmGA==
X-Received: by 2002:a17:903:1ac6:b0:240:83af:e2e0 with SMTP id
 d9443c01a7336-24944ae7beemr297755715ad.47.1757082528461; 
 Fri, 05 Sep 2025 07:28:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a4b99fasm22492373b3a.57.2025.09.05.07.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 07:28:47 -0700 (PDT)
Message-ID: <42b68c7f-8368-470b-a7b7-d1ff075973fa@roeck-us.net>
Date: Fri, 5 Sep 2025 07:28:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xichao Zhao <zhao.xichao@vivo.com>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Guillaume La Roque
 <glaroque@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, zhanghongchen
 <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>
References: <20250905072423.368123-1-zhao.xichao@vivo.com>
 <20250905072423.368123-2-zhao.xichao@vivo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250905072423.368123-2-zhao.xichao@vivo.com>
Subject: Re: [Linux-stm32] [PATCH 01/12] thermal: of: Add error handling in
 devm_thermal_*_register()
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

On 9/5/25 00:23, Xichao Zhao wrote:
> devm_thermal_of_zone_register() does not print any error message
> when registering a thermal zone with a device node sensor fails
> and allocating device resource data fails.
> 
> This forces each driver to implement redundant error logging.
> Additionally, when upper-layer functions propagate these errors
> without logging, critical debugging information is lost.
> 
> Add dev_err_probe() in devm_thermal_of_zone_register() to unify
> error reporting.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>   drivers/thermal/thermal_of.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 1a51a4d240ff..8fe0ad402579 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -475,11 +475,15 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
>   
>   	ptr = devres_alloc(devm_thermal_of_zone_release, sizeof(*ptr),
>   			   GFP_KERNEL);
> -	if (!ptr)
> +	if (!ptr) {
> +		dev_err(dev, "Failed to allocate device resource data\n");
>   		return ERR_PTR(-ENOMEM);
> +	}
>   
>   	tzd = thermal_of_zone_register(dev->of_node, sensor_id, data, ops);
>   	if (IS_ERR(tzd)) {
> +		dev_err_probe(dev, PTR_ERR(tzd),
> +			      "Failed to register thermal zone sensor[%d]\n", sensor_id);

This will print an error message even if the problem is (for the calling code,
such as hwmon) only informational.

Guenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
