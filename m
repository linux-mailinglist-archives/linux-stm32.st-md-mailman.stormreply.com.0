Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F204D0E0F7
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jan 2026 05:01:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA0C3C8F283;
	Sun, 11 Jan 2026 04:01:34 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ADE5C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 04:01:33 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-34abc7da414so3093735a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jan 2026 20:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768104092; x=1768708892;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6aSQimWPEMhTKsPYUy1vj9/5sPSG4zuP/FMO33v30Ew=;
 b=nfTuisQRGygWY74UATdXQ1De0DborFPK1PbvgL4oV2Lt2sIOY6nQeQgmcN4YcYMxOn
 bGxIP50U6U01ULewAzap/m3V4MnO1hD/fyUy5PBqzzBw7A6D5rfaMq4y+4Icf7ouJbrZ
 +5FhdRzmGyM1lv3HjRvNsNe82UmncrxBLufGalB04VrNQFW9FJ3Lv2ThQ1UHuz0FoUTI
 0olADcB7gM2vFggBUFOndhfyTynbRQHm3zCHID5cbxC2CdPSeGhZv/3BawFcLcgHfV2o
 8n1wbJRQ3R3xo3KAiz0mE0Ift8lnqCK3eL8Ii1ysuAMuDziieUfgyfPmBk0u6p3UZKvC
 TD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768104092; x=1768708892;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6aSQimWPEMhTKsPYUy1vj9/5sPSG4zuP/FMO33v30Ew=;
 b=DLo22qILCcYV8PcIbRhwSLJ9hsXrZnfbC5nHTm6K+yT2KazE3NxYI9/jEIbKlzE9vh
 KiWYRITLugljVXUsEXR8SoC6TxxkFZwVsldzcahKlTF4n1PZFtwtGEwlq94eYXBPyxP7
 hU39UVMv0UNPE8kjdfYChTXpzm/i+p5yKOdpC35XH6KPFkHtcYC5UmRmTIZZNYLjul9p
 yPMSH6xmLn/vEFMNJNsCUYqX+Rc8phBCBaC7uMKNo0GhAAd0DelsNAxzhLBjCx82JWWZ
 YzMNvCZ1N6kdX5UNIDC/xf+SxQ0GvJLQUEzmQrGVz8cwDMmwO8oNjsvUOojGxKSrVglY
 AXTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3P86XwiSTBDUip0LKVBOd/dT5jo2sImoEl/b9h94AwGc+cz15e9EnzkDEH6J91wdNVyYVnV8LR0HpNQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLemNhoTgux6leVFnaendSkjk8LXYQNaD22DZ1hvwjeT6EKVgi
 vj/3L9pAWm2EA4b2oquK4WZAp0JTRnLNItnNQBLSJHNZxDzC66/8sJS9
X-Gm-Gg: AY/fxX5SSJYuUXiy2ho+X/lXaNVo/8G0nv3bVWX2DdYCElyusT/BhRDk3W4RqlKoAsW
 4JodNCHDZ2/MDC7g2CZ+LYClqg4xRVCL/kO7aPNg0YqfS4e8aG1LBxY8ddN4wiNKN8Q/OD0OA6b
 l+hXAjw/uxR2TtjvRp8Zm3+b4wp/LyHS0TwtktRGJ4oALWEzltG4bUq6OYSGrSVqWl3rpfVvsz9
 FNbrN+s8yaTs+iyimjYPYGaCcaXK4Bn8Sz380C7jb68lcMQ0TJ4FbmT7gIRhpZnWpm+9gJFtP9Q
 v1NoOl7ME4qUhS6pKCNdE7wdIIkOrFpSYmUiomgxeNnsvPVQ4s33pztzWODAKkxOtN1vLH/vhUA
 006GOZM0iVjeLu5uHmyhGcywdg9qxDxEalqCDcZjUvJ9MmaoEJTg/psLRGKdt8PgEN0jFgMgHoI
 jR7JWh
X-Google-Smtp-Source: AGHT+IGPybPvZupy/FYihDwzQNc/n+V1kR/RRvYwaA6/FcFDZUxpWNk2e4gufz92hDuNfXzVOvBWtg==
X-Received: by 2002:a05:6a20:a128:b0:35f:68d:430e with SMTP id
 adf61e73a8af0-3898f8f45bemr12792422637.9.1768104091706; 
 Sat, 10 Jan 2026 20:01:31 -0800 (PST)
Received: from [0.0.0.0] ([8.222.167.232]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cc96ca7a9sm13871167a12.25.2026.01.10.20.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jan 2026 20:01:31 -0800 (PST)
Message-ID: <0d54ddca-9270-40a5-aa82-d8a7b65027ff@gmail.com>
Date: Sat, 10 Jan 2026 20:05:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linmin@eswincomputing.com, robh@kernel.org,
 ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
 lizhi2@eswincomputing.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v1 1/2] dt-bindings: ethernet: eswin: add
 clock sampling control
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

On 1/10/26 10:26, Russell King (Oracle) wrote:
> On Fri, Jan 09, 2026 at 07:27:54PM +0100, Andrew Lunn wrote:
>>>     rx-internal-delay-ps:
>>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>>> +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
>>>   
>>>     tx-internal-delay-ps:
>>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>>> +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
>>
>> You need to add some text to the Changelog to indicate why this is
>> safe to do, and will not cause any regressions for DT blobs already in
>> use. Backwards compatibility is very important and needs to be
>> addressed.
>>
>>> +  eswin,rx-clk-invert:
>>> +    description:
>>> +      Invert the receive clock sampling polarity at the MAC input.
>>> +      This property may be used to compensate for SoC-specific
>>> +      receive clock to data skew and help ensure correct RX data
>>> +      sampling at high speed.
>>> +    type: boolean
>>
>> This does not make too much sense to me. The RGMII standard indicates
>> sampling happens on both edges of the clock. The rising edge is for
>> the lower 4 bits, the falling edge for the upper 4 bits. Flipping the
>> polarity would only swap the nibbles around.
> 
> I'm going to ask a rather pertinent question. Why do we have this
> eswin stuff in the kernel tree?
> 
> I've just been looking to see whether I can understand more about this,
> and although I've discovered the TRM is available for the EIC7700:
> 
> https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
> 
> that isn't particularly helpful on its own.
> 
> There doesn't appear to be any device tree source files that describe
> the hardware. The DT bindings that I can find seem to describe only
> ethernet and USB. describe the ethernet and USB, and maybe sdhci.
> 
> I was looking for something that would lead me to what this
> eswin,hsp-sp-csr thing is, but that doesn't seem to exist in our
> DT binding documentation, nor does greping for "hsp.sp.csr" in
> arch/*/boot/dts find anything.
> 
> So, we can't know what this "hsp" thing is to even know where to look
> in the 80MiB of PDF documentation.
> 

HSP -> High-Speed Peripheral. eswin,hsp-sp-csr is mentioned in

Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml

 From ESWIN's vendor/testing kernel tree:

hsp_sp_csr: hsp-sp-top-csr@0x50440000 {
   compatible = "syscon";
   #size-cells = <2>;
   reg = <0x0 0x50440000 0x0 0x2000>;
};

Apparently it's just a register block that controls varies behaviors of
high speed peripherals. I'm not sure if DT bindings mandates it, but it's
undocumented in the TRM. Perhaps ESWIN should properly document it going
forward? Also, I think ESWIN needs to check-in the sdhci/eth/usb device-
tree components ASAP, so folks can test it.

Bo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
