Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A620896BB7
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 12:10:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2381FC640E5;
	Wed,  3 Apr 2024 10:10:20 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C8AEC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 10:10:19 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a4715d4c2cbso825038866b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Apr 2024 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712139019; x=1712743819;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=myCgdA0h68H3QUNWwYVoFe/9Mdd1M32UgiW7MLHEsoE=;
 b=V42xqgDrPO+OKTzPgtTiypkSQC3OI/mzful6jDCiAZlVDhCxcAmat5Q73RnFeO+gyF
 yF5TjZg6HSY3eAvQHBOAKpq3yDXTpFCTY2S3JcwjaYF+l2SWOuQ5Xex/PE/O2ftblHMx
 WXqvESU123LOeWEqi1F5kaR3/p/Us0e7CUGMn/jvhQZLNHOTcNcEL6Dmc2sEnVg3gtz3
 xvnDAe6LqYGtU4W5rnCJRb3ijbIbcPPpHT/CJgaCznZO6Y7IwvSyQfmM82vhJfi4ZQXP
 w46OiXBBetHW/+g85UULyB0jKywyFrUXymKrhsMpwF+2B8kLaVXaj/bsvCMPbvhGoVdP
 irig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712139019; x=1712743819;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=myCgdA0h68H3QUNWwYVoFe/9Mdd1M32UgiW7MLHEsoE=;
 b=EulbfOOULJZnSDEwz4LxkubRiy0gwgFvf9YN9M0VDR2ALHlhY7k99iMDlc5csjZDKY
 uebxKCEycB54oNHsCOCizdup6dGrS1oFInW1+j3xreCsNwnNtGuEMB+K42XZM+fFpXdE
 KSX/RIHoEFgXCy9Akj1BWGz/oW6Rqlv7jaDLCfhgeP0NlCgPc9T2D/Nt2zcYfr4axDpQ
 5enwhgLFwX2ymxVOSgGtrdkhEIwrocKc/3/OMp2r7zIWCuDFSbMYJCL3UNBumb1X6Qmu
 1Aag8gEJDngn6z7LKLPmqSUhIGvMhq/q+a/qr7i9ASE7kgxWJ2lTh8MzYZWyBaqh4RZt
 vg5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNM1lKeSe2vWPNOXXi3vy7/cXA7LSdwwG5qsuD5mbhVBugMSQcPjn2k38qNoVyTIB22T8uzqN6lATamU709b7arqf6iHUo14PHCWLasSllAsYYKxuHnDek
X-Gm-Message-State: AOJu0Yw67ylfMRUxU9FsWD2L/rvhHyp5/knmc5vCIZ5M5FhqBNJ+y31Y
 JapaaJLVoWrXehRVub/8QXAsoXAJSQsqRBDgKasg9DGb+F72VODO1oP8IeQy89s=
X-Google-Smtp-Source: AGHT+IFhHhHI7xoYGNaPz0Ae1xelDIgCSGIAHERjeb4kNBN4c48x0Aukr3cvcs9kc7EZChEcXP9iAA==
X-Received: by 2002:a17:906:1914:b0:a47:4b39:ba1c with SMTP id
 a20-20020a170906191400b00a474b39ba1cmr1452990eje.39.1712139018628; 
 Wed, 03 Apr 2024 03:10:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
 by smtp.gmail.com with ESMTPSA id
 xf6-20020a17090731c600b00a4e56e4e051sm4693217ejb.94.2024.04.03.03.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 03:10:18 -0700 (PDT)
Message-ID: <92c7ec52-a7a1-4639-aca7-ffeb643ae6b8@linaro.org>
Date: Wed, 3 Apr 2024 12:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-8-arnd@kernel.org>
 <Zg0kC6uYFOi-UGXl@smile.fi.intel.com>
 <614fc80a-5d2a-43a1-b8d4-48bdb2cc7dc7@linaro.org>
 <Zg0pei7ut5lC9yVC@smile.fi.intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zg0pei7ut5lC9yVC@smile.fi.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/34] Input: stmpe-ts - mark OF related
 data as maybe unused
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

On 03/04/2024 12:03, Andy Shevchenko wrote:
> On Wed, Apr 03, 2024 at 11:52:12AM +0200, Krzysztof Kozlowski wrote:
>> On 03/04/2024 11:40, Andy Shevchenko wrote:
>>> On Wed, Apr 03, 2024 at 10:06:25AM +0200, Arnd Bergmann wrote:
> 
> ...
> 
>>>> -static const struct of_device_id stmpe_ts_ids[] = {
>>>> +static const struct of_device_id stmpe_ts_ids[] __maybe_unused = {
>>>
>>> __maybe_unused? 
>>>
>>> Why not adding it into .driver as you have done in another patch in this series?
>>
>> Because there is no benefit in this. This is instantiated by MFD, so the
>> only thing you need is entry for module loading.
> 
> Hmm... Seems to me rather a good candidate for MODULE_ALIAS in this case. No?

No, I do not think module alias is for that purpose. This is a valid
compatible, documented and provided by DT so it is expected to be in
of_device_id.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
