Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48FA32646
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2025 13:51:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F5A2C78F6D;
	Wed, 12 Feb 2025 12:51:26 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6C9DC78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 12:51:19 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-868da0af0fcso212311241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 04:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739364677; x=1739969477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MQ/1ab/AMMhwdUM5h+TBMpEY47u6kr9GW+SYGBdGrF8=;
 b=NL9vgJDht7Fd556M2UMpc6jE+Q1p9mFQXCN3fhnAqQ3UctV2aTWf4ntWbuTT9t02B1
 x9mo3urPYIntwinITUSfDiXhZWHh8yZ64/5Wuq5Nk0OpckAl1mDBpZoH65xTudoriy9S
 9EzylSAk7NOXjEOEL3R95QA/MXCzmdVwGYo++BumBdDyH/HHpMsQgqHawvIZRKvixMLL
 Nx3eQBCBv4LjjIbF0iZ1xpkyRHH3BH8/llsihPJacGgCM1fvmB1uo37/uYHk6AKG6/s4
 GLD5hm54a34dlkaAzUXA27cL0eB6lY35SOoaEOGEz5B45zjRh2MAfiyoHxb7G7mWENEt
 +WNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx2KQT6yE7EtRfKX3k/08ODrm97WR+9JB98RlPyIGj7nyMLWL+mxUflJrvYP/tUz7oXTFyeXJOTh3l1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxAkZFb+ZO6kpN1xyUVyMaNMoC1XjzB08h1+zUEyNVkJGGPtl5m
 iHDG1JHx4CjaBYyG+y8v0/c+pK8UxGK4ZRceXgXf79raB9Fsn5LtlrNDnA3p
X-Gm-Gg: ASbGncsnk7HWbF9bW1sNN6f23o2aafh5NNT/ge5VzQyLhvjJI8GN4OtMru9DMPQADuu
 BjKcy/1ldqEOR/uabM5YP6+ApaOoNRU4HHwvC8S8QO8fWLAYZxdosJvMd8BpmbYOnkPBaT5JHH5
 X6gAPi2uYLnVIQJCs+ii9sH32gYG2x6MnNOhC47Yri5grMnHQAu2BKKjdNc93K4SXLMgkX+A7wI
 YpoNPGUYGPMl3wMfldlyXblgKzU9gQUJEyoRk4LH1dZqyLhYpWDu9+C4QQoUQNSkNXcRQfk6w9l
 sqbYbOvrwmt7xqs9VhT0ZWNeN9jfZw5N/oh/siAkeWzrqVVwtvczGg==
X-Google-Smtp-Source: AGHT+IH9Zut0IXmUUnKsNtNhZGI+ZwSBma6Ooh/KxrIf1s1Xs1kfHGrokSnF4U/Qf9XyM573z/sS2w==
X-Received: by 2002:a05:6102:f0f:b0:4bb:ba51:7d54 with SMTP id
 ada2fe7eead31-4bbf21c7eb9mr2377881137.6.1739364676599; 
 Wed, 12 Feb 2025 04:51:16 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868da36d5a4sm194469241.10.2025.02.12.04.51.15
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 04:51:15 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-4bbbf49a329so756609137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 04:51:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUVm+wQXRwHMCRJELw5Z5dx7uMMWkg4zlqlA+06EqZHkPRg0+KPLEsRwKxqz569uetfwBr3fCwimm0QqA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:3709:b0:4bb:d394:46c5 with SMTP id
 ada2fe7eead31-4bbf21cdce8mr2389568137.9.1739364674977; Wed, 12 Feb 2025
 04:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-5-patrice.chotard@foss.st.com>
