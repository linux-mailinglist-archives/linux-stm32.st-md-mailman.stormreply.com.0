Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B05AC1372
	for <lists+linux-stm32@lfdr.de>; Thu, 22 May 2025 20:36:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F1AFC7A82A;
	Thu, 22 May 2025 18:36:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F68CC7A827
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 18:36:50 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a36561d25cso836506f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747939009; x=1748543809;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RJGS5GdAP2jwMN2asFwop/bmwWDSIqO/lnl06Fno7WE=;
 b=zE2MBmxXmeiNvLL+WejayI6FQfS0f7g4WXh29UN++me4v7lUhJ2MJ/0eEWAI+hFJIn
 VmTuwnWVgq1SvrTPfcpnWSW/Yy4ZHKPlNHbAxIecrNTh38cVpW9ZAdpJsOdjQbWjXqRW
 OS1nmZDOaBGvu9ga04UNzRsI9EA9KQl2RLCMvIH0VpmrlkVojA7SD+TQd8sY4/VjKh4k
 e6uDNvLSr443iTB+oF5AHlA0hkoaIbPwMO0GddB28KiJ1Pk8bEnerD8/BZ+3krwEG3JB
 88WFGbHdIv83MD58v3OmyayMCOi9cmaqCDTAfzJGLWuPq/+ncK3niYCvDCS/MSA7tPaY
 l5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747939009; x=1748543809;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJGS5GdAP2jwMN2asFwop/bmwWDSIqO/lnl06Fno7WE=;
 b=ZdjML26gbawEFHrvuEzNPW95IyCojNcyaZACmw5Utb0+fAc3CNPOjuYV8uDFMjWNXu
 PNTPsee4dUku0qUiLkYU6mQspR7yaiO5uGeKDYKweS4qDDJz9L3+ArubTDprMaDKNPoO
 Fid6rN88pwaQn51ekVPk0sVV+MFCwKuOHCcwY7br9FIvfK/afi2ZWjQcjC5APJD0h4ib
 qkgx90aAiGv7FKi9LaI2paNC5+I0vvEGvqoHjlsDkrRL88CZsO1LxuYluWLafXHBzCEX
 PTi7DXj7d7ZOVlaTnIerLQGFmiZwEogLXq9mmLbVNpKQNZ/x4e54p4WazPY3Cg9bqtKr
 jXmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlIo8CDM/iLQPRZHjjoQgWQxIK0xvfN1j5FMHdsDxB0iOBbAx0vScAq/aD/W5GVJVJVefByImYCRjWCQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYa9evnsdAwhReOiSXQiEp+g5a0bIP03V0sRx0OxugjQyIzsVX
 07OYYzRxlDDXbcRb7Xb7l66/ji94jo1jHnNhunf6MiaGkUv7wlrzANaNwN7hL38kNAA=
X-Gm-Gg: ASbGncs45Wp6myFIXlYlIXLUAnWbjgdi1mDRa0oCiTEfzsZeFmnGVtF2kBHVhZ09Lhn
 K3UMVfSrE+/EbsdfXCrYFGZLg8M0mRRV63rFSIpD9NYY0RUaC5Xs+8xRYMPAkN71xcoYVH01J7s
 F9Oe1eRs8tz1Pjt7MTd9k4In8GRL/oKp7RKYQJqJ2DI/yUSFJvCYEAGEzzuYRxpBoeNvmhqfzr5
 Yefz4B09bOgJIzhmnDdo/H/s+/Br1qGvCpAlUM9JNJ2YvMEBQ9fy0ae4iTxXioj16UyqVcTtgYn
 7aYbiyTaWVv6V166X11muo6rv7AREB4C4cVsE9KakbN27dDrIUFgdWYTlEtiE0mUw3ZQ3MA=
X-Google-Smtp-Source: AGHT+IHR+WLXCmN0YpGsXVAMyTrf5qwUXOqpxWzDyNHvcgpM8sHVsTuYa3Mt6GIgso9ohbfhoLilLw==
X-Received: by 2002:a5d:5f47:0:b0:3a3:6a3d:163a with SMTP id
 ffacd0b85a97d-3a36a3d18b3mr7521239f8f.12.1747939009584; 
 Thu, 22 May 2025 11:36:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6b295fdsm120822505e9.5.2025.05.22.11.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 11:36:48 -0700 (PDT)
Message-ID: <3cf3f029-f56c-4ea7-a10d-ece09fdbb2b0@linaro.org>
Date: Thu, 22 May 2025 20:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
 <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
Subject: Re: [Linux-stm32] [PATCH 1/2] watchdog: stm32: Fix wakeup source
 leaks on device unbind
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

On 06/04/2025 23:17, Guenter Roeck wrote:
> On 4/6/25 13:35, Krzysztof Kozlowski wrote:
>> Device can be unbound or probe can fail, so driver must also release
>> memory for the wakeup source.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 


This was almost two months ago, got review but still did not reach
linux-next. What is needed for this patchset?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
