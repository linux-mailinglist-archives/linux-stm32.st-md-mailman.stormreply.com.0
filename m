Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ECB56312D
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Jul 2022 12:18:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB55FC640EB;
	Fri,  1 Jul 2022 10:18:12 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3547C03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Jul 2022 10:18:11 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id d145so19837ybh.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Jul 2022 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IK1q7pWvnzmd2/yzmMQOB6gFUgHkXgsyzwODpSKqHtU=;
 b=jSDpH5b4ezTXYDkI+Kv1qjoulW4GueRKAo9MfvH6Or74WD1aO19b0yl9X6h7ikpgsb
 Yzj9/9QR8pvv9s537mQBeUk8bodicRt2sYNtrKP02dXkQyCDQKSj99VRGbrzh5/zLrXe
 3DbujuLPciSi5vALJ+old//V6zoLm6pd0LhvBAARG1SXsh/2UP6qVVa/FfV3DuM5if+u
 lMLgaAYtih653stfzpF6JzV1TgtPEvIAiwFM7x+VFO7m6+ikg5S95jdc8NlSpoxf6NUC
 chD7vf96GrCNEtWT2dpp9TfC5k1TkiGvGH1SczyJzPL6/3uFcjCYC/RxAKuWF753UD7k
 NBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IK1q7pWvnzmd2/yzmMQOB6gFUgHkXgsyzwODpSKqHtU=;
 b=1OudtOSP7+rl/ImlsfHKxhjxlt5Yx0+jMxt9OdWYvoMeKxLKz3fbbZZCsxuR82HQmA
 QVUiBqpzPOyZsO2LBa6IocYZoUfPtX1lu5EX9DALEi9A/q+AVb59xdpzfZ8aait1HyIt
 paZ8PDe8/wG65bBdBQYx1ZIPpTc7OzKq6qXGeJr0TF3fxmdtqHdmSFrBY13yNgoykiF5
 Eosv3BCaxsvTbwlPRCLNfKqNE9NSUvfBMz8BkmtRh/O/TQ2OgISEuh9BXGkpgO9J8ztE
 Q7o/4b+qkVriKMrw6GGtKvJYp+vOphmwEuKYr5vffLHay0VYqJGUR52jqfdInxgGHyfk
 8LNA==
X-Gm-Message-State: AJIora9v4syZkuOY36ubtJSKa9zsmR7l8AmBmu/elkH3mDgpQcda1Q4G
 2woJP45YJpDfhWqqPWpYKct4/DT1W6KFJJvhras=
X-Google-Smtp-Source: AGRyM1tvrcPaXjb6qpRZmlm3mN1+HaZ3X5zFt5Vb6BDK08mCBJ8qF4vfcIrvo5gC3LEAhM4YrPgldTFVhwpUgFcS228=
X-Received: by 2002:a05:6902:1549:b0:66d:5f76:27ba with SMTP id
 r9-20020a056902154900b0066d5f7627bamr14092504ybu.385.1656670690515; Fri, 01
 Jul 2022 03:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com>
 <20220701012647.2007122-3-saravanak@google.com>
In-Reply-To: <20220701012647.2007122-3-saravanak@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 1 Jul 2022 12:17:33 +0200
Message-ID: <CAHp75Vdw8pZePnqR=mmJh4pv0bPMRJE=p7-cG3akskdxMHmoKw@mail.gmail.com>
To: Saravana Kannan <saravanak@google.com>
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@xilinx.com>,
 Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-unisoc@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Genoud <richard.genoud@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 sascha hauer <sha@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Tobias Klauser <tklauser@distanz.ch>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-actions@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Andreas Farber <afaerber@suse.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>,
 heiner kallweit <hkallweit1@gmail.com>, ulf hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>,
 kevin hilman <khilman@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 paolo abeni <pabeni@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org,
 Timur Tabi <timur@kernel.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Laxman Dewangan <ldewangan@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Baruch Siach <baruch@tkos.co.il>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Sparc kernel list <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, joerg roedel <joro@8bytes.org>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 jakub kicinski <kuba@kernel.org>, will deacon <will@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>, netdev <netdev@vger.kernel.org>,
 david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] serial: Set probe_no_timeout for
	all DT based drivers
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

On Fri, Jul 1, 2022 at 3:28 AM Saravana Kannan <saravanak@google.com> wrote:
>
> With commit 71066545b48e ("driver core: Set fw_devlink.strict=1 by
> default") the probing of TTY consoles could get delayed if they have
> optional suppliers that are listed in DT, but those suppliers don't
> probe by the time kernel boot finishes. The console devices will probe
> eventually after driver_probe_timeout expires.
>
> However, since consoles are often used for debugging kernel issues, it
> does not make sense to delay their probe. So, set the newly added
> probe_no_timeout flag for all serial drivers that at DT based. This way,
> fw_devlink will know not to delay the probing of the consoles past
> kernel boot.

Same question, do you think only serial drivers need that?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
