Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998CD8F06
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2019 13:12:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB679C36B0B;
	Wed, 16 Oct 2019 11:12:39 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A412C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 11:12:39 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id m7so23568607lji.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 04:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v71FlkQ6J0UpJP7xXEoyiSKAD0pF3wX4jouOoO7MnLU=;
 b=p2VwOvllbg/0/Neh5/P7m4vAWBzv1dXkn+WNCkRcqrMNWDx9pfbHIa1twG4R8nWXjf
 X0M7OXDXTJjEo6uAH35h6Pb+KV8ArvF5+d3HYtX/xO1AsS0HaJJlRtU8llEBmLpfkGwX
 qoYLlT9L7uvJ/T+E+qUzOdI6FY45brr2Bv6PTnSoZJ71z9Vvwf01D5P/l9RmTXc+IC2N
 lbO6S9Db5rrGVTg5iZLHpv5cQ7fUNfoslwR10po8ClfKUicmkFsBs9TTsTHq9Kkd+uc3
 NlHHMouM3yK4d/F+R4Mow1+AUxpLJFyFS0nNGhD2SjvgZwuSNWd09Ebc9nuNkfqJfYao
 beIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v71FlkQ6J0UpJP7xXEoyiSKAD0pF3wX4jouOoO7MnLU=;
 b=MXjeh8YW+bJqOJ9FvKxJZ0fJNAuGTV2ZuFTJLTpB99tQx9YGW9z8kiJl3APMxA6NTM
 p8U86yioBc3SoH0bf6bGgPbYiGAbQJR669ErugHvRYeAnVthuDgmCeem2Uc8+qWyt8cr
 Nb6NxVZRmOPWaEJu/tebkgShCkheEzBZdoO7ZPCJf7ctRbUJjR+IBTiLVGFEyf/1zu9b
 SIhGtyney04uljHCAVZ8K+BBvis0lX77WfB80AIkBbWna9BNToV1G3OcfxLSsrnfgb8k
 /AvPHetXkQUgBlFZ8uH08uKDd/476udHwh0t0IK7/E2MgqYobDRvrsVeaDi9Aer6vxu0
 8NJw==
X-Gm-Message-State: APjAAAVvRLWL4k0d1taeK8rgy+QyQwiup80LYgISaBhDe1QxE+BVaniY
 A5DLVxUzSKchksfxPC2bXJ2nZedJpKEEesrmzHIxoA==
X-Google-Smtp-Source: APXvYqy4lzrmB+aQANagIA9pI4peUp9E83YYX2I1eb8nCIhO/KTMZcmTe+F/iRjlb9lEwc7ZwWZU9GViug9WdVdMM3s=
X-Received: by 2002:a2e:481a:: with SMTP id v26mr18093137lja.41.1571224358312; 
 Wed, 16 Oct 2019 04:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191004122923.22674-1-amelie.delaunay@st.com>
 <CACRpkda6CyYCt-s-VkaK856Jt3TxQg+HVDz-5Ww9T9KNHHAjaQ@mail.gmail.com>
 <8eb2090a-e50e-2e4f-982b-073ad24e553c@st.com>
In-Reply-To: <8eb2090a-e50e-2e4f-982b-073ad24e553c@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2019 13:12:25 +0200
Message-ID: <CACRpkda1H+fUidZG3wccM-YCyk_Ya9gRb8s-JV35qWvEBOKWPQ@mail.gmail.com>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] pinctrl: stmfx: add
	irq_request/release_resources callbacks
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

On Mon, Oct 7, 2019 at 4:53 PM Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
> On 10/5/19 6:49 PM, Linus Walleij wrote:
> > On Fri, Oct 4, 2019 at 2:29 PM Amelie Delaunay <amelie.delaunay@st.com>

> >> +       pctl->irq_chip.irq_request_resources = stmfx_gpio_irq_request_resources;
> >> +       pctl->irq_chip.irq_release_resources = stmfx_gpio_irq_release_resources;
> >
> > What about just adding
> >
> > pctl->irq_chip.irq_enable and do stmfx_gpio_direction_input()
> > in that callback instead? gpiolib will helpfully wrap it.
>
> Thanks for pointing that out to me.
>
> I can't use .irq_enable because of I2C transfer to set gpio direction
> (scheduling while atomic BUG occurs in this case). Indeed, .irq_enable
> is called under raw_spin_lock_irqsave in __setup_irq() while
> irq_request_resources is called before.
>
> I could apply gpio direction in stmfx_pinctrl_irq_bus_sync_unlock
> depending on pctl->irq_gpi_src[] (checking which one is set, to set
> input direction), but this will be applied each time a consumer requests
> a stmfx gpio irq.

Oh I get it, hm. I thought it would be covered by the sync_unlock()
but I guess not then.

> IMHO, keeping .irq_request/release_resources callbacks and using
> gpiochip_reqres_irq()/gpiochip_relres_irq() seems to be the best compromise.

OK let's go with that for now, please put in some comments as
to why this gets done there so we know when reading the
code.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
