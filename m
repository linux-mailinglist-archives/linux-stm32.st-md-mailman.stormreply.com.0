Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 538339F944A
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 15:30:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 073D6C6C83D;
	Fri, 20 Dec 2024 14:30:13 +0000 (UTC)
Received: from mail-m19731109.qiye.163.com (mail-m19731109.qiye.163.com
 [220.197.31.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B01C0C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 10:38:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 656820ed;
 Fri, 20 Dec 2024 18:38:26 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Date: Fri, 20 Dec 2024 18:37:46 +0800
Message-Id: <20241220103825.3509421-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh9LT1ZJGktPSElKGk8fQxhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtNQk
 tVSktLVUpCWQY+
X-HM-Tid: 0a93e3a5af4003afkunm656820ed
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6Kxw6GTIRKggeThEUMR4h
 P0gaCyxVSlVKTEhPTUJKSkpKTElJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOTUpJNwY+
DKIM-Signature: a=rsa-sha256;
 b=LXQtSCOj5PQ5rmMQS8JUHg+aVmzux+tnR5NnlpILS50US/QWv5VBCTHDsqEiVs5WhSa9UqWxWgKBEnSg0vucKhE8FyZdsUwbc5ZsdiUz76LZqHiim02ORqBuKb413jRYfReSUFy7jfbzAaPEA5wGkuukfoQqA957T+ZIIQC0lqE=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=RUJ3VBWN4hJZF+kjNTXL1lSb1odrwauQvfHGVuJDe90=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Fri, 20 Dec 2024 14:30:12 +0000
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, linux-phy@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jisheng Zhang <jszhang@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Shresth Prasad <shresthprasad7@gmail.com>, Jamie Iles <jamie@jamieiles.com>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Simon Xue <xxm@rock-chips.com>, devicetree@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Andy Yan <andyshrk@163.com>, Tim Lunn <tim@feathertop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 Jose Abreu <joabreu@synopsys.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 linux-pm@vger.kernel.org, Frank Wang <frank.wang@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Johan Jonker <jbx6244@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-spi@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 FUKAUMI Naoki <naoki@radxa.com>, Jonathan Cameron <jic23@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Wu <david.wu@rock-chips.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>,
 "David S. Miller" <davem@davemloft.net>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-i2c@vger.kernel.org
Subject: [Linux-stm32] [PATCH 00/38] rockchip: Add rk3562 support
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


This patch set adds rk3562 SoC and its evb support.

The patch number is a little bit too big, some of them may need to split
out for different maintainers, please let me know which patch need to
split out.

Test with GMAC, USB, PCIe, EMMC, SD Card.

This patch set is base on the patche set for rk3576 evb1 support.


David Wu (2):
  ethernet: stmmac: dwmac-rk: Add gmac support for rk3562
  ethernet: stmmac: dwmac-rk: Make the phy clock could be used for
    external phy

Finley Xiao (7):
  clk: rockchip: add dt-binding header for rk3562
  clk: rockchip: Add clock controller for the RK3562
  dt-bindings: add power-domain header for RK3562 SoC
  nvmem: rockchip-otp: Add support for rk3568-otp
  nvmem: rockchip-otp: Add support for rk3562
  arm64: dts: rockchip: add core dtsi for RK3562 Soc
  arm64: dts: rockchip: Add RK3562 evb2 devicetree

Frank Wang (1):
  phy: rockchip: inno-usb2: add usb2 phy support for rk3562

Jon Lin (1):
  phy: rockchip-naneng-combo: Support rk3562

Kever Yang (24):
  dt-bindings: clock: add rk3562 cru bindings
  dt-bindings: pinctrl: Add rk3562 pinctrl support
  soc: rockchip: power-domain: add power domain support for rk3562
  dt-bindings: rockchip-thermal: Support the RK3562 SoC compatible
  dt-bindings: iio: adc: Add rockchip,rk3562-saradc string
  dt-bindings: net: Add support for rk3562 dwmac
  dt-bindings: nvmem: rockchip,otp: Add support for rk3562 and rk3568
  dt-bindings: phy: rockchip: Add rk3562 naneng-combophy compatible
  dt-bindings: phy: rockchip,inno-usb2phy: add rk3562
  dt-bindings: PCI: dwc: rockchip: Add rk3562 support
  dt-bindings: mmc: Add support for rk3562 eMMC
  dt-bindings: mmc: rockchip-dw-mshc: Add rk3562 compatible string
  dt-bindings: power: rockchip: Add bindings for rk3562
  dt-bindings: i2c: i2c-rk3x: Add rk3562 compatible
  dt-bindings: gpu: Add rockchip,rk3562-mali compatible
  dt-bindings: watchdog: Add rk3562 compatible
  dt-bindings: spi: Add rockchip,rk3562-spi compatible
  dt-bindings: serial: snps-dw-apb-uart: Add support for rk3562
  dt-bindings: usb: dwc3: add compatible for rk3562
  dt-bindings: pwm: rockchip: Add rockchip,rk3562-pwm
  dt-bindings: rockchip: pmu: Add rk3562 compatible
  dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
  dt-bindings: arm: rockchip: Add rk3562 evb2 board
  dt-bindings: mfd: syscon: Add rk3562 QoS register compatible

Shaohan Yao (1):
  thermal: rockchip: Support the rk3562 SoC in thermal driver

Simon Xue (1):
  iio: adc: rockchip_saradc: add rk3562

Steven Liu (1):
  pinctrl: rockchip: add rk3562 support

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../bindings/clock/rockchip,rk3562-cru.yaml   |   62 +
 .../bindings/gpu/arm,mali-bifrost.yaml        |    3 +-
 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
 .../bindings/iio/adc/rockchip-saradc.yaml     |    2 +
 .../devicetree/bindings/mfd/syscon.yaml       |    2 +
 .../bindings/mmc/rockchip-dw-mshc.yaml        |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    9 +-
 .../bindings/net/rockchip-dwmac.yaml          |    5 +-
 .../bindings/nvmem/rockchip,otp.yaml          |   49 +-
 .../bindings/pci/rockchip-dw-pcie.yaml        |    1 +
 .../phy/phy-rockchip-naneng-combphy.yaml      |    1 +
 .../bindings/phy/rockchip,inno-usb2phy.yaml   |    3 +-
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |    1 +
 .../power/rockchip,power-controller.yaml      |    1 +
 .../devicetree/bindings/pwm/pwm-rockchip.yaml |    1 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
 .../devicetree/bindings/spi/spi-rockchip.yaml |    1 +
 .../bindings/thermal/rockchip-thermal.yaml    |    1 +
 .../bindings/usb/rockchip,dwc3.yaml           |    3 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  520 ++++
 .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1432 ++++++++++
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-rk3562.c             | 1111 ++++++++
 drivers/clk/rockchip/clk.h                    |   39 +
 drivers/iio/adc/rockchip_saradc.c             |   24 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  213 +-
 drivers/nvmem/rockchip-otp.c                  |   97 +
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c |   49 +
 .../rockchip/phy-rockchip-naneng-combphy.c    |  152 ++
 drivers/pinctrl/pinctrl-rockchip.c            |  199 +-
 drivers/pinctrl/pinctrl-rockchip.h            |    3 +-
 drivers/pmdomain/rockchip/pm-domains.c        |   48 +-
 drivers/thermal/rockchip_thermal.c            |  112 +-
 include/dt-bindings/clock/rk3562-cru.h        |  733 +++++
 include/dt-bindings/power/rk3562-power.h      |   35 +
 42 files changed, 7269 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rk3562.c
 create mode 100644 include/dt-bindings/clock/rk3562-cru.h
 create mode 100644 include/dt-bindings/power/rk3562-power.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
