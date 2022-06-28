Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F34855BD1E
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 04:03:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA99EC04003;
	Tue, 28 Jun 2022 02:03:06 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96BA2C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 02:03:05 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 s194-20020a252ccb000000b00669b5702413so9817878ybs.22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 19:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=/OuahP8oPHDxIXADrtMOHzHvbE6HS+PoE4WDHegn+rY=;
 b=XSa6BG9j+Us6qSO6vPHqc2TVfQxumnU0pAOfjBJHFlWcIck0At2n2mfq5tAA7z3Bx5
 PD0vlBv1k9Q/E/30MAFFG1P5OxPr5/WK6+axB0HoavtP7KnHzjHkg1qUFmVSky1XYmCE
 keKg7zc6YYKZDYEnwk3qbSxvFO3Xk4Y8/tdDX97msFctgpLZBdPkJDnH5LbWzXx7pTZH
 CgzyIamG5okMqCh9aY8wAvuFixrOfwL/UhwfbnX/7paM2krnQNZDjv67WdvSzvvMWo7D
 m5fFpT4ZoMrA6AasD66OkuDUwH3oHEeuCSo5kX9VLcSW8/gQ+X2898P5YGyQhyrYIK8G
 Aulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=/OuahP8oPHDxIXADrtMOHzHvbE6HS+PoE4WDHegn+rY=;
 b=xOIwR6ZMSiDmPk/E0SEr3QkbvYAhDCIKCcTQgb1hYAoCjcba39i2TMa8tcHLq41Ped
 7TNHKF7JYnU3iINw8WS9lPmYY1rNBLNxpYc4IvV5cYuKerVaeHJI4u1XLG6Y9OA+81bU
 H2NOcZdCvVyZ+vhHdoVvVf8ScWLHqU+HgAJzYA8pKYUG7IWj3W3akj1ALQUUs2qJeLCI
 Au50ap0qOvGg02VoAvXNFJB6kVrLkczkFY3pKQTf9mVonb7lSIHnTYhUUtbyke/xHfzU
 cV8pOfPvpgjeLbfG8siSeg+fubYw9VbtdA8c9bPvgSFkEoRzPGlUqaxhUCTKVwEh1nEy
 WnyA==
X-Gm-Message-State: AJIora/bH2WAMMY8SSIOfNSL8tTlCNDNxfRUUCZmZGdHPlzv4TKr7MWa
 EYFL7mO1cgN/TbrFzSiTA17qxoRy/G1mp9Q=
X-Google-Smtp-Source: AGRyM1s6TFssoICBD8dW4KaHJ9QFnbGLouWSVAgJ1icUDVgZq5pRLN92A6h2ACkaFVoX2i0qb9ktR7y39ECy36c=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:1f27:a302:2101:1c82])
 (user=saravanak job=sendgmr) by 2002:a81:9292:0:b0:317:dd64:5adc with SMTP id
 j140-20020a819292000000b00317dd645adcmr19123629ywg.145.1656381784427; Mon, 27
 Jun 2022 19:03:04 -0700 (PDT)
Date: Mon, 27 Jun 2022 19:01:01 -0700
Message-Id: <20220628020110.1601693-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Al Cooper <alcooperx@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Paul Cercueil <paul@crapouillou.net>, 
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Tobias Klauser <tklauser@distanz.ch>, Russell King <linux@armlinux.org.uk>, 
 Vineet Gupta <vgupta@kernel.org>, Richard Genoud <richard.genoud@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexander Shiyan <shc_work@mail.ru>, 
 Baruch Siach <baruch@tkos.co.il>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
 Gabriel Somlo <gsomlo@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pali Rohar <pali@kernel.org>, 
 Andreas Farber <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Hammer Hsieh <hammerh0314@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Timur Tabi <timur@kernel.org>, 
 Michal Simek <michal.simek@xilinx.com>, Saravana Kannan <saravanak@google.com>
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>,
 linux-aspeed@lists.ozlabs.org, linus walleij <linus.walleij@linaro.org>,
 ulf hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 eric dumazet <edumazet@google.com>, pavel machek <pavel@ucw.cz>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 will deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 sascha hauer <sha@pengutronix.de>, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, kevin hilman <khilman@kernel.org>,
 joerg roedel <joro@8bytes.org>, linux-serial@vger.kernel.org,
 jakub kicinski <kuba@kernel.org>, paolo abeni <pabeni@redhat.com>,
 kernel-team@android.com, len brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-unisoc@lists.infradead.org, hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
 netdev@vger.kernel.org, david ahern <dsahern@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, heiner kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v1 0/2] Fix console probe delay when
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

Since the series that fixes console probe delay based on stdout-path[1] got
pulled into driver-core-next, I made these patches on top of them.

Even if stdout-path isn't set in DT, this patch should take console
probe times back to how they were before the deferred_probe_timeout
clean up series[2].

Fabio/Ahmad/Sascha,

Can you give this a shot please?

[1] - https://lore.kernel.org/lkml/20220623080344.783549-1-saravanak@google.com/
[2] - https://lore.kernel.org/lkml/20220601070707.3946847-1-saravanak@google.com/

Thanks,
Saravana

