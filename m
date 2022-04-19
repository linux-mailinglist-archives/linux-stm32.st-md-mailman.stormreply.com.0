Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B7506751
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 10:59:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F37FC628A4;
	Tue, 19 Apr 2022 08:59:52 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B486C628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 08:59:51 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id f22so2505996qtp.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 01:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2tS14D5PGmg/JLCqgQ04J95Jt9tqRjNAbrf1/kgwkng=;
 b=T68fTMSY/XEh9UP36S9WTdwi8hvGuW8p0Z4qqE8IICagzQESX4/c8tHS1m0lu2lIIH
 PE2GKj+tXp/X6tZNlXhrmXbbUY881jpQZJSFXxUJGs5Emil+l/8W4q9DidPgSkd8gnYi
 ZXQ0mPkEqwTo1C+95u/vMjecVWzWGwzclLHfN55r3ifXBxs7peYBAerjrn3/hRfIn2AF
 nYa3IiurPpcCVfb18dLr13ozoiZJMys5Ug8vCos0eQfA7+rHnSueblEdQ6+O73y02n2W
 nOGkVW2yVSGPfADz4NK5sbYE4/pyidWp1hg6pmXNMjMYYq6UaDhgQEdthHlymzyOcFFW
 EHkA==
X-Gm-Message-State: AOAM530GEb2BB4QfUrY6d6OKgkzG/e8Ds/2M3Zyg7eW/VDfSoOTXdXV5
 nEBf271GrVNGclm8Tl8mof8M1A7XgOhkIw==
X-Google-Smtp-Source: ABdhPJy/NH5wnzHHu4HMytS20/7YhZjNyMnnExNmmttsq6uyK6qk62uCV5FlDPAsuDJSLDqeUbDEAw==
X-Received: by 2002:a05:622a:1185:b0:2f3:3560:14e6 with SMTP id
 m5-20020a05622a118500b002f3356014e6mr1662531qtk.324.1650358789933; 
 Tue, 19 Apr 2022 01:59:49 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05620a21ce00b0069e8c2d2bd9sm3591305qka.42.2022.04.19.01.59.49
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 01:59:49 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2edbd522c21so164444237b3.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 01:59:49 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr14521561ywb.438.1650358789297; Tue, 19
 Apr 2022 01:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220419085330.1178925-1-valentin.caron@foss.st.com>
 <20220419085330.1178925-2-valentin.caron@foss.st.com>
In-Reply-To: <20220419085330.1178925-2-valentin.caron@foss.st.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Apr 2022 10:59:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCeuC5qStugnssWKUeOVWxd_3XyYtS0mrZpqQVaXAP2w@mail.gmail.com>
Message-ID: <CAMuHMdVCeuC5qStugnssWKUeOVWxd_3XyYtS0mrZpqQVaXAP2w@mail.gmail.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V3 1/3] serial: stm32: remove infinite
 loop possibility in putchar function
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

On Tue, Apr 19, 2022 at 10:54 AM Valentin Caron
<valentin.caron@foss.st.com> wrote:
> Rework stm32_usart_console_putchar() function in order to anticipate
> the case where the character can never be sent.
>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

Thanks for your patch!

> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -1640,10 +1640,16 @@ static void stm32_usart_console_putchar(struct uart_port *port, unsigned char ch
>  {
>         struct stm32_port *stm32_port = to_stm32_port(port);
>         const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
> +       u32 isr;
> +       int ret;
>
> -       while (!(readl_relaxed(port->membase + ofs->isr) & USART_SR_TXE))
> -               cpu_relax();
> -
> +       ret = readl_relaxed_poll_timeout_atomic(port->membase + ofs->isr, isr,
> +                                               (isr & USART_SR_TXE), 100,
> +                                               STM32_USART_TIMEOUT_USEC);
> +       if (ret != 0) {
> +               dev_err(port->dev, "Error while sending data in UART TX : %d\n", ret);

Does it make sense to print this message, i.e. will the user ever see it?
Or is the failure above temporary?
I assume that you have seen this trigger?

> +               return;
> +       }
>         writel_relaxed(ch, port->membase + ofs->tdr);
>  }

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
