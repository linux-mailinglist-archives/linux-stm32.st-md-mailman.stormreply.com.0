Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB2B557A3
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Sep 2025 22:30:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 599B5C3F93E;
	Fri, 12 Sep 2025 20:30:52 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F798C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Sep 2025 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=mVBouDME3yyB4oBFbpIyijCZ2IoHFwuH0Y/Nfu3LeAM=; b=YCPcdasteYKljjzN0JKrJrS6lP
 l3fz/ljsVsjqV2C0ALlax8u6tA3uvM9WaSTUQTrQFM9giuHCkSQwHRgmi4fihEeo6RhZmjkVZ4FqS
 WJNH9xfAocflQzYZpnQKzblj9gY81xljHdYLn36SnAVt7nqshJZidrxEdFFOgk/07zR0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uxAPc-008FmE-0B; Fri, 12 Sep 2025 22:30:28 +0200
Date: Fri, 12 Sep 2025 22:30:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Message-ID: <7c81cd46-36e5-4280-9a49-8924a7bd5f92@lunn.ch>
References: <20250912055352.2832-1-weishangjuan@eswincomputing.com>
 <20250912055702.2939-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250912055702.2939-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, 0x1207@gmail.com, edumazet@google.com,
 jszhang@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, faizal.abdul.rahim@linux.intel.com,
 lizhi2@eswincomputing.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, inochiama@gmail.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, krzk+dt@kernel.org, emil.renner.berthing@canonical.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v6 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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

> +	/* Read rx-internal-delay-ps and update rx_clk delay */
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "rx-internal-delay-ps", &delay_ps)) {
> +		u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
> +
> +		eth_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> +		eth_dly_param |= FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> +	} else {
> +		dev_warn(&pdev->dev, "can't get rx-internal-delay-ps\n");
> +	}

The binding specifies the X-internal-delay-ps values are required. So
this should be dev_err_probe() and return -EINVAL to stop the probe.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
