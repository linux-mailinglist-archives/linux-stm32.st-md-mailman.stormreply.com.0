Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97355E53A
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 16:13:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D302C5F1EF;
	Tue, 28 Jun 2022 14:13:32 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85D02C5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 14:13:30 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id d5so22446122yba.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Ak9fGBSyNTC9/zM2LmAtjsPfz0fauhmhcL7y4wTmPs=;
 b=AWjGfj5bvqdOWR0OCeEbsZwXgKhFXY1IVpM59omVQIQ5g9UT3qIVK+sTls/SSa8N0u
 gNKxXtFnuCj8BwgRlShIV6JZ7rRPMV0WYd/Z3v5UP6m4nht2KvodkA9Ra5fSqwgpvT1A
 6odq10H/hYXdyKO68R1v/pgTC24/DPfGWy+I5KQJRi8NqRUkLHKvw8x/nL474HqXUPuO
 Wn8AKWrpRfmNr2+TsU7XoTRiQkpz6cdKZF7OHeT6yM6qK5EWaEfzpk0VRWJjsnMwQ/VB
 ldZXGycBnyUmJ6+6Auv9MiEwoy/75pubtFPA2hsaqieRS1YF/P4QuQHbO/rida3LwNN7
 g9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Ak9fGBSyNTC9/zM2LmAtjsPfz0fauhmhcL7y4wTmPs=;
 b=vSIAG7eSir6w8AdhczyZaodN3hbqO2fLs/Rwog0hZxHfDZt9FLMYmK3fP9Jb37mqTe
 yvkmD7inv47RwzuD0F5Xdfk6o/tMrP79P6HY48s+8GYznTnYkAD/N9BreGh8hw1TL5ES
 J7L3u0pSVqoncCFgB5q4v+L88yglpNN5Yq+QfNMCq3Ux8VZf4EMVKtRw7qizvFuIIEVt
 d4zLNKgfci+vb13iWmLB/E1pFE/kwi4IIEJ2f66QOaheksEhqS3FNugiTvmrC65Q1luv
 ffgSjVr612dRTHYFktscwpliyK0zM3j7zcHpwa4PIIjBoqaXxdhzNgLNgydJ359nNexB
 Ni0A==
X-Gm-Message-State: AJIora/hZr4Z2cRyCI/kR/Uwtl/v3RtXHVMzXIeurRvJ+Z3JzVV7Beav
 /h1rUdeiUGCKNldPRjSbRNGUuz0URxdS81d9IJn/Mw==
X-Google-Smtp-Source: AGRyM1tzbdsFHeeYT4fOTsfzgP49TpefwICfzEQ63caT6oTXLjkLH1NlVPVj5M+nSxqLxg5MWOERTK9fRabKLmHP74g=
X-Received: by 2002:a25:cac5:0:b0:66d:2c32:8593 with SMTP id
 a188-20020a25cac5000000b0066d2c328593mr3202257ybg.626.1656425609426; Tue, 28
 Jun 2022 07:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220627142350.742973-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20220627142350.742973-1-fabien.dessenne@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jun 2022 16:13:18 +0200
Message-ID: <CACRpkdZQNs6BgchbxFN4rHzk41xUnJKcxKTi78xTduq32y4urQ@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: fix optional IRQ support
	to gpios
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

On Mon, Jun 27, 2022 at 4:24 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> To act as an interrupt controller, a gpio bank relies on the
> "interrupt-parent" of the pin controller.
> When this optional "interrupt-parent" misses, do not create any IRQ domain.
>
> This fixes a "NULL pointer in stm32_gpio_domain_alloc()" kernel crash when
> the interrupt-parent = <exti> property is not declared in the Device Tree.
>
> Fixes: 0eb9f683336d ("pinctrl: Add IRQ support to STM32 gpios")
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied for fixes.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
