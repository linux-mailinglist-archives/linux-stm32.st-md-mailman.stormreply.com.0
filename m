Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D8E50A28A
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Apr 2022 16:31:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37B81C60496;
	Thu, 21 Apr 2022 14:31:41 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19BF0C5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Apr 2022 14:31:40 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2edbd522c21so53755847b3.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Apr 2022 07:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wFI100ksKyx/De8JN82LDPBcTcxrj8iutf9RS/aDs2c=;
 b=PFD/WP8oOojZ7hWXT7AKN/o4scR2dHpuRMHfhP+qV3FTfhmRRMo3KypyjfQzu8Kwoa
 yJL1GTY9T1lsNRg3ddqZcOnN1GiLcjRMCh6EishWNc09VlPWoHQuaIwTKKNuYo7zIbVd
 UsCl5GqEE/jUsRvRupg105t2iSRIHw6FhRb2dddvoGH9i6lsZsNn4jaHLybpCSs/W2+q
 2s0bE64G5jx7xUBj3fOvYipT8lpYi+dCewdRHHcb9D0/t0Zkh4BQGZzwshKbpseldb9L
 PjIIl9DI9X5lmEH5hfAiFNgBenF/l9AdQpellfFv+3+tQAgvs6a1BWaguAaIM0c9JKXt
 a+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wFI100ksKyx/De8JN82LDPBcTcxrj8iutf9RS/aDs2c=;
 b=jDuVRMJio6h32+VAHjwSrHfVdktUgp8lz9pkVB3BjyApFtzAdzNW+AmIduMg284NhZ
 9Q06qQekUUXjgGWXMcwlWUSDhDBwM9bCycyXBw/sX8J1k5H3kH1KIiE0//j4VTxSqkJR
 6PMfUznLDKZKzTGYSkRS+12CtANuEN2xuvrw72FHMlac1/ga6sYQ5mZYBdy+TUuGoGhh
 dX0nKwdq0889SD5vJk/qmNFnnIQCeFtRXAu9ZftqMsSiX+046S8LC0wN7gmOr7QP6oSJ
 6oEjaRmKWy8TRKX6gmsUct2LQ010ZCPhoivLjkTmmpP7texzmqrXxFmf0qgIIjU2lN9f
 G13A==
X-Gm-Message-State: AOAM533hzIwylza4yUu1JArI39BxjVMtLjGCxm8H8jp9aqnJt/ZuaYuc
 ig1NQbfZoI3nUCcOo0YszpsLN05Mwgo84WJKG87n2A==
X-Google-Smtp-Source: ABdhPJzc+2ALCE7Xo4CcUntkIGPkRLulqQajSFyrx/E9OSaxsFlqnOPZLERahbngQ9Sh9Z1MwsiYFsn5KbcV4X4kj2c=
X-Received: by 2002:a0d:c4c2:0:b0:2f1:6c00:9eb4 with SMTP id
 g185-20020a0dc4c2000000b002f16c009eb4mr24374270ywd.448.1650551498376; Thu, 21
 Apr 2022 07:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220415215410.498349-1-marex@denx.de>
In-Reply-To: <20220415215410.498349-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Apr 2022 16:31:27 +0200
Message-ID: <CACRpkdZiQiovFrgo7v7vRyQdyS0q8yS_dw097rbb31dXWsEDRw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] irqchip/stm32: Do not call
 stm32_gpio_get() for edge triggered IRQs in EOI
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

On Fri, Apr 15, 2022 at 11:54 PM Marek Vasut <marex@denx.de> wrote:

> The stm32_gpio_get() should only be called for LEVEL triggered interrupts,
> skip calling it for EDGE triggered interrupts altogether to avoid wasting
> CPU cycles in EOI handler. On this platform, EDGE triggered interrupts are
> the majority and LEVEL triggered interrupts are the exception no less, and
> the CPU cycles are not abundant.
>
> Fixes: 47beed513a85b ("pinctrl: stm32: Add level interrupt support to gpio irq chip")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> To: linux-gpio@vger.kernel.org

Patch applied!

But I changed the subject to pinctrl: stm32:

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
