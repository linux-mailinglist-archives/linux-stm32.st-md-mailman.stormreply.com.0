Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D51C95EA
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 18:05:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF6A3C3F95C;
	Thu,  7 May 2020 16:05:32 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EDADC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 16:05:28 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t7so2239904plr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=shAx5fmUY4GBiMpF4nsPgUiuKRCBDJJg9eU0A1S+7bw=;
 b=itgDhdC+fvDcYDxcSpsVDa/dn3YwaDgPOw5TBf2ASh/q13tAIoOMkUTP7ardWb7ke2
 uWM1TainBuc7kEjn+V8qCjH8VOEXPwAZ2aMwK38vB8wFjrk3/ckxg6LJLqZGZfCxTALI
 9sNb7i0tnAcnxI+bd7YhYOTQS/ngbI9eSkU2qpVM53Y+4Z8cVOc4aLHHox726QfhK0fZ
 RPRXLDH9pii+4mgH6S6AdfFeyXOzUy7+7laapFa2Ds349cD/MFiJzcQ8cmGyIm3MsWOA
 J/JIpGJmSF6WZCR3V2rWQegNIH6Em09FypboA5B+6Ibs4slYh/6ZkO+l2jYr+favPKJy
 DgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=shAx5fmUY4GBiMpF4nsPgUiuKRCBDJJg9eU0A1S+7bw=;
 b=pJvhMWh1a6yhlhaCFvZZDIYOy+C76YVLIN+KqSVMk4XbJQpEGNBf4TP+bBwVzKg5/t
 6QM6Oq5bBs2n1msodMbdYX/B2U2ovZLFxgSAWzzi9EJRt6sF6YWjl5ig1WoZp664+DnD
 R6dtzaIfwSf4v7yrWRJpvXEqwlz71L0zo51btAyH5Unqg+iuEo4Ub1/NGT/Uw8jxsIMA
 GS9BhIm7R0o+cN62Tf0AS2UOjDngtYwSBR03rXJ9g6E5epK8N2O4vGWYlS9vr1qovznG
 mzfSkAiSk3u0oalLp+b/d162XmT6hb5dYzwVtlWyQYnytqpVCGhT/R13vurPJw7iXk3y
 YBzw==
X-Gm-Message-State: AGi0PubTjuczj9Blbe9Hmei+FhjlJy8iVQH29UrorH696e68VsEwe3ed
 eqwP+R9aknp0YmdBcy4Evvd7
X-Google-Smtp-Source: APiQypJ3rnUlbjfGFLhJy9yib9DTFtLKFe6k/yM6zILzyCHII57dyUj5pBSBbGllSlAtiKjughxC9w==
X-Received: by 2002:a17:902:347:: with SMTP id
 65mr14179711pld.21.1588867527216; 
 Thu, 07 May 2020 09:05:27 -0700 (PDT)
Received: from ?IPv6:2409:4072:6e0f:c0c0:7d3e:c269:b7ed:651a?
 ([2409:4072:6e0f:c0c0:7d3e:c269:b7ed:651a])
 by smtp.gmail.com with ESMTPSA id d35sm3991469pgd.29.2020.05.07.09.05.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 09:05:26 -0700 (PDT)
Date: Thu, 07 May 2020 21:35:17 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <687cdc32-7486-1090-154b-58e711dd6a2a@denx.de>
References: <20200429163743.67854-1-marex@denx.de>
 <20200429163743.67854-12-marex@denx.de>
 <20200507152616.GB2019@Mani-XPS-13-9360>
 <687cdc32-7486-1090-154b-58e711dd6a2a@denx.de>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <80717706-6209-427D-B448-C99697490034@linaro.org>
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 12/12] ARM: dts: stm32: Add DTs for
	STM32MP15x variants of the DHCOR SOM and AV96
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



On 7 May 2020 9:03:08 PM IST, Marek Vasut <marex@denx.de> wrote:
>On 5/7/20 5:26 PM, Manivannan Sadhasivam wrote:
>
>Hi,
>
>[...]
>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index f43467b02bcd..b4a4d2b0f18e 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1029,6 +1029,9 @@ dtb-$(CONFIG_ARCH_STM32) += \
>>>  	stm32h743i-eval.dtb \
>>>  	stm32h743i-disco.dtb \
>>>  	stm32mp157a-avenger96.dtb \
>>> +	stm32mp151a-dhcor-avenger96.dtb \
>>> +	stm32mp153a-dhcor-avenger96.dtb \
>>> +	stm32mp157a-dhcor-avenger96.dtb \
>> 
>> I'm not really sure if keeping SoM name is a good practice here.
>Since the
>> board is sold as "Avenger96" alone, why do you want to prepend SoM
>name to it?
>> When you say, "stm32mp157a-avenger96.dtb" it obviously means that
>Avenger96
>> board uses the stm32mp157a SoC and that comes from SoM.
>
>That's because if you look at the other side of the AV96, you will
>notice there is this other piece of PCB on it, that's the DHCOR SoM.
>The
>SoM is soldered on the AV96 carrier board. And only on that SoM is the
>STM32MP15xx SoC.
>

Yeah I know but what I was saying is that it is not the usual convention to put SoM name in board DTS. The DTS should reflect the actual product name. Here, the SoC prefix is justified since they reflect the family/SoC name and used as a differentiation factor. But using SoM name seems redundant. 

You can use SoM name if there are chances where different family of SoM can be used on the base board, thereby making it as a differentiation factor. 

Thanks, 
Mani

>>>  	stm32mp157a-dk1.dtb \
>>>  	stm32mp157c-dhcom-pdk2.dtb \
>>>  	stm32mp157c-dk2.dtb \
>>> diff --git a/arch/arm/boot/dts/stm32mp151a-dhcor-avenger96.dts
>b/arch/arm/boot/dts/stm32mp151a-dhcor-avenger96.dts
>>> new file mode 100644
>>> index 000000000000..0f3875fbdd73
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/stm32mp151a-dhcor-avenger96.dts
>>> @@ -0,0 +1,9 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>> +/*
>>> + * Copyright (C) 2020 Marek Vasut <marex@denx.de>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "stm32mp151a-dhcor-som.dtsi"
>>> +#include "stm32mp15xa-dhcor-avenger96.dtsi"
>> 
>> [...]
>> 
>>> diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
>b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
>>> index 10f11ca53c7d..dc3bbd576756 100644
>>> --- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
>>> +++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
>>> @@ -1,421 +1,9 @@
>>>  // SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>>  /*
>>> - * Copyright (C) Linaro Ltd 2019 - All Rights Reserved
>>> - * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
>That's fixed in the other submission, sorry.

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
