Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308850D57A
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 00:01:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6157C5F1F1;
	Sun, 24 Apr 2022 22:01:21 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 116F6C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Apr 2022 22:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=1uhfKcZ+6BWyxBcenyGt8hZC2w8nrTOjeFtKsnxgUy0=; b=TYE4+wL+QXKlSp17Wikv0KyXHZ
 Qn70ubLFPRDJAeMtovP97e10wosR4s9CTGdpCxzqzRc/wx9c5gOZ/1gwguUBGPOLWl2hFfawrU+U0
 9vQCEnnK71mumG96EQk/s8M1TwwNY39oh98GaobVmtn5OVsOxGOQ+PIKJsPyrYDduPno=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nikHz-00HJOS-Ep; Mon, 25 Apr 2022 00:01:07 +0200
Date: Mon, 25 Apr 2022 00:01:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Message-ID: <YmXIo6q8vVkL6zLp@lunn.ch>
References: <36ba455aad3e57c0c1f75cce4ee0f3da69e139a1.camel@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36ba455aad3e57c0c1f75cce4ee0f3da69e139a1.camel@toradex.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] net: stmmac: dwmac-imx: half duplex crash
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

On Sat, Apr 23, 2022 at 10:58:07PM +0000, Marcel Ziswiler wrote:
> Hi there
> 
> We lately tried operating the IMX8MPEVK ENET_QOS imx-dwmac driver in half-duplex modes which crashes as
> follows:

How many transmit queues do you have in operation:

       /* Half-Duplex can only work with single queue */
        if (priv->plat->tx_queues_to_use > 1)
                priv->phylink_config.mac_capabilities &=
                        ~(MAC_10HD | MAC_100HD | MAC_1000HD);

What does ethtool show before you force it? Does it actually list the
HALF modes?

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
