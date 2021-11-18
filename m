Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C30FC45594D
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Nov 2021 11:44:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 827B4C5E2CC;
	Thu, 18 Nov 2021 10:44:18 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CF32C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 10:44:17 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id i6so12615673uae.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 02:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4v2AD/7kPOPPNFxUrwvcAKdN8Awv89acKC5POSyWGVI=;
 b=LEOi7SYX01DcWhDLpUCso9QTboa2lp47YFGQKJTULr6qKJsLUf6nuM7pFs6GbcnUZO
 KdWBAz2+lpG0ANnDtwSr7Nlu/U4b3ilLZJ6t6jdKFVTtuaAQ/ZMULF7jnsxk+He54N+b
 jhcEg5eJqbnkBqkhUS65nZDCjJrxl97GLvjQh+dXQzVfzMwL4+JQzS+/koNiRj1hlp3k
 W4QUcX4sbMgVccIjvOs9bEGw+JbOE3w14bxvXVzjJmU7rOGGCrjT7UPqYQT8lMKGq22o
 3jzi7QsmnKI/QjIZJffkdPGf9aVCndqXH+ZamPgpE9iGhM6tZ7ZSZKEJePH+6kzVldkQ
 rakQ==
X-Gm-Message-State: AOAM531qiO5MI5mgIw0c+4u2GLxXo4m+84DM/8Hq6j9sgQhj8SjPoABY
 9cow4vcxFpVjgxLxqRbscAjSYcaLqpmUEg==
X-Google-Smtp-Source: ABdhPJwt7MJOJxAEBrveW+vjBKmbIjMKW1LpBSCjWVlfQgpfkrl6ADFR+MXqwJSbp229e68Ge/bqdA==
X-Received: by 2002:a05:6102:c8a:: with SMTP id
 f10mr24451716vst.22.1637232256073; 
 Thu, 18 Nov 2021 02:44:16 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id 3sm1335137vsq.1.2021.11.18.02.44.14
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 02:44:15 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id ay21so12542458uab.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 02:44:14 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr35081179uae.122.1637232254305; 
 Thu, 18 Nov 2021 02:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Nov 2021 11:44:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3LP6YkGPwiA0Cpmmmb5YkL5LcSgp0C9JKPDvHfV0KGg@mail.gmail.com>
Message-ID: <CAMuHMdW3LP6YkGPwiA0Cpmmmb5YkL5LcSgp0C9JKPDvHfV0KGg@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/4] clocksource/drivers/renesas-ostm:
	Add RZ/G2L OSTM support
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

On Fri, Nov 12, 2021 at 7:44 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> deassert the reset line before accessing any registers.
>
> This patch adds an entry point for RZ/G2L so that we can deassert
> the reset line in probe callback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Added reset_control_put() on error path.
>  * enabled suppress_bind_attrs in ostm_device_driver structure

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
