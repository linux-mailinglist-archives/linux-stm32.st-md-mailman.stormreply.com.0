Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF4894F78
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 12:04:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D267C6B45B;
	Tue,  2 Apr 2024 10:04:12 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68B6BC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 10:04:11 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-56c0a249bacso5994586a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Apr 2024 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712052251; x=1712657051;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=lXlejm1gxhMkyf9SE5eKOVkRtnhxyT9RO6nl18SlSZM=;
 b=kbsB3fAawY5jdLS22FQpromX43PjBuURZlxuzEx64rv01wuDeonT2MyuZM2bH+vZkl
 QwHPPcj7Z0bDsdChS4CWpi1h19G7OggqYeo9sKj0lEAsn3FYsnqfy1ZmdykroQWKhGN0
 D7OfLS3MpiMpZJBgOL1zFGpOhB4wVy7rCyxMjA7tnSiudWh0zMDKGxkgeVTIv8LGpZ2B
 rsZVkgtoOF06xz5i/4rT3Ah4OqiqOUTJ+hMTIZAPHWjGDubJ9L0fP/KqG4RuhODlqHAr
 F9lF+ZeZY16rPsX28XMsuIbJN9EnepaTf6in9o7OExeO8S+WbputYuU2egAi/72UflQK
 PnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712052251; x=1712657051;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXlejm1gxhMkyf9SE5eKOVkRtnhxyT9RO6nl18SlSZM=;
 b=sh9iEsX6vsiGBKKMqfzK8f2vxP+l5b3BJmJGS92c3oyQ0oYBnLqub6ySyeuk/PFjGM
 7aBfMdVx9NIZB1rfCSrQ97UrsHdoXQjFHN637ffiemhKOhSWJ5OduOS8Jt3aoOk04eAi
 diYlvBYaPl4X8oeCXXY3Uc+wBp0O362dWST5AJfhl7Q6SR/O1zOsecYe5DrPvyh57Vt3
 arNk09yQ6vARGcO092b9RXaGPLEXEnsGrhSCGiUIpR1vJNynhvqOwkDUQGG1msiyRQD4
 hlG9xPM2/hImLhlYAX6jQQeWwgnsYd15zO/kcEYB3hq+1X8hs65znu86Hew3acEPUFJB
 VxeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0ggHPn9PMZ1awvqYE8F+MFk7+HC7IWSuyr+2SxEkjIn7SxEJipVonFzJxRNFa4raPlhDGZG5KJqbkMaQLd003qGAGLlMIWN+l3yyE2DkGHY0bNVUV+iSc
X-Gm-Message-State: AOJu0YyvBhbffjjfAhncbf6XJWkGXC0JelC5nLA9WENCZx39eSmrCn+e
 mJx6g4k2QSDz9nmImEb/NqT/9iJ5647aQlm52q+dqb5j5MCNDWr+4GaLyaXknO8=
X-Google-Smtp-Source: AGHT+IE0RVVwIf+Sbm8r8Y9Va+HRLItn/eLkpOfFL6YAcnUNeKJt/7rXsXC1TLnw6Weha0uszmU5uw==
X-Received: by 2002:a50:9e24:0:b0:56b:a017:10e with SMTP id
 z33-20020a509e24000000b0056ba017010emr5886427ede.42.1712052250694; 
 Tue, 02 Apr 2024 03:04:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
 by smtp.gmail.com with ESMTPSA id
 h11-20020aa7c94b000000b0056ddcb509f5sm1527641edt.56.2024.04.02.03.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 03:04:10 -0700 (PDT)
Message-ID: <65f0ed39-4c2f-4cea-b488-2a8ba6fdbeff@linaro.org>
Date: Tue, 2 Apr 2024 12:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <f514d9e1-61fa-4c55-aea1-d70c955bb96a@linaro.org>
 <ZgvIMRDfeQaeVxYt@shell.armlinux.org.uk>
 <324e9c02-c005-4e18-9872-8408695fb1fe@linaro.org>
 <ZgvWfhSEYIUaIn6h@shell.armlinux.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZgvWfhSEYIUaIn6h@shell.armlinux.org.uk>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-input@vger.kernel.org,
 Mike Leach <mike.leach@linaro.org>, Andi Shyti <andi.shyti@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
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

