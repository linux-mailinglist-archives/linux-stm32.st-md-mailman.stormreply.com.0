Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D8317350
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Feb 2021 23:28:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30195C57B53;
	Wed, 10 Feb 2021 22:28:09 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43862C5718A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 22:28:07 +0000 (UTC)
Date: Thu, 11 Feb 2021 01:28:05 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Message-ID: <20210210222805.upoioue7uc6cat2v@mobilestation>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
 <20210208140820.10410-2-Sergey.Semin@baikalelectronics.ru>
 <20210209231352.GA402351@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209231352.GA402351@robh.at.kernel.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/16] dt-bindings: net: dwmac: Add DW
 GMAC GPIOs properties
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

On Tue, Feb 09, 2021 at 05:13:52PM -0600, Rob Herring wrote:
> On Mon, Feb 08, 2021 at 05:08:05PM +0300, Serge Semin wrote:
> > Synopsys DesignWare Ethernet controllers can be synthesized with
> > General-Purpose IOs support. GPIOs can work either as inputs or as outputs
> > thus belong to the gpi_i and gpo_o ports respectively. The ports width
> > (number of possible inputs/outputs) and the configuration registers layout
> > depend on the IP-core version. For instance, DW GMAC can have from 0 to 4
> > GPIs and from 0 to 4 GPOs, while DW xGMAC have a wider ports width up to
> > 16 pins of each one.
> > 
> > So the DW MAC DT-node can be equipped with "ngpios" property, which can't
> > have a value greater than 32, standard GPIO-related properties like
> > "gpio-controller" and "#gpio-cells", and, if GPIs are supposed to be
> > detected, IRQ-controller related properties.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml     | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index bdc437b14878..fcca23d3727e 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -110,6 +110,23 @@ properties:
> >    reset-names:
> >      const: stmmaceth
> >  
> > +  ngpios:
> > +    description:
> > +      Total number of GPIOs the MAC supports. The property shall include both
> > +      the GPI and GPO ports width.
> > +    minimum: 1
> > +    maximum: 32
> 

> Does the driver actually need this? I'd omit it if just to validate 
> consumers are in range.

I can't say for all possible DW MAC IP-cores (I've got manuals for
GMAC and xGMAC only), but at least DW GMAC can't have more than four
GPIs and four GPOs, while XGMACs can be synthesized with up to 16
each. That's why I've set the upper boundary here as 32. But the
driver uses the ngpios property do determine the total number GPIOs
the core has been synthesized. Th number of GPIs and GPOs will be
auto-detected then (by writing-reading to-from the GPI type field of
the GPIO control register).

> 
> Are GPI and GPO counts independent? If so, this isn't really sufficient.

Yeap, they are independent. What do you suggest then? Define some
vendor-specific properties like snps,ngpis and snps,ngpos? If so then
they seem more generic than vendor-specific, because the separated
GPI and GPO space isn't an unique feature of the DW MAC GPIOs. Do we
need to create a generic version of such properties then? (That much
more changes then introduced here. We'd need to fix the dt-schema tool
too then.)

-Sergey

> 
> Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
