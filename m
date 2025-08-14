Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C83B25E09
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 09:53:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B27AC36B3E;
	Thu, 14 Aug 2025 07:53:01 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 801E5C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 07:52:59 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-50f88cd722bso273043137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 00:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755157978; x=1755762778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1Ih+GxrJlx9WnOtqCehCJ3Lo5kUOBdBINzHA4pU3lA=;
 b=RO1Y6aBYBL8JVAr9fI8/Ryja4ytgYWE+T/GfXd/wPkxVYzAoU0j1U4afkPnHWgLn/7
 +bkSnizSq0nd4DmvC2NNA6GgARbLTaFFJtD3r0zcj841wPm37Iu4s5s5Yz4ewlqJ/RRW
 SoMrf1UTfrwe8ytwEQ8PDBneRaoHH813VNH+YrmXELd6ZXVDQuLInzG6QCBiJpTjA6u0
 hcylEQP/rDuJSmZhqUe4ROXIZ+Lha6RfjX6y1UQPjAKT0dZ7xUIMIdmB8/BG61l/9tbC
 q9n8rImJxFlyLJRwGSXhLbL+GApYJZTG3DGpYfVyzjSirB0av/s+HZy3py2B/g17Gd1t
 iAnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHb31iUHKjegBpB53rc7ckxrZvEuyKZ3yej6A/aZZrvReMJUVNOe0B6dC0BIMvJ406q3Z7LL5dZR3mwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+w+ptIhiNzB/aODqji36Yfq1OgBQsDhufJPM+hi9OtBAUHwyd
 93uoD8o5+DYhxVzoh+3HpX6oCUWIPbxdpJaBlbOmvYjpCpT3dC3thXjOBVuqNd1T
X-Gm-Gg: ASbGnctOywd73Yh2907QBQ/2GOH8FkLK23zHFFpZWDP78wVRTcfCPKXBudCTXYVtUBK
 JkwlIVmxZamdJ/q6faFYQJf4qZPq2pePf2zaYFoHokHeKzf/YXy4KX9jLyC3VvhRuRUtMBzCQAG
 anj6+Q9sNfrv/fEMj7SL/HUNmHczvMJUOWjBWJMtFWd0uHXmToaUiDFszy/3AprY+RZ44tzqrAV
 x+CitoJzgsIF8JTkJ945GbqDpBfCm5tmDt2mTSKQkt0f9T7qlKV7E1clJae45gfYfMp4b8MEVcN
 jCzbUnFzhR/o29gcqJen8PXsPPnFxLrSyXEtHzWnM6tj4BjkUpS1/Guedz3dFod0KUKUd/j+5+G
 hroiCmvrq6oTTlo/33MyLpJ0hDHGmMcDZxYLyyjD3L44G1Lj6TFtX8X/yJziL
X-Google-Smtp-Source: AGHT+IE8YnK2647OJU6ov6oJMnmjagm5qDNwRIRrC1PJ48KD9aqSL7XTXapvU+B8ezvLVXebR7mjTg==
X-Received: by 2002:a05:6102:6315:10b0:4e6:ddd0:96f7 with SMTP id
 ada2fe7eead31-50fe9f79d9fmr484054137.13.1755157977793; 
 Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-88e02989033sm3161378241.21.2025.08.14.00.52.57
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-50f85da6c3fso95521137.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUpS6UpvVYonly7SAZqhDA9wBh2M0HyDZvLTAQHuhQpVZAExKhU4OHFQFvN0QflhfhGloYVgLNanOrJmw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:8011:b0:4fb:def3:d27c with SMTP id
 ada2fe7eead31-50fea4aa249mr676943137.22.1755157976795; Thu, 14 Aug 2025
 00:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250813214808.895654-1-robh@kernel.org>
In-Reply-To: <20250813214808.895654-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 09:52:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk4rsv5YEj5kJ4+tu-n_11rXOHe1zJiy7KYnvBwJZ=eQ@mail.gmail.com>
X-Gm-Features: Ac12FXx9pwnYSd00OxlZFeC1ex7P8HZ3DAupd0C5lnYndVT3t4qqLZV8fVUeU-Q
Message-ID: <CAMuHMdXk4rsv5YEj5kJ4+tu-n_11rXOHe1zJiy7KYnvBwJZ=eQ@mail.gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] remoteproc: Use
	of_reserved_mem_region_* functions for "memory-region"
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

Hi Rob,

On Wed, 13 Aug 2025 at 23:48, Rob Herring (Arm) <robh@kernel.org> wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
>
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar

One nit below (which applies to most drivers).

> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -52,41 +52,33 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  {
>         struct device *dev = rproc->dev.parent;
>         struct device_node *np = dev->of_node;
> -       struct of_phandle_iterator it;
>         struct rproc_mem_entry *mem;
> -       struct reserved_mem *rmem;
> +       int i = 0;
>         u32 da;
>
>         /* Register associated reserved memory regions */
> -       of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> -       while (of_phandle_iterator_next(&it) == 0) {
> -
> -               rmem = of_reserved_mem_lookup(it.node);
> -               if (!rmem) {
> -                       of_node_put(it.node);
> -                       dev_err(&rproc->dev,
> -                               "unable to acquire memory-region\n");
> -                       return -EINVAL;
> -               }
> +       while (1) {
> +               struct resource res;
> +               int ret;
> +
> +               ret = of_reserved_mem_region_to_resource(np, i++, &res);
> +               if (ret)
> +                       return 0;
>
> -               if (rmem->base > U32_MAX) {
> -                       of_node_put(it.node);
> +               if (res.start > U32_MAX)
>                         return -EINVAL;
> -               }
>
>                 /* No need to translate pa to da, R-Car use same map */
> -               da = rmem->base;
> +               da = res.start;
>                 mem = rproc_mem_entry_init(dev, NULL,
> -                                          rmem->base,
> -                                          rmem->size, da,
> +                                          res.start,
> +                                          resource_size(&res), da,
>                                            rcar_rproc_mem_alloc,
>                                            rcar_rproc_mem_release,
> -                                          it.node->name);
> +                                          res.name);
>
> -               if (!mem) {
> -                       of_node_put(it.node);
> +               if (!mem)
>                         return -ENOMEM;
> -               }
>
>                 rproc_add_carveout(rproc, mem);
>         }

The "return 0;" below (out of context) is now unreachable.
It may be wise to remove it, so the compiler will complain when someone
ever adds a break statement, and people are forced to consider what
is the proper value to return.

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
