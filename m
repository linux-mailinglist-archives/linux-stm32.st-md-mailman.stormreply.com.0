Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A654A84618
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 16:20:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C3CAC78F74;
	Thu, 10 Apr 2025 14:20:06 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DD97C7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 14:20:05 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-603ff8e915aso206004eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744294804; x=1744899604;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cFmetQ0fd8tg9OjN42SYuqaihg5CWxCtulYfskMf/mA=;
 b=npyIZQysmglrh0B3MpKpE8qG2WHjCodfck2ahPnR2wo6bOEzCXO0cOwkwsEEqYS0ZT
 Yw3SR6z+6e3ovnwwpO4SydKKJQGB4VT7h85i3i8jehX/KCwPdqQRWm4eEXVFIqopdBHS
 L7xn5AmeRTz6iZ/EdyYVBiQK8uBDTZjl92JZraepnYULnmcSzYsJORjU6HNc1CAp7J3O
 kZczAyjmAPzOns75VflwFDeYdnaIm1nniCO/KmxrDFVYq7jrdWif6yRJ9Xw+QNyl0f2E
 GZz4maVB6cECkyHAVsredg/ev/QYT2AG7ZnQOncILgoGIlzCvavoMtzpurCI9VkA+ErU
 AN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744294804; x=1744899604;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cFmetQ0fd8tg9OjN42SYuqaihg5CWxCtulYfskMf/mA=;
 b=D82VjNqfs5okKV6V7ysv5Dg5IVb/ADbDeaIK7BMI49pzCCNGCkl23lAZPRgucrzDKs
 /VoNV3XEziYmUh7R9p32cQ6wKv45e9iWa9ikAUh9mNoyGCX+4aQ9xcp7ZCc/Fl6zw73g
 xWgxs8loVxtqZlRkXv3nvV7WFmfUY+OY23PyqCEwIxVRJRcqrE4Xg99B9E5q/pKx4t/7
 1h5Rzpks4a37gf3zC423eYTfcVyjnxL8pV+iB9HwlWmg0EScfsBSe0dQurm+xQqi6GWa
 yrDkiVhQD0OmzXfxi/u9XGqKVtGp0ZY1TmUdwAOhL/oJMJB3N1bUUVDon+2JX8LYWwIn
 MFDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3L0luhJ8cqSJbM4+JIfKGZHxkeKn4KXxsVvJaRPL3Y1l04L6OqNY3k79VXKtmTbXdZ/Y28dPFiuRE4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxFz8j3k/cZv6ai3J0c2cw/8POVHpaXkTvLEfeAs2eiH1zLw5FP
 VzOk5ooLnArbEfN0pdR52YF8JA0L3A5g/K1AQwRsAGM6b0EZa3YD1BBfMf5p2sk=
X-Gm-Gg: ASbGncu76xCIgg7UTZ8V6k45xhgWbEhWJUk8+VYr6897Yzpl4YW+vXRR7bJbBEn0CVy
 daUw4lzUTseeHpPm3/lC1lfcXznDUaThp4TWelMY5eaeqjZxf9tyvFcg+lp87mWR0EODCWPpVsN
 SQKRshf3+FVcqblad33BvwBGr7iP5CMaKBZ4FTSX8H28ZblO6B7rItPwn6nb4yrE21kdl0o2Hcv
 CHRPLrjt8AkjzgyRcc8rGEYZIQyf0Yawp9o5rZQi126JFWDWOTKVRsfq2rvyPhzNTyJs9l4mUYZ
 0zBP2NVS/oAZgUipeA+k5+YEehpZN5ggi3mj+cKMlY/fzdRH9z9BT56QBWHF9Nw2SYNJ3Zfr9ai
 FUg==
X-Google-Smtp-Source: AGHT+IHmprFnmE2L9dl6TZiZJCp0rXROk32fEiGq63fS0aW94IToqZ2dIpCTynqnYIATWgqEA0PScQ==
X-Received: by 2002:a05:6870:158d:b0:2c2:56f3:1c84 with SMTP id
 586e51a60fabf-2d0b3820255mr1492765fac.25.1744294804016; 
 Thu, 10 Apr 2025 07:20:04 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72e73e4db34sm578067a34.49.2025.04.10.07.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 07:20:03 -0700 (PDT)
Message-ID: <22384798-eddc-460b-87d8-8c13beeefbd7@baylibre.com>
Date: Thu, 10 Apr 2025 09:20:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4] iio: adc: stm32: add oversampling
	support
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

On 4/10/25 8:58 AM, Olivier Moysan wrote:
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing
> the data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution,
> a right shift is applied to keep initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2exp(n) ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
