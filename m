Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 881CD232608
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jul 2020 22:16:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9146C36B29;
	Wed, 29 Jul 2020 20:16:43 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9862C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 20:16:40 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id bo3so3011336ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 13:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G9J40aLhPUBHarAksyHrJM+WbtR3gRhMvbXXJTyIEsw=;
 b=igO+2qg5PpN04+T4eV2X6nZKqGOqZRAdV2CCVGPzvuIOGs7+ykgSGr4zJWzbwys7Zy
 VnDZA3gmVvqvA0FuNMfQEiZM6vMx8ikxnReYamCvMzngBMMYUPBZ15cWFPTYUDT83pNG
 slJaPaDyxmNapA4nhhY/TlxMyKg4bSF9F+yhXYYrvQ+EjtaXnuV6CHgR99hdn7sMNk1C
 zVHyEz9HWXmBRJi29wdcV/A6n8EtvDRZ7RHKchf4S+mAqbo9DU27zio2RqDYFPEeExbo
 kghcMILRS34OKYZyqUopD59DSR84K3BgvlPCeO/Eg7tyJIKcYgccoUQ/25YECUkg6TRC
 Y2UA==
X-Gm-Message-State: AOAM533mNohNtSk815Lj6XhhqWLlseroiMvVkzpqC6w6q+YyL1mq9luT
 ftOOAswcqWBdaZMnXGdsa4Y=
X-Google-Smtp-Source: ABdhPJz8NSZ1YgCRCp5BY64q7jD+PPCB1uyy1HQKw9M5f39sg32SzCcRfdGo1BmuaDhYo5fGcHeBew==
X-Received: by 2002:a17:906:78e:: with SMTP id l14mr80328ejc.67.1596053799753; 
 Wed, 29 Jul 2020 13:16:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id a23sm2669500eju.68.2020.07.29.13.16.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 13:16:39 -0700 (PDT)
Date: Wed, 29 Jul 2020 22:16:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Message-ID: <20200729201635.GB26917@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-2-krzk@kernel.org>
 <159605176358.1360974.7715120460121088439@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159605176358.1360974.7715120460121088439@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>,
 Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Lihua Yao <ylhuajnu@outlook.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Vincent Sanders <vince@simtec.co.uk>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 1/7] clk: samsung: s3c64xx: Declare
 s3c64xx_clk_init() in shared header
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

On Wed, Jul 29, 2020 at 12:42:43PM -0700, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2020-07-29 09:09:36)
> > diff --git a/include/linux/clk/samsung.h b/include/linux/clk/samsung.h
> > new file mode 100644
> > index 000000000000..b6b253c46c22
> > --- /dev/null
> > +++ b/include/linux/clk/samsung.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2020 Krzysztof Kozlowski <krzk@kernel.org>
> > + */
> > +
> > +#ifndef __LINUX_CLK_SAMSUNG_H_
> > +#define __LINUX_CLK_SAMSUNG_H_
> > +
> > +#ifdef CONFIG_ARCH_S3C64XX
> > +void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
> 
> Don't use __init in header files. It doesn't do anything.
> 
> > +                            unsigned long xusbxti_f, bool s3c6400,
> > +                            void __iomem *base);
> > +#else
> > +static inline void __init s3c64xx_clk_init(struct device_node *np,
> 
> Forward declare struct device_node;
> 
> > +                                          unsigned long xtal_f,
> > +                                          unsigned long xusbxti_f,
> > +                                          bool s3c6400,
> > +                                          void __iomem *base) { }
> 
> Include <linux/compiler.h> (or compiler_types.h) for __iomem define
> please.

Thanks for the feedback. I'll send v2.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
