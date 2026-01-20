Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIwRALOScGkaYgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 09:47:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C9853D29
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 09:47:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37363C3F944;
	Wed, 21 Jan 2026 08:47:46 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03F36C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 11:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768907647; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MLm/apznCo1vkrhgqdt2z6fqtnb1SbIVdgzHikdkv35tmySWGCVPqd99XhKn9owM3TbqWCkOIMUUwMS+4V/TExvZibsn+8Ef//q7UoIpTE2r5lb8zot88oM3B8j424J46SwRKKCxuFyolNStCD9T4Odg+1rktwEjUujOY7kupJg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768907647;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tJlvsdjO7MakrXAnTGrsJvCK8GVpY/2Oni8KztKsRFI=; 
 b=h7QuZ28EnDC7OQBna/NjX26H1HsexkJZmeY1FtM/izwfHFAZwH8EL5v++SrxWlMuY3MvlCvGBkrSFHFJvTyjQxl9FabP5zAfyzp91rYyIofRWW4ljwoTCkP2u5S7awWzTYW51Qlgz5vSOqZkTV7986ETKQgVlqL8SVgq5v9KunM=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=ziyao.cc;
 spf=pass  smtp.mailfrom=me@ziyao.cc;
 dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768907647; 
 s=zmail; d=ziyao.cc; i=me@ziyao.cc;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=tJlvsdjO7MakrXAnTGrsJvCK8GVpY/2Oni8KztKsRFI=;
 b=IQ5J3XJXRxRY9SMaPXJbxjogepRElpYKptpWbrV3D841tGD/EIepXwW76IZohqcy
 tnt4sfgsqRQ+Nlu3e54z/Hy1Q5EUkmVxxbP0+LS0HVeGOdWosQZsgLuN1Jw6Fudw2GR
 WCsTFNyASwHiRvKnThPceu0ee3SM5iJpw8xp1sd8=
Received: by mx.zohomail.com with SMTPS id 176890764538613.18629924577317;
 Tue, 20 Jan 2026 03:14:05 -0800 (PST)
Date: Tue, 20 Jan 2026 11:13:50 +0000
From: Yao Zi <me@ziyao.cc>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Message-ID: <aW9jbqBSgkiLLw8r@pie>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120043609.910302-4-inochiama@gmail.com>
X-ZohoMailClient: External
X-Mailman-Approved-At: Wed, 21 Jan 2026 08:47:44 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Add glue layer
 for Spacemit K3 SoC
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ziyao.cc : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ziyao.cc:s=zmail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:zohomail.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@gentoo.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:siyanteng@cqsoftware.com.cn,m:ziyao@disroot.org,m:vladimir.oltean@nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:yong.liang.choong@linux.intel.com,m:maxime.chevallier@bootlin.com,m:wens@kernel.org,m:weishangjuan@eswincomputing.com,m:boon.khai.ng@altera.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lis
 ts.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[me@ziyao.cc,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gentoo.org,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,cqsoftware.com.cn,disroot.org,nxp.com,bp.renesas.com,linux.intel.com,bootlin.com,eswincomputing.com,altera.com,cherry.de,st.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[ziyao.cc:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@ziyao.cc,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 76C9853D29
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Tue, Jan 20, 2026 at 12:36:08PM +0800, Inochi Amaoto wrote:
> Adds Spacemit dwmac driver support on the Spacemit K3 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 224 ++++++++++++++++++
>  3 files changed, 237 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> new file mode 100644
> index 000000000000..72744e60d02a
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Spacemit DWMAC platform driver
> + *
> + * Copyright (C) 2026 Inochi Amaoto <inochiama@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/math.h>

These are the only two headers listed out-of-order. Is this intended?

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

...

> +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> +					       unsigned int *config)
> +{
> +	int i;
> +	int code, best_code = 0;
> +	unsigned int best_delay = 0;
> +	unsigned int best_config = 0;
> +
> +	if (delay == 0)
> +		return 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> +		unsigned int step = k3_delay_step_10x[i];
> +
> +		for (code = 1; code <= MAX_DLINE_DELAY_CODE; code++) {
> +			/*
> +			 * Note K3 require a specific factor for calculate
> +			 * the delay, in this scenario it is 0.9. So the
> +			 * formula is code * step / 10 * 0.9
> +			 */
> +			unsigned int tmp = code * step * 9 / 10 / 10;
> +
> +			if (abs(tmp - delay) < abs(best_delay - delay)) {
> +				best_code = code;
> +				best_delay = tmp;
> +				best_config = i;
> +			}

Is the inner loop really necessary? Could it be replaced by

	this_code = DIV_ROUND_CLOSEST(delay * 10 * 10, step * 9);
	this_delay = this_code * step * 9 / 10 / 10;

Then comparing abs(this_delay - delay) and abs(best_delay - delay)?

> +		}
> +	}
> +
> +	*config = best_config;
> +
> +	return best_code;
> +}

...

> +static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
> +					  struct stmmac_resources *stmmac_res,
> +					  struct regmap *apmu,
> +					  unsigned int ctrl_offset)
> +{
> +	unsigned int mask = PHY_INTF_MII | PHY_INTF_RGMII | WAKE_IRQ_EN;
> +	unsigned int val = 0;
> +
> +	switch (plat_dat->phy_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		val |= PHY_INTF_MII;
> +		break;

The OR operation seems unnecessary and could be replaced with an
assignment. Same for PHY_INTERFACE_MODE_RGMII's case.

> +
> +	case PHY_INTERFACE_MODE_RMII:
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		val |= PHY_INTF_RGMII;
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}

...

> +static int spacemit_dwmac_probe(struct platform_device *pdev)
> +{

...

> +	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
> +	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);

According to of.h, of_property_read_u32, which in turn calls
of_property_read_u32_array, could fail with -ENODATA if there's no value
associated with the property. Should the case be handled?

Regards,
Yao Zi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
