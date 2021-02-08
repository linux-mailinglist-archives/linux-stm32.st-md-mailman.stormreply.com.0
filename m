Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D6A313F25
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 20:36:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB5F5C57189;
	Mon,  8 Feb 2021 19:36:41 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5AC5C3FADB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 19:36:40 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1l9CKn-004vUw-8i; Mon, 08 Feb 2021 20:36:33 +0100
Date: Mon, 8 Feb 2021 20:36:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <YCGSwZnSXIz5Ssef@lunn.ch>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
Cc: Jose Abreu <joabreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/16] net: stmmac: Add DW MAC GPIOs and
 Baikal-T1 GMAC support
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

On Mon, Feb 08, 2021 at 05:08:04PM +0300, Serge Semin wrote:

Hi Serge

I suggest you split this patchset up. This uses the generic GPIO
framework, which is great. But that also means you should be Cc: the
GPIO subsystem maintainers and list. But you don't want to spam them
with all the preparation work, which has little to do with the GPIO
code.

So please split the actual GPIO driver and DT binding patches from the
rest. netdev can review the preparation work, with a comment in the
0/X patch about what the big picture is, and then afterwards review
the GPIO patchset with a wider audience.

And as Jakub pointed out, nobody is going to review 60 patches all at
once. Please submit one series at a time, get it merged, and then
move onto the next.

	 Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