cc: Rob Herring <robh@kernel.org>
cc: sascha hauer <sha@pengutronix.de>
cc: peng fan <peng.fan@nxp.com>
cc: kevin hilman <khilman@kernel.org>
cc: ulf hansson <ulf.hansson@linaro.org>
cc: len brown <len.brown@intel.com>
cc: pavel machek <pavel@ucw.cz>
cc: joerg roedel <joro@8bytes.org>
cc: will deacon <will@kernel.org>
cc: andrew lunn <andrew@lunn.ch>
cc: heiner kallweit <hkallweit1@gmail.com>
cc: russell king <linux@armlinux.org.uk>
cc: "david s. miller" <davem@davemloft.net>
cc: eric dumazet <edumazet@google.com>
cc: jakub kicinski <kuba@kernel.org>
cc: paolo abeni <pabeni@redhat.com>
cc: linus walleij <linus.walleij@linaro.org>
cc: hideaki yoshifuji <yoshfuji@linux-ipv6.org>
cc: david ahern <dsahern@kernel.org>
cc: kernel-team@android.com
cc: linux-kernel@vger.kernel.org
cc: linux-pm@vger.kernel.org
cc: iommu@lists.linux-foundation.org
cc: netdev@vger.kernel.org
cc: linux-gpio@vger.kernel.org
Cc: kernel@pengutronix.de

Saravana Kannan (2):
  driver core: Add probe_no_timeout flag for drivers
  serial: Set probe_no_timeout for all DT based drivers

 drivers/base/base.h                         |  1 +
 drivers/base/core.c                         |  7 +++++++
 drivers/base/dd.c                           |  3 +++
 drivers/tty/ehv_bytechan.c                  |  1 +
 drivers/tty/goldfish.c                      |  1 +
 drivers/tty/hvc/hvc_opal.c                  |  1 +
 drivers/tty/serial/8250/8250_acorn.c        |  1 -
 drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
 drivers/tty/serial/8250/8250_bcm2835aux.c   |  1 +
 drivers/tty/serial/8250/8250_bcm7271.c      |  1 +
 drivers/tty/serial/8250/8250_dw.c           |  1 +
 drivers/tty/serial/8250/8250_em.c           |  1 +
 drivers/tty/serial/8250/8250_ingenic.c      |  1 +
 drivers/tty/serial/8250/8250_lpc18xx.c      |  1 +
 drivers/tty/serial/8250/8250_mtk.c          |  1 +
 drivers/tty/serial/8250/8250_of.c           |  1 +
 drivers/tty/serial/8250/8250_omap.c         |  1 +
 drivers/tty/serial/8250/8250_pxa.c          |  1 +
 drivers/tty/serial/8250/8250_tegra.c        |  1 +
 drivers/tty/serial/8250/8250_uniphier.c     |  1 +
 drivers/tty/serial/altera_jtaguart.c        |  1 +
 drivers/tty/serial/altera_uart.c            |  1 +
 drivers/tty/serial/amba-pl011.c             |  1 +
 drivers/tty/serial/apbuart.c                |  1 +
 drivers/tty/serial/ar933x_uart.c            |  1 +
 drivers/tty/serial/arc_uart.c               |  1 +
 drivers/tty/serial/atmel_serial.c           |  1 +
 drivers/tty/serial/bcm63xx_uart.c           |  1 +
 drivers/tty/serial/clps711x.c               |  1 +
 drivers/tty/serial/cpm_uart/cpm_uart_core.c |  1 +
 drivers/tty/serial/digicolor-usart.c        |  1 +
 drivers/tty/serial/fsl_linflexuart.c        |  1 +
 drivers/tty/serial/fsl_lpuart.c             |  1 +
 drivers/tty/serial/imx.c                    |  1 +
 drivers/tty/serial/lantiq.c                 |  1 +
 drivers/tty/serial/liteuart.c               |  1 +
 drivers/tty/serial/lpc32xx_hs.c             |  1 +
 drivers/tty/serial/max310x.c                |  1 +
 drivers/tty/serial/meson_uart.c             |  1 +
 drivers/tty/serial/milbeaut_usio.c          |  1 +
 drivers/tty/serial/mpc52xx_uart.c           |  1 +
 drivers/tty/serial/mps2-uart.c              |  1 +
 drivers/tty/serial/msm_serial.c             |  1 +
 drivers/tty/serial/mvebu-uart.c             |  1 +
 drivers/tty/serial/mxs-auart.c              |  1 +
 drivers/tty/serial/omap-serial.c            |  1 +
 drivers/tty/serial/owl-uart.c               |  1 +
 drivers/tty/serial/pic32_uart.c             |  1 +
 drivers/tty/serial/pmac_zilog.c             |  1 +
 drivers/tty/serial/pxa.c                    |  1 +
 drivers/tty/serial/qcom_geni_serial.c       |  1 +
 drivers/tty/serial/rda-uart.c               |  1 +
 drivers/tty/serial/samsung_tty.c            |  1 +
 drivers/tty/serial/sc16is7xx.c              |  1 +
 drivers/tty/serial/serial-tegra.c           |  1 +
 drivers/tty/serial/sh-sci.c                 |  1 +
 drivers/tty/serial/sifive.c                 |  1 +
 drivers/tty/serial/sprd_serial.c            |  1 +
 drivers/tty/serial/st-asc.c                 |  1 +
 drivers/tty/serial/stm32-usart.c            |  1 +
 drivers/tty/serial/sunhv.c                  |  1 +
 drivers/tty/serial/sunplus-uart.c           |  1 +
 drivers/tty/serial/sunsab.c                 |  1 +
 drivers/tty/serial/sunsu.c                  |  1 +
 drivers/tty/serial/sunzilog.c               |  1 +
 drivers/tty/serial/tegra-tcu.c              |  1 +
 drivers/tty/serial/uartlite.c               |  1 +
 drivers/tty/serial/ucc_uart.c               |  1 +
 drivers/tty/serial/vt8500_serial.c          |  1 +
 drivers/tty/serial/xilinx_uartps.c          |  1 +
 include/linux/device.h                      |  7 +++++++
 include/linux/device/driver.h               | 11 +++++++++++
 72 files changed, 95 insertions(+), 1 deletion(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
