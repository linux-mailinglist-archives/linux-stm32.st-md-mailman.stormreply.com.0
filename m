Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B25B15F85
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:33:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63217C30883;
	Wed, 30 Jul 2025 11:33:14 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB932C3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 11:33:12 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-5390ccb30bfso1563297e0c.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 04:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753875191; x=1754479991;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nW9Fed3oaCcY5j8zAXTzmhRy4s/lDYERKz+lZhw5SjM=;
 b=OqxDZQiDDr1bBnd8S4Icpnzh3fPRjGoeBWaZPs+sd5zBmWEDnxt3eQnlhqhyonCFvr
 aoP5b9soK4m0rsJINQepqkD7gyZy0PCkOdEdfwR7qLwyFjhEvSQrGQ/MefgTpgEtrkzs
 jt1QK0IX3Ae3YWnHCMPv9qpCyO+d8x7RacwGsNROQO+ij7bf5CSYJH650dq/o400pZyu
 0gjhVjRCrbmscf3BRXKXadmqT/tsjKrom62KDk6jX6DTz+V8en4xqinAF8nRzvpgd6c9
 3Z2gsOJUGhjg6ToHTTqeTIf5JeFa0AkmEJku+rnIiezLXe6whxkESAk4xRcb0pOg0WHb
 2jNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNUcsr7Kf+9C7WWfZZl4w5JFl52OL7AEYhAbqy2Q5QLhq6dYE1kbLApjwNkyHThv240Dym2cPIn5R5Cg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJ2rZAcqqqbirwR3NEFlGiVQIHfzwCzc6Mx1XHwd7jbUaBlVQE
 ihE9Sml1652a1941R6hd0LiUfp4R1hlAsKKT/NKJVZBTPpMYOqXmLJq6F2igHbOS
X-Gm-Gg: ASbGnctn51zechII3VdlwvNjYv1kIqAfjiYoyLT92y00c91NXXEPBaaA9AFgLJxIqdT
 RbR+YN+LgX3dVqHajPKwn83jAolwF6rvkaPdW+50YT+ZgSlq2ELS4XCEdx/rJtopVxXL6rlaELm
 iAizesKnEiZm/F2xSvn2G+W5ZRoOTxBWS0F46eLDUnH6Fi0q0CxvC6dD2Mg+8jIb9fM4Ex+swk3
 oruXL5fs3iuguBROVKEj/mHiB5gqLuLxxAkGDekRYZ4ZbvbewUg26UkW5YxPUsspdjK3TvrbM+E
 sHW93V9mdaKLxvXt7/5raqQjAq8AORZniiboReVspA7vfXL+jjpORgD9cKheJx78ii+cbb97Lcg
 6FaHxBpPuUxsG3LPx5ufrmiQJvb10+OZOzGGbSwG3fXe7nWZb6ahUfEHJZ+B2
X-Google-Smtp-Source: AGHT+IFjXpnqOqOrhmk2NivktWCMcA29Mv3tK7Ey1GClOeeP9DGzTjwJFtm+7nUX5DflJSgdLEXwDw==
X-Received: by 2002:a05:6122:3c4e:b0:526:2210:5b68 with SMTP id
 71dfb90a1353d-5391cef1cf6mr1770950e0c.4.1753875191163; 
 Wed, 30 Jul 2025 04:33:11 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53919edc337sm694786e0c.2.2025.07.30.04.33.09
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 04:33:09 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-88bb987d8fbso1338490241.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 04:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQt+4zaxYRiQrwsytJWyEZqULAC1rUs3+QB9i206mqkPgQPfGT7AE2z7qTfJqoIBREsfYW6ypPswtomA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:418b:b0:4c5:4591:ffda with SMTP id
 ada2fe7eead31-4fbe87b425emr1711001137.21.1753875189085; Wed, 30 Jul 2025
 04:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 13:32:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
X-Gm-Features: Ac12FXwFObS4veqAcz-kMArtfpOLnucchkvqP_CejUTAp0AxApTTYboaikMMzJA
Message-ID: <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-spi@vger.kernel.org,
 Janne Grunau <j@jannau.net>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 linux-mips@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 asahi@lists.linux.dev, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-tegra@vger.kernel.org, Sven Peter <sven@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Saravana Kannan <saravanak@google.com>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RFC 3/6] dmaengine: qcom: gpi: Accept
	protocol ID hints
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

Hi Konrad,

On Wed, 30 Jul 2025 at 11:35, Konrad Dybcio <konradybcio@kernel.org> wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Client drivers may now pass hints to dmaengine drivers. GPI DMA's only
> consumers (GENI SEs) need to pass a protocol (I2C, I3C, SPI, etc.) ID
> to the DMA engine driver, for it to take different actions.
>
> Currently, that's done through passing that ID through device tree,
> with each Serial Engine expressed NUM_PROTOCOL times, resulting in
> terrible dt-bindings that are full of useless copypasta.
>
> To help get rid of that, accept the driver cookie instead, while
> keeping backwards compatibility.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2145,7 +2151,8 @@ static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
>         }
>
>         gchan->seid = seid;
> -       gchan->protocol = args->args[2];
> +       /* The protocol ID is in the teens range, simply ignore the higher bits */
> +       gchan->protocol = (u32)((u64)proto);

A single cast "(uintptr_t)" should be sufficient.
Casing the pointer to u64 on 32-bit may trigger:

    warning: cast from pointer to integer of different size
[-Wpointer-to-int-cast]

>
>         return dma_get_slave_channel(&gchan->vc.chan);
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
