Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC944E90F
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 15:38:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CC17C5EC74;
	Fri, 12 Nov 2021 14:38:49 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0388C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 14:38:48 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id p37so17539767uae.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 06:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RJ+UbO1XlTn+a5bEKrJdgxXRE0fGry1ajxGH+r1uHc8=;
 b=Xs1qi3FNReMLDy839QQjHYrpEblf7M94UB28rW2wb2u4XfOIB1bB/ntliw2W3jRXeV
 EW/2CmVG0OEb5ShnVx6Mqg4GOP2D1XfTuAYxRrlkzoK8PrbQrmuwNlsWDsGaZzpPlMlB
 tc9OG9MmxCPau1x8LDrV4eK548Gd51dSeZjphSdDeWimslqsXVlF+IyaKQT4EaaDMECY
 +hOCF623DCUZG4apsIFvcr0EvIThN78kmAAUEdvqLSWAYnb3RAzVQYEqJg0dn7c+mzMV
 Y1bNvPSylib5T1FeTFgtFZkuYrNhPUAWudM2hfeEHtKiH/N0curmdJcwVpi4tvYBFgJ7
 it5w==
X-Gm-Message-State: AOAM533KXLHGLowS4cb2zaixcwVLczUnmtEOincHwNe3fD/AzT6UaO8x
 CDLVaY0w96URnZ1ZBB2p9i4kfmBjbxsQXg==
X-Google-Smtp-Source: ABdhPJwfVgy9NV1sBxSCAXYBDS9Z81vVGpXmEOmGGVkvepa59omAd9vOPqxXSDOqGUwpZoEzw0LtaQ==
X-Received: by 2002:ab0:2508:: with SMTP id j8mr23308149uan.16.1636727927721; 
 Fri, 12 Nov 2021 06:38:47 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id m67sm4137922vsc.0.2021.11.12.06.38.46
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 06:38:47 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id l24so14951515uak.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 06:38:46 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr10597139vsj.50.1636727926568; 
 Fri, 12 Nov 2021 06:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20211110153142.3451-1-biju.das.jz@bp.renesas.com>
 <20211110153142.3451-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110153142.3451-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Nov 2021 15:38:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuLrhi29L9BUxB=XrhORGtei-skxSXa5AJw6rwANXQ2g@mail.gmail.com>
Message-ID: <CAMuHMdXuLrhi29L9BUxB=XrhORGtei-skxSXa5AJw6rwANXQ2g@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] dt-bindings: timer: renesas: ostm:
 Document Renesas RZ/G2L OSTM
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

On Wed, Nov 10, 2021 at 4:31 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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
