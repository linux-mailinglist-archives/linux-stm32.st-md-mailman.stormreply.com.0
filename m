Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E3AD57B7
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 15:57:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D57FC32E8E;
	Wed, 11 Jun 2025 13:57:36 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A224C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 13:57:34 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-408e0986303so4693123b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749650254; x=1750255054;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Onw+F7Njzqx9qJlT9wI5+vJ8uzypmHxvVhvYZXMTUQc=;
 b=dq5xDzhCi9C5FtZW/lF8hhYC9UllQ+h4zBec45EVsj4QgChN7/W5h5J0wic7NppiVl
 AwNPwzmAU6bX5HEe3G2T54Zl76c9l+SQFYbO6PeSSQ5onfqUt+flun8rPpJpstoCzOPC
 k1+1Y3xW/26XRFBkppVmWJu5t7S9UHH78U0kz2WVhBEyITyk+V+8wmrd3XyFSArYR+A0
 la5754aqRzXrfVdk7OVoEe/jvgTbJ6H2c7XMXa4Le+8llc0Ovtm2dS5wVAdt3SlXUxVg
 PKNNpQPTZsU1Q9sga4619TmJGAal4Ph72XUiCykcuSX0WImgx7ld8YN8+0GQ1XM1VM3R
 nlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749650254; x=1750255054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Onw+F7Njzqx9qJlT9wI5+vJ8uzypmHxvVhvYZXMTUQc=;
 b=AmKvVM0BwjK85akQMg32416smajXfwS1tE6AnDzAGJ0alhEjrk0iXJGiO/7FIaEI0t
 Nfp7Qw3hSbzq+480GOPv+NZz+ys0M756xGBC/epKqzV2B3YBZf26nYTjoFonFczgf4Vh
 mU07oIj9anedAXR+pB3pJos2MoyU7WncUwMY2UVqZdlWrpXX2EeM34tiV3iLOY9ArE6t
 8yZB6NgVdUIN49849CLEc2MbcfORVTdSF/6KhW+Par0RoPUFFCbbtLLcefeZcJwKSdvy
 +8rlb3je627Ik9JSfc/dYOaV9NphxFeVXwb1WCsOm0c1M7sgEcl9obTxilUip1lu+Mcw
 qoCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUinkOUlI65FTUFYr0GacgRzEyqtbsGWw0lEiXoIVeYwkEJV4Ha5IQBTwzYbmAMEKODCCqoFexld+alIQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyY+PkDS7CHkNj38J1qXVxXpVUxhcTWAMJ3JPt53bcIfxbA0Edq
 Qc5vVMzJeRvcnckFR/sC5uHMLvMmSLdwJ/e7cqAuuSI7C0H3fLo5g+gCKjIZU9uI2jE=
X-Gm-Gg: ASbGnct1Kzs+/27/oQHG8qczSTGp3MNOOW6TO/kmBL5Dfb7TIQz08AfAxnJ4r57/f25
 rFZfyvIRsUQDXH5+AdJjXHFHbA2971JM3kTiUEyerpXDKL1dfb7wK6whf1TgybUpNipAcrsMTaN
 QxgfngQcwyIfm/ErYrM8JvJOf94hJWX8xFl6BwEvKUtU64R8sIF7Kjpez9EvaXPb8+I8pwLK1S7
 JFnV4odmqfaa1G9gkRgabuL1V2w+oRqHcnzZjTxilQMtjcQFsBPKPlOLYrx+bE6VO/fKi/v082+
 vB1FtM0O9lPSwDPIeFgPiasdz4LDa5RpSqfv6Oprg6jGLKKBMDx41Hwq8NiMOjAmNn3Ve5j5AFW
 +WkunNkHaKZGr8J3B2GuunAmJUtWiDsH26ro2
X-Google-Smtp-Source: AGHT+IHHOJ7UPUjqfa7Ax2DODQaNiUV5DY9O1oiua1yOw8frXqBPksX3fFK+2Qk20HoobYMoNjVxXw==
X-Received: by 2002:a05:6808:21a4:b0:3f8:3eeb:11a3 with SMTP id
 5614622812f47-40a5e0a6824mr1694522b6e.11.1749650253782; 
 Wed, 11 Jun 2025 06:57:33 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:eb6c:30d1:632b:494?
 ([2600:8803:e7e4:1d00:eb6c:30d1:632b:494])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a5d941cbesm333645b6e.24.2025.06.11.06.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 06:57:32 -0700 (PDT)
Message-ID: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
Date: Wed, 11 Jun 2025 08:57:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-9-jirislaby@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611104348.192092-9-jirislaby@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, tglx@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] iio: Use dev_fwnode()
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

Subject should be "iio: adc: stm32-adc: Use dev_fwnode()"

On 6/11/25 5:43 AM, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 

...

> @@ -421,10 +420,8 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
>  			return priv->irq[i];
>  	}
>  
> -	priv->domain = irq_domain_create_simple(of_fwnode_handle(np),
> -						STM32_ADC_MAX_ADCS, 0,
> -						&stm32_adc_domain_ops,
> -						priv);
> +	priv->domain = irq_domain_create_simple(dev_fwnode(&pdev->dev), STM32_ADC_MAX_ADCS, 0,
> +						&stm32_adc_domain_ops, priv);

In the IIO subsystem, we still usually wrap at 80 characters so
wouldn't want to unwrap the lines here.

>  	if (!priv->domain) {
>  		dev_err(&pdev->dev, "Failed to add irq domain\n");
>  		return -ENOMEM;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
