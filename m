Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AA225EEBE
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Sep 2020 17:42:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A767C36B37;
	Sun,  6 Sep 2020 15:42:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6A31C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Sep 2020 15:42:01 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D59962078E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Sep 2020 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599406920;
 bh=r/gOQLwi0vjxIzoJJal9o3e2qU4i0aOboXzVPzBsSr8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LDXst8xQux98fgwS+DCPPihpnc/EIEY5qjXq28Z6Q+CGRBgcseA42lQoMei/yn6wl
 7o3dnsXl8KCvWfXAyW6DQN8eWLud2lv08WmDva8Ob3vXhLaa5IAihtkKAgQoSAAx5o
 w9KubcmigtPzKB26MfUkK97aI+LYQYGo4cwv/I4U=
Received: by mail-ed1-f45.google.com with SMTP id l63so10267718edl.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Sep 2020 08:41:59 -0700 (PDT)
X-Gm-Message-State: AOAM532fo2UFBn5HTHQWq/bkkidHPLPRKsZZ9OTd51kkOVw8eq0QAz/g
 aKQX/idEjaU26Rt7YV3Fx0MTaSLEv+8tU5kNx4s=
X-Google-Smtp-Source: ABdhPJxIynhvt9FPtCkCknmoZlm54k/a28/XHX67a2orq3+WSH0hrY9/KZ8SKA/AvmUK58YzhTnGp1wjkPUSp+tg52g=
X-Received: by 2002:a05:6402:ca7:: with SMTP id
 cn7mr17583253edb.143.1599406918482; 
 Sun, 06 Sep 2020 08:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-14-krzk@kernel.org>
 <159721917443.33733.7919188364233003142@swboyd.mtv.corp.google.com>
 <CGME20200812091510eucas1p15944eb26bb496e20b9fadd609063a490@eucas1p1.samsung.com>
 <CAK8P3a13u0KY0jzxNLs=irTs6ZSXyObKKTp-8KEmowcOZrZXxQ@mail.gmail.com>
 <8066413c-367d-2f8d-3e7b-dacd954675be@samsung.com>
 <CAK8P3a1xXe56k5nKuCJ-25h1VqWKRb9JGnFrr=SPg_icay-vZA@mail.gmail.com>
 <6ccf14a9-802f-25b8-494d-e957cafd073d@samsung.com>
 <20200812133109.GA15697@pi3>
 <30eb6355-0749-8268-c87a-f389dc4b4f1b@free.fr>
In-Reply-To: <30eb6355-0749-8268-c87a-f389dc4b4f1b@free.fr>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 6 Sep 2020 17:41:46 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcrhv=1FKE+9RxuYtCb9ZbmMcLt2N0p5pf_sUTimE5Jtw@mail.gmail.com>
Message-ID: <CAJKOXPcrhv=1FKE+9RxuYtCb9ZbmMcLt2N0p5pf_sUTimE5Jtw@mail.gmail.com>
To: Cedric Roux <sed@free.fr>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Lihua Yao <ylhuajnu@outlook.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
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

On Thu, 27 Aug 2020 at 22:51, Cedric Roux <sed@free.fr> wrote:
>
> On 8/12/20 3:31 PM, Krzysztof Kozlowski wrote:
> > Or even more important - is it worth to spend effort and time on this?
> > If there is no single production system using recent Linux kernel, the
> > answer should be negative...
>
> Well, I have a server running on mini2440 with a not-too-young
> but not-too-old kernel. I don't have much time to test recent
> kernels though so I guess that doesn't count.

Actually good to hear. It counts a little bit :)

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
