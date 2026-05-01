Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC1EN36T+GnSwgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0664BCFFF
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EDB4C5EC44;
	Mon,  4 May 2026 12:39:26 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37313C8F26F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2026 15:54:29 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-8a08fa355a1so28892886d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2026 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650868; x=1778255668;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8otWr85W9XMyDBNKDSXuSyml6J7KaSXr45sNqDPMQHs=;
 b=AFGF1z9amC3CT9WeyWOOjPpJFmT7QaYGAxbGOODPshh8Ql6sbO25EzhZSF+htVSy8I
 OgAWB2uNNKlDvvLemYnxHsGvhA8wkPNNi+Ajan9pazKJf5eTrnx1se3D/PrAFjHtx9uQ
 48hiiIPxrt8nlM/l2JH0SjaD/ZSZV/BAxnoDW3z6+xAbZl+Wzc6dkYMCluQJ3M7oNUdn
 2Jrxa2OT/mgqsllgc8n9QTd8Qz0WT36WCkVq9bIyxb53ihzM6RrWuNPFibVUGZp21XB+
 Yvk3mfWCoZjUMbIfejz60KTfabMMLykfB1w1dqvQXP2Rr4Ymd0NAMvBhkf2yEu8ORxr+
 xk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777650868; x=1778255668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8otWr85W9XMyDBNKDSXuSyml6J7KaSXr45sNqDPMQHs=;
 b=i0aOlUVwV6xk2uEHtVcmDNddMdXtbXyuqE7T4GzSJFwC5ex624I1pWG2t5mvgI4Ci+
 xMWvuTM52dAQ5xPhfAWZ6StSMPzDYrLJ5G4z/4jDHPlgQvg58D87ESUAnflmRLleyc3N
 qUf2zvq6c2jFByjTjzvU1ErjWL7+x8F/MBHElI6YMgiBY+JMnwa67sXFtj7cmUTZPDRO
 ozDEW+eA3KtPUQQKu6ptasfmsiLoQBt/4+Pdz4GIXv1YjC9nZwUxfpPIK93sKqA6ZkRW
 zpQPX0MS8oZ+N7M3wzZxz+JULDzxxhR7/nYU0iU0nDp4NQnBDcnZQsZAl30st2Hu7UZ+
 kJEg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9iJVDYahKhGghoxw9RrbQZKNGaagYY7FSGedvxv2scGcDS5K8u7hYvtjSrwdPKAtpjeV/0+XvCu14gPg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwpHmgc09B9oaxDXSGqL5d3as0ymz4uasyjuBJ8NrhReVcvFx/P
 ypvclFmCQjkUBnxlmh0n0KZli/LNEhaelGLq6GJHyiVaeswHYcL03Y04objhsAlEW3Q=
X-Gm-Gg: AeBDievoM31TRahrM4zDDT4GbajBqhRSVXhujblVI8poD3ugqUrh2nPW6ix9TXlZ9BN
 ICatkCOxNIHxx0sq98U1A2qjJbPCGa0dyNf9D+3vdDTMleg6w3/578Pf99peGzgGrMj96M8oKhu
 YHTm1qDg7VBSigkKSw2BNO7TGijLgzzW5CNDgMR5yHdqWmuDIE84TU01pVF5hVVFm9JCSmKizgq
 HjYHIJ/C3xzUMx57G3s4F4YfhkwIDldlxlNmDHlaF5msaSIYlDoF8ktClKdppnQJVCZ+iC+7qZZ
 Bsnp9fHQxr4eD5FXjlQWXgJVe3TvS7sYGgwhO/VVq89GzsZE5trkvuix+0A+NjH3/2SGm8nsx5V
 j1wS5pJr9ed0L8U0QsVL/kBFHz7nWddEAr0atN2Ne2pd6nPF/mcCQYUMPfy1NYaGGXbIeCwMrYV
 9n29ktQ/dFM4B26WZLGsoX4whwoQAALrsm3wSB0xgdMIkhHqbQjH6WEV3jxAL6kFecDhKL8Pm80
 2StSA==
X-Received: by 2002:a05:6214:4c8f:b0:89a:173d:9c5c with SMTP id
 6a1803df08f44-8b6686383cfmr363016d6.32.1777650867766; 
 Fri, 01 May 2026 08:54:27 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 08:54:27 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Date: Fri,  1 May 2026 10:54:08 -0500
