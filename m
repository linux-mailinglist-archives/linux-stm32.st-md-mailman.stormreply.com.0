Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF777A1E01
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Sep 2023 14:04:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8C1DC6B462;
	Fri, 15 Sep 2023 12:04:17 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED8E3C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 12:04:15 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1694779455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q3Ibg3p9cDagivhDktxq8eP8BYordpmk7hum3Axk04g=;
 b=hfofoNUXRajtM0GjlTDL3S8uCPrZulnUAl3sDOuUPa5oy4jGgAgNbuoN9zq30CvsIMo6cQ
 76S8YLIyYmUWLWqXq+B6LailcKKqcikZGHOc4Erpeot3J8LvMzg2R6WVBIi3xzRwnUY395
 pS/yCtuKAjRQXT0+x4oEIpQyUhpbeGdMECufG8cXCZoM+44lexmwXf4O2LHWyQ5xwYsTtI
 hG+jNq5wP5koi7uiKsR8aQVs4cDip7FcG5dlrN7qOoLDiEan+8YKeUcutQq6RBBnllQ/za
 F8F1a6fTyU+1T0L+VnAkTGdL1QBpNnEZDKqVeyezp0ZEm/31ANRktL+QyqAdKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1694779455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q3Ibg3p9cDagivhDktxq8eP8BYordpmk7hum3Axk04g=;
 b=XoGHAuaQljzpxY7rNPRk66q5CkUTImgsUWadAIDMEofDY3WaI6vm1ZUxH4Wc2bfKw2zqPJ
 9SjBirKXUrFTwlAA==
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, John Ogness
 <john.ogness@linutronix.de>
In-Reply-To: <alpine.DEB.2.21.2309141959100.57368@angie.orcam.me.uk>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
 <alpine.DEB.2.21.2309141959100.57368@angie.orcam.me.uk>
Date: Fri, 15 Sep 2023 14:04:14 +0200
Message-ID: <87il8b1w3l.ffs@tglx>
MIME-Version: 1.0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hammer Hsieh <hammerh0314@gmail.com>, Jiamei Xie <jiamei.xie@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>,
 Thierry Reding <treding@nvidia.com>, Petr Mladek <pmladek@suse.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>,
 linux-unisoc@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Richard Genoud <richard.genoud@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 delisun <delisun@pateo.com.cn>, Fabio Estevam <festevam@gmail.com>,
 Ruan Jinjie <ruanjinjie@huawei.com>,
 Matthew Howell <matthew.howell@sealevel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Hongyu Xie <xiehongyu1@kylinos.cn>, Tobias Klauser <tklauser@distanz.ch>,
 Yangtao Li <frank.li@vivo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, Sherry Sun <sherry.sun@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "David
 S. Miller" <davem@davemloft.net>,
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
 Lukas Wunner <lukas@wunner.de>, Sergey Organov <sorganov@gmail.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>, Tom Rix <trix@redhat.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>,
 Yuan Can <yuancan@huawei.com>, Isaac True <isaac.true@canonical.com>,
 linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Kevin Cernekee <cernekee@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>,
 Ilpo =?utf-8?Q?J?= =?utf-8?Q?=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-snps-arc@lists.infradead.org, Jacky Huang <ychuang3@nuvoton.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Timur Tabi <timur@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Baruch Siach <baruch@tkos.co.il>, Tony Lindgren <tony@atomide.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Liviu Dudau <liviu.dudau@arm.com>, sparclinux@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org,
 Marek Vasut <marex@denx.de>, Lech Perczak <lech.perczak@camlingroup.com>,
 Russell King <linux@armlinux.org.uk>, Nick Hu <nick.hu@sifive.com>,
 Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Lucas Tanure <tanure@linux.com>,
 Andrew Davis <afd@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH tty v1 00/74] serial: wrappers for uart
	port lock
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

On Thu, Sep 14 2023 at 20:01, Maciej W. Rozycki wrote:

> On Thu, 14 Sep 2023, John Ogness wrote:
>
>> Patches 2-74 switch all uart port locking call sites to use the new
>> wrappers. These patches were automatically generated using coccinelle.
>
>  Hmm, no need to do this for drivers/tty/serial/zs.c?

zs.c does not use port lock at all. It has like a couple of other
drivers a local homebrewn spinlock.

Thanks,

        tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
