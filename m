Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 837706D234B
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 16:59:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F213C69069;
	Fri, 31 Mar 2023 14:59:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0874AC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:59:01 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m8so2148688wmq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274741;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vnlFqaagyiGC/yxykb+LPtjAztaRZkdyq0QplfwjoFU=;
 b=nF3sjGDQMAa+9jHsKfcp2XyDYlHpo2KuexE8K8B4AEt9/p0IObEDWv2CgD5R/nHOZs
 LKrnCyin/QS2zaGGOJyMPMc9pDYbfs+wygN0GlXYN79Pk627UpehAwFW+43cDdVYZ3h5
 EKqyUv3wk56Nyvg2r5e0GliVdi+B8N8eRMEu7xCrjLBQFnSstXL2oVvoMkrtv/dveeiO
 F37ewmOOr6JQO4KPhRRQmgyaI7I1mqSfqTqfRB3WByalYZ5HZ8FovnO1iw6OQz1VY4oN
 KGrF+QS+fO8qgq6jFJlJv0L9G9eYlEl0jj7QZM7zsAaCtqPH4+v4I5ncnoa+EWF86CHG
 DKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274741;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vnlFqaagyiGC/yxykb+LPtjAztaRZkdyq0QplfwjoFU=;
 b=tgwXldgTaaAugRaKKbxiHoq57ITdzVydYgAkCFEPR/wKr8eCXOvSd4No9foWmg4RgI
 SDK6S9cu67hLcmLTz3BLYRU7khkGL47HWwOKnXbEiX/ZfTHCE2T29UFFff5fq2kTk8ha
 SGAIvgQ8fwqR01DEDnJ+JueEFZefGFESLq+6bhXv8Juxd427EgFblLM/BDJ/BAYlPUgb
 bdA5FJiJU+Bp1LO6yvItWxuZSl4aP3BHCn4y+6nzS83VscwdgkMZGBLWy4nqvkyjhsbq
 pjGh7GY5sqCT0o8rBvhtSpQFQH0hvTTMaWGoGp+3b+x07IHeM6DMHIGRZ7YFoLFz1v7D
 29sg==
X-Gm-Message-State: AO0yUKVUEvG/ulbKEwm9zsP+Ue1vBSP/KtjtjU8aQnPdjsBgLTQ4+kEn
 4YsI8wzwiBbBirE0fHN/fXJSkA==
X-Google-Smtp-Source: AK7set/StNy++vH3rTk//CEKOWCplvO4ynmJaY373xQJNztEOfuyKCvvX4OAZ8I7XwRimDvrMK7WOA==
X-Received: by 2002:a7b:c8c3:0:b0:3ed:711c:e8fe with SMTP id
 f3-20020a7bc8c3000000b003ed711ce8femr23315255wml.2.1680274741435; 
 Fri, 31 Mar 2023 07:59:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0?
 ([2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0])
 by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b003ef69873cf1sm10363016wmb.40.2023.03.31.07.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 07:59:01 -0700 (PDT)
Message-ID: <22bac350-0a2f-48df-c8b3-6d915a830caa@linaro.org>
Date: Fri, 31 Mar 2023 16:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Arnd Bergmann <arnd@arndb.de>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
 <ZCblCsKMHYDZI-H9@makrotopia.org>
Organization: Linaro Developer Services
In-Reply-To: <ZCblCsKMHYDZI-H9@makrotopia.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pm@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, Netdev <netdev@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Olof Johansson <olof@lixom.net>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC 00/20] ARM: oxnas support removal
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Daniel,

On 31/03/2023 15:50, Daniel Golle wrote:
> On Fri, Mar 31, 2023 at 03:42:15PM +0200, Arnd Bergmann wrote:
>> On Fri, Mar 31, 2023, at 10:34, Neil Armstrong wrote:
>>> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
>>> associated with a clear lack of maintainance, development and migration to
>>> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
>>>
>>> In addition, the OX810 hasn't been booted for years and isn't even present
>>> in an ARM config file.
>>>
>>> For the OX820, lack of USB and SATA support makes the platform not usable
>>> in the current Linux support and relies on off-tree drivers hacked from the
>>> vendor (defunct for years) sources.
>>>
>>> The last users are in the OpenWRT distribution, and today's removal means
>>> support will still be in stable 6.1 LTS kernel until end of 2026.
>>>
>>> If someone wants to take over the development even with lack of SMP, I'll
>>> be happy to hand off maintainance.
>>>
>>> The plan is to apply the first 4 patches first, then the drivers
>>> followed by bindings. Finally the MAINTAINANCE entry can be removed.
>>>
>>> I'm not sure about the process of bindings removal, but perhaps the bindings
>>> should be marked as deprecated first then removed later on ?
>>>
>>> It has been a fun time adding support for this architecture, but it's time
>>> to get over!
>>>
>>> Patch 2 obviously depends on [1].
>>>
>>> [1] https://lore.kernel.org/all/20230327121317.4081816-1-arnd@kernel.org/
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Thanks a lot for going through this and preparing the patches!
>>
>> I've discussed this with Daniel Golle on the OpenWRT channel as well,
>> and he indicated that the timing is probably fine here, as there are
>> already close to zero downloads for oxnas builds, and the 6.1 kernel
>> will only be part of a release in 2024.
>>
>> For the dependency on my other patch, I'd suggest you instead
>> remove the SMP files here as well, which means we can merge either
>> part independently based on just 6.3-rc. I can do that change
>> myself by picking up patches 1-4 of your RFC series, or maybe you
>> can send resend them after rebase to 6.3-rc1.
>>
>> For the driver removals, I think we can merge those at the same
>> time as the platform removal since there are no shared header files
>> that would cause build time regressions and there are no runtime
>> regressions other than breaking the platform itself. Maybe
>> just send the driver removal separately to the subsystem
>> maintainers with my
>>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Sounds reasonable, so also
> 
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> 
> (but I am a bit sad about it anyway. without SMP it doesn't make sense
> to keep ox820 though)

Same !

I would have loved to see the full support mainline, but the platform is
old and apart you nobody were interested in working on this.

Thanks a lot for you work keeping Oxnas support alive!
Neil


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