In-Reply-To: <20250210131826.220318-5-patrice.chotard@foss.st.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 13:51:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkFym-3byZkszsi9tRoZ6zNOMCT79c2EgQQjn5xd19ig@mail.gmail.com>
X-Gm-Features: AWEUYZnzYg0ThTq4p4M8sQ0EhbXz6WBb20xXzFHLgeW2YGdd91BJTbWp42U4Smo
Message-ID: <CAMuHMdVkFym-3byZkszsi9tRoZ6zNOMCT79c2EgQQjn5xd19ig@mail.gmail.com>
To: patrice.chotard@foss.st.com
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/8] memory: Add STM32 Octo Memory
	Manager driver
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

Hi Patrice,

On Mon, 10 Feb 2025 at 14:21, <patrice.chotard@foss.st.com> wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Octo Memory Manager driver (OMM) manages:
>   - the muxing between 2 OSPI busses and 2 output ports.
>     There are 4 possible muxing configurations:
>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>         output is on port 2
>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>         OSPI2 output is on port 1
>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>   - the split of the memory area shared between the 2 OSPI instances.
>   - chip select selection override.
>   - the time between 2 transactions in multiplexed mode.
>   - check firewall access.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Thanks for your patch!

> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -225,6 +225,23 @@ config STM32_FMC2_EBI
>           devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
>           SOCs containing the FMC2 External Bus Interface.
>
> +config STM32_OMM
> +       tristate "STM32 Octo Memory Manager"
> +       depends on SPI_STM32_OSPI || TEST_COMPILE

COMPILE_TEST

> +       help
> +         This driver manages the muxing between the 2 OSPI busses and
> +         the 2 output ports. There are 4 possible muxing configurations:
> +         - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
> +              output is on port 2
> +         - OSPI1 and OSPI2 are multiplexed over the same output port 1
> +         - swapped mode (no multiplexing), OSPI1 output is on port 2,
> +              OSPI2 output is on port 1
> +         - OSPI1 and OSPI2 are multiplexed over the same output port 2
> +         It also manages :
> +           - the split of the memory area shared between the 2 OSPI instances.
> +           - chip select selection override.
> +           - the time between 2 transactions in multiplexed mode.
> +
>  source "drivers/memory/samsung/Kconfig"
>  source "drivers/memory/tegra/Kconfig"

> --- /dev/null
> +++ b/drivers/memory/stm32_omm.c

> +static int stm32_omm_set_amcr(struct device *dev, bool set)
> +{
> +       struct stm32_omm *omm = dev_get_drvdata(dev);
> +       struct regmap *syscfg_regmap;
> +       struct device_node *node;
> +       struct resource res, res1;
> +       resource_size_t mm_ospi2_size = 0;
> +       static const char * const mm_name[] = { "ospi1", "ospi2" };
> +       u32 amcr_base, amcr_mask;
> +       int ret, i, idx;

unsigned int i

> +       unsigned int amcr, read_amcr;
> +
> +       for (i = 0; i < omm->nb_child; i++) {
> +               idx = of_property_match_string(dev->of_node,
> +                                              "memory-region-names",
> +                                              mm_name[i]);
> +               if (idx < 0)
> +                       continue;
> +
> +               /* res1 only used on second loop iteration */
> +               res1.start = res.start;
> +               res1.end = res.end;
> +
> +               node = of_parse_phandle(dev->of_node, "memory-region", idx);
> +               if (!node)
> +                       continue;
> +
> +               ret = of_address_to_resource(node, 0, &res);
> +               if (ret) {
> +                       dev_err(dev, "unable to resolve memory region\n");
> +                       return ret;
> +               }
> +
> +               /* check that memory region fits inside OMM memory map area */
> +               if (!resource_contains(omm->mm_res, &res)) {
> +                       dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
> +                               mm_name[i]);
> +                       dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
> +                               res.start, res.end,
> +                               omm->mm_res->start, omm->mm_res->end);

As reported by the kernel test robot, this fails to build when
resource_size_t differs from unsigned long long.  However, you can
easily print the full resource instead:

    dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);

https://elixir.bootlin.com/linux/v6.13.2/source/Documentation/core-api/printk-formats.rst#L206

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
