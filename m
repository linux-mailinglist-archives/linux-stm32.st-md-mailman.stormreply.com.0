Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B555BD69
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 04:23:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D699C56630;
	Tue, 28 Jun 2022 02:23:06 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 963FEC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 02:23:04 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 184so10782990pga.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 19:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HJxtqab0/tMiakWNEyC3nFz1/Ap3ZwjlyjInjl9oQ08=;
 b=GtISRQAw32VwWkIqJjbS6kPz10YSeb/J+R05thf6bFPMAOY82jKQN3UdU/3Xm5A6wE
 tMPJ9jiXwXd5WIpoNmuhYObSQi+a4vbyn3XjCacf3FIX++nTWeWgUHF+xWdV2kFekLbZ
 0OzYqNi1FmudYoMCCJZeGvG2ye4sCgduv0rk2Zt4nVkQ98BfuFa3NPGjGKGgPVG9KtHY
 DntPc1msd2JalXRAlzsxyFpEjwPnKkzTvOPkfaVuXEaP+ZKelLBEm4Nr7ZrcOOgm/4RV
 HPa6kkD+OJGFCcd57tIyozXxW7wCGRkiieRac/DfVSrfyK1ch327OFoWU4ImG2SclPJ9
 uIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HJxtqab0/tMiakWNEyC3nFz1/Ap3ZwjlyjInjl9oQ08=;
 b=gh0yYOCfqo0qWuFzaqtb0mwdupSLDnnDy/2Y0DjgS1zseAblrGo4/3doWCSxlQ7P5T
 IS/s7r2xzi53OzS69XYqhvkUlQx/ZwoPXwHzwhH9O2kBmlb3sNDppoBC3FJ64Hbs80xc
 uHiXJNz3K4H/jYl9S8K8mzt3yZDTVCc+wDbdsk+Awluze2iitEbb9GflugSmhN/uScoc
 Dmi3ioPIfDgUMf1HCVVbk0LxZywOCr4gvSrRosLe5sVAsl+HW95XbxCfK3tEs89ajCil
 1eCmEs0ztYi43zIDpCTta7a9Fo02b21sR9+R5TUgJRwfV0P1I7q9jtW6IGGvvq+yqJBJ
 KT8g==
X-Gm-Message-State: AJIora/s5Psb9VuEIiKiAP+6s6Y5Ylf6Q7N3Dao43ulfLTkS22hd0Kq5
 jcnMmqx7Rm0yLmpPWJFlifvtzQ90G37jCeuiN6Y=
X-Google-Smtp-Source: AGRyM1tkELEQsXZZ9rCiYz26Ox2Bo3COuaabo0ODviEYu2B5j99coTUXvXqjCJz9EcYG+uOHPMvd9KNaBAGlSJExO9A=
X-Received: by 2002:a65:6a0e:0:b0:405:2310:22d0 with SMTP id
 m14-20020a656a0e000000b00405231022d0mr15760605pgu.290.1656382983124; Mon, 27
 Jun 2022 19:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220628020110.1601693-1-saravanak@google.com>
In-Reply-To: <20220628020110.1601693-1-saravanak@google.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Jun 2022 23:22:52 -0300
Message-ID: <CAOMZO5D29QqH_-pktht6yO_Ga7B7KgeGXxzyUHJWGYfGTJr4pw@mail.gmail.com>
To: Saravana Kannan <saravanak@google.com>
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@xilinx.com>,
 Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Richard Genoud <richard.genoud@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 sascha hauer <sha@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Tobias Klauser <tklauser@distanz.ch>, linux-mips@vger.kernel.org,
 kernel-team@android.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Andreas Farber <afaerber@suse.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>,
 heiner kallweit <hkallweit1@gmail.com>, ulf hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>,
 linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>,
 kevin hilman <khilman@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 paolo abeni <pabeni@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org,
 Timur Tabi <timur@kernel.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
 iommu@lists.linux-foundation.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Baruch Siach <baruch@tkos.co.il>, Liviu Dudau <liviu.dudau@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, joerg roedel <joro@8bytes.org>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, jakub kicinski <kuba@kernel.org>,
 will deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>, netdev <netdev@vger.kernel.org>,
 david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [Linux-stm32] [PATCH v1 0/2] Fix console probe delay when
	stdout-path isn't set
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

Hi Saravana,

On Mon, Jun 27, 2022 at 11:03 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Since the series that fixes console probe delay based on stdout-path[1] got
> pulled into driver-core-next, I made these patches on top of them.
>
> Even if stdout-path isn't set in DT, this patch should take console
> probe times back to how they were before the deferred_probe_timeout
> clean up series[2].
>
> Fabio/Ahmad/Sascha,
>
> Can you give this a shot please?

This series works fine for me (with and without stdout-path), thanks:

Tested-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
