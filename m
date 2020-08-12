Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF3242DE1
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Aug 2020 19:13:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ACF1C36B26;
	Wed, 12 Aug 2020 17:13:36 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7521FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 17:13:33 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id di22so2082569edb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 10:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MT1HlMJVel4NfjLeoguo3S82lKmyadBedQuGtY3rkqk=;
 b=S+Mprf/aZOJD4LRpPqpCn7fYq5uRdcAZXUg7cPS1ItcwnQaJHWim/W7lnU2LAes8lt
 S/qyLiMFOiPIY8IZDim8PT9m8Oaj0Os/021cxNo3ODmU7VBLLFzi7kS9qjDuI34MmXXx
 +15lWZAeXFsufAChgQfOyPXuxiTrJGT8fCTxWfLbZI993N+nfFDC9SB8GStRls+cznmP
 cTvl5uajkeROLBZC7mreiFf5yjawxpvI5YhDFrDi+HILW122JI9DEYzy7tpzkiJbA25g
 6gmvDXP+6yc4jdOCRTTGMhBCe/HaTUmhbzoSi4i2RXsa3hGjw+WNQkRik8oUf0sogbrU
 A8ww==
X-Gm-Message-State: AOAM530VUnJF7WLtZ36RLFG3fz1N77Cl78O8rMXjsbUPPnwSVxvqjRdO
 +nuR5x/57EeqhEmda+VH4oM=
X-Google-Smtp-Source: ABdhPJxHwROrd0TssNGyu5e5q3y0vfIOw6f27KQllbOmg3rLagqeBRyVqwp6k+Jy2UBlAMcA2OF4Tw==
X-Received: by 2002:a05:6402:c84:: with SMTP id
 cm4mr920950edb.20.1597252412911; 
 Wed, 12 Aug 2020 10:13:32 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
 by smtp.googlemail.com with ESMTPSA id b20sm1821329eds.7.2020.08.12.10.13.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Aug 2020 10:13:32 -0700 (PDT)
Date: Wed, 12 Aug 2020 19:13:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20200812171329.GA3420@kozik-lap>
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
 <CGME20200812091510eucas1p15944eb26bb496e20b9fadd609063a490@eucas1p1.samsung.com>
 <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
 <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
 <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
 <6ccf14a9-802f-25b8-494d-e957cafd073d@samsung.com>
 <20200812133109.GA15697@pi3>
 <828b3dd5-31f0-0414-e6ea-7629b063e8ce@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <828b3dd5-31f0-0414-e6ea-7629b063e8ce@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Lihua Yao <ylhuajnu@outlook.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 Arnd Bergmann <arnd@arndb.de>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Kyungmin Park <kyungmin.park@samsung.com>,
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

On Wed, Aug 12, 2020 at 05:58:52PM +0200, Sylwester Nawrocki wrote:
> On 12.08.2020 15:31, Krzysztof Kozlowski wrote:
> > On Wed, Aug 12, 2020 at 03:11:41PM +0200, Sylwester Nawrocki wrote:
> >> On 12.08.2020 13:28, Arnd Bergmann wrote:
> >>> On Wed, Aug 12, 2020 at 12:46 PM Sylwester Nawrocki
> >>> <s.nawrocki@samsung.com> wrote:
> >>>> On 12.08.2020 11:14, Arnd Bergmann wrote:
> 
> >>> I see two board files (and no DT) instantiate the camif device:
> >>> NexVision Nexcoder 2440 and the FriendlyARM mini2440.
> >>>
> >>> Can you say whether the camif on those would actually work
> >>> at all without your patch? If not, we know that there are no
> >>> users of that driver and could either drop it completely or move
> >>> it to staging for a release or two.
> >>
> >> Without additional patches the camif will not work, the driver 
> >> needs an instance of struct s3c_camif_plat_data which specifies
> >> what image sensor is attached.
> >>
> >> I think we can drop the driver, together with the s3c_camif_device
> >> platform device definitions. It can always be added again if anyone
> >> ever needs it or converts the platform to DT.
> > 
> > Since the header was in /include/media I assumed there might be some
> > user-space tools using it. But if it is not the case, I'll drop the code
> > then.
> 
> That's a kernel internal header, only for board files, it should really 
> have been added to include/linux/platform_data.
>   
> >> IMO all non-DT code in arch/arm/mach-s3c24xx is a candidate for
> >> removal, it just adds to the maintenance effort and I seriously
> >> doubt there are now any users of it.
> > 
> > That is quite tricky... I really do not know whether there are any real
> > world users of S3C24xx and S3C64xx platforms. Evalkits are mostly not
> > available for buying so I do not expect new designs. However still
> > existing ones might be somewhere... Few years ago, back in Samsung, I
> > mentioned removing them. That time I think Marek or you Sylwester, said
> > that there are industrial applications using S3C24xx. I believe, why
> > not. The trouble is - how to find such users? How to get in touch for
> > testing or at least for bug reports if something is broken?
> 
> I believe if there any such applications of the S3C24XX SoCs still existing 
> somewhere their long term support doesn't include updating to new kernels. 
> I used to keep a running S3C2440 SoC based board just for the purpose of
> testing patches touching the common code, but I stopped it, I think it is
> not worth to waste time and health on it any more. For example support for 
> the OSELAS.BSP-Pengutronix-Mini2440 BSP I used for tests ended 5 years ago
> [1].
> 
> > Or even more important - is it worth to spend effort and time on this?
> > If there is no single production system using recent Linux kernel, the
> > answer should be negative...
> 
> I suspect nobody cares about that code (non-DT s3c24xx) any more for other
> than sentimental reasons.

I'll start then with S3C camif driver. :) I guess
drivers/media/platform/s3c-camif/ still should be left?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