Message-ID: <20260501155421.3329862-1-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org, daniel@riscstar.com,
 chenchuangyu@xiaomi.com, linux-stm32@st-md-mailman.stormreply.com,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, devicetree@vger.kernel.org,
 hawk@kernel.org, elder@riscstar.com, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, hkallweit1@gmail.com
Subject: [Linux-stm32] [PATCH net-next 00/12] net: enable TC956x support
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
X-Rspamd-Queue-Id: 9A0664BCFFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[68];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:elder@riscstar.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.729];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]

This series introduces stmmac driver support for the Toshiba TC9564
(also known as Qualcomm QPS615).  This is an Ethernet-AVB/TSN bridge IC
that provides a high-speed connection between a host SoC and Ethernet
devices on a network.  It incorporates a PCIe switch, and implements
two 10 Gbps capable Ethernet MACs (along with other IP blocks), and
is essentially a small and highly-specialized SoC.  The TC9564 is a
member of a family of similar chips, and the driver code uses "tc956x"
to reflect this.

TC956x chips incorporate a PCIe gen 3 switch, with one upstream and
three downstream ports.  Its PCIe functionality is already supported
upstream, including a power control driver that performs some early
configuration of the PCI ports ("pci-pwrctrl-tc9563.c").

One of the PCIe switch's downstream ports has an internal PCIe endpoint,
which implements two PCIe functions, each of which has an Ethernet MAC
(eMAC) subsystem. The eMAC is composed of a Synopsis Designware XGMAC
combined with an XPCS and PMA.  Each MAC is capable of operating at
10M/100M/1G/2.5G/5Gps and 10Gps.  The initial target platform is the
Qualcomm RB3gen2, which supports a 10Gbps Marvell PHY on port A, and
a 2.5Gbps Qualcomm PHY on port B.  (The Marvell PHY is not populated on
all RB3gen2 boards, and only 2.5 Gbps support is included initially.)

TC956x chips also implement several other blocks of functionality,
including a GPIO controller, interrupt controllers (MSIGEN), I2C
and SPI, a UART, and an Arm Cortex M3 CPU with 128KB SRAM.  The GPIO
interface exposes several lines to manage external resets.  The
interrupt controllers are used internally by the MAC functions.  The
UART, SPI, microcontroller, and SRAM are currently unused.

              ----------------------------------
              |              Host              |
              ------+...+----------+........+---
                    |i2c|          |  PCIe  |
    ----------------+...+----------+........+------
    | TC956x        |I2C|          |upstream|     |
    |               -----        --+--------+---  |
    |  -----  ------  -------    | PCIe switch |  |
    |  |SPI|  |GPIO|  |reset|    |             |  |
    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
    |                 -------    ---++--++--++--  |
    |  -----  ------     downstream//    \\  \\   |  downstream
    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
    |  -----  ------   //PCIe port 3       \\     |
    |                  ||                   \======= downstream
    |  ----+-----------++-----------+----         |  PCIe port 2
    |  | M | internal PCIe endpoint | M |         |
    |  | S |------------------------| S |  ------ |
    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
    |  | G |function 0|  |function 1| G |  ------ |
    |  | E |----++----|  |----++----| E |         |
    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
    --------+.......+------+.....+-----------------
            |USXGMII|      |SGMII|
          --+.......+--  --+.....+--
          |  ARQ113C  |  | QEP8121 |
          |    PHY    |  |   PHY   |
          -------------  -----------

The primary objective for this series is to support the Ethernet
functionality provided by the TC956x.  The code providing this
support has been structured into three distinct modules.
  - A driver for the GPIO controller
  - Code enabling the TC956x-specific eMAC/MSIGEN hardware
  - A "chip" driver, associated with the PCIe functions

The GPIO driver is implemented separately because in some hardware
configurations, these GPIO lines are used to manage resets for
external Ethernet PHYs.  We describe these PHYs via devicetree,
where the GPIO-based reset signals are defined using phandles.

The code for the eMAC/MSIGEN consists of a new source file that
populates hardware-specific details about the two MACs, and integrates
with the existing stmmac driver.  This also required implementing some
enhancements to the core stmmac driver, described further below.

