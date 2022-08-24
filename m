Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1B5A02DD
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Aug 2022 22:36:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53816C6410E;
	Wed, 24 Aug 2022 20:36:36 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CCF1C640FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 20:36:34 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso1564211wma.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 13:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=PHwTuCnEL7EtB2rU0ZKm2AoGKO0cbH9wf0XuAB8In50=;
 b=jS0OlYQI0Zplep4Ed4lMnqtdkDh40PLTcf6EeIDIlwiNXwTOKErL+p8HbdM2fk5Ckn
 l5eZIkjVtiWgcadwvtz/U6auUIRNobBA97as2BuE8E0gG3ojYAXRpd3o3lx5cqJssTfs
 spVaPDijVyq6UD2hvgGdM3DE7RKbZjoWn04mzcKt/V5qVyFgBdJxwn4XRlKCa98OHIDO
 FMdRHHVnlNdO/fUO/r84C++gHF1WwO4J4tTiaOUbAzSsqRkU6nq6RRK450r6vNgEGR3J
 3smItmJjxekSn/7b+Nf1JAGA5h5jxbLZqk36Wo4QEX3OL2EPFHtBANMtpMVXUuPyheuw
 VR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=PHwTuCnEL7EtB2rU0ZKm2AoGKO0cbH9wf0XuAB8In50=;
 b=5mpJ6pnhpE4ReZRaqEbptkRm17vyzE62VzhCHuiMSYWvd6aDrGfLrvI0o5ULZ7JReM
 72Yss8IYVhWGGNDQSiPSxeXc68aESX85UIkpkBVMmCaRgazV5KpddcMqi+88C7D7XStU
 dGkQa5gR9KqShD4mrVE3BruI/s6MFl+NVh1L5jMGQumriqC56LLmrXOKgFJVhRAuuG4k
 kDkPNRGHYx1ZO2FS2fc9mZQ0F4OKqcXwxBHjM96eK7K2DdFalYLwC4IqmZLy8aGxaI1w
 RHcGVoRuvx5Xavb/nJ36h2+S9s+71w8RJ61D/NboeYgN9qYkSgAs9QAgT8lOfBQ/uGn4
 dzow==
X-Gm-Message-State: ACgBeo1hhecGVzlPzeF7jPVjKAcCipkCRqgbM+GXv7m2Hft/nYGsRdaM
 ChQCuJfYPfp2l0RuCMXJ3RQ=
X-Google-Smtp-Source: AA6agR7iDVcDClHA4R60UnKf6VHm8MI5AZ7TR4qlLMkKRcInxtkl24wT3rFQ9Rjrr/7DSPqxBkZPew==
X-Received: by 2002:a05:600c:3b92:b0:3a6:8d6:9a2f with SMTP id
 n18-20020a05600c3b9200b003a608d69a2fmr6342451wms.159.1661373393818; 
 Wed, 24 Aug 2022 13:36:33 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7aa2:100:8857:e17a:56:c2b2?
 (dynamic-2a01-0c22-7aa2-0100-8857-e17a-0056-c2b2.c22.pool.telefonica.de.
 [2a01:c22:7aa2:100:8857:e17a:56:c2b2])
 by smtp.googlemail.com with ESMTPSA id
 bh19-20020a05600c3d1300b003a54d610e5fsm3168381wmb.26.2022.08.24.13.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 13:36:33 -0700 (PDT)
Message-ID: <776ece87-e24c-bb19-e472-8a04d1cbbaa3@gmail.com>
Date: Wed, 24 Aug 2022 22:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
References: <72755b6b-f071-1c54-c2fd-5ea0376effe1@gmail.com>
 <20220823162259.36401af0@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20220823162259.36401af0@kernel.org>
Cc: Da Xue <da@lessconfused.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Qi Duan <qi.duan@amlogic.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: work around sporadic tx
	issue on link-up
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

On 24.08.2022 01:22, Jakub Kicinski wrote:
> On Sat, 20 Aug 2022 17:20:37 +0200 Heiner Kallweit wrote:
>> This is a follow-up to the discussion in [0]. It seems to me that
>> at least the IP version used on Amlogic SoC's sometimes has a problem
>> if register MAC_CTRL_REG is written whilst the chip is still processing
>> a previous write. But that's just a guess.
>> Adding a delay between two writes to this register helps, but we can
>> also simply omit the offending second write. This patch uses the second
>> approach and is based on a suggestion from Qi Duan.
>> Benefit of this approach is that we can save few register writes, also
>> on not affected chip versions.
>>
>> This patch doesn't apply cleanly before the commit marked as fixed.
>> There's nothing wrong with this commit.
> 
> I don't think this is right, please do your best to identify where
> the bug was actually introduced and put that in the Fixes tag.
> 
> IIRC this is not the first time you've made this choice so let's
> sort this out, we can bring it up with Greg if you would like,
> I don't see it clarified in the docs.
> 
> My understanding and experience doing backports for my employer is 
> that cutting off the Fixes tag at the place patch application fails 
> is very counter productive. Better to go too far back and let 
> the person maintaining the tree decide if the backport is needed.
> 
OK, I changed the Fixes tag accordingly and submitted a v2.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
