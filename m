Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA9FB0DCFE
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 16:07:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 625CAC3F93F;
	Tue, 22 Jul 2025 14:07:45 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26500C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 14:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=0jFu8sOPMkZ/eXw6Hxbm9Ofc0OdtdvCKlqxK+F5dq+o=; b=JllzPbi4165KOYJ2nX+VJKqDBQ
 lWhb1tCON1TGIfIOosVj0nG3GP2UA5+/uXuYkTUGckTMi9dwwtCcSR3gGXBtwymADInPsmN2p6uk7
 Pp8KHRCREAg1Wt2aOR6rPdoYn8bZA6zmotNFJ0JtXCk/l0OJbrM/h85Q4W4q5rPLvrSM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ueDeN-002TOt-AW; Tue, 22 Jul 2025 16:07:23 +0200
Date: Tue, 22 Jul 2025 16:07:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Message-ID: <28a48738-af05-41a4-be4c-5ca9ec2071d3@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
 <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
 <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
 <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com, 0x1207@gmail.com,
 kuba@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, inochiama@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 2/2] ethernet: eswin: Add eic7700
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

> In v2, `eswin,dly-param-xxx` is used to configure all delay registers via
> device tree, including RXCLK and TXCLK. Based on the latest discussion,
> this approach in the next version:
> - The delay configuration for RXCLK and TXCLK will be handled using the
>  standard DT properties `rx-internal-delay-ps` and `tx-internal-delay-ps`.
> - The remaining delay configuration (e.g., for RXD0-4, TXD0-4, RXDV) will
>  continue to use the vendor-specific `eswin,dly-param-xxx` properties.
> - If the standard delay properties are not specified in DT, a default of 0
> ps
>  will be assumed.

Please keep the RGMII standard in mind. All it says is that there
should be a 2ns delay between the data and the clock signal. It is
also quite generous on the range of delays which should actually
work. It says nothing about being able to configure that delay. And it
definitely says nothing about being able to configure each individual
single.

You hardware has a lot of flexibility, but none of if should actually
be needed, if you follow the standard.

So phy-mode = "rgmii-id"; should be all you need for most boards.
Everything else should be optional, with sensible defaults.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
