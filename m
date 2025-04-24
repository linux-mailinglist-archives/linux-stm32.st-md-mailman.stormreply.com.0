Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F325FA9B3A5
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 18:17:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CC9BC78F70;
	Thu, 24 Apr 2025 16:17:15 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A91CC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 16:17:14 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-73044329768so1020218a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 09:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745511433; x=1746116233;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DMDSe2gyY7VT/4LTz9u2YpY5KEIDQEp0d0WnKerW0I8=;
 b=CA8hL3d2Accxui3aHEc0c4mZzfIKmnUqHy73sFkeIncceEnzsCax8uAovQIhj7ML4q
 lox9YGF7+Lea18egCfOefroo7l8bjWerV+HEqGaJ03meXEYftXGwWFTpBe6tV/OB/n1l
 hgFntUb55xGJVNnQKMulMbpiQC9oqCS91M/5jw+B4jNyI8/wSa1Gl8v2dLgRWSFHgLBr
 5dHU3eImaGFjmXaHsbGNxEOaAvU4js3V7OG3VBYY7HBrgbFLYJaVfZBifbV3uORDJ5Ug
 wu1rZcBkR8VKpdp9fFnS/70kR9ebkO3wHFS/nlwhtVYchPIbpu+yeKVxUBEUkOsDF7lZ
 JFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745511433; x=1746116233;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DMDSe2gyY7VT/4LTz9u2YpY5KEIDQEp0d0WnKerW0I8=;
 b=AyeShrTwVzdhJNfHCZ+6MBWX62pK0AY3qZd3D4QbzP73g2fUJoVNEkyFyMvlJCxrdw
 rYssrCT/cAtvtzKy7FwUgSPPzaq3HoXsld5eC1/S6I5spwdRbfRDIl3G9Gt6891TXf4U
 OS8M9eqIAciMdFoQzJ/KKL3br4UMbLR4qZdDS0s3bwNQZPBrJcCvfLcsmYtHerFemMKK
 2uahYvaWlML5GVGPMmKeGJcnmhmTcjEyWHuogsgBxtkr4CHKXowr9FguEKCnCMf+wSIb
 04sTMsKi52O1dLw3kw9mPTVuS1B6N+yWDgxeg+cNr/fXgYRAlhkDWDJlJ9JZjEFhN5Jl
 rCtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLjwyu33YLqOB2wxnhxNAFCSKMYwyOyumrKWjT7QvLlzGOIV/y1MCfJ+JXu+ejUqPbaPzR2S/QF/BGcg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzzeDijaTE8SOOcFstjX96GmUpA2gbI9MHUtwl6VdURDhSoX4bD
 vxVOn/STkMULebIDV8Mp6vQaODhapNtW9jMmHiZC++06hMAdcp7XvBknvwGs7qo=
X-Gm-Gg: ASbGncswJZXRzkO41psnyFSv91SOSx+uWTHq974GOJ6wZMkHIvEBIQ8bMlLX8hmI4iF
 gAjufvg3G07PcQblDV0QFcMaw7ksE2qf/3ljUXp6JrmSfteKdzOIhK3L4TU5uwFCqGovpK4gsrM
 VMQZMJu8tn0tCiFSI5kbZLFtczixk1sVmkiXACsVvxPeD+FSNJutKIgsKQ2y9OCpOqawd/EzHD0
 zY8glWSVrCwZNBl2me5Rl5B3jqhki0cvniwfUgfjXThn5+3l37xe2Z3Nhgy8C6kJL5/tiN09YS7
 JFB0/kBc/c+R56Fy9eldEow6Sn7dMgzagWV0iZeWzjQjf9xd9oNjO8vzx7nGKVnFbOFNPCcSA4w
 8LH+8lHGRwX2l2a5bbw==
X-Google-Smtp-Source: AGHT+IGYpdBfV2Zzsk0/8jMa28e3BnEWDecgbttEk0HlgDIzoWmi2sopZs6+yVh5h5dJX7VRxbT0tQ==
X-Received: by 2002:a05:6830:2586:b0:72b:872f:efc8 with SMTP id
 46e09a7af769-73059dc7e88mr305240a34.24.1745511433030; 
 Thu, 24 Apr 2025 09:17:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:68de:6c1f:6d0d:b32d?
 ([2600:8803:e7e4:1d00:68de:6c1f:6d0d:b32d])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7304f188882sm291036a34.5.2025.04.24.09.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 09:17:12 -0700 (PDT)
Message-ID: <ab3dcc4e-bb85-4a5c-82f3-36bedec3e79d@baylibre.com>
Date: Thu, 24 Apr 2025 11:17:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250424151604.626758-1-olivier.moysan@foss.st.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250424151604.626758-1-olivier.moysan@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5] iio: adc: stm32: add oversampling
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

On 4/24/25 10:16 AM, Olivier Moysan wrote:
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing the
> data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution, a right shift
> is applied to keep the initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2^n ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
> 
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> ---
Don't forget to pick up other tags. In v4, I already gave

Reviewed-by: David Lechner <dlechner@baylibre.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
