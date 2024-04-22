Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9C98AD171
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 18:03:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DC62C7128C;
	Mon, 22 Apr 2024 16:03:10 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 518DDC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=nrWXsKM4GcLwFBIZrYvh14P/NRPtdrs1fUJfL6jXu2M=; b=222tnBrQxmPiTVFF5iurH3o4Ms
 jz0+OyhvcCMg1AKkQYQdWPsQJmy0WBpcYOdwK0b6dNfthA3JYwsjsw3eEbZM61aaOJhbzKqgUHVVR
 ySoKu+nGVjb5gjPaGgvGYFGT/MDyLCVgqpk5Nd5TAInaSWOsucpk1U0eZ54CPbRghaww=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ryw80-00DdF8-R4; Mon, 22 Apr 2024 18:02:48 +0200
Date: Mon, 22 Apr 2024 18:02:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Message-ID: <972f323b-2c90-4088-b245-d5a8077d77e8@lunn.ch>
References: <20240422-v6-9-topic-imx93-eqos-rmii-v1-0-30151fca43d2@pengutronix.de>
 <20240422-v6-9-topic-imx93-eqos-rmii-v1-1-30151fca43d2@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240422-v6-9-topic-imx93-eqos-rmii-v1-1-30151fca43d2@pengutronix.de>
Cc: imx@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: net: mx93: add
	enet_clk_sel binding
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

> +  enet_clk_sel:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the GPR syscon
> +          - description: the offset of the GPR register
> +    description:
> +      Should be phandle/offset pair. The phandle to the syscon node which
> +      encompases the GPR register, and the offset of the GPR register.
> +

net/nxp,dwmac-imx.yaml

  intf_mode:
    $ref: /schemas/types.yaml#/definitions/phandle-array
    items:
      - items:
          - description: phandle to the GPR syscon
          - description: the offset of the GPR register
    description:
      Should be phandle/offset pair. The phandle to the syscon node which
      encompases the GPR register, and the offset of the GPR register.

dma/fsl,imx-sdma.yaml

  gpr:
    $ref: /schemas/types.yaml#/definitions/phandle
    description: The phandle to the General Purpose Register (GPR) node

memory-controllers/fsl/fsl,imx-weim.yaml

 fsl,weim-cs-gpr:
    $ref: /schemas/types.yaml#/definitions/phandle
    description: |
      Phandle to the system General Purpose Register controller that contains
      WEIM CS GPR register, e.g. IOMUXC_GPR1 on i.MX6Q. IOMUXC_GPR1[11:0]
      should be set up as one of the following 4 possible values depending on
      the CS space configuration.

      IOMUXC_GPR1[11:0]    CS0    CS1    CS2    CS3
      ---------------------------------------------
              05          128M     0M     0M     0M
              033          64M    64M     0M     0M
              0113         64M    32M    32M     0M
              01111        32M    32M    32M    32M

      In case that the property is absent, the reset value or what bootloader
      sets up in IOMUXC_GPR1[11:0] will be used.

How about defining that the General Purpose Registers property is
once, rather than per device which needs access to it?

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
