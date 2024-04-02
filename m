Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8811894F45
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 11:57:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EE51C6B45B;
	Tue,  2 Apr 2024 09:57:23 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31E5DC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 09:57:22 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d485886545so81679101fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Apr 2024 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712051841; x=1712656641;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KaALGpR55LLYN546Bwu1n1OTGHrwQpx5Bj/luubs+R0=;
 b=CGKlybkockgmQZ7SNI+UAV4Ert0eYnaIyIxFIzsTGiF7lZQvV/lz9XAKsyMnYv5dac
 cl/EiUVx/cvB9TVCfzdwcNib1chQQcU9W5piJ3ycYHAwvDj/C5bihtW7MDmsDNkGBCdS
 poLy9ZnUgAWvHwuu8jXioRZBt1CJaRLpMGyTp+y55T8+tdIkip4eyt0KC/0KyV/Iu/GA
 LBYzH1/xoM/k07TOe5YQ6cRONERheCtJhI8KkkTLYnCETVBjvQIKSsMVkhjSv/0ecxUx
 2lwlZGtRJeHFTrMTTQVKsO8aAtemvViB7lRA5peb5dv6ElcVD/KJPSK1XnipjUHJAtjK
 ls0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712051841; x=1712656641;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KaALGpR55LLYN546Bwu1n1OTGHrwQpx5Bj/luubs+R0=;
 b=gOUO7YUDNeUyU4/pj4aYbPhSe4K+HNt98IqNTQFG2L1wtnZIufcswKGHHirbqLzRXu
 T/jl3LLhJShzC6/v+yf8cpmzs98or4V0r5fjspKtF0/zbO67inV61qfyOqeUBIWgSAXQ
 6b8W80g0ChuCBRnfQ+z+18yKuEPlQhpDobMXF5fwEdH5y5NfNv7pp5Fy1gta1FF52xnh
 dnlTpCxeUjcpWc3kTES5V62IG5zeUY1FhmN7WZvhhA2fetkHO3ciVV/5Ju4rzI7qZWz4
 lrapgKvvZ3YyVrgug8s7B3mGilcoLjqwb02oqU/h06uuKGoEChWIAdzPOpmshy7WrYZT
 h1SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUm5KCgG5iVhtcMiN39UICovbOBEaznpNCquYTSd0BgasKqYdSrE3E4iFX2A078g20KMex0+t3beyrvqGsQ8+/fa+pYEQ3vS897oVw8DUtD84UQJN4W8zv
X-Gm-Message-State: AOJu0YwBpx95zx/GpjwXQY19JZm/L6RryxeElBsOVQMEWlu5c4b50dNB
 7IZF9ieGWQ41QMXyP3dvzLZk5QO+0ogbYifBKOtgO8GYGhWBIt+7HLsJ8h0DLko=
X-Google-Smtp-Source: AGHT+IGWCEOGN1+XjtzfYre7/egOrrrKPQ8Lfe9ZEH+5g0W7eKr0xB6p1bbpF7hXyXxGItvb0g1xWg==
X-Received: by 2002:a05:6512:403:b0:516:a686:8ae1 with SMTP id
 u3-20020a056512040300b00516a6868ae1mr1017019lfk.62.1712051841164; 
 Tue, 02 Apr 2024 02:57:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a170906364100b00a4628cacad4sm6312315ejb.195.2024.04.02.02.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 02:57:20 -0700 (PDT)
Message-ID: <47813c01-39b2-4e5e-bb67-1d49788fc613@linaro.org>
Date: Tue, 2 Apr 2024 11:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <f514d9e1-61fa-4c55-aea1-d70c955bb96a@linaro.org>
 <ZgvIMRDfeQaeVxYt@shell.armlinux.org.uk>
 <ZgvKh/Cwudh3gCDr@shell.armlinux.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZgvKh/Cwudh3gCDr@shell.armlinux.org.uk>
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

