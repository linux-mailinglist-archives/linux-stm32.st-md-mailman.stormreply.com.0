Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA460946612
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Aug 2024 01:08:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95C6DC7129D;
	Fri,  2 Aug 2024 23:08:18 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E523AC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 23:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=kCvDw6cMtXkCqDiB477k4mCcHd/xIbtjON9PoTAGLh0=; b=e2NxG7814mITJZkIfu4rFDAQiq
 4IaKpIXaqfpBWOc/2N3uQisgAiCLLAhpdwFxkk1fEKfczfNYFDQxGTGUDptl5EScLDbW5fj5x1ZNB
 rrF9CYaTigZp8FbYQ884wruCeDwJHl+xblWWzq3+FiSnmWvmInXnEPObZMsTQBHZvx2s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sa1NQ-003tlO-OQ; Sat, 03 Aug 2024 01:08:00 +0200
Date: Sat, 3 Aug 2024 01:08:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: jitendra.vegiraju@broadcom.com
Message-ID: <c2e2f11a-89d8-42fa-a655-972a4ab372da@lunn.ch>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add PCI
 driver support for BCM8958x
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

> Management of integrated ethernet switch on this SoC is not handled by
> the PCIe interface.

MDIO? SPI? I2C?

> +#define XGMAC_PCIE_MISC_MII_CTRL			0x4
> +#define XGMAC_PCIE_MISC_MII_CTRL_VALUE			0x7

Could you replace these magic values with actual definitions. What
does 7 mean?

> +#define XGMAC_PCIE_MISC_PCIESS_CTRL			0x8
> +#define XGMAC_PCIE_MISC_PCIESS_CTRL_VALUE		0x200

> +static int num_instances;

> +	/* This device is directly attached to the switch chip internal to the
> +	 * SoC using XGMII interface. Since no MDIO is present, register
> +	 * fixed-link software_node to create phylink.
> +	 */
> +	if (num_instances == 0) {
> +		ret = software_node_register_node_group(fixed_link_node_group);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"%s: failed to register software node\n",
> +				__func__);
> +			return ret;
> +		}
> +	}
> +	num_instances++;

So all the instances of the MAC share one fixed link? That is pretty
unusual. In DT, each would have its own. Have you reviewed the
implications of this?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
