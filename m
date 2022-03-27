Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4DD4E89D6
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Mar 2022 21:58:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC373C5F1FA;
	Sun, 27 Mar 2022 19:58:44 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D611C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Mar 2022 19:58:43 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r23so14785878edb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Mar 2022 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SJC0OBpbo1wPJs92walEXwvuMKGL+QuVz9UtNgWIQO4=;
 b=cbr7IATfDrBAabV81aPZWOvIUBIUIpSdkVpz3wjkORMU+Td/ujiwFi9ZmSk3nHQVca
 qjNhZ+aFm+JtQYK//RiGq1gFJxM3cmSauYqUO2zFMLO92vxv2idh3/kJkah5hdsKpIGu
 ohyvdc6aUDzyrgxarmcXEakKWBjWYqlfE3WMVENslcooChfSlJsQNnzSyLyNuECHCTUB
 bRs1z9EhRBXqUQTHHRdq+XJEiCuxMkMsGkp4wRMPUhOZcZzxM7/lQ4CY1YO15gUoudXV
 1CUzBCwGedNlRNVXhiCntP139L693MrUoHassTyuCBVby16DlShHN5rHMaHEZH4B0VAv
 665A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SJC0OBpbo1wPJs92walEXwvuMKGL+QuVz9UtNgWIQO4=;
 b=gOjnHOZgU8GfwuvZ9qzcFaJqacQHdagaUgmaRjxgmwgraiRPA4KqE0byKHwOxDqimf
 J81y3ZxD4c2hpt0/vl8xP7zVy0Vx0RMozYuthDBAkd/lK9VZzr/qvuivL7g+ABS7ts08
 Osk/fVOGDPtLWHg+3lruALVyYLz0F4ZyO971CrWDElJvIKUvk/AOC9FAdfRHl8Oj8i2g
 kULsX2vWgWEfml9sgZK9dd/Lx2t/xYupbB8S4MknCwFRqbPGdD2f3HjKGJHNodqoJNG0
 1K6+zxxCP9tRyLLGvI3QOQQ9tBLyl/K6PCFm3GdNMxG3DExcc4TC2n/EdIymI5SzH1fT
 Vj3A==
X-Gm-Message-State: AOAM530dp09MwWz+yv+8V4mt2+ry06pYUbjzVgaCG+2igkPCpWBrKWbn
 XXuRGD9n9XHbq2i6Pb0DriI7Ca4/0csyKSIcF2M=
X-Google-Smtp-Source: ABdhPJwgGCwymYiuaBSFEllOtIN0gwhVm7kC5VU8kOJXl9C6VXio0PVhOi6MtGOhiTL4+DgFpjcuqUXIPq2NqVcjDUg=
X-Received: by 2002:aa7:c30f:0:b0:419:2af:4845 with SMTP id
 l15-20020aa7c30f000000b0041902af4845mr12139494edq.296.1648411122928; Sun, 27
 Mar 2022 12:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-5-andriy.shevchenko@linux.intel.com>
 <3415996d-e8b5-2416-fb66-e65779a9b507@omp.ru>
In-Reply-To: <3415996d-e8b5-2416-fb66-e65779a9b507@omp.ru>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 27 Mar 2022 22:58:07 +0300
Message-ID: <CAHp75VdoKOqaR5XuBvZ9EBPRE+ULvXf+B3sh1rQ6RXt_ovcsbw@mail.gmail.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v1 5/5] pinctrl: armada-37xx: Replace
 custom code by gpiochip_count() call
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

On Sat, Mar 26, 2022 at 7:02 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> On 3/25/22 11:03 PM, Andy Shevchenko wrote:
>
> > Since we have a generic function to count GPIO controller nodes
> > under a given device, there is no need to open-code it. Replace
> > custom code by gpiochip_count() call.

...

> > +     nr_child_nodes = of_irq_count(np);
>
>    Mhm, 'np' is no longer assigned to it at this point...

Good catch! We may retrieve it by calling

  np = to_of_node(device_get_named_child_node(dev, "gpio-controller"));

like it's done in the previous patch in the series.

--
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
