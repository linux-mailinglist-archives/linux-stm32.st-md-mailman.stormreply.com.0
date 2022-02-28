Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC1B4C6FBB
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 15:43:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EC6FC60491;
	Mon, 28 Feb 2022 14:43:20 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E061C5F1F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 14:43:19 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id b64so1918705vkf.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 06:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ns+Arg4klDnlGygzEk76LpslXMQxYcezrQQdYtWZQRM=;
 b=54Ai58cLb8P8LaB2ugstukjGgkbZ5DTvuuiKbn2MbM1lTIF/INyifRDvGSax338sB1
 fX8CiVa3/QlJ44KG8pUtIQ5n4wLyhsCiRtqXp5S221Xp3GP7fAWmQwsYGKozGK8GuEhY
 TOxme/3uKoaJ8EqEIPLEtdvWhG0B2G3p8ypZtbPRjiL+kFXcWaI3+jfmGK63Za9DA8kw
 ssPOV717bAFmskUa8Grgpvwd6FRBoEUE5iUKbzJFv0DCo1QBCycNOqigNMZxSrIjb139
 lZ2lMuFHatDB9WsFZDO/CNEvillpgVyDA+weAaO625ZbYM7FYgsy3GJTT5tqu3oSNTnY
 6nOw==
X-Gm-Message-State: AOAM533fGy+XOWnds3U8SGpFLYPNHqLSS9tgHYqMvHiVukFZkc9lOkOP
 pdjEUIzTeW82LYc68PdXi6REh2zQQ1GWaQ==
X-Google-Smtp-Source: ABdhPJwKFYlGMPKRFXPFf624RE97MAt4+r3Wq/MyPXPhF3JRysarJaEb2dANk5aK05u/zKMarU1Y8w==
X-Received: by 2002:a05:6122:2151:b0:32d:a624:f5d0 with SMTP id
 m17-20020a056122215100b0032da624f5d0mr8019092vkd.18.1646059398139; 
 Mon, 28 Feb 2022 06:43:18 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 h79-20020a1f2152000000b0033176aaacb1sm1666488vkh.35.2022.02.28.06.43.16
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 06:43:17 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id q9so13202537vsg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 06:43:16 -0800 (PST)
X-Received: by 2002:a67:af08:0:b0:31b:9451:bc39 with SMTP id
 v8-20020a67af08000000b0031b9451bc39mr7651662vsl.68.1646059396569; Mon, 28 Feb
 2022 06:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20220227224845.27348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220227224845.27348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Feb 2022 15:43:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+AFpiYwgPN6F1=nx6ivFAU3YYtM1xu4jwyKZh+VNQHQ@mail.gmail.com>
Message-ID: <CAMuHMdV+AFpiYwgPN6F1=nx6ivFAU3YYtM1xu4jwyKZh+VNQHQ@mail.gmail.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
 Document Renesas RZ/V2L OSTM
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

On Sun, Feb 27, 2022 at 11:49 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/V2L SoC.
> OSTM module is identical to one found RZ/G2L SoC. No driver changes are
> required as generic compatible string "renesas,ostm" will be used as a
> fallback.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

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
