Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 676F0315141
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 15:11:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D5AC57B53;
	Tue,  9 Feb 2021 14:11:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ED19C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 14:11:53 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1l9Tjx-0057rG-Nl; Tue, 09 Feb 2021 15:11:41 +0100
Date: Tue, 9 Feb 2021 15:11:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <YCKYHay9PsR2o04z@lunn.ch>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
 <YCGSwZnSXIz5Ssef@lunn.ch>
 <20210209111609.tjxoqr6stkcf22jy@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209111609.tjxoqr6stkcf22jy@mobilestation>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
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

> Regarding splitting the series up. I don't see a problem in just
> sending the cover-letter patch and actual GPIO-related patches to
> the GPIO-maintainers with no need to have them added to Cc in the rest
> of the series.

The Linux community has to handle a large number of patches. I don't
particularly want patches which are of no relevance to me landing in
my mailbox. It might take 4 or 5 rounds for the preparation patches to
be accepted. That is 4 or 5 times you are spamming the GPIO
maintainers with stuff which is not relevant to them.

One of the unfortunately things about the kernel process is, there are
a lot of developers, and not many maintainers. So the processes need
to make the life of maintainers easier, and not spamming them helps.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
