Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A2B9F4E37
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 15:49:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89DDDC78014;
	Tue, 17 Dec 2024 14:49:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E032BC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 14:49:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 932475C44DB;
 Tue, 17 Dec 2024 14:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC30C4CED4;
 Tue, 17 Dec 2024 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734446950;
 bh=S5/ik6fbwrpyH3KSs+GVUj/CwVH+gNMOhnzP7q730h0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IqHQ23rNJvtV2zSWtz1Es0/zYfqBOVMSlTnIkbbPmk2R1d5jMnegR/jaVbOQdNwy5
 FVMq/xQd+jsedpESIGo7NCI+aQtoUtPuU4EcrT9DeTBmDfAD+h/at4RRBKhpQx0w5V
 /mj54HSZ1Cf0TzeGBfxwsSywidecWbwuBpOd4MY6kcKUsY6fOihCe+DXedu6u0rHV7
 upgf8hqlwkc9fm/M6L00ZcFJKs2XC2JRXZJCdeacJ3PKJagahHY/fjLsE9YjOLiXy+
 0GOsrJH+VuoIhHw9kzWHb/6mIVDM3SZZTxhTIBN4Cuxw7LnRu1ABU0nBAz8s3An6Rf
 WSlKf7rBrlnEQ==
Date: Tue, 17 Dec 2024 06:49:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20241217064907.0e509769@kernel.org>
In-Reply-To: <20241217135932.60711288@fedora.home>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
 <20241213090526.71516-3-maxime.chevallier@bootlin.com>
 <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
 <20241213182904.55eb2504@fedora.home>
 <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <20241216094224.199e8df7@fedora.home>
 <20241216173333.55e35f34@kernel.org>
 <20241217135932.60711288@fedora.home>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-socfpga:
 Set interface modes from Lynx PCS as supported
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

Let me triple check ;)

On Tue, 17 Dec 2024 13:59:32 +0100 Maxime Chevallier wrote:
> - The priv->phylink_config.supported_interfaces is incomplete on
> dwmac-socfpga. Russell's patch 5 intersects these modes with that the
                                   ^^^^^^^^^^
> PCS supports :
> 
> +		phy_interface_or(priv->phylink_config.supported_interfaces,
                              ^^
> +				 priv->phylink_config.supported_interfaces,
> +				 pcs->supported_interfaces);
> 
> So without patch 2 in the series, we'll be missing
> PHY_INTERFACE_MODE_1000BASEX in the end result :)

"Or" is a sum/union, not intersection.

You set the bits in priv->phylink_config.supported_interfaces.
Russell does:

	priv->phylink_config.supported_interfaces |=
		pcs->supported_interfaces;

If I'm missing the point please repost once Russell's patches 
are merged :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
