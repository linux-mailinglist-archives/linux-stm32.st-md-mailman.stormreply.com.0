Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6B5670FCF
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 02:17:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD1F8C65E71;
	Wed, 18 Jan 2023 01:17:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E38E7C6507E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 01:17:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91B03615BF;
 Wed, 18 Jan 2023 01:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EDEC433D2;
 Wed, 18 Jan 2023 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674004662;
 bh=FGOiyRzcJoEHKdMm+kbK+YBbd8BVEKp07glKSiqMg5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QbeEAIQw7uP/CRIUHrwWm1uUqA0LznQ6bZkZCm/JvVzO+chR72Aco1aIqOwMEMO6A
 nBojp92S1Dz6EWGVhbEqXnr2gR1nDDCg1BvKgFHpWbYSepjNRH/Y/8jrAVBM+iwkX5
 HJdlwLQF+HWFHnVGGr0vEm2GmGJw5zhl0oOL6KxGZo1YkpRav1MK6etkZ44IQEhchi
 ys/UxjqQtx//40gat0FDCYAyyq+pPU/BaAhpVXg2/scFUUHc+hUK6WNuwBEXmm5NCW
 cvWuhnpp8XPzu/obuWLLL3faKEfzlFEgRT48oZuIESimcnHSBlKaDsX86cFMQE22Of
 l8V+vvA4V+WDQ==
Date: Tue, 17 Jan 2023 17:17:40 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Walle <michael@walle.cc>
Message-ID: <20230117171740.3a9e6f8d@kernel.org>
In-Reply-To: <20230116-net-next-remove-probe-capabilities-v1-2-5aa29738a023@walle.cc>
References: <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
 <20230116-net-next-remove-probe-capabilities-v1-2-5aa29738a023@walle.cc>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Joel Stanley <joel@jms.id.au>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: mdio: Rework scanning
 of bus ready for quirks
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

On Mon, 16 Jan 2023 13:55:14 +0100 Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> Some C22 PHYs do bad things when there are C45 transactions on the
> bus. In order to handle this, the bus needs to be scanned first for
> C22 at all addresses, and then C45 scanned for all addresses.
> 
> The Marvell pxa168 driver scans a specific address on the bus to find
> its PHY. This is a C22 only device, so update it to use the c22
> helper.

clang says:

drivers/net/phy/mdio_bus.c:708:11: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
        while (--i >= 0) {
                 ^
drivers/net/phy/mdio_bus.c:620:7: note: initialize the variable 'i' to silence this warning
        int i, err;
             ^
              = 0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
