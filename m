Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344711DF1E
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2019 09:09:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF53AC36B0B;
	Fri, 13 Dec 2019 08:09:27 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BCD5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 00:07:16 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z124so506711pgb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 16:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iu0ZHHpoa2S/s6q/AtXMlnqWAKo36xS0Mhh784bJZYw=;
 b=QiGJQwcgFjSO13uljrEjqqU+gpfX3BearZe4cm0Fxz712OWJLfhV+4r3S4IUDdWe3q
 jUzW78JOYK/SejZUC83GaY+As3EQc2QE6jEMaRVazPojdNRbpnNI1BDGsdQSBZUNTLIf
 l42Fn7f++Ak+1t/Eso6neZ1309/jr9t/hERGHDFs3hJ4VPixZQ7WRmV7HwqQCtGGK8/M
 ZKoNcqnpS08Pt/533IO03qs9PMh6saC3HiQpwVwJ8CEJ/8KH7x+2mU1loULtGwAV7VT1
 4+B9pU9gbNIVphVxkpEsZjw3pEtNKf160OHo1klwj3oEy7rWBaxYyHGHQoEMvkKrGnMy
 piQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iu0ZHHpoa2S/s6q/AtXMlnqWAKo36xS0Mhh784bJZYw=;
 b=Hy+SPwqTIOrifNoD2KXcWS05w8FNj6gClcGKFUq/L3NeJUzRJpK6e1tTpStaLxT9G5
 XGI4W1B6Gm70e/tdy0ev2B/kuv86+ESp4U8NbDJtwx0W6YTEE3g6dj/Q9VtBLOGZ4t2J
 7/WnYxfOEYGSxB8XkcZXudrBvjDZAoCDQokdy2FWU85i/fW+LnMi+qWcJxA/crHokoYH
 vv7F863V+vfZUAh/vINswRJXPBeGHVAfHC/5i147g/DKk6/xUXnWz5jAJL2ZU9wiIHfT
 do/PHmATYbBAz3ecbZ/1eBYUb6iD+rKuebzPKOU7k5t/Y0zfm5H/KWsIrst9Zmi1Oxyn
 fAwA==
X-Gm-Message-State: APjAAAX5zPpfRRPp4x9xxoZq+muteLddwJmtCAjHKQxltTeRDcjQkdZD
 qUdzbq6FT4ksnuWnsPembHPIzw==
X-Google-Smtp-Source: APXvYqzCsSFyDW1VNoPiCFbPpjDPM2JXmKeMPce+jSVN1BtS0JF+BuC7yZV1+AcEYKFQ0q0Fv4jYJA==
X-Received: by 2002:a62:e50d:: with SMTP id n13mr5086768pff.201.1576195634578; 
 Thu, 12 Dec 2019 16:07:14 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j38sm8317647pgj.27.2019.12.12.16.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 16:07:13 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 13 Dec 2019 00:05:59 +0000
Message-Id: <20191213000657.931618-1-dima@arista.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:09:26 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>, "Maciej W. Rozycki" <macro@linux-mips.org>,
 sparclinux@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Kees Cook <keescook@chromium.org>, Vasiliy Khoruzhick <vasilykh@arista.com>,
 Alexander Shiyan <shc_work@mail.ru>, Dmitry Safonov <dima@arista.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Russell King <linux@armlinux.org.uk>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Orson Zhai <orsonzhai@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Kevin Hilman <khilman@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Timur Tabi <timur@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tony Prisk <linux@prisktech.co.nz>, Richard Genoud <richard.genoud@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vineet Gupta <vgupta@synopsys.com>, Baolin Wang <baolin.wang7@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH 00/58] serial/sysrq: Cleanup ifdeffery
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

The original purpose of the patches set was to add a way to enable
sysrq on a uart where currently it can be constantly either on or off
(CONFIG_MAGIC_SYSRQ_SERIAL), see the last patch:
  "serial/sysrq: Add MAGIC_SYSRQ_SERIAL_SEQUENCE"

