Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F5D3172D8
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Feb 2021 23:05:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE5DEC57B53;
	Wed, 10 Feb 2021 22:05:22 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 227DAC5718A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 22:05:20 +0000 (UTC)
Date: Thu, 11 Feb 2021 01:05:18 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Message-ID: <20210210220518.nbzm6ux6pui2csbf@mobilestation>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
 <20210208135609.7685-8-Sergey.Semin@baikalelectronics.ru>
 <20210209223258.GA328873@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209223258.GA328873@robh.at.kernel.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Joao Pinto <jpinto@synopsys.com>,
 netdev@vger.kernel.org, Lars Persson <larper@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, Johan Hovold <johan@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH v2 07/24] dt-bindings: net: dwmac: Detach
 Generic DW MAC bindings
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

On Tue, Feb 09, 2021 at 04:32:58PM -0600, Rob Herring wrote:
> On Mon, Feb 08, 2021 at 04:55:51PM +0300, Serge Semin wrote:
> > Currently the snps,dwmac.yaml DT bindings file is used for both DT nodes
> > describing generic DW MAC devices and as DT schema with common properties
> > to be evaluated against a vendor-specific DW MAC IP-cores. Due to such
> > dual-purpose design the "compatible" property of the common DW MAC schema
> > needs to contain the vendor-specific strings to successfully pass the
> > schema evaluation in case if it's referenced from the vendor-specific DT
> > bindings. That's a bad design from maintainability point of view, since
> > adding/removing any DW MAC-based device bindings requires the common
> > schema modification. In order to fix that let's detach the schema which
> > provides the generic DW MAC DT nodes evaluation into a dedicated DT
> > bindings file preserving the common DW MAC properties declaration in the
> > snps,dwmac.yaml file. By doing so we'll still provide a common properties
> > evaluation for each vendor-specific MAC bindings which refer to the
> > common bindings file, while the generic DW MAC DT nodes will be checked
> > against the new snps,dwmac-generic.yaml DT schema.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v2:
> > - Add a note to the snps,dwmac-generic.yaml bindings file description of
> >   a requirement to create a new DT bindings file for the vendor-specific
> >   versions of the DW MAC.
> > ---
> >  .../bindings/net/snps,dwmac-generic.yaml      | 154 ++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml   | 139 +---------------
> >  2 files changed, 155 insertions(+), 138 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> > new file mode 100644
> > index 000000000000..6c3bf5b2f890
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> > @@ -0,0 +1,154 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/snps,dwmac-generic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synopsys DesignWare Generic MAC Device Tree Bindings
> > +
> > +maintainers:
> > +  - Alexandre Torgue <alexandre.torgue@st.com>
> > +  - Giuseppe Cavallaro <peppe.cavallaro@st.com>
> > +  - Jose Abreu <joabreu@synopsys.com>
> > +
> > +description:
> > +  The primary purpose of this bindings file is to validate the Generic
> > +  Synopsys Desginware MAC DT nodes defined in accordance with the select
> > +  schema. All new vendor-specific versions of the DW *MAC IP-cores must
> > +  be described in a dedicated DT bindings file.
> > +
> > +# Select the DT nodes, which have got compatible strings either as just a
> > +# single string with IP-core name optionally followed by the IP version or
> > +# two strings: one with IP-core name plus the IP version, another as just
> > +# the IP-core name.
> > +select:
> > +  properties:
> > +    compatible:
> > +      oneOf:
> > +        - items:
> > +            - pattern: "^snps,dw(xg)+mac(-[0-9]+\\.[0-9]+a?)?$"
> 

> Use '' instead of "" and you can skip the double \.
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Got it. Thanks.

-Sergey

> 
> > +        - items:
> > +            - pattern: "^snps,dwmac-[0-9]+\\.[0-9]+a?$"
> > +            - const: snps,dwmac
> > +        - items:
> > +            - pattern: "^snps,dwxgmac-[0-9]+\\.[0-9]+a?$"
> > +            - const: snps,dwxgmac
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
