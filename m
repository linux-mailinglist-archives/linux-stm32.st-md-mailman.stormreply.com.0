Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DD46E65B1
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 15:19:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98516C6A5FA;
	Tue, 18 Apr 2023 13:19:37 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9198C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 13:19:35 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id fy21so30117932ejb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681823975; x=1684415975;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bIX4Rr3ehv2fMoH6ZgqIbWsmVfGdQo2i8FUTrHShcig=;
 b=pB7wXu1ywZIBBUonDsDq5inPakthH6Vy3I76ItK9jN1tih7yBOxvY/FgnwG4oqtgHK
 i+M37Oh3+41Abtz3/DNjk4RR7JI9RNSbiusp5YzeRpOvWhH58yz8YdnwQqMiQ/B3Zo/p
 WR8Kry0BQPQwA59G8HZgQorBqDdQqrVL8TwgJWjoJ+nQcEN53rwYm2+vdRBf1cxhao4y
 2Rj3tbxzzQmDuAsIHBGb3Bx/AIMv4GQztYZL7s+WYI7Vbua+B3NnGRz7ZYaBv4JK6VoW
 Xae7N+o6eTlS3eVftvt+Odr1ASmq5BiHw7iNsbpuq+0SuDz/Of5ikYVg18hPUCh92N1a
 wwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681823975; x=1684415975;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bIX4Rr3ehv2fMoH6ZgqIbWsmVfGdQo2i8FUTrHShcig=;
 b=XpeFoyp6Fq2dpUxwgOGrmjyOKBMA8ErKV+AnkZ11Qpab6xNnv54f3/SdedtZGbpGrR
 /EDTdQh+0HbXBbnnmU2SuubH0VtxfdrwWa5oIUTDLBElVAbQPsl6lsXzL6UJcFy7F0l9
 KCHJVfa6NBVI6h6SaU0yxDuCEQkD2tSTHcQ4elw5i4FbG8MRI5GcLlwwksEtWBdCtyED
 YUV+22AqPHltXmQHtpYRcXamJXPMUxeqxyp41HC1aNhB/C8wPVhb6jadF83hXAYmMhyD
 LeWsVMJKehpzhrnr/WONUdOtUp1SJ2xTNbyL2vt1rpqjMw2W/V1YL7QYZ+a4kbsHtoOr
 6Alw==
X-Gm-Message-State: AAQBX9e311xUeudVNfNzwfRg2de2CMX+K+q3bGrMwk7SceSDZJQKd3J+
 9h4Tqfy0111mRKtyY4OzqTuDjQ==
X-Google-Smtp-Source: AKy350auYZpuRF8dsf9xL60a7BUYDlrVge9la3UOE6deGPEpmQQCziMBihvpBb7AgbinT46ger1D5Q==
X-Received: by 2002:a17:906:da88:b0:94f:6616:8b00 with SMTP id
 xh8-20020a170906da8800b0094f66168b00mr7603319ejb.74.1681823975270; 
 Tue, 18 Apr 2023 06:19:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77?
 ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a170906349100b0094eeea5c649sm6234681ejb.114.2023.04.18.06.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 06:19:34 -0700 (PDT)
Message-ID: <ae487706-1081-bab3-0b31-1c5b3a72890e@linaro.org>
Date: Tue, 18 Apr 2023 15:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230417181342.v2.1.I483a676579cc7e3ac07e1db649091553743fecc8@changeid>
 <fde49fb8-c337-3a6b-811e-b9d7c3620393@linaro.org>
 <f2ad2414-526e-8b9b-aa95-a35953556f36@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f2ad2414-526e-8b9b-aa95-a35953556f36@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: stm32: Remove
 unnecessary blank lines
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

On 18/04/2023 15:03, Patrick DELAUNAY wrote:
> Hi,
> 
> On 4/18/23 09:22, Krzysztof Kozlowski wrote:
>> On 17/04/2023 18:14, Patrick Delaunay wrote:
>>> Remove double blank line.
>>>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>> ---
>>>
>>> Changes in v2:
>>> - update commit title and commit message to reflect what the change is
>>>    V1="dt-bindings: mfd: stm32: Fix STM32F4 DT include fil
>> More than one file has the same issue. This is quite a churn to handle
>> such patch one by one. Please fix all of them or just skip, as it is
>> harmless.
> 
> 
> To be crystal clear, it is minor difference between files in U-Boot
> 
> and in Linux, just because we correct the check-patch errors
> 
> when this file for STM32F4 was up streamed in U-Boot.
> 
> 
> I prefer correct this line in the Linux file and no having
> 
> this difference for each device tree synchronization with U-Boot.

I don't know what is there in U-Boot, so my comment was not about it. I
prefer all the files in Linux kernel being correct, but done once for
all. Not once for stm32XX, then later for stm32XY and then stm32XZ...

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
