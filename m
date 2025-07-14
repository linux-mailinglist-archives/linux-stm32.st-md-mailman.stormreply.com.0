Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E5B04B20
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 00:58:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB5CBC3F92F;
	Mon, 14 Jul 2025 22:58:01 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D574C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 22:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=re5vEpWzxNdWCjr9r1o7knlAw2oLCVrTuWhoL9AZx4g=; b=fwkO7GOy6gh70PKilmMQibFb0V
 +X4ndIAYAZUUWrnjfTRP7MHxTmBVi+zHqVuapH+IzjGGDso9u2dFZSrzGOP8AGHidmECNpmwKXGGh
 CG4oA5yqgTt3iutTmvACQjNmfT/f0eZzSKKNYQZPTskc1ActSOjcK2horL4AroxCqVGA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ubS7N-001W4h-3e; Tue, 15 Jul 2025 00:57:53 +0200
Date: Tue, 15 Jul 2025 00:57:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Message-ID: <8b7f0946-4c95-465a-a462-48fa9887aade@lunn.ch>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
 <20250714152528.311398-4-matthew.gerlach@altera.com>
 <de1e4302-0262-4bcc-b324-49bfc2f5fd11@lunn.ch>
 <256054d7-351a-4b1c-8e1a-48628ace091d@altera.com>
 <86e1e04a-3242-482c-adb0-dde7375561c1@lunn.ch>
 <baed95d4-c220-4d3b-8173-fc673660432d@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <baed95d4-c220-4d3b-8173-fc673660432d@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/4] arm64: dts: socfpga: agilex5: enable
 gmac2 on the Agilex5 dev kit
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

> Currently the
> driver, drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c, and its
> bindings, Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml,
> allow all rgmii phy-modes.

There is nothing unusual about allowing all four RGMII modes. Somebody
might design a board with the 2ns delay via extra long clocks lines,
or some other form of delay lines. Such a board would need 'rgmii',
and they do exist, a board like this was added this cycle. There is
one rather odd board with a DT file which has extra long clock line
for TX, but not RX! That needs rgmii-rxid. The majority of boards
don't have any delays on the PCB, so need 'rgmii-id'.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
