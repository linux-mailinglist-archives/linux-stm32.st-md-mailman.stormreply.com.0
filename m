Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF706C43B6
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Mar 2023 07:58:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5787C6A60A;
	Wed, 22 Mar 2023 06:58:22 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1241AC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 23:46:31 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id k2so14220097pll.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 16:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1679355989;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=CVD5kdtXy54YH3zU4G6cezFVCE0kWaOWnyh3a3H/fVw=;
 b=gqS4hwId4OLnZEQgJI+kyIQkdjmZZrN+nyj53I24mqFbKwumRa3syzV+0mkcoQUlbp
 I3AgRwMOV5tpdFgxUwMOdyobSn6YGJLq5ce4Okpmp1xF8WMyk+AYS/fECsmmnrjwBbvh
 m416ye8JJBLiaMGKdPSU4vq6gcd8bwzfYtt4uBxxudYPXhLppUa4BnHpOAHtMLbQfY1m
 MgvnWpRfkoiw5QiNdjNC8e97mTNXbNTRxWG+QQNHRgAgPLzHdXjluPpcHMXjwu63j5tq
 +AkQmONBFJpyV0p6OQzwTmHpFlFVOZSZARJD9iWGVFgf52pT57vGrjmsDw1ywIryYuNH
 Cqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679355989;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CVD5kdtXy54YH3zU4G6cezFVCE0kWaOWnyh3a3H/fVw=;
 b=tHjX6x86Dxr1BKkYQ01kFyx+NbPILwt/Uw08wMCpjLEUlXwhGljX5AUN+juVkLcSHD
 ddQbNMQZ63Xyjn1Qj7m+3WagUFImMBdWixG+ZkW2iZa2aO/phYVymsYUteKdWfj54lwz
 azzIItd7ZaX2LIDmc+HVbE/s7nNm7AQMxqUKQLrBdLb1tPKkkhXqpnn8cQfiZbAPyyNL
 E27fqqyfMsiHb8lwzN/yUQgdAOqrP947guWJnPXCKK1obYdTP7areg0IxJ6HizSCOOS6
 NyUos9FfI4sETAGcTCwuzxk8AMHCFvL0DlDUoPkv/CC55ulquXIfdHq3yeYC8Djlf8IH
 34Jw==
X-Gm-Message-State: AO0yUKX7yyoeH0Uju0PenHhD65SQjurzEz09U1Bn45VGnoFQPoBic4sD
 qiGpept2w/WAfBJhEHnkichy4Q==
X-Google-Smtp-Source: AK7set+Eo6dVqOrcG8rwMRvHa6vfuVju4SycRcGmgII+64sM2O1goAy6bcstJI4WTVXmjXHmb/WVRA==
X-Received: by 2002:a17:90b:1e43:b0:23f:9fac:6b31 with SMTP id
 pi3-20020a17090b1e4300b0023f9fac6b31mr367842pjb.25.1679355989349; 
 Mon, 20 Mar 2023 16:46:29 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 30-20020a630c5e000000b00502fd141ffbsm6756689pgm.49.2023.03.20.16.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 16:46:28 -0700 (PDT)
Date: Mon, 20 Mar 2023 16:46:28 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Mar 2023 16:45:32 PDT (-0700)
In-Reply-To: <Y+vxw28NWPfaW7ql@spud>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-49aaa4a3-0280-4401-ba33-7fe2f3b79534@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-Mailman-Approved-At: Wed, 22 Mar 2023 06:58:20 +0000
Cc: kernel@esmil.dk, edumazet@google.com, sagar.kadam@sifive.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 yanhong.wang@starfivetech.com, lee@kernel.org, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, richardcochran@gmail.com, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 cristian.ciocaltea@collabora.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH 01/12] dt-bindings: riscv: sifive-ccache:
	Add compatible for StarFive JH7100 SoC
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

On Tue, 14 Feb 2023 12:40:35 PST (-0800), Conor Dooley wrote:
> Hey all,
>
> On Sat, Feb 11, 2023 at 05:18:10AM +0200, Cristian Ciocaltea wrote:
>> Document the compatible for the SiFive Composable Cache Controller found
>> on the StarFive JH7100 SoC.
>> 
>> This also requires extending the 'reg' property to handle distinct
>> ranges, as specified via 'reg-names'.
>> 
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  .../bindings/riscv/sifive,ccache0.yaml        | 28 ++++++++++++++++++-
>>  1 file changed, 27 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
>> index 31d20efaa6d3..2b864b2f12c9 100644
>> --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
>> @@ -25,6 +25,7 @@ select:
>>            - sifive,ccache0
>>            - sifive,fu540-c000-ccache
>>            - sifive,fu740-c000-ccache
>> +          - starfive,jh7100-ccache
>>  
>>    required:
>>      - compatible
>> @@ -37,6 +38,7 @@ properties:
>>                - sifive,ccache0
>>                - sifive,fu540-c000-ccache
>>                - sifive,fu740-c000-ccache
>> +              - starfive,jh7100-ccache
>>            - const: cache
>>        - items:
>>            - const: starfive,jh7110-ccache
>> @@ -70,7 +72,13 @@ properties:
>>        - description: DirFail interrupt
>>  
>>    reg:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: control
>> +      - const: sideband
>
> So why is this called "sideband"?
> In the docs for the JH7100 it is called LIM & it's called LIM in our
> docs for the PolarFire SoC (at the same address btw) and we run the HSS

IIRC it's both: "LIM" is the memory, "sideband" is the port.  I can't 
find any proper documentation of "sideband" outside of DT and errata, 
but there's a hanful of references to it in the bootloader for the 
fu540: 
<https://github.com/sifive/freedom-u540-c000-bootloader/search?q=sideband>.

It's not really clear which is more correct here: sideband accesses are 
only useful when the cache is configured as an LIM, at least for general 
software.  IIRC the accesses to the LIM only go through the sideband 
port for the E core, but I might be wrong about that.

> out of it! LIM being "loosely integrated memory", which by the limit
> hits on Google may be a SiFive-ism?

Yep: TIM is the SiFive version of Arm's TCM (tightly coupled memory), 
and LIM is the flavor that's farther away (L2 instead of L1).

> I'm not really sure if adding it as a "reg" section is the right thing
> to do as it's not "just" a register bank.
> Perhaps Rob/Krzysztof have a take on that one?
>
>>  
>>    next-level-cache: true
>>  
>> @@ -89,6 +97,7 @@ allOf:
>>            contains:
>>              enum:
>>                - sifive,fu740-c000-ccache
>> +              - starfive,jh7100-ccache
>>                - starfive,jh7110-ccache
>>                - microchip,mpfs-ccache
>>  
>> @@ -106,12 +115,29 @@ allOf:
>>              Must contain entries for DirError, DataError and DataFail signals.
>>            maxItems: 3
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: starfive,jh7100-ccache
>> +
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 2
>> +
>> +    else:
>> +      properties:
>> +        reg:
>> +          maxItems: 1
>> +
>>    - if:
>>        properties:
>>          compatible:
>>            contains:
>>              enum:
>>                - sifive,fu740-c000-ccache
>> +              - starfive,jh7100-ccache
>>                - starfive,jh7110-ccache
>>  
>>      then:
>> -- 
>> 2.39.1
>> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
