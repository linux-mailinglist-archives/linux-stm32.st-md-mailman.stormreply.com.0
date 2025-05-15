Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D756CAB7D54
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 07:53:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84FE2C7A843;
	Thu, 15 May 2025 05:53:44 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00706C78F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 05:53:42 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-4def152384eso179951137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 22:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747288419; x=1747893219;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPyG0mlit4Fqvc3ieiHFbClT0DklwqbFDL/14cm9a+o=;
 b=XQ/6K0Wf/20G4wzkHT4PufmvN49acyB+s1LoFqgQGB6r42d2y4PEsZAFV9IaoGl73e
 nEJhCdaWOkeFMW8gfO7REc/V+YYk1wJNSMfZIURjTFX+mtOZAQ0fWybOnsdnRn3ZNd6x
 Y13CGstg5Gna7JKb6XFOVMNT8soS4/h3fHkfC9Te7uEDuWocMEERthwGjNqNuNYRUeNO
 cqjm5QosxOojTBWWgSQdCo11WaGNkNosU5eX4T52TelMJgOGnI+Dbs8bY0I523AZyaZ8
 ghtmQqyqDz8r7fzlgUBzvxcld7WnB0wXMLVrutkSs3mIu52SFQNrEjtZXx6DgzYc6MVs
 Kgbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvloqnpPDvFX9QWlTtpvEGBwvOBeIuXY5Xplpr4vs0ckS5wYJyNaBPluhHk1ul5SLVt8tmXHRmwb+Tlg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5v1f5SY5zNIGOiRzoxYsbwc4xBJPmJIqEssrvtMR+PvsoD7QE
 8GAdLyh4BeDxrfzbmwNPt0Cdry+sz5RPN0CjoCOupLtk7ztqTrJH4hyqqYOf
X-Gm-Gg: ASbGncuSiAKJ5aWeb4SUJukPBVjKuSfiLx3OJC0wW/wJIQSFXZeGtRLH24XzFeZa58q
 jZOqUIej4SLfpB+Bj3R5whOY7OCALmhnuKTNc2qiSKkRTK+eiPBGmCbEVLB9sjBsqT251+lveK9
 n3KoK/C8THkFW1QzYzhByU0An0LUFcJbYZrnGWb7B2c9uIhNyZigBzuPawJo6uSym778gHD71DC
 bc6a5u1kmMmv+C7IgRpadZIRWeZIFv9wSiBSH44mLFFOT1zfm/JaJe3PEZbSvVC+mldV+Me7iaV
 +ksX1e7KGdAQFFMTce30EOmr/k4o4o1wf7rCG9o1c/WrZGRciAVNkhc9soWa2BvbDRVXgcuohwE
 MCndBNuxtmOMrug==
X-Google-Smtp-Source: AGHT+IFHuoZYEUttnB+xZIizbMFNIRDzvBwP+KZruyrPJI3l48XkJh2NSTkjcaQ9v4y1KhAk6VCg8A==
X-Received: by 2002:a05:6102:b0c:b0:4df:8259:eab with SMTP id
 ada2fe7eead31-4df825910c4mr4581056137.19.1747288418861; 
 Wed, 14 May 2025 22:53:38 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4deb203c2f9sm9331312137.29.2025.05.14.22.53.37
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 22:53:37 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-879edc092e7so131310241.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 22:53:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVImnjTIw1S/ocyqoUQxBedyYW2XPac7mCDTIWZ9gg4RXuzQ5CP65/jHVq+iWMx2A2wrWb6Thjk9TCuQA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:3e0b:b0:4b6:d108:cac1 with SMTP id
 ada2fe7eead31-4df7dcb5c78mr6484774137.9.1747288417074; Wed, 14 May 2025
 22:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <202505151255.rCHp8Bvu-lkp@intel.com>
In-Reply-To: <202505151255.rCHp8Bvu-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 May 2025 07:53:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
X-Gm-Features: AX0GCFvo3GnsTZII4bhG8cXLylyB93OgSRrkVG13kj0dt4dQMBXBbYjIu4GDk6M
Message-ID: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 llvm@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [Linux-stm32] [PATCH v3 2/2] clocksource/drivers/renesas-ostm:
 Unconditionally enable reprobe support
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

On Thu, 15 May 2025 at 07:04, kernel test robot <lkp@intel.com> wrote:
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on tip/timers/core]
> [also build test WARNING on robh/for-next linus/master v6.15-rc6 next-20250514]
> [cannot apply to daniel-lezcano/clockevents/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
> base:   tip/timers/core
> patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
> config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable 'ostm_of_table' [-Wunused-const-variable]
>      235 | static const struct of_device_id ostm_of_table[] = {
>          |                                  ^~~~~~~~~~~~~
>    1 warning generated.
>
>
> vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c
>
> 3a3e9f23c2cae9 Biju Das 2021-11-12  234
> 3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_id ostm_of_table[] = {
> 3a3e9f23c2cae9 Biju Das 2021-11-12  236         { .compatible = "renesas,ostm", },
> 3a3e9f23c2cae9 Biju Das 2021-11-12  237         { /* sentinel */ }
> 3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
> 3a3e9f23c2cae9 Biju Das 2021-11-12  239

The table is unused if CONFIG_OF=n due to

                .of_match_table = of_match_ptr(ostm_of_table),

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
