Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786D89D4E5
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:53:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17267C7128B;
	Tue,  9 Apr 2024 08:53:00 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01952C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 08:52:57 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a51d05c50b2so264332566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Apr 2024 01:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712652777; x=1713257577;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a0jIR2OL0GyuZ7AB0nPnmYn4Ft44qzFta5fRUBXkOno=;
 b=EPnxcEMgegtHl4VtVOGE/Hjgpm/EMzQzlmzztfiEE5GkD7TSxugKIh7cYHGHdkfLNT
 PZHeWgAIuDl9PkU8J7d6hcD2HNz5SxNRpArBQkHGanReC9CvnGNKlR/enEV0ulKmgRz3
 zDVTTjK2OcJEbIriDMtsl+JjffKsqI2ZWXOBFxnpcV2/BDQdcqF6Z6pS4xZenA8LTQ84
 IhwvklaCIRKQ5FwLUOU4f/f3OUd4e2ImIG3OwSLlTYSNoCdpqFr5tBKOk8bWZg2UVnUy
 s5bJmvtaX6DFOJ9bwIE9P0RkmmT9IUhPrEK31fUMmVSRxnZi1sKQonSXEG+sGfydXb7i
 +iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712652777; x=1713257577;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0jIR2OL0GyuZ7AB0nPnmYn4Ft44qzFta5fRUBXkOno=;
 b=Raugm0UOT0RNjRsWDKCVJik/f6fUP/ZD78I3F+109m5VpCuawQwWsQBUCfwuIsHCbU
 iR5v/ftGw0eJfPnebQD0J3ibVrSGEEopTMtbfIINC72O5+5RjGQhWjAYptLcAmtJ9pov
 aK7GKOPfYch4rbUjuZVXTvzziTjyYK1TD7IB/A3lzC1fzzIx222a0SoC6XXyOqKjXYfp
 qTHKoZ5ND3r0n/KaH3xaml79klmzv0my/6oaIPXFbmWcQv2YljgmU5H8ufMJrSrJ9RsW
 BYUGS/Mj3ME/iUs7La0pyiuJr2JlbziNhE9k0DefZhqIVyFwcsCBJbdOdhR6mISe3bg6
 21Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6/Dej/jO+GbUV2n5bBawNkghdqTTAfUgMh/4/bOxbjyb+PhSJpwwpgqi5286AQSj/NljEyqrGfJI33tt1goX9gsMThJOu2q8Uj8/ZO6necxqVSViMdQGU
X-Gm-Message-State: AOJu0YxSFA5sLIdwsWWNjUBZhzI1i7H26fAauMH8ORekfNfpuJoyXLy6
 rnueIal6hvVRl/VkgwvVJX4H3FFQCpJzcTVIdxI9FBDt/xDB1zFf
X-Google-Smtp-Source: AGHT+IEAFHw1NjWQVbVzBzYATvddUlqkzBcIRzHxlgvPpMiPiCZOtlevHR5EjAtm+ZEjmL4iwtsgFA==
X-Received: by 2002:a17:906:6c97:b0:a51:88e5:5451 with SMTP id
 s23-20020a1709066c9700b00a5188e55451mr5956856ejr.29.1712652777110; 
 Tue, 09 Apr 2024 01:52:57 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-64.cable.dynamic.surfer.at.
 [84.115.213.64]) by smtp.gmail.com with ESMTPSA id
 ak2-20020a170906888200b00a51dccd16d9sm1836588ejc.99.2024.04.09.01.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 01:52:56 -0700 (PDT)
Message-ID: <6dc808bf-682f-4e91-aac7-7ce6f05a0ab4@gmail.com>
Date: Tue, 9 Apr 2024 10:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
 <20240408-rtc_dtschema-v1-3-c447542fc362@gmail.com>
 <dd5e9837-0dcf-4b0e-8d11-f8bed868cdf2@linaro.org>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <dd5e9837-0dcf-4b0e-8d11-f8bed868cdf2@linaro.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/9] dt-bindings: rtc: lpc32xx-rtc: move
	to trivial-rtc
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

On 4/9/24 09:34, Krzysztof Kozlowski wrote:
> On 08/04/2024 17:53, Javier Carrasco wrote:
>> This RTC requires a compatible, a reg and a single interrupt,
>> which makes it suitable for a direct conversion into trivial-rtc.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt  | 15 ---------------
>>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
>>  2 files changed, 2 insertions(+), 15 deletions(-)
> 
> This one no... and if you tested DTS you would see errors, although you
> need to test specific lpc config, not multi_v7.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
> Anyway, you *must* check all DTS before moving anything to trivial.
> 
> Does it mean all other bindings were not checked against DTS at all?
> 
> Best regards,
> Krzysztof
> 
Hi,

I did check the conversion against nxp/lpc/lpc3250-phy3250.dts, which
throws a message about the 'clocks' property.

That property is not documented in the original binding, and even though
it could be missing, I could not find any function to get a clock (i.e.
any form of clk_get()) in rtc-lpc32xx.c, which is the only file where
the compatible can be found.

Is therefore the property not useless in the dts? My apologies if I am
missing something here.

Thanks and best regards,
Javier Carrasco
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
