Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2222ABB23E
	for <lists+linux-stm32@lfdr.de>; Mon, 19 May 2025 00:38:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82C9CC78F85;
	Sun, 18 May 2025 22:38:35 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B402EC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 May 2025 22:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=9PAtzibwPGzPsb2gvUMPS4izyL4nfJ85lKJcGMeMkIY=; b=u9It1wTng+n27k/Da9wot3ipbE
 nkgw93z5yood/RlJjxLZBNSayr0VihjFpH/DTgZN7LxwMLqSt+tX+zWsdW+hrzeOFHIPK7L/wJwSf
 JuxxLpQFWBMFnRxHoYOZgzGvYxQ/L6ebDJ39lmuxrWpq+EXU5WltIGdq21ljuvLHxrxk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uGme5-00Cwv3-Rh; Mon, 19 May 2025 00:38:13 +0200
Date: Mon, 19 May 2025 00:38:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Message-ID: <c9f0cb9e-26e9-43cb-bf67-3fd27033f55c@lunn.ch>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011040.801-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250516011040.801-1-weishangjuan@eswincomputing.com>
Cc: edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 jan.petrous@oss.nxp.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, dfustini@tenstorrent.com,
 linux-arm-kernel@lists.infradead.org, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 p.zabel@pengutronix.de, inochiama@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v1 1/2] ethernet: eswin: Document for
	eic7700 SoC
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

> +  phy-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [mii, gmii, rgmii, rmii, sgmii]

In theory, all four rgmii modes should be listed. In practice, only
rgmii-id is likely to be used.

> +examples:
> +  - |
> +    gmac0: ethernet@50400000 {
> +        compatible = "eswin,eic7700-qos-eth";
> +        reg = <0x0 0x50400000 0x0 0x10000>;
> +        interrupt-parent = <&plic>;
> +        interrupt-names = "macirq";
> +        interrupts = <61>;
> +        phy-mode = "rgmii";

Please don't use rgmii in an example. It is probably wrong, unless you
have an unusual PCB design.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
