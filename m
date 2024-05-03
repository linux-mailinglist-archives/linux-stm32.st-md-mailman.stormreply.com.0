Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5A8BA8EB
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 10:40:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A436C712A2;
	Fri,  3 May 2024 08:40:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81DE7C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 08:39:59 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51aa6a8e49aso10875030e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 May 2024 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714725599; x=1715330399;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xd2nsty2WG6SHHF8+nkpeQv9fDcTG+0JYjbHe+PLVZg=;
 b=CaclV+lxYipW7VHOXPlXwoHcNkh3z3VvUDLoJTrnrn2D3Hv6dHZWj99mGWBM47sVkp
 mh70H8by7pXlCzrt5lw2KWQmS1QagqCRcphQOUM/sHTlPpJqDPuwWlKtWWTy7KD5HeQM
 Jo+0AuNf+eDJPlCZFaz2yvnkWK2KfFUpUrIamI9eDHMBD3rJZc0Z9RrCPe5/Fb49yVDV
 fXJ3DPgHucXHtAbqfYAg6gl6IrnPA+6cPsHEslflrmu6pkkTLvcAp0hKhnGoltfx0E5W
 WMzZ7uWfjY/f3vLvlI4V4EdVtXZhTGjwAt9CV0bwqlYWOwvfTvCXoL7nwsCMF8gywi/V
 MFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714725599; x=1715330399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xd2nsty2WG6SHHF8+nkpeQv9fDcTG+0JYjbHe+PLVZg=;
 b=R2dtWnnbS06knNyLYKkB4owEu59EdQu+2B7F1Bsfa3+PENQlMq1ogzEjPRnZAQyaAW
 5J3pDBQyVmtLuD2+aWpsqtL1orY82JGLXyiF0q1Pzpe85rIr8UInCuoKR97uzf0qEzxt
 QqSYY9eEOBnr9FbcnBhwRaEXI3X+Zcy3ULMPLRzEVGyHihGzY/mM20Wex70wR0IZya13
 U7lWQLOfGhwPHgC8kkwZfJ7uA9xgMna01/9q3bCcuoxp4ZZPbanJIHHFOgW/Fr8g6/TM
 KAs7ZfmYMDGORvwM2yBmSsQJp+ySalG7gd5ooN/L3zY3MR+dFcfUCeI4bZwUwh286rDs
 Ewng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUilV9Qa/ygRKKagtyL8TeuAHpajPAkxNqLbd3LZd9cKYKV2dGmegaDFU2got2ABk7+EqLg/7dr2V5PCixcTDOhlezViQdaDyrHd7rK79DfFiPMrXs8EAoM
X-Gm-Message-State: AOJu0YwjWGHeWK8GAiwKQsbEY79O7x0n6KIXX3D+wTDLfAwEKctPRSzy
 K3Ays7c6xt37YTC6WNQMl1u+Hdv+b4W+Kf0PVx4XkZQGoQlTKP3w9rDFb6QQA/0=
X-Google-Smtp-Source: AGHT+IF4QKcb/sXAo8+X01dOQnrnNqk2SSFq/L9I8igfxBKKMdF/CsCxYt2AjVAF4ukP/fC/AnH4MA==
X-Received: by 2002:ac2:58d9:0:b0:51d:bbb:7a4e with SMTP id
 u25-20020ac258d9000000b0051d0bbb7a4emr1341798lfo.24.1714725598711; 
 Fri, 03 May 2024 01:39:58 -0700 (PDT)
Received: from [192.168.1.119] ([37.251.223.213])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b004186f979543sm8674790wms.33.2024.05.03.01.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 01:39:53 -0700 (PDT)
Message-ID: <7f5e3ab6-515c-4943-8678-03232fd9aed5@linaro.org>
Date: Fri, 3 May 2024 09:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
 <a2886f72-210e-41a1-aae0-c079a4d11396@linaro.org>
 <0af10387-ddfb-47b0-b59e-eeba1644be1c@kernel.org>
 <20240503082444.GJ1227636@google.com>
 <72f94454-867f-4a6c-90c8-134db2ce150e@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <72f94454-867f-4a6c-90c8-134db2ce150e@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: Use full path to other
	schemas
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



On 5/3/24 09:31, Krzysztof Kozlowski wrote:
> On 03/05/2024 10:24, Lee Jones wrote:
>> On Fri, 03 May 2024, Krzysztof Kozlowski wrote:
>>
>>> On 03/05/2024 10:08, Tudor Ambarus wrote:
>>>>
>>>>
>>>> On 5/3/24 08:21, Krzysztof Kozlowski wrote:
>>>>>  .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
>>>>>  .../bindings/mfd/samsung,s2mps11.yaml         | 12 ++---
>>>>>  .../bindings/mfd/samsung,s5m8767.yaml         |  4 +-
>>>>
>>>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>
>>> So this should be Ack. You cannot review part of the patch ("I have
>>> carried out a technical review of this patch...").
>>> https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/process/submitting-patches.rst
>>
>> Reviewed-by is totally appropriate here.
> 
> Submitting patches is clear on that:
> "A Reviewed-by tag is a statement of opinion that the patch is an"
> Not "the patch or part of patch"
> 
> And ack:
> " It is a record that the acker has at least reviewed the patch ....
> Acked-by: does not necessarily indicate acknowledgement of the entire
> patch."
> 
> So no, reviewing part of the patch means you Ack it. Especially that in
> git log the Rb tag will suggest entire patch was reviewed, while it was
> not true. Review of 80% of patch did not happen.

Thanks, Krzysztof, I'll keep in mind next time. I now confirm I went
through all the substitutions and they look good to me. R-b now applies
to all the changes.

ta
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
