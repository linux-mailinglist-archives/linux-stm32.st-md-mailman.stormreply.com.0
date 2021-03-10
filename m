Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2533439B
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 17:49:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76621C5718D;
	Wed, 10 Mar 2021 16:49:19 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7138CC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 16:49:16 +0000 (UTC)
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N2Dgk-1ljdYb3LVm-013gIy for <linux-stm32@st-md-mailman.stormreply.com>; Wed,
 10 Mar 2021 17:49:16 +0100
Received: by mail-ot1-f46.google.com with SMTP id n23so11386342otq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 08:49:15 -0800 (PST)
X-Gm-Message-State: AOAM533FLYNNa4vLGGG90o1bMJZHzgbyKEaNvxksCzguN8cL9lUIH43c
 6td+sX8dPuMYVsPaUu3t+uQzvykN9MS0DzLfcIU=
X-Google-Smtp-Source: ABdhPJw1kIhr8ttdGXD5g+DpuAzvAToYG1aFxOSVPDl56eSY4x70c4eQdWZH4tiH2ZUpEN9KrRB/9/YZCrDgnKY8YZU=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr3227502otq.305.1615394954588; 
 Wed, 10 Mar 2021 08:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210310083840.481615-3-krzysztof.kozlowski@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 17:48:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a27hAExCKtsO7k1HQwLKk-5Q8uxYYt_G2v-Osq8RZv2tg@mail.gmail.com>
Message-ID: <CAK8P3a27hAExCKtsO7k1HQwLKk-5Q8uxYYt_G2v-Osq8RZv2tg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Provags-ID: V03:K1:1q5AuCFLV6R4DgLDlgM1UdiRnxtM4t0cMKFgmx02wRWpZOjy/il
 vmtVoBrQ7lLlL2a69vfbEGE35mCqBnIZG35Qao9+jVt4RiB+255qWwUGcM1U4mQovdeWRNl
 glGvrGR9F9gkonnVcDHnnOBL082y1h3Yir/9/yuRrmPX99J/Cs8b3C9yEFcVrVixYT75AOX
 ILkv/uc5QjqHGNq0RCfeg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jd6FRlfbC+Q=:zf+bUf+ebTEI27vMNDiXUT
 vEJ39xsH9iIF8s35LFEaHAkR8hvXNJmzBUINrCjJ5P0HX9JBt7xFElafuec/8bSOEqMX4+hkZ
 lNO4jXSsakz4v4O0ee9bjK/VKQdkV6rAUh4um+gdTNkttm5/rxfkkxrS7n3UZbyx9zsi/+6/N
 /WzUcKuiRitwLrWtgOFetmOty+28sLUngywM1wH+C+lpDeZ7MLReM1YX2vWean2rS2qszT49x
 2cm9B+l5XsIvxqomzIMAKQlwpuSZiA1t/ydiBWFs2qlIAoYp0VeOA8U/dKDNiBhPGGxXMibfz
 J2jtKOCkHlo+dtvqbHSzYLvdiL4W7UhAvo2C3UYYXmZfGl2j9SvpkniDY3ITJb4wzVJFJVReq
 KReZ5kvZFpaSNkCWSxP9V2L2YKoy5Ju1OjNY85r9ce0nufWEn5K5RsCWh3TFvu8Rbs5Prr7z5
 DR/9f30ZwtStmIloF48Bos940sO50gvxZk9Ekad7Z6NGHqmcwOaa07440XEQMgeBEJOaBjkkh
 gMIBc/naN0RSGcyt8qxZ1+A1vS5+LlpOeYNWm07H5rVwzRuV2noVBqxK7dvQL0esg==
Cc: DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Dinh Nguyen <dinguyen@kernel.org>,
 linux-fpga@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Will Deacon <will@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC v2 5/5] clk: socfpga: allow compile testing
 of Stratix 10 / Agilex clocks
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

On Wed, Mar 10, 2021 at 9:38 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> --- a/drivers/clk/socfpga/Kconfig
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -1,6 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
> +config COMMON_CLK_SOCFPGA
> +       bool "Intel SoCFPGA family clock support" if COMPILE_TEST && !ARCH_SOCFPGA && !ARCH_SOCFPGA64
> +       depends on ARCH_SOCFPGA || ARCH_SOCFPGA64 || COMPILE_TEST
> +       default y if ARCH_SOCFPGA || ARCH_SOCFPGA64

I think the 'depends on' line here is redundant if you also have the
'if' line and the default.

        Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