On 02/04/2024 11:06, Russell King (Oracle) wrote:
> On Tue, Apr 02, 2024 at 09:56:17AM +0100, Russell King (Oracle) wrote:
>> On Sat, Mar 30, 2024 at 01:18:30PM +0100, Krzysztof Kozlowski wrote:
>>> On 26/03/2024 21:23, Krzysztof Kozlowski wrote:
>>>> Merging
>>>> =======
>>>> All further patches depend on the first amba patch, therefore please ack
>>>> and this should go via one tree.
>>>>
>>>> Description
>>>> ===========
>>>> Modules registering driver with amba_driver_register() often forget to
>>>> set .owner field.
>>>>
>>>> Solve the problem by moving this task away from the drivers to the core
>>>> amba bus code, just like we did for platform_driver in commit
>>>> 9447057eaff8 ("platform_device: use a macro instead of
>>>> platform_driver_register").
>>>>
>>>> Best regards,
>>>
>>> I tried to submit this series to Russell patch tracker and failed. This
>>> is ridiculous. It's 2024 and instead of normal process, like every other
>>> maintainer, so b4 or Patchwork, we have some unusable system rejecting
>>> standard patches.
>>
>> Sorry but no. Stop being offensive.
>>
>>> First, it depends some weird, duplicated signed-off-by's.
>>
>> Eh? There is no such logic in there.
>>
>>> Second it > submitting patch-by-patch, all with clicking on some web
>>> (!!!) interface.
>>
>> Again, no it doesn't, and you're just throwing crap out because you
>> failed. Unlike most of the "normal" processes, the patch system allows
>> you to submit both by *email* and also by *web* for those cases where
>> the emails get screwed up by ones company mail server. That's why the
>> web interface exists - to give people *flexibility*.
>>
>> The fact is, the web interface is merely a front end interface that
>> generates an email and submits it in the usual way by email - an
>> email that you can perfectly well generate that is *very* close to
>> the standard email that git format-patch generates.
>>
>> The *only* difference is that the patch system wants a KernelVersion:
>> tag in the email _somewhere_ and it doesn't matter where it appears.
>> Git even has support to do this.
>>
>>   git format-patch --add-header="KernelVersion: $foo"
>>
>> Why does it want the kernel version? Because when we were running 2.4
>> and 2.5 kernel versions in parallel, it was important to know which
>> tree the patch was being submitted for. It has continued to be required
>> because it means when there's problems applying a patch, it gives me
>> the additional information about the base used for the patch (and it
>> keeps on being useful to have.)
>>
>>> That's the response:
>>> -------------
>>> Your patch has not been logged because:
>>>
>>> Error:   Please supply a summary subject line briefly describing
>>>          your patch.
>>>
>>>
>>> Error:   Please supply a "KernelVersion: " tag after "PATCH FOLLOWS" or
>>> "---".
>>>
>>> Error:   the patch you are submitting has one or more missing or incorrect
>>>          Signed-off-by lines:
>>>
>>>          - author signoff <krzkreg@gmail.com> is missing.
>>>
>>>          Please see the file Documentation/SubmittingPatches, section 11
>>>          for details on signing off patches.
>>
>> Lots of people use it without a problem. I've just run the parser
>> through its offline tests, and it parses email content correctly.
>> I've no idea what you're doing wrong, but it looks like something
>> pretty serious if it didn't parse the subject line.
>>
>> Rather than getting stressed about it, why don't you send me an email
>> the first time something goes wrong so I can investigate, turn on
>> debugging to capture the problem email?
> 
> ... and I'll also point out one of the biggest problems is people.
> People who think it's more complex than it is, or who can't read
> instructions.

We all read submitting-patches instructions (and many more). A need to
learn one more set of instructions for one more process leads to people
needing to learn 100 different processes for 100 different subsystems.

That's not the way how people should be contributing to Linux kernel.

> 
> For example, trying to tell people to use the standard format subject
> line:
> 
> 	[PATCH ...] blah
> 
> has proven to be hopeless - unless one states to them the exact
> sequence of keys on their keyboard to press - yes, it *really* takes
> that patronising level to get everyone to understand. If one tries to
> do it any other way, then you get stuff like:
> 
> 	"[PATCH ...] ..."
> 
> with the quotes. Or some other stupid variation.
> 
> The patch system is as forgiving as possible. It takes standard git
> formatted patches (with the exception of wanting an additional tag).

The additional tag about kernel version is redundant and not helping
anyone. I doubt you apply patches on top of linux-next or top of
previous release (e.g. v6.8-rc1). Almost every maintainer applies on top
of current RC, so v6.9-rc1 currently, thus version is just unnecessary
obstacle.

> 
> It is possible that bugs creep in - particularly when Debian updates
> get applied and change the way Perl works, but I don't think that's
> what has happened with your situation.
> 
> I _guess_ you're putting the entire email-like output from git
> format-patch as the patch file. That won't work - that isn't a "patch
> file", that is an email/email template, and the patch system will
> attempt to parse that as the patch itself.

Yes, that's what every sane person's workflow is. git format-patch -19
(cover letter goes from branch description).

> 
> I suppose you term "patch" to be the email as well, rather than what
> I interpret it to be, which is only the output of "diff" - call me
> old fashioned but that's what a patch file used to be before the
> waters got muddied by git "patch files".

Well, world is now using git as a standard. It's true there is quilt out
there, but even Andrew I think is going slowly towards git in some parts
of his workflow.

But then even Andrew accepted standard patch from the mailing lists. No
need for any other step, no need for any double submission (one public,
second to patches@armlinux or webform) with any other requirement.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
