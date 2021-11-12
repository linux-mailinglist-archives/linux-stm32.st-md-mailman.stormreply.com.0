Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE04944E99B
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 16:09:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88EE0C5EC74;
	Fri, 12 Nov 2021 15:09:34 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6329AC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 15:09:33 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id v3so19343461uam.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 07:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qw8DgkZbZem6Ea8HZNgud/7sA7AYF/tTTZ98QhHrEck=;
 b=zZFywd36pUmyofJwvjmQD+FdLb6uCUAwTQicH3sJWF1nrLM1Qft5DIsxLuloG6IVOv
 pSyU29Ml3D/3k+CJTDryehU8Fso2joM8JJDEJRkVOY/H7ALDOY+/2p/DFLuUKpllD2Nv
 +6Iw7Y0YBigBh3fk/xXz8YcAnHhxVMWrh6iKuFDT5NQ4ArQX7aArZSYKoR0sNpJ/PDQG
 d126If6liUbjXnQOuPeZo+d0E4JRX7wS0hj7tz0HXOFIwjFkUAqk9C/Phqb2VSrmX0Yw
 uSBJhAMf76Mx/V3tRPeHBRESghQUabGY8dsbbWLrl5raNqVf3NQjTCQYVwgPcxR53hnQ
 hFWQ==
X-Gm-Message-State: AOAM531u7ZHDlva8pIOD0QGSy67sFpyLJnUkFzlrFX+ab6tLELXhAVP5
 G9kjWU2o2x9ECLo0ljzWnK9FUj5WEWPX9g==
X-Google-Smtp-Source: ABdhPJxolSwUzzhRodhC2BJ4SaRpKgVfTwJT19R/tJde5c4dsW+k7TPBhI20o0UO0TY3eFXPbDcuog==
X-Received: by 2002:a05:6102:f0f:: with SMTP id
 v15mr11160496vss.28.1636729772130; 
 Fri, 12 Nov 2021 07:09:32 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id h24sm4607063uab.5.2021.11.12.07.09.30
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 07:09:31 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id p37so17742928uae.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 07:09:30 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr18909340uar.14.1636729770683; 
 Fri, 12 Nov 2021 07:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20211110153142.3451-1-biju.das.jz@bp.renesas.com>
 <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Nov 2021 16:09:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8XyqC6hDArDratj58kRUrJNwyKdT6cTcCVgvOO95O_A@mail.gmail.com>
Message-ID: <CAMuHMdX8XyqC6hDArDratj58kRUrJNwyKdT6cTcCVgvOO95O_A@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] clocksource/drivers/renesas-ostm:
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

Hi Biju,

On Wed, Nov 10, 2021 at 4:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> deassert the reset line before accessing any registers.
>
> This patch adds an entry point for RZ/G2L so that we can deassert
> the reset line in probe callback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

FTR, no regressions detected when booting RSK+RZA1 and RZA2MEVB,
which rely on the OSTM as system timer.

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
