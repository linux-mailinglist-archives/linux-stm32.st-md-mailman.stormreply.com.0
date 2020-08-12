Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1E242748
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Aug 2020 11:15:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3976FC36B26;
	Wed, 12 Aug 2020 09:15:06 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02053C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 09:15:03 +0000 (UTC)
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M597q-1k6tJC49jQ-0018v2 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 11:15:03 +0200
Received: by mail-qv1-f50.google.com with SMTP id j10so671105qvo.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 02:15:02 -0700 (PDT)
X-Gm-Message-State: AOAM530XXLKlddm3SicoomStWIQDikqi40xNVAZ3vo0Y5wAxEQugBQ2p
 RcL06pGgYpqP3gp75DlKvUfkfnLpQ7J8kxoAzv8=
X-Google-Smtp-Source: ABdhPJx0VdO25VsXrKJTGh++kO4RzTD7ABEGX3vxwAEv4hRe86n9s2x2EuFs5/Fm/ZiIRZ9shvLmiOvKZowrNIwmt2A=
X-Received: by 2002:ad4:44e5:: with SMTP id p5mr5592821qvt.197.1597223701843; 
 Wed, 12 Aug 2020 02:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
In-Reply-To: <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 12 Aug 2020 11:14:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
Message-ID: <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
X-Provags-ID: V03:K1:TFGSOq4hGDUdDqPmj86WASWtUsTXQqHaua882C01P9texx+0s02
 z0nx8DVCp+RPEsMrHsBNmHfgZr/BIChM8aZh9NuFeH1ipNnaKDkjEbODF7qfLdJMsdbtCx4
 l5OB2s80QTlkWN+69JiUto2y+noTyp+FM00VTCFKj4SC4lwu/UMxl5PNzZp8U5GxLHHRRvp
 Hndo+5rq/Yh2ulJfgC0ig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AivZKXbYAvI=:EDL/uU2WO23twRpO8sT4Gr
 AhsD/y/Xjokf43vGA5HYdc6qUkEamJ7eDxSoNu8iuj/ZmzuYeEauDDDyZjS4RrRDlB2K+A/f6
 kAS3oyFRCYoF5+jerMgTCQvlbzUGaCxToVq3QJPA4g2tcxs7e7yaCIKeIkNKqL9dzxpCH3W87
 3C2Aa+ZMgebVcX6FbyXFxk/khOGN5EcTxb1+h5qnQYxU1g7c+pjpebhjXg5UboaM5sUgZ5p2O
 WHkKeIrfujDDaybGOrzguyIiPCMR2CjqWtNbZ3tdwbNWEqbMRuvAvdBQieL0IJvjt1hubAL63
 vbrb0qcFHz1fJMqDW5Jc32O5Nydux26fjvA2XDn9JB9kpjOy6QCx3m++7ANewYhM/EbaNndX+
 NnwKAlp5+jH3PjZeKF+9ugte52L8mrUkloYIaeB220uyp4AQyeieaMQyeypoQz4SwlvC0BmYS
 GbqsXHMmgfzF9gY6l6kr0H2cpYrCAiXSNtVKA5eRR28iAJq0KFMDQvmmhgXyuS7R5aLJw+HRK
 zLDoMKlHUgwwXlsfh0hb0JCK9BCJC2NbQJhPMtpoQXkIxcz2w06i42V9ueZ0qmyYSUdau4ZnG
 bK8aqx4GyFO7ZJdTahGPPhw33K8y6JH30BQvs6z5QW8ETdnnZSG5wmDnOiYQjaVCEUpnUwknc
 LQkqVJXpf283JiouRMmz+2B+3uKUV1I0nFccTuhYXAwB3pnlZHiwVrh12mqeCMM6kU767m4S7
 IjtsDBJk1egI64/2+SyP/3osfIV+YJf5cuB+d/V4UQSZ5Omb9PFXdOTrwyBTIXh5yFBwwXtuZ
 TyKwGWUqWQ0DlAnOrb/jR6Cw79RKJ9xsfesSV5/7xmDEUNQpC50q21KHFvLQayM06nA8fwy
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Lihua Yao <ylhuajnu@outlook.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 patches@opensource.cirrus.com, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 13/13] ARM: s3c24xx: camif: include
 header with prototypes and unify declaration
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

On Wed, Aug 12, 2020 at 9:59 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Krzysztof Kozlowski (2020-08-04 12:26:54)
> > The s3c_camif_gpio_put() declaration in
> > include/media/drv-intf/s3c_camif.h header was different than definition.
> > Fixing this allows to include that header to also fix the W=1 compile
> > warnings:
> >
> >     arch/arm/mach-s3c24xx/setup-camif.c:28:5: warning: no previous prototype for 's3c_camif_gpio_get' [-Wmissing-prototypes]
> >        28 | int s3c_camif_gpio_get(void)
> >     arch/arm/mach-s3c24xx/setup-camif.c:56:6: warning: no previous prototype for 's3c_camif_gpio_put' [-Wmissing-prototypes]
> >        56 | void s3c_camif_gpio_put(void)
>
> Maybe it should have been void all along?

It seems there have never been any callers and the entire file
can just be removed, with the rest of that platform_data header
file moved to drivers/media/platform/s3c-camif/.

     Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
