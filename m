Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0FE6D233B
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 16:57:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1218FC69069;
	Fri, 31 Mar 2023 14:57:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2016C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:57:11 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id h17so22701342wrt.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274631;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=X2dQ+lYOZmXZreHzCA27SPymWQu74XpJ9AsKWsdeeL4=;
 b=LxMr8btqIWpZVBhNCuG3Pv8bToCfJWDTdR7+mR8mGHozcnAnNX8W0cDET2uL7CaGs9
 5e93/RuXqDOnGQEs4AERzNy/Qogvh1lNEl5m/Bf/swKpLDINZWZrVcg2ZaNJuQJxTI3k
 scrF3ioZ8uoXF7zeOPiJ/wP8xdLa/F/5qp3ahGdIGZuPJ7thH6JA/9PSgY4cV1Egc6BI
 O1Rz6S+5Em4dXlsXilZs5u99e4DEWL7+4xEEyTpHsjLqG+DWWc96/933gCmUjtvMCuis
 cNHHsNXvDWRcx4rsOJaAwffsHJR3LJLod1tAvHB9N9onT9OneeyP7ioLARMZpPHqlTA4
 cJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274631;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X2dQ+lYOZmXZreHzCA27SPymWQu74XpJ9AsKWsdeeL4=;
 b=T419vtRsUgfW8RIUA1rFZVLZUVSLZxnVyzTQiqDdwATd5v2a/VCQ8VlraJt2n+dYUr
 7vTFpt4Qv8gjP1SJiPqnX4y6f4f1/2NuzAOydxuTjUSjsfjmeHwejf7uXhWvIpVABUnZ
 7CfXh2MPtVjC/MK+1nlW7kNC0zuda0yN8D7U18fhJcriXIzdqvP6N+ft1JSBe6ytfAD0
 E7/FPWQsXXBnFUbuJBxfHf/BvZOs+uePWcEDGqsPUkjHKXtoWT94cESvQ1Q8M83/yyrD
 2BR/SkzE8bX34WDiIeUe62GisjnfIOA2GNRNol86P9yDBdTPN7bjTmDfP50GvOYTAT4a
 q20w==
X-Gm-Message-State: AAQBX9depPI351YEkcmXVlFySmfn6btdBI60/WAUuDxUhUiWf7hAOoki
 RM0Q4lHFjohlTpxEClvt12Hh9A==
X-Google-Smtp-Source: AKy350ZhM7TlzzbkKQh+f2qjf5R7dBolMimYX1XKzO4RjCFaq7KCOpO3n90LcpUgFdpKCsl7ogNfUw==
X-Received: by 2002:a5d:4409:0:b0:2cf:e422:e28c with SMTP id
 z9-20020a5d4409000000b002cfe422e28cmr18329961wrq.42.1680274631125; 
 Fri, 31 Mar 2023 07:57:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0?
 ([2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d4d8c000000b002e51195a3e2sm2392687wru.79.2023.03.31.07.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 07:57:10 -0700 (PDT)
Message-ID: <23e513ad-9fca-30cd-1f08-2ff559072314@linaro.org>
Date: Fri, 31 Mar 2023 16:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
Organization: Linaro Developer Services
In-Reply-To: <df218abb-fa83-49d2-baf5-557b83b33670@app.fastmail.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 31/03/2023 15:42, Arnd Bergmann wrote:
> On Fri, Mar 31, 2023, at 10:34, Neil Armstrong wrote:
>> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
>> associated with a clear lack of maintainance, development and migration to
>> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
>>
>> In addition, the OX810 hasn't been booted for years and isn't even present
>> in an ARM config file.
>>
>> For the OX820, lack of USB and SATA support makes the platform not usable
>> in the current Linux support and relies on off-tree drivers hacked from the
>> vendor (defunct for years) sources.
>>
>> The last users are in the OpenWRT distribution, and today's removal means
>> support will still be in stable 6.1 LTS kernel until end of 2026.
>>
>> If someone wants to take over the development even with lack of SMP, I'll
>> be happy to hand off maintainance.
>>
>> The plan is to apply the first 4 patches first, then the drivers
>> followed by bindings. Finally the MAINTAINANCE entry can be removed.
>>
>> I'm not sure about the process of bindings removal, but perhaps the bindings
>> should be marked as deprecated first then removed later on ?
>>
>> It has been a fun time adding support for this architecture, but it's time
>> to get over!
>>
>> Patch 2 obviously depends on [1].
>>
>> [1] https://lore.kernel.org/all/20230327121317.4081816-1-arnd@kernel.org/
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks a lot for going through this and preparing the patches!
> 
> I've discussed this with Daniel Golle on the OpenWRT channel as well,
> and he indicated that the timing is probably fine here, as there are
> already close to zero downloads for oxnas builds, and the 6.1 kernel
> will only be part of a release in 2024.
> 
> For the dependency on my other patch, I'd suggest you instead
> remove the SMP files here as well, which means we can merge either
> part independently based on just 6.3-rc. I can do that change
> myself by picking up patches 1-4 of your RFC series, or maybe you
> can send resend them after rebase to 6.3-rc1.

Ack I'll send patches 1-4 rebased on v6.3-rc1 with the acks
and sent a PR next week.

> 
> For the driver removals, I think we can merge those at the same
> time as the platform removal since there are no shared header files
> that would cause build time regressions and there are no runtime
> regressions other than breaking the platform itself. Maybe
> just send the driver removal separately to the subsystem
> maintainers with my
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks, I'll submit those individually once the first patches are merged.

Neil

> 
>       Arnd

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