But to do that, I had to add uart_try_toggle_sysrq() and I didn't want
to bloat serial_core.h even more. So, I did cleanup by removing
SUPPORT_SYSRQ resulting in a nice diff-stat and lesser ifdeffery.

Most patches are one-liners, I decided to keep them separated per-driver
to let reviewers easier follow the purpose.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Vasiliy Khoruzhick <vasilykh@arista.com>
Cc: linux-serial@vger.kernel.org

Dmitry Safonov (58):
  sysrq: Remove sysrq_handler_registered
  serial: Move sysrq members above
  serial_core: Un-ifdef sysrq SUPPORT_SYSRQ
  tty/serial: Migrate aspeed_vuart to use has_sysrq
  tty/serial: Migrate 8250_fsl to use has_sysrq
  tty/serial: Migrate bcm63xx_uart to use has_sysrq
  tty/serial: Migrate 8250_omap to use has_sysrq
  tty/serial: Migrate 8250_port to use has_sysrq
  tty/serial: Migrate amba-pl01* to use has_sysrq
  tty/serial: Migrate apbuart to use has_sysrq
  tty/serial: Migrate arc_uart to use has_sysrq
  tty/serial: Migrate atmel_serial to use has_sysrq
  tty/serial: Migrate clps711x to use has_sysrq
  tty/serial: Migrate cpm_uart to use has_sysrq
  tty/serial: Migrate dz to use has_sysrq
  tty/serial: Migrate efm32-uart to use has_sysrq
  tty/serial: Migrate fsl_linflexuart to use has_sysrq
  tty/serial: Migrate fsl_lpuart to use has_sysrq
  tty/serial: Migrate imx to use has_sysrq
  tty/serial: Migrate ip22zilog to use has_sysrq
  tty/serial: Migrate meson_uart to use has_sysrq
  tty/serial: Migrate milbeaut_usio to use has_sysrq
  tty/serial: Migrate mpc52xx_uart to use has_sysrq
  tty/serial: Don't zero port->sysrq
  tty/serial: Migrate msm_serial to use has_sysrq
  tty/serial: Migrate mux to use has_sysrq
  tty/serial: Migrate mxs-auart to use has_sysrq
  tty/serial: Migrate omap-serial to use has_sysrq
  tty/serial: Migrate pch_uart to use has_sysrq
  tty/serial: Don't check port->sysrq
  tty/serial: Migrate pmac_zilog to use has_sysrq
  tty/serial: Migrate pnx8xxx_uart to use has_sysrq
  serial/f81534: Don't check port->sysrq
  tty/serial: Migrate pxa to use has_sysrq
  tty/serial: Migrate qcom_geni_serial to use has_sysrq
  tty/serial: Migrate sa1100 to use has_sysrq
  tty/serial: Migrate samsung_tty to use has_sysrq
  tty/serial: Migrate sb1250-duart to use has_sysrq
  tty/serial: Migrate sccnxp to use has_sysrq
  tty/serial: Migrate serial_txx9 to use has_sysrq
  tty/serial: Migrate sh-sci to use has_sysrq
  tty/serial: Migrate sprd_serial to use has_sysrq
  tty/serial: Migrate st-asc to use has_sysrq
  tty/serial: Migrate stm32-usart to use has_sysrq
  tty/serial: Migrate sunhv to use has_sysrq
  tty/serial: Migrate sunsab to use has_sysrq
  tty/serial: Migrate sunsu to use has_sysrq
  tty/serial: Migrate sunzilog to use has_sysrq
  serial/ucc_uart: Remove ifdef SUPPORT_SYSRQ
  tty/serial: Migrate vr41xx_siu to use has_sysrq
  tty/serial: Migrate vt8500_serial to use has_sysrq
  tty/serial: Migrate xilinx_uartps to use has_sysrq
  tty/serial: Migrate zs to use has_sysrq
  serial_core: Remove SUPPORT_SYSRQ ifdeffery
  usb/serial: Don't handle break when CONFIG_MAGIC_SYSRQ is disabled
  serial_core: Move sysrq functions from header file
  sysctl/sysrq: Remove __sysrq_enabled copy
  serial/sysrq: Add MAGIC_SYSRQ_SERIAL_SEQUENCE

 arch/powerpc/kernel/legacy_serial.c         |   4 +-
 drivers/tty/serial/8250/8250_aspeed_vuart.c |   5 +-
 drivers/tty/serial/8250/8250_fsl.c          |   4 -
 drivers/tty/serial/8250/8250_of.c           |   4 +-
 drivers/tty/serial/8250/8250_omap.c         |   5 +-
 drivers/tty/serial/8250/8250_port.c         |   5 +-
 drivers/tty/serial/amba-pl010.c             |   5 +-
 drivers/tty/serial/amba-pl011.c             |   6 +-
 drivers/tty/serial/apbuart.c                |   5 +-
 drivers/tty/serial/arc_uart.c               |   5 +-
 drivers/tty/serial/atmel_serial.c           |   9 +-
 drivers/tty/serial/bcm63xx_uart.c           |   5 +-
 drivers/tty/serial/clps711x.c               |   5 +-
 drivers/tty/serial/cpm_uart/cpm_uart_core.c |   9 +-
 drivers/tty/serial/dz.c                     |   5 +-
 drivers/tty/serial/efm32-uart.c             |   5 +-
 drivers/tty/serial/fsl_linflexuart.c        |   8 +-
 drivers/tty/serial/fsl_lpuart.c             |   9 +-
 drivers/tty/serial/imx.c                    |   7 +-
 drivers/tty/serial/ip22zilog.c              |   7 +-
 drivers/tty/serial/meson_uart.c             |   5 +-
 drivers/tty/serial/milbeaut_usio.c          |   5 +-
 drivers/tty/serial/mpc52xx_uart.c           |  11 +-
 drivers/tty/serial/msm_serial.c             |   5 +-
 drivers/tty/serial/mux.c                    |   5 +-
 drivers/tty/serial/mxs-auart.c              |   5 +-
 drivers/tty/serial/omap-serial.c            |   5 +-
 drivers/tty/serial/pch_uart.c               |  12 +-
 drivers/tty/serial/pmac_zilog.c             |   5 +-
 drivers/tty/serial/pnx8xxx_uart.c           |   7 +-
 drivers/tty/serial/pxa.c                    |   5 +-
 drivers/tty/serial/qcom_geni_serial.c       |   5 +-
 drivers/tty/serial/sa1100.c                 |   7 +-
 drivers/tty/serial/samsung_tty.c            |   5 +-
 drivers/tty/serial/sb1250-duart.c           |   5 +-
 drivers/tty/serial/sccnxp.c                 |   5 +-
 drivers/tty/serial/serial_core.c            | 123 ++++++++++++++++++++
 drivers/tty/serial/serial_txx9.c            |   5 +-
 drivers/tty/serial/sh-sci.c                 |  10 +-
 drivers/tty/serial/sprd_serial.c            |   5 +-
 drivers/tty/serial/st-asc.c                 |   5 +-
 drivers/tty/serial/stm32-usart.c            |   5 +-
 drivers/tty/serial/sunhv.c                  |   5 +-
 drivers/tty/serial/sunsab.c                 |   5 +-
 drivers/tty/serial/sunsu.c                  |   5 +-
 drivers/tty/serial/sunzilog.c               |   6 +-
 drivers/tty/serial/ucc_uart.c               |   2 -
 drivers/tty/serial/vr41xx_siu.c             |   5 +-
 drivers/tty/serial/vt8500_serial.c          |   5 +-
 drivers/tty/serial/xilinx_uartps.c          |   5 +-
 drivers/tty/serial/zs.c                     |   5 +-
 drivers/tty/sysrq.c                         |  16 +--
 drivers/usb/serial/f81534.c                 |   6 +-
 drivers/usb/serial/generic.c                |  10 +-
 include/linux/serial_core.h                 |  92 ++-------------
 include/linux/sysrq.h                       |   1 +
 kernel/sysctl.c                             |  41 ++++---
 lib/Kconfig.debug                           |   8 ++
 58 files changed, 238 insertions(+), 346 deletions(-)

-- 
2.24.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
