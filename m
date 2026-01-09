Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E92D0BD78
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 19:31:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DFC6C8F292;
	Fri,  9 Jan 2026 18:31:18 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11827C8F291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 18:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=EwGYOeRaxC8r7KLQ5MPQHRQIWLWbUCt3JTk1jKiuCXI=; b=COcIW6ipe3pNW3FLUndl9lxole
 p8kA6IAipiGel0bGPkZFc3iT9DHRMCYDVlPe/BHwmOlsOZHjg3xxIW3w7TXTZou1tIeT2KcsH3x0V
 FnOnenbGbAWs4NA4n7Dq5nWHLvTRDKIjGvMGZRm65GhmpmKvcfr4F2WOsA+Eq5U6LJts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1veHGP-0029bk-2U; Fri, 09 Jan 2026 19:31:09 +0100
Date: Fri, 9 Jan 2026 19:31:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: lizhi2@eswincomputing.com
Message-ID: <1f553a6e-ca95-45e2-be14-96557a35e618@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080929.1308-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260109080929.1308-1-lizhi2@eswincomputing.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linmin@eswincomputing.com, devicetree@vger.kernel.org,
 ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: eic7700: enable
 clocks before syscon access and correct RX sampling timing
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

> +	dwc_priv->eic7700_hsp_regmap =
> +			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +							"eswin,hsp-sp-csr");
> +	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
>  		return dev_err_probe(&pdev->dev,
> -				PTR_ERR(eic7700_hsp_regmap),
> +				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
>  				"Failed to get hsp-sp-csr regmap\n");

In order to be backwards compatible, you cannot error out here,
because old DT blobs won't have this property.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
