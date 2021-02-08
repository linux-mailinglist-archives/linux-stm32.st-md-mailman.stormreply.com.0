Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DCE313E6E
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 20:05:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5E43C57189;
	Mon,  8 Feb 2021 19:05:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B703C5717D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 19:05:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 783B364E8C;
 Mon,  8 Feb 2021 19:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612811125;
 bh=2JC70mXZqImlB6IjWOvtQN/wJ5o2d5jfmnWoF61hxG4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DfdXaKmVsCHSnfTWKM2Kspc1e1q8brgQ5Et/bNcRGbkjoDXPEMgaIrXX6IjiQoqki
 DIoZ0Ab9usdBoEJkv5z4+AQHyWJVUefYiswO9p7HbGP/qEz+PP3XIpcyoIUpSxO1xd
 JmkFmVEF4/sTc+q4u62dhpdOEShQec1zisR22w93DS4qZ77gUQnQaRyWMcG9HcReTz
 8wAeVOwkq6p30PA2V5o4twg3+kz/JUUbu0T6O8QE+2N7cnsnWNiqcL5NF9Y9oYrwmI
 ACivHDxYm1Yp0hJfpMIWrbzMdCaHL8ze4M1Z5BoCqrM/sgdVfFvbnxWr7NOqgjCJdT
 0hTi5tVHoVbEA==
Date: Mon, 8 Feb 2021 11:05:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Andrew Lunn
 <andrew@lunn.ch>
Message-ID: <20210208110521.59804f08@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lars Persson <larper@axis.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH v2 00/24] net: stmmac: Fix
 clocks/reset-related procedures
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

On Mon, 8 Feb 2021 16:55:44 +0300 Serge Semin wrote:
> Baikal-T1 SoC is equipped with two Synopsys DesignWare GMAC v3.73a-based
> ethernet interfaces with no internal Ethernet PHY attached. The IP-cores
> are configured as GMAC-AXI with CSR interface clocked by a dedicated
> signal. Each of which has got Rx/Tx FIFOs of 16KB, up to 8 MAC addresses
> capability, no embedded filter hash table logic, EEE enabled, IEEE 1588
> and 1588-2008 Advanced timestamping capabilities, power management with
> remote wake-up, IP CSUM hardware acceleration, a single PHY interface -
> RGMII with MDIO bus, 1xGPI and 1xGPO.
> 
> This is a very first series of patches with fixes we've found to be
> required in order to make things working well for our setup. The series
> has turned to be rather large, but most of the patches are trivial and
> some of them are just cleanups, so it shouldn't be that hard to review.

Hi Serge!

You've submitted 60 patches at once, that's a lot of patches, in netdev
we limit submissions to 15 patches at a time to avoid overwhelming
reviewers. 

At a glance the patches seem to mix fixes which affect existing,
supported systems (eg. error patch reference leaks) with extensions
required to support your platform. Can the two be separated?
The fixes for existing bugs should be targeting net (Subject: 
[PATCH net]) and patches to support your platform net-next (Subject:
[PATCH net-next]).

Right now the patches are not tagged so our build bot tried applying
them to net-next and they failed to apply, so I need to toss them away.

Andrew, others, please chime in if I'm misreading the contents of the
series or if you have additional guidance!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
