Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6DFB9DE91
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 09:48:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B07AC36B2D;
	Thu, 25 Sep 2025 07:48:34 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54D11C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 07:48:32 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-583a520bd81so334884137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 00:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758786511; x=1759391311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fvGyyGJ8hFx3nYrMkZDfGE5Winq5taN5wWeFI0QZNc=;
 b=upDS7/ZC00/zfzTf4TcLj9R4ten3kXpuSDVyr0nFlX4LXuGZoEZ9ZGhU9WhoXgQryg
 0btVtUaf2I4p1/HAWIxSWxiHGAyMJm76NVUYxcMSWnDHKL4UmvfRQF9B3ru9W4a16zfY
 QWud/saK/lHNxhbD8mEdTThz3UYYrFE97M0HLV4uWIKPWQo/2MDtLJRLjHVpNilKE99N
 zotdzwMu1tpZZQq9sBk7d3ZFr2bDg44QPekFYm2zRjWkkadQhWs9lSeMBw8+D7YkbZQ3
 JHb92mwBwjA1ldV2YulX+XRP6Dz30Qo7scB/j9kX63g2WPPMbSC63/lE+qd03pGGP+Qs
 BzJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVJNK1zdXjeyMP0SprWp5aPDhk90gbMELswo12qMBLMaXvo3PXw18Rmj3GALBkZR+SqrX18AwsKRhfSw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzi/tez/mmubNe+GsFcLlcV1f7AXX1WZFZqVnJ3dJ/jAOkgH577
 hEk0xENMeOhviiZsgSOZ0o5/XIa24pCX/qpz1RxQmAxL+tzdIxWJgvAg5Pt71LkY
X-Gm-Gg: ASbGnctwUrC86+esMDfVCneVcVKbMvOiAmwrP8j/8GeCg8tqd/Fh5joAqVn//YqKxEJ
 4Mi2mHtadSPjkx8a6/oxeAIZyJasJY/9kHORsZpK+/zuTgXTK8Hz4OSOdvyg1z6ADaTPqIRDtdB
 X1W7krDW5nhbfEd6OmqZS6uV/C00IODT8729PPSAreXMwcmFf2mPYJwIxTHMqaS3UrlG80DsCIX
 5ITNQRvTJ4oEG3X3Ta6FYZt42HqyWLD5WUgSUiUKrUaO0NSBGDO8ancFKVY4gHqbwYkT58Pl7S+
 i71RO+8z/Y9kHupZ+RPHJMA9IcCLhnk43z1YyRWKv5RMtthFb3r/oZ02bgBeJvNkrL0guQ+T2pt
 Ca+BFcMhbvpxZDvRwpSIeYBtoQHC8yH0aWQllwBkORRPrDGJ4AV66sLDtYH9wA6lWauT8dZo=
X-Google-Smtp-Source: AGHT+IFL4vptvi3Z7LN3qMU2b0ZdjpLLkwdEYCtN1yIHlLiQYXNHOJYjrSUhhOvLt9TMNec38eMifw==
X-Received: by 2002:a05:6102:41a4:b0:524:bee7:aeb7 with SMTP id
 ada2fe7eead31-5acc67090dfmr1026561137.3.1758786510896; 
 Thu, 25 Sep 2025 00:48:30 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ae3182b293sm401549137.6.2025.09.25.00.48.29
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 00:48:30 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-55784771e9dso400365137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 00:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXwuMXT0qRQyvFrd1V/JOTVm/ybyN7cCJtYYXsyA7cFzyFX0UInr1mbHOZkOrXQ+psYonvOVo6B3YOEIg==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:510d:b0:529:fc9e:84a0 with SMTP id
 ada2fe7eead31-5acd36bc5d5mr955558137.32.1758786509499; Thu, 25 Sep 2025
 00:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 09:48:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
X-Gm-Features: AS18NWAlEwAE5FC0AW6Wq0ip31mrrj6gmcRezsp6GMYcQa-YSc4N16xdaxhcVw8
Message-ID: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, imx@lists.linux.dev,
 Tomer Maimon <tmaimon77@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 James Cowgill <james.cowgill@blaize.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, openbmc@lists.ozlabs.org,
 Lee Jones <lee@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-gpio@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>,
 Benjamin Fair <benjaminfair@google.com>, Yang Shen <shenyang39@huawei.com>,
 Scott Branden <sbranden@broadcom.com>, Neil Jones <neil.jones@blaize.com>,
 linux-unisoc@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matt Redfearn <matt.redfearn@blaize.com>, Imre Kaloz <kaloz@openwrt.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/3] pinctrl: use more common syntax for
	compound literals
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

Hi Bartosz,

On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.

Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
use more common syntax for compound literals") in pinctrl/for-next

> Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

Looks like you (slightly) missed your target. The correct link is:

    Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
