Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wOzvFu3sImo+fQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 17:36:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D8D6495C6
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 17:36:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=LSb3DbXw;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 150EFC87ED6;
	Fri,  5 Jun 2026 15:36:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A3D8C87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 15:36:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 91F194E40859;
 Fri,  5 Jun 2026 15:36:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4A1AB5FED1;
 Fri,  5 Jun 2026 15:36:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C996106A24F0; 
 Fri,  5 Jun 2026 17:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780673767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=FHeuOlC/gaOtesZkFgqVr9DoEMDIdfxTclEETE4eqSU=;
 b=LSb3DbXwWwWowFJQbUezIa1BBhdJR5igSpOLdXQsCT+BMkRWsdW44ijdI9dXSrrrcI8V3I
 ecL7Zv+Q2UVM43Odjp/o2hzqvGbJH9gcvwM6bdnjCKpscXz21KdbG5a15Kc6ylGOPoMikV
 /27OcnmIj1H+3ddtxGC9cfiTRCWoqBfbWXl8ciMGadarXoTP7kfh+SkJNF+NmdT7qNf3N7
 nOUpMyUSLjBesoK1WhJDphDI8xte4Zjy9kt1XGP1BSTgKvcUlm5wSd8QHvl7H5BQGa0SY4
 7tx4Gs7DtT2TfocD21W8eEKgMWx1a3Dd+/HcnhtEgGNrly28oFopJXpGDFJybQ==
Message-ID: <566af63b-05a9-43f8-94e9-19af737c848a@bootlin.com>
Date: Fri, 5 Jun 2026 17:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-4-elder@riscstar.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260605010022.968612-4-elder@riscstar.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 devicetree@vger.kernel.org, hawk@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 03/14] net: pcs:
 pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via regmap
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.o
 rg,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:from_mime,bootlin.com:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6D8D6495C6

Hi Alex,

