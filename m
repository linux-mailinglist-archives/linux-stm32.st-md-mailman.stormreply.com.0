Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE657A1A14
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Sep 2023 11:13:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7988C6B462;
	Fri, 15 Sep 2023 09:13:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AD24C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694769216; x=1726305216;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=mry5V7nr5xa9zDtsfeoNxabJToApg0Wq8K46aPBD860=;
 b=KUuG3Y/w8l0NqKflBTAkO/XqJDtG6zxDbMAUBETmq5FZaFsGyjfMqXHO
 riseMR2mhvMr9tGWBsk6IEZm4PvvqhtszGQiuN01NE72JYsqQDk3x4E6R
 fEUJzx9gRj9hONp4BSoJA9PFvLVmJKMybWIE4MGtdp4hofJUkFr/xJRlt
 UIAmO6paTlrhXU5ohft3J14XmxXBxxZKM37OAwkEjhiVpfI60qEI/BAei
 gF833Pvm8PNRKmGl09XxBCRH6MGTDN8z5z6ZIvdcgxd3VqXNkTFQPscux
 BrLNr9uXttAIYnDVoGYXZCQ0oTD7mtBCgIg5iiu/Uvq2lnYhGl37v8DBK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378120576"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="378120576"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918589081"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="918589081"
Received: from srdoo-mobl1.ger.corp.intel.com ([10.252.38.99])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:13:03 -0700
Date: Fri, 15 Sep 2023 12:12:58 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: John Ogness <john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-1-john.ogness@linutronix.de>
Message-ID: <1446dc6-5ab0-629-45c8-3b7d8c76367d@linux.intel.com>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hammer Hsieh <hammerh0314@gmail.com>, Jiamei Xie <jiamei.xie@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>,
 Thierry Reding <treding@nvidia.com>, Petr Mladek <pmladek@suse.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>,
 linux-unisoc@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Richard Genoud <richard.genoud@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
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
 Chunyan Zhang <zhang.lyra@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
 Lukas Wunner <lukas@wunner.de>, Sergey Organov <sorganov@gmail.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>,
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
 =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-snps-arc@lists.infradead.org, Jacky Huang <ychuang3@nuvoton.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 =?ISO-8859-15?Q?Jonathan_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Timur Tabi <timur@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
 Baruch Siach <baruch@tkos.co.il>, Tony Lindgren <tony@atomide.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Liviu Dudau <liviu.dudau@arm.com>, sparclinux@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org,
 Marek Vasut <marex@denx.de>, Lech Perczak <lech.perczak@camlingroup.com>,
 Russell King <linux@armlinux.org.uk>, Nick Hu <nick.hu@sifive.com>,
 Andy Gross <agross@kernel.org>, linux-serial <linux-serial@vger.kernel.org>,
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

On Thu, 14 Sep 2023, John Ogness wrote:

> When a serial port is used for kernel console output, then all
> modifications to the UART registers which are done from other contexts,
> e.g. getty, termios, are interference points for the kernel console.
> 
> So far this has been ignored and the printk output is based on the
> principle of hope. The rework of the console infrastructure which aims to
> support threaded and atomic consoles, requires to mark sections which
> modify the UART registers as unsafe. This allows the atomic write function
> to make informed decisions and eventually to restore operational state. It
> also allows to prevent the regular UART code from modifying UART registers
> while printk output is in progress.

Hi John,

Would this also be useful to enable printing to console while under port's 
lock (by postponing the output until the lock is released)?

E.g., 8250_dw.c has had this commented out since the dawn on time:
        /*
         * FIXME: this deadlocks if port->lock is already held
         * dev_err(p->dev, "Couldn't set LCR to %d\n", value);
         */

-- 
 i.


