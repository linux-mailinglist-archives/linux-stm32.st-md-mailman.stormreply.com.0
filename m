Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CED88F9DC
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 09:15:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39D1AC6DD96;
	Thu, 28 Mar 2024 08:15:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7A4DC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711613749;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjUADkxK7W8MqHSaaLff78AqyJRHwq7pquaV+zZOTUA=;
 b=LR7fCMkz5IfEk6B9SFWIsRlsTbv21GkbArFiXiQPgeNJlj+zfToxGkkqhvJt/Jyf31Ur5D
 Avf+HCR3fZty530hjeMKEY6x9kxoCk1PCc3hfol2Z03xnf5HaQ+PJB4vtXLJ4oykKGpo5V
 waUYdmBRcAvwdWFQAQ6JHiWDW/2uEao=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-muOqEIvWPv6JXL7d2FUydQ-1; Thu, 28 Mar 2024 04:15:47 -0400
X-MC-Unique: muOqEIvWPv6JXL7d2FUydQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-341678a510bso406203f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 01:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711613746; x=1712218546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zjUADkxK7W8MqHSaaLff78AqyJRHwq7pquaV+zZOTUA=;
 b=TPezwt8dBnqNxJ2TTjsjzp7nVFKbjqxj0fxkkYRRlBWxvCIxE4FPG+N4XIL0v84KgK
 1M0dAmR53wsehHsFc2dPcSRMFyEmDeDW8IYYpQSm4XYZ8aCmVqDPEToNBMJUOdyDvVKr
 T8Hzi75U5Dhp2nFYe0W+6Yg/c1ceoTmMAffvVwuS6E0w48xqCP/kWmf0VDsPX4PunPAm
 GZYqoyvp9xsOiW8Lr69qmGHootyaikPD9kSw7MDepCa+C3pIBrvyd+A1CfkP1re7jVWX
 UUSW10q2AEAGQEwu30NCwd1djwQ4JIkBEiaz3pruLdYyMwj6DANNUVmNtFsyg6zmtvCF
 Y/RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmuKgawcQN/JGTGpjsEVG05IEzVVSZkuFVFNa0TRAkRwzX4IRC/IcdDurjC+Cx6J+C8QLUW/bKJim3NI/og/IPAemAn2OfTyh2UHFxwFLZRUXEV8YzNqEq
X-Gm-Message-State: AOJu0YygGwN4+u7nLRs4Uoj32fC1Xe6A/xPpsiVjaB5x0HMGM4yIUKfI
 tww2YBcHrkOFWRh6ztd5L+jW57FyuAh4nr70jcKgIAfW8E9Scw19uWWbKN0Dcbt4BjQ+dijaUtM
 l4JRt3G/hoaMbjO7L34RrA886GVAxIy31VKtDh5pGH6Hm1o66xR0fMMN4mRZhtSKKp3XiRl3adF
 YJzw==
X-Received: by 2002:a05:600c:468a:b0:414:c42:e114 with SMTP id
 p10-20020a05600c468a00b004140c42e114mr1687514wmo.39.1711613746198; 
 Thu, 28 Mar 2024 01:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8MDeRM7xS3BA3duuFbIO3KAqdPRdzqESI90M9Ta6qWW4GGp1Je55w6TxUEAK7EYkUeNt2Cw==
X-Received: by 2002:a05:600c:468a:b0:414:c42:e114 with SMTP id
 p10-20020a05600c468a00b004140c42e114mr1687496wmo.39.1711613745872; 
 Thu, 28 Mar 2024 01:15:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a05600c45d500b0041487f70d9fsm4599444wmo.21.2024.03.28.01.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 01:15:44 -0700 (PDT)
Message-ID: <66fd044e-37a8-4f03-a19a-fcd754bdcc40@redhat.com>
Date: Thu, 28 Mar 2024 09:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-19-4517b091385b@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240326-module-owner-amba-v1-19-4517b091385b@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 19/19] vfio: amba: drop owner assignment
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
Reply-To: eric.auger@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 3/26/24 21:23, Krzysztof Kozlowski wrote:
> Amba bus core already sets owner, so driver does not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Depends on first amba patch.
> ---
>  drivers/vfio/platform/vfio_amba.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
> index 485c6f9161a9..ff8ff8480968 100644
> --- a/drivers/vfio/platform/vfio_amba.c
> +++ b/drivers/vfio/platform/vfio_amba.c
> @@ -134,7 +134,6 @@ static struct amba_driver vfio_amba_driver = {
>  	.id_table = vfio_amba_ids,
>  	.drv = {
>  		.name = "vfio-amba",
> -		.owner = THIS_MODULE,
>  	},
>  	.driver_managed_dma = true,
>  };
>
>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