To manage the common functionality (including configuring address
translation and controlling internal reset and clock signals), a
"chip" driver is implemented.  This chip driver is associated with
the PCIe function *itself*, not the eMAC associated with the function.

The driver binds to the internal PCI functions 0 and 1, and creates
a shared data structure describing the common chip elements the two
driver instances share.  Three auxiliary bus devices are created to
represent the GPIO controller and the two Synopsys MAC controllers.

The driver instance for PCIe function 0 has responsibility for
controlling the common chip functionality--creating the GPIO
controller auxiliary device, configuring address translation
between PCIe address space and internal addresses, and controlling
clocks and resets.  It creates a data structure--shared via its
platform data pointer with PCIe function 1--to represent shared
"chip" information.  In addition, PCIe function 0 creates an
auxiliary device to represent its attached eMAC.  It allocates
IRQs and maps BAR address ranges for use by the stmmac driver,
passing them in a structure via the auxiliary device's platform
data.

PCIe function 1 defers probing until after PCIe function 0 has
created the shared data structure.  After that its only job is
to set up IRQs and mapped memory and create the eMAC1 auxiliary
device.

The version of the Synopsys MAC IP is 3.01, which is largely compatible
with version 2.20.  The core stmmac driver required several changes to
enable support for the TC956x.
  - A change to dwxgmac2 support changes the interrupt mode when
    multi_msi_en is enabled.
  - While most support for version 3.01 simply uses the 2.20 code,
    an erratum related to the RX ring length is implemented for
    3.01 DMA operations.
  - Having the PCIe device be separate from an auxiliarly device
    implementing the eMAC required allowing a distinct DMA device
    to be maintained for an stmmac interface.

In addition:
  - A new source file provides memory-mapped access to XPCS using
    regmap.  The alignment of the TC956x MDIO registers aren't
    suitable for using simple MMIO.
  - Two additional XPCS changes are implemented that provides
    support for the XPCS as implemented in the TC956x.

This series is available here:
  https://github.com/riscstar/linux/tree/tc956x/stmmac-v1

					-Alex (and Daniel)

Alex Elder (3):
  net: stmmac: dma: create a separate dma_device pointer
  gpio: tc956x: add TC956x/QPS615 support
  misc: tc956x_pci: add TC956x/QPS615 support

Daniel Thompson (9):
  net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via
    regmap
  net: pcs: pcs-xpcs: select operating mode for 10G-baseR capable PCS
  net: pcs: pcs-xpcs: Preserve BMCR_ANENBLE during link up
  net: stmmac: dwxgmac2: Add multi MSI interrupt mode
  net: stmmac: dwxgmac2: Add XGMAC 3.01a support
  net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
  dt-bindings: net: toshiba,tc965x-dwmac: add TC956x Ethernet bridge
  net: stmmac: tc956x: add TC956x/QPS615 support
  arm64: dts: qcom: qcs6490-rb3gen2: enable TC9564 with a single QCS8081
    phy

 .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 +++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  45 +-
 drivers/gpio/Kconfig                          |  11 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-tc956x.c                    | 209 +++++
 drivers/misc/Kconfig                          |  10 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/tc956x_pci.c                     | 667 +++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  13 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
 .../net/ethernet/stmicro/stmmac/chain_mode.c  |  12 +-
 .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 791 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  12 +
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  78 +-
 .../net/ethernet/stmicro/stmmac/ring_mode.c   |  12 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  59 +-
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   2 +-
 drivers/net/pcs/Makefile                      |   4 +-
 drivers/net/pcs/pcs-xpcs-regmap.c             | 203 +++++
 drivers/net/pcs/pcs-xpcs.c                    |  43 +-
 include/linux/pcs/pcs-xpcs-regmap.h           |  20 +
 include/linux/stmmac.h                        |   1 +
 include/soc/toshiba/tc956x-dwmac.h            |  84 ++
 26 files changed, 2341 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
 create mode 100644 drivers/gpio/gpio-tc956x.c
 create mode 100644 drivers/misc/tc956x_pci.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
 create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
 create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
 create mode 100644 include/soc/toshiba/tc956x-dwmac.h


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
