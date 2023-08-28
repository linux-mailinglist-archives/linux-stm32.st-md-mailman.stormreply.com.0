Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D601978B5B3
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 18:57:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AC54C6A61D;
	Mon, 28 Aug 2023 16:57:03 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E278C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 16:57:02 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A18453F65D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1693241821;
 bh=/HH1I+FxaPyMqvr2xW4lvphl2+/GSXm7Z7s+Wycc9k0=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=rEdznWTViG3Z7Q2W3WpWm9ejafPZm13la4brmow6UB890HGqhd2Yq1RyzakeDhgUX
 NeBBx46NOw5Qiaa6kKzV+hkFEGuYjwcRQakhns7EMf8vs1fQR3O/vcKq+nBO6jvEAS
 LzgEdjzr4hXN6QTSKGb1ACUZNaU4nxC893PygVurBdXJjpOj72ZW7jecK0aPn0j4Ce
 SPomKFpadSpAN2uyWk2e8O1ocGRXZGiXGdSrhPdcYsIKRccBVfmzYWudrhm1iV0hHa
 p823CzvfjV+cGJIYJccAyTf/suz70fZ8ZlIuTrN1XQwmgLzM0ogNIBp4Lbl1DayENk
 NazdYJ8tx8BCw==
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-412136f4706so34585271cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 09:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693241821; x=1693846621;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/HH1I+FxaPyMqvr2xW4lvphl2+/GSXm7Z7s+Wycc9k0=;
 b=iSZxxeNVJ2Qk3oyu8JZwuuzxDfKlswDScKGHKXMmL8SFEYJqv8lf9VmRBGnS0J9OwD
 SPGcR6vZgZy5Votw/gBC2Y8Lr/DLpkv+h4f1ZeKwQar8KeJhzWWhxS9TKzpfBtUsKoLR
 8ckDydIelOPFAiOR5+VsNQrkC4/5vDgy9w9oTWgkBEsOA5dnfIyXUEkWs8biZIZJhTLE
 vl6OmCu224C0GYe/Mo6238zpZRr6bPN1OZxHMjaTlbbLzoEnF3jVqeOXucyM/lg1Tj6W
 qgga/B88HfdXqzRJ81D7kGAcEkE3ImAzSdkzOqW1cvQmobXOQj6TgQEW4Fjo7sqfdG+5
 90Lg==
X-Gm-Message-State: AOJu0YzLi6lvRhl2TU0OG/TQZZ9BoAXSTVkimfewHBbxEiayFWEphHBP
 xA4eskmw/LFnamXCUwQ+eO/hSQbYimMsA2cXJNgy+GK2mvegUfIDskiXOH38lEp9VjNNKzPFJ3d
 T+oK6Yc5PVtDBwZm9hmn38lWocD+2AhuqueqvxrL7JvHH+dTbrbUK2aCB6quQ1NIu7fm9EMk2fQ
 ==
X-Received: by 2002:a05:622a:15d1:b0:410:a54d:dea4 with SMTP id
 d17-20020a05622a15d100b00410a54ddea4mr27046689qty.48.1693241820626; 
 Mon, 28 Aug 2023 09:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy6qGsOYe081xFAOiF7yVbryLOTebDnrPXjzGkrbEoB+oJWBgJ1Fnrc2eSywhNv6BM5h0fFVg624X5B1zXAnw=
X-Received: by 2002:a05:622a:15d1:b0:410:a54d:dea4 with SMTP id
 d17-20020a05622a15d100b00410a54ddea4mr27046659qty.48.1693241820325; Mon, 28
 Aug 2023 09:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230827091710.1483-1-jszhang@kernel.org>
 <20230827091710.1483-4-jszhang@kernel.org>
 <maj7mkdtkhp3z7xzcwvopnup3lhm5h5wyxz3j2ljryjbwpwilx@xdizgwctqukn>
 <ZOzAO5xhWdGcBXD1@xhacker>
In-Reply-To: <ZOzAO5xhWdGcBXD1@xhacker>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 28 Aug 2023 18:56:43 +0200
Message-ID: <CAJM55Z--LznLXZcg6cdxqAMUiN1zzsa6_YZVVNOM=K6eMrOqXw@mail.gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 devicetree@vger.kernel.org, Maxime@web.codeaurora.org, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Coquelin@web.codeaurora.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: add glue
 layer for T-HEAD TH1520 SoC
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

