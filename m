Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1584DAE97
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Mar 2022 12:01:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DF22C60464;
	Wed, 16 Mar 2022 11:01:24 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22A47C5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 11:01:22 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x34so1049138ede.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=j3v7DktL3ddi9374noY82uKNTdAF/kxo3zK0ti9poTo=;
 b=ag7rpmGq64Dt2m4x/ymb15hq8v9NNthzmlkesTFljZKC6Ypood6gIx6dYZCWxeJP3k
 JCtG3cwF7IlErSUsSfhLXzB/rJffvX6r6t6axGZOErm8S+MWL2lVc9OpQUWVCLSWx6AC
 752064Wc2Ox33hA96YTm4ibav3fN/3yFjapfUYJMNLUuBkw7lh4uAQLtIY+blEBMMHzl
 ewj67LXPPOueqoE6OASpoHHRfaVTiiZjTaX6nX9EuLIrKyPNfGgPXzrG9ApNQf09bFje
 BW3hcNWGfbehsQYVacaD1UnbMVTWX9BL/5n5iSsz6JDG7Ub7H+rVc8tmswrWhVmGb+eM
 lxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j3v7DktL3ddi9374noY82uKNTdAF/kxo3zK0ti9poTo=;
 b=w145hHyUSkq+3L34HNDLOatpmKeuQCBdhZdJW/W6LiZGOtQlwSjrYkHxFTaUMvN/IV
 g7jGfzkZNOvSPmjDXP9u8V8RjEDJUJ28B4AhAkSIeCZ+Uj7S/KTGajjWY9jV6y1pjR3M
 1hH4h01bmpmuJPhaD5zRu4eb4mvEdGo/tXgtoI4JR882qFcNzhTyeXIHkumQ6xygqrCi
 Sh43XI5OyE5agsmmBbBmJo4Hf5mUSgMszR5FC63jBWdN8RVrCk2am32vZgfj82N5okOj
 mvw7XCkC7bF6UHs+k5wGRTkQfDOKCjLfBkCR5bmNELSakFUW3+9qL5sVcSS37fAbCTUM
 +zEw==
X-Gm-Message-State: AOAM530n088vsTlhpzPtcxtGnbUlasv8mPGx6KUy5p7anK59Rfz6kFvN
 pbIg9mHTWo9+JnZZeUIdL1wjt5rF9Y5zevvX38h4aQ==
X-Google-Smtp-Source: ABdhPJz9uTMpP8wIRwICJOsdbaUoqk6CQS0ySWvzyFknprjpuA3rI9gkHi+NCH4oiFpKv6T8LV0ikDt+M87WhwMLTY0=
X-Received: by 2002:aa7:d789:0:b0:418:673a:7f24 with SMTP id
 s9-20020aa7d789000000b00418673a7f24mr18134428edq.333.1647428481584; Wed, 16
 Mar 2022 04:01:21 -0700 (PDT)
MIME-Version: 1.0
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 16 Mar 2022 12:01:10 +0100
Message-ID: <CAN5uoS9F1cjN+WLks1S=GzA1SHw=o-ibFbu-VsUzJ4NydAkAdw@mail.gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 12/13] ARM: dts: stm32: enable optee
 firmware and SCMI support on STM32MP13
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

Hi Ahmad,

> Helo Gabriel,
>
> On 03.03.22 14:09, Gabriel FERNANDEZ wrote:
>>
>> On 2/25/22 16:13, Ahmad Fatoum wrote:
>>> Hello Gabriel,
>>>
>>> On 25.02.22 14:31, gabriel.fernandez@foss.st.com wrote:
>>>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>>> +    firmware {
>>>> +        optee {
>>>> +            method = "smc";
>>>> +            compatible = "linaro,optee-tz";
>>>> +        };
>>>> +
>>>> +        scmi: scmi {
>>>> +            compatible = "linaro,scmi-optee";
>>> This compatible doesn't seem to be documented upstream. I am looking at v5.17-rc5.
>>> Do you have a reference detailing the difference between this conduit and
>>> plain arm,scmi-smc (as used with TF-A on the STM32MP151).
>>>
>>> Cheers,
>>> Ahmad
>>
>> Hi
>>
>> Ahmad,
>>
>> it's on going.
>>
>> https://lore.kernel.org/linux-arm-kernel/20211029102118.GG6526@e120937-lin/T/#mf46c83f0aadce3061ee93fa22159405f38d881a0
>
> I've found that thread in the meantime and got some clarification on why a new
> transport for OP-TEE was added. One question I still have though is why make
> this transport the default for STM32MP13x instead of using SCMI over SMC like
> you do for STM32MP15x. OP-TEE could still be made to service SCMI over SMC
> and it would allow people employing TF-A as SCMI provider an easier migration
> to the newer SoC.
>

Just to rephrase a bit what's being said in the referred mail thread:
On STM32MP13x, there are SCMI messages that must be processed inside a
thread execution context in the SCMI server. There is no standard SMC
function ID defined that the SCMI/SMC transport could use for that
purpose. OP-TEE provides such a threaded context. Therefore STM32MP13x
explicitly expects SCMI services based on SCMI/OP-TEE transport, not
SCMI/SMC transport.

Best regards,
etienne

> Cheers,
> Ahmad

>
>>
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +            linaro,optee-channel-id = <0>;
>>> +            shmem = <&scmi_shm>;
>>> +
>>> +            scmi_clk: protocol@14 {
>>> +                reg = <0x14>;
>>> +                #clock-cells = <1>;
>>> +            };
>>> +
>>> +            scmi_reset: protocol@16 {
>>> +                reg = <0x16>;
>>> +                #reset-cells = <1>;
>>> +            };
>>> +        };
>>> +    };
>>>       clocks {
>>>           clk_axi: clk-axi {
>>>               #clock-cells = <0>;
>>
>


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
