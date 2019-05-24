Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D837C2971F
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 13:26:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89E75C59798
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 11:26:28 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 243FBC59797
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 11:26:27 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p26so4370893qkj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 04:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AQbzxXz1q7eupENIwZaibprKRQQ1QGdGQzKNp6w4Rig=;
 b=qno0DZOafF73RT0ZDcC5fDnleaIYN1r7Spg2AtrRPoNELpOm+eVBquKf6qMKWbrZll
 vML+ySumfkUfEYJsRHL24yaWH5pJ2yNZvk+QsCm9PHbbqB9FvVUNPlDWi7czSYwW62gh
 LZl2c3bZ6CtXghWBQfFf+LQJRDn3nM+w6HyXoPhLlkwZ26YXO2dC2zAUmr3wKfwVhcjz
 zJb7JHfyzcbGDJkHpUPYxU8vDenHtUxsi88gK56wAcnT1O7pEsALLubqM2Jv9hNu4Krf
 /OvG8Q/kHdAMj8+NFilB1sUaRV8xwnSu+MqeNgwFaIq7JTUC/dBUgN7YcA3F3ADeOT4k
 vaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQbzxXz1q7eupENIwZaibprKRQQ1QGdGQzKNp6w4Rig=;
 b=kHpgaof69ZjnB5cK6+91vGvQrkv0wfsgjM1SnxTbzVLLOkdFipZFOLTaZlW2TUsPR/
 nxpCDf/eOn72/GmP1hdmMQfZrGfvh8i4NBEeIcK+bAsWiokSM1pjK40f2z3Ph6a+Y5bK
 9oYHTgu/lwqZ8b7qFp96ZHkNjWZUhXKcGfSkVg1bojaaZ7i+y8CcH4MIwyarvlrjoT1t
 6nGFzGriT1gbVXBKbMPY9hgkxRgyeCKrHHyEJUeW2Un7d+Xx2+4Dlj5yB/4RgV2iSG1L
 3Mq3IQclm4ztu7CSBsRuqGNZ3BCRtPQCGa2HZQ4K/gS5QQu5EP6sJyNjOFmZt+HVULka
 bAag==
X-Gm-Message-State: APjAAAXNIVI34oVC4xEPtZaP0N/5zFG/1M8ThswhIND5PsB35xeqIO0E
 I7Jg8UDGmlbkx7jn6w8hSAnCRXSHS1WTUqN6I7cHww==
X-Google-Smtp-Source: APXvYqwjkUQ0RLpOGJmq7DNe4leRPE5WFR5Q2/qSAXC1a4jjesdy4O9Mkrsk1p39MJVgfwXgFcwsHDCr+h35uS+jHwU=
X-Received: by 2002:a05:620a:1648:: with SMTP id
 c8mr73380286qko.186.1558697186148; 
 Fri, 24 May 2019 04:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
In-Reply-To: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 May 2019 13:26:14 +0200
Message-ID: <CACRpkdZ4P=PSCu86p48nBPeVk-h5T0Ytc1CYV3XZGd4fLuJLGw@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: add lock mechanism for
	irqmux selection
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

On Fri, May 10, 2019 at 9:43 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> GPIOs are split between several banks (A, B, ...) and each bank can have
> up to 16 lines. Those GPIOs could be used as interrupt lines thanks to
> exti lines. As there are only 16 exti lines, a mux is used to select which
> gpio line is connected to which exti line. Mapping is done as follow:
>
> -A0, B0, C0.. -->exti_line_0 (X0 selected by mux_0)
> -A1, B1, C1.. -->exti_line_1 (X1 selected by mux_1)
> ...
>
> This patch adds a protection to avoid overriding on mux_n for exti_line_n.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Patch applied, can't say I fully understand it but you know what
you're doing!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
