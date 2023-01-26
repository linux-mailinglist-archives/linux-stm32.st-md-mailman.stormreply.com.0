Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E267C667
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jan 2023 09:57:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEF89C69058;
	Thu, 26 Jan 2023 08:57:27 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAD08C69056
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jan 2023 08:57:25 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id k6so1276893vsk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jan 2023 00:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+8Yo/HtiEGSzYrRQZv+JkTOd1mtgjj1wSt54yjMvxXA=;
 b=6Nf5zReKZ8yT444XIx+QEzV4pFF8FAIwZlmc2zGO8lBqUwvqibHf9tY5JJZdz2a9qr
 KcE8Z2EK4ag/9Qzck4xfYwQQ6EN1KV+jXbmzgqOykIa68J8URVyxYMz6gdqpp7elVwHO
 Ux8XbDTfOMJ7jxIchPS3pBGIJjktO4gfIY6hpV9020hnYkpdriRkK2AgYLR/vckfJ9pa
 ggQHLH4QO0N6aMPy6ZxpzFvUd2zmquE4JKZgDXxa98rtVqjOOaXMJEuv9vAHd7P+x/q+
 c/2FXR9GHvAvGKk0DeOqNf08KYzNx4lGT1gdQT+ubJw6nCw0SiTIxInkQ05lKP1/DCLQ
 494w==
X-Gm-Message-State: AO0yUKVdUC1moUh55EMLw0hylH+s8qM0rVhPjj7jknKot7eQ7OfPMDDy
 k88J62DedwkDoUNAD60jVs9pqNX9VFhcSg==
X-Google-Smtp-Source: AK7set8H2yJhICWGr+SJgwrZMkGz+m9Z7PSDNRlo83TB0HFW6zUbHiZy7inyCjYLHMlnVd+z4QLb9w==
X-Received: by 2002:a05:6102:38d0:b0:3e9:5bf0:26fa with SMTP id
 k16-20020a05610238d000b003e95bf026famr2822734vst.6.1674723444302; 
 Thu, 26 Jan 2023 00:57:24 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43]) by smtp.gmail.com with ESMTPSA id
 o6-20020ab03b46000000b005e92005298esm36788uaw.17.2023.01.26.00.57.24
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 00:57:24 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id e18so206383uax.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jan 2023 00:57:24 -0800 (PST)
X-Received: by 2002:a25:37d4:0:b0:80b:8602:f3fe with SMTP id
 e203-20020a2537d4000000b0080b8602f3femr1019227yba.36.1674723055416; Thu, 26
 Jan 2023 00:50:55 -0800 (PST)
MIME-Version: 1.0
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-10-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124091916.45054-10-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2023 09:50:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfD-G+SYQX5tJ8O-GSO3yTVL00xCX8A-Rc673zNkLbBw@mail.gmail.com>
Message-ID: <CAMuHMdXfD-G+SYQX5tJ8O-GSO3yTVL00xCX8A-Rc673zNkLbBw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Korsgaard <jacmet@sunsite.dk>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chester Lin <clin@suse.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-amlogic@lists.infradead.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Fugang Duan <fugang.duan@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Linux-stm32] [PATCH v2 12/12] dt-bindings: serial: example
	cleanup
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

On Tue, Jan 24, 2023 at 10:20 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Adjust example DTS indentation to match recommended style of 4-spaces
> and use lower-case hex for address in reg.  No functional change.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../bindings/serial/renesas,em-uart.yaml      | 10 +++----
>  .../bindings/serial/renesas,hscif.yaml        | 26 +++++++++----------
>  .../bindings/serial/renesas,sci.yaml          | 24 ++++++++---------
>  .../bindings/serial/renesas,scif.yaml         | 24 ++++++++---------
>  .../bindings/serial/renesas,scifa.yaml        | 22 ++++++++--------
>  .../bindings/serial/renesas,scifb.yaml        | 12 ++++-----

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
