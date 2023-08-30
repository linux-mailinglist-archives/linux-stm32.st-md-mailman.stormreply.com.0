Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E862278E6DF
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Aug 2023 08:56:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DB6CC6B44B;
	Thu, 31 Aug 2023 06:56:44 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6788DC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 14:30:26 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-271b0a8e7ecso1195060a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 07:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693405825; x=1694010625;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LTBF5RZjge1RM0OTnXY7rRonWIcAk181t3jjXQW2nOI=;
 b=XINo55Au9gJEWxRBWn4wJ7MOJeqfeL3GqvI13rmRPtuYlfnnUCz8SLXtCe9OKOUVrz
 yNG9DZgByNKj2X7O90Qa+zT5UQ+Dbp9Wam6BpNVRm5FLp2dwUxmYL191QKn5ic9vA21e
 UEMIbrVeR1hXOmqp7xOo6nlgLNQc18j3m9KEhAbzeJ0yzMfwxoDmcmtm7XOvb0/eh/sI
 9WfA6OQHg7QAxt5FzemgmQafu2EwbBn0LLotx7NtWdfhuCpSeZvqVP2PFTEB2/QOlo0X
 ga/lwLh9lU5sncubgV/WKy4SEipfW/D0qfkM76EaWG85Hwphq/T4w/eGVxN2qTWkK8zN
 BgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693405825; x=1694010625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LTBF5RZjge1RM0OTnXY7rRonWIcAk181t3jjXQW2nOI=;
 b=ewAJDFrdOqJxmTVKRU3WVwF5bX4ejUv9Mo4DZWvUTPfinbYrrwsXHthLKpIvOpYFqi
 NmF2JJJYGuSnpF3+vWov7I3v9LUUHhvPXpXyqq0ZiKstpwmMmiq+4h6nwnOTrAv8D5Ac
 /IEgiwwCsUPl24Z+SSuiIcQpxloeUqYArxOgIVPq4nHKqH6F1yF+TVxCc7jzDM66KQJW
 wyAYembgP5gY/lM1S4pHO/U3ESugkX0Tl70z4LokyBsKNK28RpMj1m5ALFRU/TZ1zBUA
 egSpj+/oSb8sWobS6PZBkB602hjGQs9RyKIdgB9VzQLHx3MCSyG7/ajaSFX+EgXhse4Y
 2L7w==
X-Gm-Message-State: AOJu0YzmCexohuJhEr23FPSXg4qM9hSUGxzB88N2KkBR+KDivpHeo4A+
 Xahs+QHNNtEB3Ke1G7lkT8kaYZe9ck7pPDNkDmo=
X-Google-Smtp-Source: AGHT+IFwl4tlt03Cw/dP5WiUwCM0dpOdbmqnWRTX3UBBvi7P78wJTiQTlZj48ujsq28DHFgGL3hbwkWbbUCOVCMuPjc=
X-Received: by 2002:a17:90a:5216:b0:268:5558:de4c with SMTP id
 v22-20020a17090a521600b002685558de4cmr2256076pjh.38.1693405824745; Wed, 30
 Aug 2023 07:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230830114335.106344-1-eagle.alexander923@gmail.com>
 <e2dc91a9-d027-dc69-14bf-3a1184045254@linaro.org>
 <f40497d1-3547-9434-459f-050f592937ca@linaro.org>
 <CAP1tNvTvd5mZ1eWiMeck14b5KGyyXBNrEE=of0OKesbNKE_jqQ@mail.gmail.com>
 <38cd46c1-d0e2-e27d-f872-87bfee9058bb@linaro.org>
In-Reply-To: <38cd46c1-d0e2-e27d-f872-87bfee9058bb@linaro.org>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Wed, 30 Aug 2023 17:30:13 +0300
Message-ID: <CAP1tNvT5_iZdxHiqxdnyBFoCp3jQTMoJk+iUF9D2JJk54CNPLQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Thu, 31 Aug 2023 06:56:43 +0000
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add MyirTech
 MYD-YA15XC-T development board support
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

As far as I understand, the CPU type is an option when ordering.
Here's what it says on the manufacturer's website:
CPU: STMicroelectronics STM32MP151AAC3 microprocessor
(STM32MP153AAC3 and STM32MP157AAC3 are compatible and can be customized).
It's not a problem for me to make one type of CPU in the bindings,
I just wanted the bindings file to be more flexible.
#include "stm32mp151.dtsi" in this case we can transfer to MYD,
as we don't really need MYC to be compiled separately.

> On 30/08/2023 15:42, Alexander Shiyan wrote:
> > The initial thought in the file name was that the modules could be
> > equipped with a CPU
> > other than STM32MP151, i.e. 153 or 157. The development board, as far
> > i understand,
> > equipped with a STM32MP151 only, so can we leave the current name for
> > the module (15x)
> > as is and change it only in the file name (and in compatible property)
> > for the development
> > board only?
>
> Depends. I do not see SoM here. You called it "MYIR MYC-YA15XC-T", so it
> looks like end product for me. Can the same product have different SoC
> module? How would your DTSI look like? You include there 151.dtsi, so it
> could not have...
>
> Yes, you also need to adjust compatibles to reflect real names, not
> wildcards.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
