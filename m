Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E98E14FBFB9
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 16:59:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1F24C628A6;
	Mon, 11 Apr 2022 14:59:28 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 771A3C60495
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 14:59:27 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id bk12so10814465qkb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 07:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yUq/l2eFC4o7PuogV4g6ysQ8qWlSny+TA+UhI++mHfU=;
 b=BuIot4f6c2bqSv5AeJWp/50g9dHg9FF+x3qZ5vYIlv1gFSuBVJmz7YdtDKIvD0FuoM
 2kKGiStC5IL2y0Q2Ty9/VmyuUq/uaVAxEf5C31RD19kNTlQTR0a9cRlQy5mJTUYuapjd
 tlPuqGELDz5QXrz2LnvbkBAK+B/QfIf4ILxW+CW0ob/u51A8XFvC7MxM9WZpOEu76plP
 +wYRJAP1l++CIGY95fNFk84IwXZw8Sh+t41ihdYQQFqyer0uClkqiKDSOiqeGXyjqEYO
 NqKMK7zmwY7R94aob+JNum2R7XSq+BTsE2lsvzBdC6SHmaB4MvwsVSvPlfnafXTdhaX5
 RSiQ==
X-Gm-Message-State: AOAM530PGuBGF+zdlX2O6zWRurNxcyRPCsLQpINlqa0SwscIYfyGZRY3
 WeTHr6z813Bh7RagFxEGYYSSAoRZlx6QkA==
X-Google-Smtp-Source: ABdhPJwhILEjJktyAvyHL4IxmyJffAlMeqAMhJUCy493I5XKoLtnVOwG20T2t5gKmV8Dp+tzCB6RaA==
X-Received: by 2002:a05:620a:410b:b0:69c:2f6:f050 with SMTP id
 j11-20020a05620a410b00b0069c02f6f050mr6536638qko.284.1649689165789; 
 Mon, 11 Apr 2022 07:59:25 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 d15-20020a05622a15cf00b002ef31d86837sm1291580qty.55.2022.04.11.07.59.25
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 07:59:25 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2ec05db3dfbso47412417b3.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 07:59:25 -0700 (PDT)
X-Received: by 2002:a81:3d81:0:b0:2eb:8069:5132 with SMTP id
 k123-20020a813d81000000b002eb80695132mr26323646ywa.438.1649689164877; Mon, 11
 Apr 2022 07:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220408122636.505737-1-valentin.caron@foss.st.com>
 <20220408122636.505737-4-valentin.caron@foss.st.com>
In-Reply-To: <20220408122636.505737-4-valentin.caron@foss.st.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Apr 2022 16:59:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWD8fxeqPUaT_CwnYdq02aaTsnQM_G-YyOGWooS5epCeQ@mail.gmail.com>
Message-ID: <CAMuHMdWD8fxeqPUaT_CwnYdq02aaTsnQM_G-YyOGWooS5epCeQ@mail.gmail.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 3/3] serial: stm32: add earlycon support
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

Hi Valentin,

On Fri, Apr 8, 2022 at 3:14 PM Valentin Caron
<valentin.caron@foss.st.com> wrote:
> Add early console support in stm32 uart driver.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

Thanks for your patch!

> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1264,6 +1264,12 @@
>                         address must be provided, and the serial port must
>                         already be setup and configured.
>
> +               stm32,<addr>
> +                       Use early console provided by ST Microelectronics
> +                       serial driver for STM32 SoCs. A valid base address
> +                       must be provided, and the serial port must already
> +                       be setup and configured.

Why do you need this parameter?

Given this driver uses DT, can't it figure out the serial port address
from chosen/stdout-path?

+OF_EARLYCON_DECLARE(stm32, "st,stm32h7-uart", early_stm32_h7_serial_setup);
+OF_EARLYCON_DECLARE(stm32, "st,stm32f7-uart", early_stm32_f7_serial_setup);
+OF_EARLYCON_DECLARE(stm32, "st,stm32-uart", early_stm32_f4_serial_setup);

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