On 6/5/26 03:00, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> In some DesignWare XPCS implementatons the memory-mapped MDIO bus is
> allocated to a register window that does not align to a page boundary.
> This makes iomapping the registers problematic.
> 
> For example the Toshiba TC9564 (a PCIe Ethernet-AVB/TSN bridge) provides
> an "eMAC" subsystem with the XPCS base address cuddled up to XGMAC
> registers.
> 
> Let's introduce helpers to allow the driver that owns the eMAC to register
> an XPCS using is regmap for the memory-mapped MDIO bus.
> 
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  MAINTAINERS                         |   2 +
>  drivers/net/pcs/Makefile            |   4 +-
>  drivers/net/pcs/pcs-xpcs-regmap.c   | 219 ++++++++++++++++++++++++++++
>  include/linux/pcs/pcs-xpcs-regmap.h |  20 +++
>  4 files changed, 243 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
>  create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb8cdcc76324f..2aa6ea012c848 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25931,8 +25931,10 @@ F:	drivers/net/ethernet/synopsys/
>  SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
>  L:	netdev@vger.kernel.org
>  S:	Orphan
> +F:	drivers/net/pcs/pcs-xpcs-regmap.c
>  F:	drivers/net/pcs/pcs-xpcs.c
>  F:	drivers/net/pcs/pcs-xpcs.h
> +F	include/linux/pcs/pcs-xpcs-regmap.h
>  F:	include/linux/pcs/pcs-xpcs.h
>  
>  SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
> diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> index 4f7920618b900..565f1b63fce0b 100644
> --- a/drivers/net/pcs/Makefile
> +++ b/drivers/net/pcs/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for Linux PCS drivers
>  
> -pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
> -				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
> +pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-regmap.o \
> +				   pcs-xpcs-plat.o pcs-xpcs-wx.o
>  
>  obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
>  obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
> diff --git a/drivers/net/pcs/pcs-xpcs-regmap.c b/drivers/net/pcs/pcs-xpcs-regmap.c
> new file mode 100644
> index 0000000000000..55cd05d09c7db
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-regmap.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Synopsys DesignWare XPCS regmap helpers
> + *
> + * Copyright (C) 2026 RISCstar Solutions.
> + * Copyright (C) 2024 Serge Semin
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mdio.h>
> +#include <linux/pcs/pcs-xpcs.h>
> +#include <linux/pcs/pcs-xpcs-regmap.h>
> +#include <linux/regmap.h>
> +
> +#include "pcs-xpcs.h"
> +
> +/* Page select register for the indirect MMIO CSRs access */
> +#define DW_VR_CSR_VIEWPORT		0xff
> +
> +struct dw_xpcs_regmap {
> +	struct device *dev;
> +	struct mii_bus *bus;
> +	struct regmap *regmap;
> +	bool reg_indir;
> +};
> +
> +static ptrdiff_t xpcs_regmap_addr_format(int dev, int reg)
> +{
> +	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
> +}
> +
> +static u16 xpcs_regmap_addr_page(ptrdiff_t csr)
> +{
> +	return FIELD_GET(0x1fff00, csr);
> +}
> +
> +static ptrdiff_t xpcs_regmap_addr_offset(ptrdiff_t csr)
> +{
> +	return FIELD_GET(0xff, csr);
> +}
> +
> +static int xpcs_regmap_read_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
> +					 int reg)
> +{
> +	ptrdiff_t csr, ofs;
> +	unsigned int val;
> +	u16 page;
> +	int res;
> +
> +	csr = xpcs_regmap_addr_format(dev, reg);
> +	page = xpcs_regmap_addr_page(csr);
> +	ofs = xpcs_regmap_addr_offset(csr);
> +
> +	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
> +	if (res < 0)
> +		return res;
> +
> +	res = regmap_read(pxpcs->regmap, ofs, &val);
> +	if (res < 0)
> +		return res;
> +
> +	return val & 0xffff;
> +}
> +
> +static int xpcs_regmap_write_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
> +					  int reg, u16 val)
> +{
> +	ptrdiff_t csr, ofs;
> +	u16 page;
> +	int res;
> +
> +	csr = xpcs_regmap_addr_format(dev, reg);
> +	page = xpcs_regmap_addr_page(csr);
> +	ofs = xpcs_regmap_addr_offset(csr);
> +
> +	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
> +	if (res < 0)
> +		return res;
> +
> +	return regmap_write(pxpcs->regmap, ofs, val);
> +}
> +
> +static int xpcs_regmap_read_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
> +				       int reg)
> +{
> +	unsigned int val;
> +	ptrdiff_t csr;
> +	int res;
> +
> +	csr = xpcs_regmap_addr_format(dev, reg);
> +	res = regmap_read(pxpcs->regmap, csr, &val);
> +	if (res < 0)
> +		return res;
> +
> +	return val & 0xffff;
> +}
> +
> +static int xpcs_regmap_write_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
> +					int reg, u16 val)
> +{
> +	ptrdiff_t csr = xpcs_regmap_addr_format(dev, reg);
> +
> +	return regmap_write(pxpcs->regmap, csr, val);
> +}
> +
> +static int xpcs_regmap_read_c22(struct mii_bus *bus, int addr, int reg)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
> +	else
> +		return xpcs_regmap_read_reg_direct(pxpcs, MDIO_MMD_VEND2, reg);
> +}
> +
> +static int xpcs_regmap_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_write_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg, val);
> +	else
> +		return xpcs_regmap_write_reg_direct(pxpcs, MDIO_MMD_VEND2, reg, val);
> +}
> +
> +static int xpcs_regmap_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_read_reg_indirect(pxpcs, dev, reg);
> +	else
> +		return xpcs_regmap_read_reg_direct(pxpcs, dev, reg);
> +}
> +
> +static int xpcs_regmap_write_c45(struct mii_bus *bus, int addr, int dev,
> +				 int reg, u16 val)
> +{
> +	struct dw_xpcs_regmap *pxpcs = bus->priv;
> +
> +	if (addr != 0)
> +		return -ENODEV;
> +
> +	if (pxpcs->reg_indir)
> +		return xpcs_regmap_write_reg_indirect(pxpcs, dev, reg, val);
> +	else
> +		return xpcs_regmap_write_reg_direct(pxpcs, dev, reg, val);
> +}
> +
> +static void devm_xpcs_regmap_destroy(void *data)
> +{
> +	struct dw_xpcs *xpcs = data;
> +
> +	xpcs_destroy(xpcs);
> +}
> +
> +struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
> +					  const struct xpcs_regmap_config *config)
> +{
> +	static atomic_t id = ATOMIC_INIT(-1);
> +	struct dw_xpcs_regmap *pxpcs;
> +	struct dw_xpcs *xpcs;
> +	int ret;
> +
> +	pxpcs = devm_kzalloc(dev, sizeof(*pxpcs), GFP_KERNEL);
> +	if (!pxpcs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pxpcs->dev = dev;
> +	pxpcs->regmap = config->regmap;
> +	pxpcs->reg_indir = config->reg_indir;

Looking at the overall series, is there any reason for this flag ?

Looks like the reg_indir=false path isn't used at all in this series.

Maybe just drop it and let anyone add it back should the need arise ?

Maxime


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