> All modifications of UART registers are guarded by the UART port lock,
> which provides an obvious synchronization point with the console
> infrastructure.
> 
> Provide and use wrapper functions for spin_[un]lock*(port->lock)
> invocations so that the console mechanics can be applied later on at a
> single place and does not require to copy the same logic all over the
> drivers.
> 
> Patch 1 adds the wrapper functions.
> 
> Patches 2-74 switch all uart port locking call sites to use the new
> wrappers. These patches were automatically generated using coccinelle.
> The 2 used coccinelle scripts are included below and executed as
> follows:
> 
> $ spatch --sp-file uartlock-1.cocci $FILE
> $ spatch --sp-file uartlock-2.cocci --recursive-includes $FILE
> 
> This series brings no functional change.
> 
> Patches 2-74 contain identical commit message bodies. Feel free to
> fold them into a single commit if that seems more reasonable.
> 
> Thomas Gleixner (74):
>   serial: core: Provide port lock wrappers
>   serial: core: Use lock wrappers
>   serial: 21285: Use port lock wrappers
>   serial: 8250_aspeed_vuart: Use port lock wrappers
>   serial: 8250_bcm7271: Use port lock wrappers
>   serial: 8250: Use port lock wrappers
>   serial: 8250_dma: Use port lock wrappers
>   serial: 8250_dw: Use port lock wrappers
>   serial: 8250_exar: Use port lock wrappers
>   serial: 8250_fsl: Use port lock wrappers
>   serial: 8250_mtk: Use port lock wrappers
>   serial: 8250_omap: Use port lock wrappers
>   serial: 8250_pci1xxxx: Use port lock wrappers
>   serial: altera_jtaguart: Use port lock wrappers
>   serial: altera_uart: Use port lock wrappers
>   serial: amba-pl010: Use port lock wrappers
>   serial: amba-pl011: Use port lock wrappers
>   serial: apb: Use port lock wrappers
>   serial: ar933x: Use port lock wrappers
>   serial: arc_uart: Use port lock wrappers
>   serial: atmel: Use port lock wrappers
>   serial: bcm63xx-uart: Use port lock wrappers
>   serial: cpm_uart: Use port lock wrappers
>   serial: digicolor: Use port lock wrappers
>   serial: dz: Use port lock wrappers
>   serial: linflexuart: Use port lock wrappers
>   serial: fsl_lpuart: Use port lock wrappers
>   serial: icom: Use port lock wrappers
>   serial: imx: Use port lock wrappers
>   serial: ip22zilog: Use port lock wrappers
>   serial: jsm: Use port lock wrappers
>   serial: liteuart: Use port lock wrappers
>   serial: lpc32xx_hs: Use port lock wrappers
>   serial: ma35d1: Use port lock wrappers
>   serial: mcf: Use port lock wrappers
>   serial: men_z135_uart: Use port lock wrappers
>   serial: meson: Use port lock wrappers
>   serial: milbeaut_usio: Use port lock wrappers
>   serial: mpc52xx: Use port lock wrappers
>   serial: mps2-uart: Use port lock wrappers
>   serial: msm: Use port lock wrappers
>   serial: mvebu-uart: Use port lock wrappers
>   serial: omap: Use port lock wrappers
>   serial: owl: Use port lock wrappers
>   serial: pch: Use port lock wrappers
>   serial: pic32: Use port lock wrappers
>   serial: pmac_zilog: Use port lock wrappers
>   serial: pxa: Use port lock wrappers
>   serial: qcom-geni: Use port lock wrappers
>   serial: rda: Use port lock wrappers
>   serial: rp2: Use port lock wrappers
>   serial: sa1100: Use port lock wrappers
>   serial: samsung_tty: Use port lock wrappers
>   serial: sb1250-duart: Use port lock wrappers
>   serial: sc16is7xx: Use port lock wrappers
>   serial: tegra: Use port lock wrappers
>   serial: core: Use port lock wrappers
>   serial: mctrl_gpio: Use port lock wrappers
>   serial: txx9: Use port lock wrappers
>   serial: sh-sci: Use port lock wrappers
>   serial: sifive: Use port lock wrappers
>   serial: sprd: Use port lock wrappers
>   serial: st-asc: Use port lock wrappers
>   serial: stm32: Use port lock wrappers
>   serial: sunhv: Use port lock wrappers
>   serial: sunplus-uart: Use port lock wrappers
>   serial: sunsab: Use port lock wrappers
>   serial: sunsu: Use port lock wrappers
>   serial: sunzilog: Use port lock wrappers
>   serial: timbuart: Use port lock wrappers
>   serial: uartlite: Use port lock wrappers
>   serial: ucc_uart: Use port lock wrappers
>   serial: vt8500: Use port lock wrappers
>   serial: xilinx_uartps: Use port lock wrappers
> 
>  drivers/tty/serial/21285.c                  |   8 +-
>  drivers/tty/serial/8250/8250_aspeed_vuart.c |   6 +-
>  drivers/tty/serial/8250/8250_bcm7271.c      |  28 +++---
>  drivers/tty/serial/8250/8250_core.c         |  12 +--
>  drivers/tty/serial/8250/8250_dma.c          |   8 +-
>  drivers/tty/serial/8250/8250_dw.c           |   8 +-
>  drivers/tty/serial/8250/8250_exar.c         |   4 +-
>  drivers/tty/serial/8250/8250_fsl.c          |   6 +-
>  drivers/tty/serial/8250/8250_mtk.c          |   8 +-
>  drivers/tty/serial/8250/8250_omap.c         |  52 +++++-----
>  drivers/tty/serial/8250/8250_pci1xxxx.c     |   8 +-
>  drivers/tty/serial/8250/8250_port.c         | 100 ++++++++++----------
>  drivers/tty/serial/altera_jtaguart.c        |  28 +++---
>  drivers/tty/serial/altera_uart.c            |  20 ++--
>  drivers/tty/serial/amba-pl010.c             |  20 ++--
>  drivers/tty/serial/amba-pl011.c             |  72 +++++++-------
>  drivers/tty/serial/apbuart.c                |   8 +-
>  drivers/tty/serial/ar933x_uart.c            |  26 ++---
>  drivers/tty/serial/arc_uart.c               |  16 ++--
>  drivers/tty/serial/atmel_serial.c           |  24 ++---
>  drivers/tty/serial/bcm63xx_uart.c           |  22 ++---
>  drivers/tty/serial/cpm_uart.c               |   8 +-
>  drivers/tty/serial/digicolor-usart.c        |  18 ++--
>  drivers/tty/serial/dz.c                     |  32 +++----
>  drivers/tty/serial/fsl_linflexuart.c        |  26 ++---
>  drivers/tty/serial/fsl_lpuart.c             |  88 ++++++++---------
>  drivers/tty/serial/icom.c                   |  26 ++---
>  drivers/tty/serial/imx.c                    |  84 ++++++++--------
>  drivers/tty/serial/ip22zilog.c              |  36 +++----
>  drivers/tty/serial/jsm/jsm_neo.c            |   4 +-
>  drivers/tty/serial/jsm/jsm_tty.c            |  16 ++--
>  drivers/tty/serial/liteuart.c               |  20 ++--
>  drivers/tty/serial/lpc32xx_hs.c             |  26 ++---
>  drivers/tty/serial/ma35d1_serial.c          |  22 ++---
>  drivers/tty/serial/mcf.c                    |  20 ++--
>  drivers/tty/serial/men_z135_uart.c          |   8 +-
>  drivers/tty/serial/meson_uart.c             |  30 +++---
>  drivers/tty/serial/milbeaut_usio.c          |  16 ++--
>  drivers/tty/serial/mpc52xx_uart.c           |  12 +--
>  drivers/tty/serial/mps2-uart.c              |  16 ++--
>  drivers/tty/serial/msm_serial.c             |  38 ++++----
>  drivers/tty/serial/mvebu-uart.c             |  18 ++--
>  drivers/tty/serial/omap-serial.c            |  38 ++++----
>  drivers/tty/serial/owl-uart.c               |  26 ++---
>  drivers/tty/serial/pch_uart.c               |  10 +-
>  drivers/tty/serial/pic32_uart.c             |  20 ++--
>  drivers/tty/serial/pmac_zilog.c             |  52 +++++-----
>  drivers/tty/serial/pxa.c                    |  30 +++---
>  drivers/tty/serial/qcom_geni_serial.c       |   8 +-
>  drivers/tty/serial/rda-uart.c               |  34 +++----
>  drivers/tty/serial/rp2.c                    |  20 ++--
>  drivers/tty/serial/sa1100.c                 |  20 ++--
>  drivers/tty/serial/samsung_tty.c            |  50 +++++-----
>  drivers/tty/serial/sb1250-duart.c           |  12 +--
>  drivers/tty/serial/sc16is7xx.c              |  40 ++++----
>  drivers/tty/serial/serial-tegra.c           |  32 +++----
>  drivers/tty/serial/serial_core.c            |  88 ++++++++---------
>  drivers/tty/serial/serial_mctrl_gpio.c      |   4 +-
>  drivers/tty/serial/serial_port.c            |   4 +-
>  drivers/tty/serial/serial_txx9.c            |  26 ++---
>  drivers/tty/serial/sh-sci.c                 |  68 ++++++-------
>  drivers/tty/serial/sifive.c                 |  16 ++--
>  drivers/tty/serial/sprd_serial.c            |  30 +++---
>  drivers/tty/serial/st-asc.c                 |  18 ++--
>  drivers/tty/serial/stm32-usart.c            |  38 ++++----
>  drivers/tty/serial/sunhv.c                  |  28 +++---
>  drivers/tty/serial/sunplus-uart.c           |  26 ++---
>  drivers/tty/serial/sunsab.c                 |  34 +++----
>  drivers/tty/serial/sunsu.c                  |  46 ++++-----
>  drivers/tty/serial/sunzilog.c               |  42 ++++----
>  drivers/tty/serial/timbuart.c               |   8 +-
>  drivers/tty/serial/uartlite.c               |  18 ++--
>  drivers/tty/serial/ucc_uart.c               |   4 +-
>  drivers/tty/serial/vt8500_serial.c          |   8 +-
>  drivers/tty/serial/xilinx_uartps.c          |  56 +++++------
>  include/linux/serial_core.h                 |  91 ++++++++++++++++--
>  76 files changed, 1086 insertions(+), 1007 deletions(-)
> 
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