On Mon, 28 Aug 2023 at 17:55, Jisheng Zhang <jszhang@kernel.org> wrote:
> On Mon, Aug 28, 2023 at 04:40:19PM +0300, Serge Semin wrote:
> > On Sun, Aug 27, 2023 at 05:17:10PM +0800, Jisheng Zhang wrote:
> > > Add dwmac glue driver to support the dwmac on the T-HEAD TH1520 SoC.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
> > >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> > >  .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 302 ++++++++++++++++++
> > >  3 files changed, 314 insertions(+)
> > >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > index 06c6871f8788..1bf71804c270 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > @@ -216,6 +216,17 @@ config DWMAC_SUN8I
> > >       stmmac device driver. This driver is used for H3/A83T/A64
> > >       EMAC ethernet controller.
> > >
> > > +config DWMAC_THEAD
> > > +   tristate "T-HEAD dwmac support"
> > > +   depends on OF && (ARCH_THEAD || COMPILE_TEST)
> > > +   select MFD_SYSCON
> > > +   help
> > > +     Support for ethernet controllers on T-HEAD RISC-V SoCs
> > > +
> > > +     This selects the T-HEAD platform specific glue layer support for
> > > +     the stmmac device driver. This driver is used for T-HEAD TH1520
> > > +     ethernet controller.
> > > +
> > >  config DWMAC_IMX8
> > >     tristate "NXP IMX8 DWMAC support"
> > >     default ARCH_MXC
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > index 5b57aee19267..d73171ed6ad7 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > @@ -27,6 +27,7 @@ obj-$(CONFIG_DWMAC_STI)           += dwmac-sti.o
> > >  obj-$(CONFIG_DWMAC_STM32)  += dwmac-stm32.o
> > >  obj-$(CONFIG_DWMAC_SUNXI)  += dwmac-sunxi.o
> > >  obj-$(CONFIG_DWMAC_SUN8I)  += dwmac-sun8i.o
> > > +obj-$(CONFIG_DWMAC_THEAD)  += dwmac-thead.o
> > >  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)    += dwmac-dwc-qos-eth.o
> > >  obj-$(CONFIG_DWMAC_INTEL_PLAT)     += dwmac-intel-plat.o
> > >  obj-$(CONFIG_DWMAC_GENERIC)        += dwmac-generic.o
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > new file mode 100644
> > > index 000000000000..85135ef05906
> > > --- /dev/null
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > @@ -0,0 +1,302 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * T-HEAD DWMAC platform driver
> > > + *
> > > + * Copyright (C) 2021 Alibaba Group Holding Limited.
> > > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > + *
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_net.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include "stmmac_platform.h"
> > > +
> > > +#define GMAC_CLK_EN                        0x00
> > > +#define  GMAC_TX_CLK_EN                    BIT(1)
> > > +#define  GMAC_TX_CLK_N_EN          BIT(2)
> > > +#define  GMAC_TX_CLK_OUT_EN                BIT(3)
> > > +#define  GMAC_RX_CLK_EN                    BIT(4)
> > > +#define  GMAC_RX_CLK_N_EN          BIT(5)
> > > +#define  GMAC_EPHY_REF_CLK_EN              BIT(6)
> > > +#define GMAC_RXCLK_DELAY_CTRL              0x04
> > > +#define  GMAC_RXCLK_BYPASS         BIT(15)
> > > +#define  GMAC_RXCLK_INVERT         BIT(14)
> > > +#define  GMAC_RXCLK_DELAY_MASK             GENMASK(4, 0)
> > > +#define  GMAC_RXCLK_DELAY_VAL(x)   FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> > > +#define GMAC_TXCLK_DELAY_CTRL              0x08
> > > +#define  GMAC_TXCLK_BYPASS         BIT(15)
> > > +#define  GMAC_TXCLK_INVERT         BIT(14)
> > > +#define  GMAC_TXCLK_DELAY_MASK             GENMASK(4, 0)
> > > +#define  GMAC_TXCLK_DELAY_VAL(x)   FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> > > +#define GMAC_PLLCLK_DIV                    0x0c
> > > +#define  GMAC_PLLCLK_DIV_EN                BIT(31)
> > > +#define  GMAC_PLLCLK_DIV_MASK              GENMASK(7, 0)
> > > +#define  GMAC_PLLCLK_DIV_NUM(x)            FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
> > > +#define GMAC_GTXCLK_SEL                    0x18
> > > +#define  GMAC_GTXCLK_SEL_PLL               BIT(0)
> > > +#define GMAC_INTF_CTRL                     0x1c
> > > +#define  PHY_INTF_MASK                     BIT(0)
> > > +#define  PHY_INTF_RGMII                    FIELD_PREP(PHY_INTF_MASK, 1)
> > > +#define  PHY_INTF_MII_GMII         FIELD_PREP(PHY_INTF_MASK, 0)
> > > +#define GMAC_TXCLK_OEN                     0x20
> > > +#define  TXCLK_DIR_MASK                    BIT(0)
> > > +#define  TXCLK_DIR_OUTPUT          FIELD_PREP(TXCLK_DIR_MASK, 0)
> > > +#define  TXCLK_DIR_INPUT           FIELD_PREP(TXCLK_DIR_MASK, 1)
> > > +
> > > +#define GMAC_GMII_RGMII_RATE       125000000
> > > +#define GMAC_MII_RATE              25000000
> > > +
> > > +struct thead_dwmac {
> > > +   struct plat_stmmacenet_data *plat;
> > > +   struct regmap *apb_regmap;
> > > +   struct device *dev;
> > > +   u32 rx_delay;
> > > +   u32 tx_delay;
> > > +};
> > > +
> > > +static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> > > +{
> > > +   struct thead_dwmac *dwmac = plat->bsp_priv;
> > > +   u32 phyif;
> > > +
> > > +   switch (plat->interface) {
> > > +   case PHY_INTERFACE_MODE_MII:
> > > +           phyif = PHY_INTF_MII_GMII;
> > > +           break;
> > > +   case PHY_INTERFACE_MODE_RGMII:
> > > +   case PHY_INTERFACE_MODE_RGMII_ID:
> > > +   case PHY_INTERFACE_MODE_RGMII_TXID:
> > > +   case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +           phyif = PHY_INTF_RGMII;
> > > +           break;
> > > +   default:
> > > +           dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > +                   plat->interface);
> > > +           return -EINVAL;
> > > +   };
> > > +
> > > +   regmap_write(dwmac->apb_regmap, GMAC_INTF_CTRL, phyif);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> > > +{
> > > +   struct thead_dwmac *dwmac = plat->bsp_priv;
> > > +   u32 txclk_dir;
> > > +
> > > +   switch (plat->interface) {
> > > +   case PHY_INTERFACE_MODE_MII:
> > > +           txclk_dir = TXCLK_DIR_INPUT;
> > > +           break;
> > > +   case PHY_INTERFACE_MODE_RGMII:
> > > +   case PHY_INTERFACE_MODE_RGMII_ID:
> > > +   case PHY_INTERFACE_MODE_RGMII_TXID:
> > > +   case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +           txclk_dir = TXCLK_DIR_OUTPUT;
> > > +           break;
> > > +   default:
> > > +           dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > +                   plat->interface);
> > > +           return -EINVAL;
> > > +   };
> > > +
> > > +   regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> > > +{
> > > +   struct thead_dwmac *dwmac = priv;
> > > +   struct plat_stmmacenet_data *plat = dwmac->plat;
> > > +   unsigned long rate;
> > > +   u32 div;
> > > +
> > > +   switch (plat->interface) {
> > > +   /* For MII, rxc/txc is provided by phy */
> > > +   case PHY_INTERFACE_MODE_MII:
> > > +           return;
> > > +
> > > +   case PHY_INTERFACE_MODE_RGMII:
> > > +   case PHY_INTERFACE_MODE_RGMII_ID:
> > > +   case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +   case PHY_INTERFACE_MODE_RGMII_TXID:
> >
> > > +           rate = clk_get_rate(plat->stmmac_clk);
> > > +           if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
> > > +               rate % GMAC_MII_RATE != 0) {
> > > +                   dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
> > > +                   return;
> > > +           }
> > > +
> > > +           regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
> > > +
> > > +           switch (speed) {
> > > +           case SPEED_1000:
> > > +                   div = rate / GMAC_GMII_RGMII_RATE;
> > > +                   break;
> > > +           case SPEED_100:
> > > +                   div = rate / GMAC_MII_RATE;
> > > +                   break;
> > > +           case SPEED_10:
> > > +                   div = rate * 10 / GMAC_MII_RATE;
> > > +                   break;
> > > +           default:
> > > +                   dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > > +                   return;
> > > +           }
> > > +           regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> > > +                              GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
> > > +
> > > +           regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> > > +                              GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
> >
> > This chunk looks like a hard-coded implementation of the
> > CLK_SET_RATE_GATE Tx-clocks rate setup which parental clock is the
> > "stmmaceth" clock. I suggest to move it to the respective driver, add
> > a "tx" clock to the bindings and use the common clock kernel API
> > methods here only.
>
> I did consider your solution before writing the code, here are the
> reasons why I dropped it:
>
> There's no any clk IP here, the HW just puts several
> gmac related control bits here, such as rx/tx delay, bypass, invert
> interface choice, clk direction. From this point of view, it looks more
> like a syscon rather than clk.

Hi Jisheng.

That's not really a compelling argument to do the clock manipulation
here. Look at the StarFive JH7110 PLL clock driver. It's exactly a
clock driver for just the registers controlling the PLLs among the
other syscon registers.

> Secondly, I see other SoCs did similar for this case, such as
> dwmac-visconti, dwmac-meson8b, dwmac-ipq806x, dwmac-socfpga and so on.
> They met similar issue as the above.
>
> PS: here is the initial th1520 clk driver, as is seen, the clk IP is
> different from the control logic here.
>
> https://lore.kernel.org/linux-riscv/20230515054402.27633-1-frank.li@vivo.com/
>
> Thanks
>
> >
> > > +           break;
> > > +   default:
> > > +           dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > +                   plat->interface);
> > > +           return;
> > > +   }
> > > +}
> > > +
> > > +static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
> > > +{
> > > +   struct thead_dwmac *dwmac = plat->bsp_priv;
> > > +   u32 reg;
> > > +
> > > +   switch (plat->interface) {
> > > +   case PHY_INTERFACE_MODE_MII:
> > > +           reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
> > > +           break;
> > > +
> > > +   case PHY_INTERFACE_MODE_RGMII:
> > > +   case PHY_INTERFACE_MODE_RGMII_ID:
> > > +   case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +   case PHY_INTERFACE_MODE_RGMII_TXID:
> > > +           /* use pll */
> > > +           regmap_write(dwmac->apb_regmap, GMAC_GTXCLK_SEL, GMAC_GTXCLK_SEL_PLL);
> > > +
> >
> > > +           reg = GMAC_TX_CLK_EN | GMAC_TX_CLK_N_EN | GMAC_TX_CLK_OUT_EN |
> > > +                 GMAC_RX_CLK_EN | GMAC_RX_CLK_N_EN;
> >
> > Similarly settings these flags looks like just clock gates which can
> > also be moved to the clock driver.
> >
> > > +           break;
> > > +
> > > +   default:
> > > +           dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > +                   plat->interface);
> > > +           return -EINVAL;
> > > +   }
> > > +
> > > +   regmap_write(dwmac->apb_regmap, GMAC_CLK_EN, reg);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int thead_dwmac_init(struct platform_device *pdev,
> > > +                       struct plat_stmmacenet_data *plat)
> > > +{
> > > +   struct thead_dwmac *dwmac = plat->bsp_priv;
> > > +   int ret;
> > > +
> > > +   ret = thead_dwmac_set_phy_if(plat);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   ret = thead_dwmac_set_txclk_dir(plat);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
> > > +                GMAC_RXCLK_DELAY_VAL(dwmac->rx_delay));
> > > +   regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
> > > +                GMAC_TXCLK_DELAY_VAL(dwmac->tx_delay));
> > > +
> > > +   thead_dwmac_fix_speed(dwmac, SPEED_1000, 0);
> > > +
> > > +   return thead_dwmac_enable_clk(plat);
> > > +}
> > > +
> > > +static int thead_dwmac_probe(struct platform_device *pdev)
> > > +{
> > > +   struct plat_stmmacenet_data *plat;
> > > +   struct stmmac_resources stmmac_res;
> > > +   struct thead_dwmac *dwmac;
> > > +   struct device_node *np = pdev->dev.of_node;
> > > +   u32 delay_ps;
> > > +   int ret;
> > > +
> > > +   ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> > > +   if (ret)
> > > +           return dev_err_probe(&pdev->dev, ret,
> > > +                                "failed to get resources\n");
> > > +
> >
> > > +   plat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> >
> > This can be replaced with devm_stmmac_probe_config_dt() so the
> > stmmac_remove_config_dt() invocation would be dropped.
> >
> > > +   if (IS_ERR(plat))
> > > +           return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> > > +                                "dt configuration failed\n");
> > > +
> > > +   dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> > > +   if (!dwmac) {
> > > +           ret = -ENOMEM;
> > > +           goto err_remove_config_dt;
> > > +   }
> > > +
> > > +   if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay_ps))
> > > +           dwmac->rx_delay = delay_ps;
> > > +   if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay_ps))
> > > +           dwmac->tx_delay = delay_ps;
> > > +
> > > +   dwmac->apb_regmap = syscon_regmap_lookup_by_phandle(np, "thead,gmacapb");
> > > +   if (IS_ERR(dwmac->apb_regmap)) {
> > > +           ret = dev_err_probe(&pdev->dev, PTR_ERR(dwmac->apb_regmap),
> > > +                               "Failed to get gmac apb syscon\n");
> > > +           goto err_remove_config_dt;
> > > +   }
> > > +
> > > +   dwmac->dev = &pdev->dev;
> > > +   dwmac->plat = plat;
> > > +   plat->bsp_priv = dwmac;
> > > +   plat->fix_mac_speed = thead_dwmac_fix_speed;
> > > +
> >
> > > +   ret = thead_dwmac_init(pdev, plat);
> > > +   if (ret)
> > > +           goto err_remove_config_dt;
> > > +
> > > +   ret = stmmac_dvr_probe(&pdev->dev, plat, &stmmac_res);
> >
> > This can be replaced with:
> > plat->init = thead_dwmac_init;
> > ret = devm_stmmac_pltfr_probe();
> >
> > > +   if (ret)
> > > +           goto err_remove_config_dt;
> > > +
> > > +   return 0;
> > > +
> >
> > > +err_remove_config_dt:
> > > +   stmmac_remove_config_dt(pdev, plat);
> > > +
> > > +   return ret;
> >
> > This can be dropped if devm_stmmac_probe_config_dt() is utilized.
> >
> > > +}
> > > +
> > > +static const struct of_device_id thead_dwmac_match[] = {
> >
> > > +   { .compatible = "thead,th1520-dwmac" },
> >
> > See my comment to the bindings about the compatible string suffix.
> >
> > > +   { }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, thead_dwmac_match);
> > > +
> > > +static struct platform_driver thead_dwmac_driver = {
> > > +   .probe = thead_dwmac_probe,
> >
> > > +   .remove_new = stmmac_pltfr_remove,
> >
> > This can be dropped if devm_stmmac_probe_config_dt() and
> > devm_stmmac_pltfr_probe() are utilized.
> >
> > > +   .driver = {
> > > +           .name = "thead-dwmac",
> > > +           .pm = &stmmac_pltfr_pm_ops,
> > > +           .of_match_table = thead_dwmac_match,
> > > +   },
> > > +};
> > > +module_platform_driver(thead_dwmac_driver);
> > > +
> > > +MODULE_AUTHOR("T-HEAD");
> > > +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
> >
> > > +MODULE_DESCRIPTION("T-HEAD dwmac platform driver");
> >                               ^
> >                               |
> > Capitalize? ------------------+
> >
> > -Serge(y)
> >
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.40.1
> > >
> > >
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
