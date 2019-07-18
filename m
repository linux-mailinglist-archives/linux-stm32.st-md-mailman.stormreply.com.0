Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C99FA6C90F
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2019 08:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A6C9C0CDD2
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2019 06:05:07 +0000 (UTC)
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5489C0CDCC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2019 06:05:05 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x6I64nYO007891
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 18 Jul 2019 15:04:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x6I64nYO007891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1563429890;
 bh=9Cn27QIZQfB3/PlsDEzrhs3gsGNmfjgopl2Ueaqh2co=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DZ3QsT76aj6vYbKEXrr2j5egWye+7CzEUgQsrfOWOKHmx7JvShI+lArzlcW+AOyvW
 wSnANMWV0XV6vrhCS54i04y7kxYcznx4J77KcLz+b+yAgJBWXHPYsfxZAUbkGlbIEg
 Wpy1jycQ9ihqjwaQ6+dRgXMvQVOVCKDbuVVeu8pezwhgRb0iPhW2HMmEJrXpN0Hwca
 Z9XpiacJPM0Xn6AZVGCdUw/RQ291pjY+J6nJm2TER9rzOusSlfNAz4EE6IWstB5/c9
 sipLWjExYxEma8+YyZTycddtWzAD1pkERquktIODyC0IbIeXj8FJ0WaNnwVYx3yTzq
 EiYfwG04kugtw==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id b200so5530195vkf.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2019 23:04:49 -0700 (PDT)
X-Gm-Message-State: APjAAAVOzkG2RQmFoUyS7zFcWj+26oZIrxFfNtkgNoGgFpaqOx36EWiZ
 9/VfXmfOSD981/fR9Kmp1oAh4zMDi1XxV/7bFeE=
X-Google-Smtp-Source: APXvYqzXwpNJxPAL3xak/xnvOG1FGRThsufi0IBo8anhshmeGUb3O1ZZmDqs4cK2QAroVJNrjr7kw7opeFsKmiXQ9mA=
X-Received: by 2002:a1f:a34c:: with SMTP id m73mr4593622vke.74.1563429888906; 
 Wed, 17 Jul 2019 23:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190710051320.8738-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190710051320.8738-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jul 2019 15:04:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFPLcVrF4PiirqTy3PjPh_BTWNMzdMiNFaen6g1ew+Mw@mail.gmail.com>
Message-ID: <CAK7LNAQFPLcVrF4PiirqTy3PjPh_BTWNMzdMiNFaen6g1ew+Mw@mail.gmail.com>
To: arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, soc@kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: stm32: use "depends on" instead of
	"if" after prompt
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

Hi Olof,



On Wed, Jul 10, 2019 at 2:15 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This appeared after the global fixups by commit e32465429490 ("ARM: use
> "depends on" for SoC configs instead of "if" after prompt"). Fix it now.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


I think probably this is too late,
but I am afraid you silently added a wrong Fixes tag.




commit 7e8a0f10899075ac2665c78c4e49dbaf32bf3346
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed Jul 10 14:13:20 2019 +0900

    ARM: stm32: use "depends on" instead of "if" after prompt

    This appeared after the global fixups by commit e32465429490 ("ARM: use
    "depends on" for SoC configs instead of "if" after prompt"). Fix it now.

    Link: https://lore.kernel.org/r/20190710051320.8738-1-yamada.masahiro@socionext.com
    Fixes: e32465429490 ("ARM: use "depends on" for SoC configs
instead of "if" after prompt")
    Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
    Signed-off-by: Olof Johansson <olof@lixom.net>





Commit e32465429490 converted all instances at that time.
This is absolutely fine.


Later, in 2018, commit 3ed71f8ad98a added a new instance.

So, if this Fixes is wanted, it should have been
Fixes: 3ed71f8ad98a ("ARM: stm32: prepare stm32 family to welcome
armv7 architecture")


This would confuse the stable kernel maintainers.



>  arch/arm/mach-stm32/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
> index 05d6b5aada80..57699bd8f107 100644
> --- a/arch/arm/mach-stm32/Kconfig
> +++ b/arch/arm/mach-stm32/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig ARCH_STM32
> -       bool "STMicroelectronics STM32 family" if ARM_SINGLE_ARMV7M || ARCH_MULTI_V7
> +       bool "STMicroelectronics STM32 family"
> +       depends on ARM_SINGLE_ARMV7M || ARCH_MULTI_V7
>         select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
>         select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
>         select ARM_GIC if ARCH_MULTI_V7
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
