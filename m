Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vD+eHqPhImoDewEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 16:48:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6C648F83
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 16:48:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=YcDIn0z0;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C40E1C87ED6;
	Fri,  5 Jun 2026 14:48:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A807EC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 14:48:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 68DD9418A8;
 Fri,  5 Jun 2026 14:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E051F00893;
 Fri,  5 Jun 2026 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780670879;
 bh=bfFH8ZVDSQVCgdkYKT1+TMLQUY2s3jnNF65qom08fFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=YcDIn0z0biXIa+Od9GsBSTOJ6pAH9BCXCH0NzNYZHwJ4KR6orHsNPrVwhARZtUESp
 OfefIB+JQzAYPEJuu2J3LvHDwoWFp8awD03ZQ6Ex/NhPDXM4YI/xPao97CuyJ2lPwk
 5v3vGO29giHR0jblizx5wkkOoaJHIsI+0Cr8w2Pg4d1HeInCpGIZqsSNapx+UUhD00
 hfR+J+9fg+K2ZMjd4ybYE1mn5/IZtuvlV6CvREIwCZsJViRaL/NVGtLTUt06naaEA0
 lhrogLAmQTsiA59CvWJ7K0W0FmKbRwRUgp/eHEcZn4393IUGJDIZXYhJddrFW7TBIu
 4kjMdRx3q74Eg==
Date: Fri, 5 Jun 2026 09:47:58 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Message-ID: <20260605144758.GB3659201-robh@kernel.org>
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-14-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260605010022.968612-14-elder@riscstar.com>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 13/14] net: stmmac: tc956x:
 add TC956x/QPS615 support
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
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069@gmail.com,m:
 davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17A6C648F83

On Thu, Jun 04, 2026 at 08:00:20PM -0500, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
> small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
> that can be accessed, along with several other peripherals, via two
> PCIe endpoint functions. There is a main driver for the endpoint that
> decomposes things and creates auxiliary bus devices to model the SoC.
> 
> The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
> supported by an MSIGEN that bridges TC956x level interrupts to PCIe
> MSIs.
> 
> Add a driver for the eMAC/MSIGEN combination.
> 
> Co-developed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>

The order is wrong here unless you worked on it and then Daniel took 
over. Tags should be chronological order.

> ---
>  MAINTAINERS                                   |   2 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  14 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>  .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 818 ++++++++++++++++++
>  4 files changed, 836 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0439607d1155f..418537cbefbbb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27059,6 +27059,8 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>  F:	drivers/gpio/gpio-tc956x.c
>  F:	drivers/misc/tc956x_pci.c
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
> +F:	include/soc/toshiba/tc956x-dwmac.h
>  
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index e3dd5adda5aca..8d247e033e356 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -404,6 +404,20 @@ config DWMAC_MOTORCOMM
>  	  This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
>  	  controllers. Currently only YT6801 is supported.
>  
> +config DWMAC_TC956X
> +	tristate "Toshiba TC956X DWMAC support"
> +	depends on PCI
> +	depends on COMMON_CLK
> +	depends on TOSHIBA_TC956X_PCI
> +	default TOSHIBA_TC956X_PCI
> +	select GENERIC_IRQ_CHIP
> +	help
> +	  This selects the Toshiba TC956X (and Qualcomm QPS615) support in the
> +	  stmmac driver.
> +
> +	  This provides support for the ethernet controllers found on these
> +	  devices.
> +
>  config STMMAC_PCI
>  	tristate "STMMAC PCI bus support"
>  	depends on PCI
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index a1cea2f57252e..e8e7f95dbe3e8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -51,4 +51,6 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
>  obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
>  obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
>  obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
> +obj-$(CONFIG_TC956X_PCI)	+= tc956x-pci.o
> +obj-$(CONFIG_DWMAC_TC956X)	+= dwmac-tc956x.o
>  stmmac-pci-objs:= stmmac_pci.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
> new file mode 100644
> index 0000000000000..c77585e4a50e6
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
> @@ -0,0 +1,818 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
> + *
> + * Derived from code having the following copyrights:
> + * Copyright (C) 2011-2012  Vayavya Labs Pvt Ltd
> + * Copyright (C) 2025 Toshiba Electronic Devices & Storage Corporation
> + */
> +
> +#include <linux/auxiliary_bus.h>

Based on the block diagram, these are PCI devices. Auxiliary bus is the 
wrong thing to use here.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