On 02/04/2024 11:57, Russell King (Oracle) wrote:
> On Tue, Apr 02, 2024 at 11:48:08AM +0200, Krzysztof Kozlowski wrote:
>> On 02/04/2024 10:56, Russell King (Oracle) wrote:
>>> On Sat, Mar 30, 2024 at 01:18:30PM +0100, Krzysztof Kozlowski wrote:
>>>> On 26/03/2024 21:23, Krzysztof Kozlowski wrote:
>>>>> Merging
>>>>> =======
>>>>> All further patches depend on the first amba patch, therefore please ack
>>>>> and this should go via one tree.
>>>>>
>>>>> Description
>>>>> ===========
>>>>> Modules registering driver with amba_driver_register() often forget to
>>>>> set .owner field.
>>>>>
>>>>> Solve the problem by moving this task away from the drivers to the core
>>>>> amba bus code, just like we did for platform_driver in commit
>>>>> 9447057eaff8 ("platform_device: use a macro instead of
>>>>> platform_driver_register").
>>>>>
>>>>> Best regards,
>>>>
>>>> I tried to submit this series to Russell patch tracker and failed. This
>>>> is ridiculous. It's 2024 and instead of normal process, like every other
>>>> maintainer, so b4 or Patchwork, we have some unusable system rejecting
>>>> standard patches.
>>>
>>> Sorry but no. Stop being offensive.
>>>
>>>> First, it depends some weird, duplicated signed-off-by's.
>>>
>>> Eh? There is no such logic in there.
>>
>> In the web system there is - read the error message I pasted. It wants
>> another SoB from the unrelated email account, the one used purely for
>> registering in some web system, not the one used for code handling.
> 
> So you're disagreeing with the author of this system. Of course you
> know best, you know the code behind it. I have only one word for
> that kind of attitude: idiotic.

I pasted you the error which the system reported to me.

> 
>>>> Second it > submitting patch-by-patch, all with clicking on some web
>>>> (!!!) interface.
>>>
>>> Again, no it doesn't, and you're just throwing crap out because you
>>> failed. Unlike most of the "normal" processes, the patch system allows
>>> you to submit both by *email* and also by *web* for those cases where
>>
>> The email one requires additional steps, so this is unnecessary work
>> confusing submitters. I submit dozens or hundreds of patches every
>> release cycle. That's the only subsystem which is odd to use.
> 
> Lots of people use it without issue. People even send patches to the
> mailing list copied to the patch system.
> 

I will try that.


>>> the emails get screwed up by ones company mail server. That's why the
>>> web interface exists - to give people *flexibility*.
>>
>> No, they are not. None of my emails are screwed by my company system.
> 
> So why are you using the web interface?
> 
>>> Why does it want the kernel version? Because when we were running 2.4
>>> and 2.5 kernel versions in parallel, it was important to know which
>>> tree the patch was being submitted for. It has continued to be required
>>
>> Which is absolutely ridiculous now. Expecting submitters to adhere to
>> some rule for 20 year old kernel is not reasonable.
> 
> You aren't listening to me, so it's pointless discussing this further.
> You have a bee in your bonet and you want to make it a huge issue

Well, all my comments were about the actual topic - patch submission
process made for ARM subsystem by you. Your replies include comments
about me and what do I have in my bonet.

You brought no argument for keeping the kernel-version-header
requirement nowadays, yet you call me of not working constructively. I
brought that argument - it is redundant and it is an obstacle for the
contributor.

> rather than work constructively. Sorry but no, I'm not going to continue
> this confrontational exchange.
> 
> You clearly don't want to understand anything.

I understood a lot, although I did not answer under every point "I
understand this part, I disagree here".

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
