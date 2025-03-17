Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7516A65581
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 16:26:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B9CEC78F62;
	Mon, 17 Mar 2025 15:26:45 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70ACDCFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 15:26:44 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so3834433f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 08:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742225204; x=1742830004;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dLQN2rYfbUfknOcr+3k7Zu0rC5DV/UYvyp9DPPr78Rw=;
 b=FtDKC3u7EJlWQJQ2KPAFLSEA0Ho4eXJK/ndRWPAiYKY3O7fJ1JhpianrnDWHp/kilJ
 WqP3BW/FGc0iDfTi97F74z1iF/TTDS7IfpxrlJy/9bkAbs7HApKT7PBLdFor+2/I4j5K
 W9e95NKwBwc0XTru7Nz0ghWqUuR7O5iqHX23GBNJe+xYSJkG0ze973H+KkBtwUPKI64B
 T6QkkEnQBME5n9mZgjY10WJsc9keKaj64qGduprVqRjD7HdoCCiVNumfrN4u1wGcQe+q
 HqlkpmaD2B2OLlgJmuPzu1PoTYQ2TTwijeCTQZ0q2X3a2H6COAyNei/iMM5ICJ8NJ9Xo
 CiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742225204; x=1742830004;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dLQN2rYfbUfknOcr+3k7Zu0rC5DV/UYvyp9DPPr78Rw=;
 b=vNqUqJ1oJjoOu1UissZ5XHaS81d4xXs+El6uVhruYfYaT6GpxMBMGNa/BeBBiYgVKQ
 ttwNtwHbcy2wvHoqTEk8g8x/NmiOZFu3DTZrAOOdxce5wBg4RITGdM4hMxI01kz9mity
 qmZFO4tqwIoS7pU98lmaC49Pj02+Hoyf57PIiNGJxEt+I05tB6bXl9+eOc/CC4EcOehR
 pylwI0V512jJ1IlbhSHpm9COLeYK4r1A+Xx7t+OMtFvM79XfClTjJ+9Mttk38ae8W89V
 u+9eQzWf7pjNHw0x10By0PXPTCLmIm/2f1MLK3iOOpDtOVWSxKGjtT5JbIagsCEaPVdy
 aq5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc0HhBYwsj5yRSpp17fkKEwHOniX9Tm4WJsvApP4wmrmD5lN9haGl5OeZgLETFIGm9tGQPrt+g6RYOvg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0tL2mLTC0FLJ8JuCmGw/bLs0fgbz0hc89Flx7pk/dOHiYuM+U
 sCo4uclfQ+KYmp/OFIDtQDlOwyOQAvkXds5MIfEEjJQx0tqSf9hdLRzON64bmiU=
X-Gm-Gg: ASbGncs2IvLRWFADBV3FSjrID7bDdA8EZe0JxsbvNZeJ5AIvlEjDjtwBmnN1mA0Nu3o
 pLQParKZeoI0kVYfpT6Ew1pVp7eTRouZU/uVBOWWdqJQgMJWa2XZpVv/HXAJwQHiCLUzrZ2kHES
 xmARCvkEXYMNhWqv4sFQHwpxdM9ZPYKrAFNZASmnUKZfwzwUxipRjyseklROV++UE/P5qKhMXm7
 EWf2L00vRtKur3FOSUuinXoLFQUalOUrIqBcR1m4c1J3lNOuVi2BZV25mSq5M0Ff8hwNjqCPEo/
 37J6xCJQj/FWSXncdCiz58Qs8Dvn2AOZ62tHQ9jkExnOmIQWEAADjTjqRvw7Gxty
X-Google-Smtp-Source: AGHT+IHmlXtTubn1PZxH2CkcujoV8qVJCpVv92ZgYDL+4RbLAnl09dxmfdM8qSfdWo4ezczy/3C0TQ==
X-Received: by 2002:a5d:64c9:0:b0:391:2c67:7999 with SMTP id
 ffacd0b85a97d-39720779405mr16263191f8f.48.1742225203800; 
 Mon, 17 Mar 2025 08:26:43 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c82c258bsm14961910f8f.24.2025.03.17.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:26:43 -0700 (PDT)
Message-ID: <9d06b27a-c2ce-41b8-9657-151000c0b244@linaro.org>
Date: Mon, 17 Mar 2025 15:26:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-7-james.clark@linaro.org>
 <20250314095025.GW9682@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250314095025.GW9682@e132581.arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 6/7] coresight: Remove inlines from static
 function definitions
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



On 14/03/2025 9:50 am, Leo Yan wrote:
> On Tue, Feb 11, 2025 at 10:39:42AM +0000, James Clark wrote:
>>
>> These are all static and in one compilation unit so the inline has no
>> effect on the binary.
> 
> I read the doc coding-style.rst, the section "15) The inline disease",
> my understanding is though the inline is not encouraged, I prefer we can
> follow up the rule:
> 
>    A reasonable rule of thumb is to not put inline at functions that have more
>    than 3 lines of code in them. An exception to this rule are the cases where
>    a parameter is known to be a compile time constant, and as a result of this
>    constantness you *know* the compiler will be able to optimize most of your
>    function away at compile time. For a good example of this later case, see
>    the kmalloc() inline function.
> 

Isn't this advice about whether to make an inline function in a header 
file or do definition + declaration? I only removed static ones local to 
.c files where 'inline' has no effect at all. We build with optimisation 
enabled so the compiler already auto inlines small functions and ignores 
the inline keyword for large re-used ones anyway.

>> Except if FTRACE is enabled, then some functions
>> which were already not inlined now get the nops added which allows them
>> to be traced.
> 
> I understand it is a side effect that we cannot use function tracer for
> inline functions.  This is not a big issue for me, as we still can use
> "perf probe" and trace_printk() for debugging.
> 
> Thanks,
> Leo
> 

I think it can be useful, I've used it a little bit. Might as well make 
it easier to use for someone if it exists.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
