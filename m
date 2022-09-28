Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCEA5ED5BF
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 09:12:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6631AC63328;
	Wed, 28 Sep 2022 07:12:51 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7607EC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 07:12:50 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id a14so13330357ljj.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 00:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=J7AHnurfwGRZ0ip8GkiH7mYVTuQZ+AW1ouNTkLIseFI=;
 b=bRxlKDNbfipIuNeXw4e/7aIUtlBCJlQ//t9YgZeP2E2OHcRVCfXLe7eAwKxCvvx90m
 PRc+Fs8PCIsxjk9hWQYuZv/PZWCKb9906yTYAPGjprdGNkKrRKTZKbzxsCocClcRhwUs
 Sx4D5YD0vD8aHCCxivN+rJCOs2m04rYyHo9LtYeAIcZrKHHCbRMtElFFsqMuY7VO4YoE
 tFGEyJHvtTe1oURW2umgZg5SFtMo8MpVOBMCjmcYIdc93jVZmFIo60n8qh2XOOvqb4Ba
 nujmHXXXWAILBW3RXa63pwf0Olgp3+KjxMHrcmRnRLkSyr3fOQ+6YfrM43nlDJYBOKk2
 5pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=J7AHnurfwGRZ0ip8GkiH7mYVTuQZ+AW1ouNTkLIseFI=;
 b=XzH9elEQAIJqy1NSRLZawglr9gNtp44USgH5ibKTaNAOI3wLgCWBQ5eLmuvfseXYDJ
 9VfXiZNdYzfDZwDf862977w9p/DWlEwWDJMr6wB6+vdkvprE3Mj5rHjnjLFJFjpBUryh
 UMRujoD7c7L2LdS8ocHp0Zq/OgyJWeun3nIsYVW7CdSPkJagiacb9l2KWmUAGiJwPkg5
 dAA3xBBs9uOa+zbgWDSgwYJ8H+TNeUbhVgF/kLdhmBwS1+owqbltaD4B3kxdx7fl1x62
 rMLxCiiPx0+zE4wQkDZzmH8XBZzi/mimeHpyqXLmfX/kQftU/n0+OpYPN4nY0JEhPu/d
 7QqQ==
X-Gm-Message-State: ACrzQf2kG6ZDcVrEARLA3s1XXRyHMVgRH3T+s6pVDJh2S2o79gCG15ZY
 pA+p1S4hNzSKZDmU2hHPMsmBGw==
X-Google-Smtp-Source: AMsMyM5c5bD3HKX4LBqKnBoCvSwHbUYROfgtxy9aXKlB/3kIJGYg18HrwZIG7jnwQ1ZZkS97KLCOIw==
X-Received: by 2002:a2e:bd0e:0:b0:261:e718:e902 with SMTP id
 n14-20020a2ebd0e000000b00261e718e902mr11824478ljq.435.1664349169860; 
 Wed, 28 Sep 2022 00:12:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 h2-20020a05651c124200b0026c18aa8587sm365898ljh.75.2022.09.28.00.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 00:12:49 -0700 (PDT)
Message-ID: <c54f15a6-b4e6-d512-654f-28819eeaab4c@linaro.org>
Date: Wed, 28 Sep 2022 09:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: linux-arm-kernel@lists.infradead.org, marex@denx.de
References: <20220926222003.527171-1-marex@denx.de>
 <166434910296.10148.2597210651020575227.b4-ty@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <166434910296.10148.2597210651020575227.b4-ty@linaro.org>
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: memory-controller: st,
 stm32: Fix st, fmc2_ebi-cs-write-address-setup-ns
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

On 28/09/2022 09:11, Krzysztof Kozlowski wrote:
> On Tue, 27 Sep 2022 00:20:03 +0200, Marek Vasut wrote:
>> The property st,fmc2_ebi-cs-write-address-setup-ns should really be
>> st,fmc2-ebi-cs-write-address-setup-ns (there is underscore _ between
>> fmc2 and ebi and there should be a dash - instead). This is a remnant
>> from conversion of old non-upstream bindings. Fix it.
>>
>>
> 
> Applied, thanks!
> 
> [1/1] dt-bindings: memory-controller: st,stm32: Fix st,fmc2_ebi-cs-write-address-setup-ns
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/587f9891ec9661e16df7e5268543416a7d8cb547

Just a note: it's late for me in the cycle to pick up patches. I applied
this but there is a change it will miss this merge window. If that
happens, I will keep it for next cycle (no need to resend).

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
