Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA08978E6DE
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Aug 2023 08:56:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 909F0C6B442;
	Thu, 31 Aug 2023 06:56:44 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63C00C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 13:42:31 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5694ee2d0edso2361705a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693402950; x=1694007750;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1U//L1yYopSVR/IwO4YF9QhC/v7CgleTXf+0yUtxKuQ=;
 b=cSjNtA79IsyxyA81efZY9B6qFAAMs1AeXyI/igrrcpg31RFMjxDScHY4LfFBjosgfe
 z3YNYvoGceefSwmB78fZZkVr92Yu8f31lpgZBzyAoacz19o0SiHDAecCB4YBEBU27jBc
 2iWNyzREdq/ttxQlOf+3GoYYTWSVD+k0/SUm/Mwr9XWWgiHjyR1ovB+SxCTaMfkWcGbe
 a+RV93AvUehrF5eyulD/JV1GYc94H3mju2V3CiXVSemEgQQXXpUTWYON4jIgHkcNAYL1
 mNB123wDSGGlIgWl6EEQrBZhjSulxm+awlE/BTbT2dTEFIizbNZTT6UN7lpsxNZrHDJI
 +Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693402950; x=1694007750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1U//L1yYopSVR/IwO4YF9QhC/v7CgleTXf+0yUtxKuQ=;
 b=aKz0NEBpP6AW3cpvbq0TcHNHt6lWb1oiZgjzLTqVRLmGjNp4VK9xaV71dNZZVQFp3F
 3TZvm5vsu3tI+4UsmL+2aQiFrsmFKdSy0lZpzJ3DPHY7GhTwhLHco/WRZSUjxpEjOf9q
 Ksvn0ICxdCRbagHDZFldjh+3SzO5IlajdxvjbCbXnwxklx93xUyufDWwSkr7j44QU3if
 piWzslUo5F8Q8cWVki/U3NpIUf5b2bheO0t58D+P8iKDJYmv5eF9gN8viCU09PJ5XjqS
 8IWZ6A0CldPOtNa+xaRzrKN3cJWDpmEU+sogoo6IWAktFDG/S/hF33LNz4rcI7sMQAU8
 RhPw==
X-Gm-Message-State: AOJu0YzhoDE3DAVrJlzb9nRDMJYDVR77IzU4V6wK0y2TLUhT91VwWJkr
 hTRO13gb/QJDw19urVn2LWhKaW/jawbuhFQ0Pec=
X-Google-Smtp-Source: AGHT+IFF6qejXwMgd2lTbgaipAHhyViqoDykWLhXtm7DRuhv1hMLDpuP0VgeHD5QF8vIB7MncYW1A4D2Z9Y2Xp3z7ls=
X-Received: by 2002:a17:90b:1a85:b0:268:5575:93d9 with SMTP id
 ng5-20020a17090b1a8500b00268557593d9mr1997265pjb.10.1693402949742; Wed, 30
 Aug 2023 06:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230830114335.106344-1-eagle.alexander923@gmail.com>
 <e2dc91a9-d027-dc69-14bf-3a1184045254@linaro.org>
 <f40497d1-3547-9434-459f-050f592937ca@linaro.org>
In-Reply-To: <f40497d1-3547-9434-459f-050f592937ca@linaro.org>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Wed, 30 Aug 2023 16:42:18 +0300
Message-ID: <CAP1tNvTvd5mZ1eWiMeck14b5KGyyXBNrEE=of0OKesbNKE_jqQ@mail.gmail.com>
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

Hello.

The initial thought in the file name was that the modules could be
equipped with a CPU
other than STM32MP151, i.e. 153 or 157. The development board, as far
i understand,
equipped with a STM32MP151 only, so can we leave the current name for
the module (15x)
as is and change it only in the file name (and in compatible property)
for the development
board only?

Thanks!

> On 30/08/2023 14:51, Krzysztof Kozlowski wrote:
> > On 30/08/2023 13:43, Alexander Shiyan wrote:
> >> Add support for the MyirTech MYD-YA15XC-T development board.
> >>
> >> General features:
> >>  - STM32MP151
> >>  - 256MB RAM
> >>  - 2xUSB HOST
> >>  - USB-C OTG
> >>  - Gigabit ethernet
> >>  - UART
> >>  - Boot from NAND, eMMC, SD
> >>
> >> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> >> ---
> >>  arch/arm/boot/dts/st/Makefile                 |   3 +-
> >>  .../boot/dts/st/stm32mp15x-myirtech-myc.dtsi  | 351 ++++++++++++++
> >>  .../boot/dts/st/stm32mp15x-myirtech-myd.dts   | 457 ++++++++++++++++++
>
> Also naming looks wrong. This is stm32mp151, not 15x.
>
> Best regards,
> Krzysztof
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
