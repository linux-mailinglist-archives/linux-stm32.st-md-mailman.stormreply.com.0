Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5C2DBB2A
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Dec 2020 07:25:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A994C3089F;
	Wed, 16 Dec 2020 06:25:03 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A50FC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Dec 2020 06:25:01 +0000 (UTC)
Date: Wed, 16 Dec 2020 09:24:58 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Message-ID: <20201216062458.7oiccf6fc5lvabdc@mobilestation>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
 <20201214091616.13545-5-Sergey.Semin@baikalelectronics.ru>
 <20201214143006.GA1864564@robh.at.kernel.org>
 <20201215085421.v5aepprkk2iyimaw@mobilestation>
 <CAL_JsqK2LLGMmVMrmgK-SidhVQ0y=d-6VvrXcuK_FHmQ2ijmjg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqK2LLGMmVMrmgK-SidhVQ0y=d-6VvrXcuK_FHmQ2ijmjg@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev <netdev@vger.kernel.org>,
 Lars Persson <larper@axis.com>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Johan Hovold <johan@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH 04/25] dt-bindings: net: dwmac: Refactor
 snps, *-config properties
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

On Tue, Dec 15, 2020 at 08:08:35AM -0600, Rob Herring wrote:
> On Tue, Dec 15, 2020 at 2:54 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > Hello Rob,
> >
> > On Mon, Dec 14, 2020 at 08:30:06AM -0600, Rob Herring wrote:
> > > On Mon, Dec 14, 2020 at 12:15:54PM +0300, Serge Semin wrote:
> > > > Currently the "snps,axi-config", "snps,mtl-rx-config" and
> > > > "snps,mtl-tx-config" properties are declared as a single phandle reference
> > > > to a node with corresponding parameters defined. That's not good for
> > > > several reasons. First of all scattering around a device tree some
> > > > particular device-specific configs with no visual relation to that device
> > > > isn't suitable from maintainability point of view. That leads to a
> > > > disturbed representation of the actual device tree mixing actual device
> > > > nodes and some vendor-specific configs. Secondly using the same configs
> > > > set for several device nodes doesn't represent well the devices structure,
> > > > since the interfaces these configs describe in hardware belong to
> > > > different devices and may actually differ. In the later case having the
> > > > configs node separated from the corresponding device nodes gets to be
> > > > even unjustified.
> > > >
> > > > So instead of having a separate DW *MAC configs nodes we suggest to
> > > > define them as sub-nodes of the device nodes, which interfaces they
> > > > actually describe. By doing so we'll make the DW *MAC nodes visually
> > > > correct describing all the aspects of the IP-core configuration. Thus
> > > > we'll be able to describe the configs sub-nodes bindings right in the
> > > > snps,dwmac.yaml file.
> > > >
> > > > Note the former "snps,axi-config", "snps,mtl-rx-config" and
> > > > "snps,mtl-tx-config" bindings have been marked as deprecated.
> > > >
> > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > >
> > > > ---
> > > >
> > > > Note the current DT schema tool requires the vendor-specific properties to be
> > > > defined in accordance with the schema: dtschema/meta-schemas/vendor-props.yaml
> > > > It means the property can be;
> > > > - boolean,
> > > > - string,
> > > > - defined with $ref and additional constraints,
> > > > - defined with allOf: [ $ref ] and additional constraints.
> > > >
> > > > The modification provided by this commit needs to extend that definition to
> > > > make the DT schema tool correctly parse this schema. That is we need to let
> > > > the vendors-specific properties to also accept the oneOf-based combined
> > > > sub-schema. Like this:
> > > >
> > > > --- a/dtschema/meta-schemas/vendor-props.yaml
> > > > +++ b/dtschema/meta-schemas/vendor-props.yaml
> > > > @@ -48,15 +48,24 @@
> > > >        - properties:   # A property with a type and additional constraints
> > > >            $ref:
> > > >              pattern: "types.yaml#[\/]{0,1}definitions\/.*"
> > > > -          allOf:
> > > > -            items:
> > > > -              - properties:
> > > > +
> > > > +        if:
> > > > +          not:
> > > > +            required:
> > > > +              - $ref
> > > > +        then:
> > > > +          patternProperties:
> > > > +            "^(all|one)Of$":
> > > > +              contains:
> > > > +                properties:
> > > >                    $ref:
> > > >                      pattern: "types.yaml#[\/]{0,1}definitions\/.*"
> > > >                  required:
> > > >                    - $ref
> > > > -        oneOf:
> > > > +
> > > > +        anyOf:
> > > >            - required: [ $ref ]
> > > >            - required: [ allOf ]
> > > > +          - required: [ oneOf ]
> > > >
> > > >  ...
> > > > ---
> > > >  .../devicetree/bindings/net/snps,dwmac.yaml   | 380 +++++++++++++-----
> > > >  1 file changed, 288 insertions(+), 92 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > index 0dd543c6c08e..44aa88151cba 100644
> > > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > @@ -150,69 +150,251 @@ properties:
> > > >        in a different mode than the PHY in order to function.
> > > >
> > > >    snps,axi-config:
> > > > -    $ref: /schemas/types.yaml#definitions/phandle
> > > > -    description:
> > > > -      AXI BUS Mode parameters. Phandle to a node that can contain the
> > > > -      following properties
> > > > -        * snps,lpi_en, enable Low Power Interface
> > > > -        * snps,xit_frm, unlock on WoL
> > > > -        * snps,wr_osr_lmt, max write outstanding req. limit
> > > > -        * snps,rd_osr_lmt, max read outstanding req. limit
> > > > -        * snps,kbbe, do not cross 1KiB boundary.
> > > > -        * snps,blen, this is a vector of supported burst length.
> > > > -        * snps,fb, fixed-burst
> > > > -        * snps,mb, mixed-burst
> > > > -        * snps,rb, rebuild INCRx Burst
> > > > +    description: AXI BUS Mode parameters
> > > > +    oneOf:
> > > > +      - deprecated: true
> > > > +        $ref: /schemas/types.yaml#definitions/phandle
> > > > +      - type: object
> > > > +        properties:
> > >
> >
> > > Anywhere have have the same node/property string meaning 2 different
> > > things is a pain, let's not create another one.
> >
> > IIUC you meant that having a node and property with the same name
> > isn't ok. Right? If so could you explain why not? especially seeing
> > the property is expected to be set with phandle reference to that
> > node. That seemed like a perfect solution to me. We wouldn't need to
> > introduce a new property/node name, but just deprecate the
> > corresponding name to be a property.
> 

> Right. It's also a property or node name having 2 different meanings.
> I think your schema above demonstrates the problem in that it
> unnecessarily complicates the schema. It's not such a problem here as
> it is self contained. The worst example is 'ports'. That's a container
> of graph port nodes, ethernet switch nodes or a property pointing to
> DRM graphics pipelines. If there's multiple meanings, then we can't
> apply a schema unconditionally. Or we can only check it matches one of
> the 3 definitions.

It turned out in case of this change having different meaning also luckily
fit with having different types (property vs node). Right, as you called
it's self contained. But in general, of course, having different meaning
of the same node indeed may cause problems with different schema validation.
So ok. Thanks for clarification. I'll just introduce a new sub-node with
the same name but no vendor-prefix.

> 
> > > Just define a new node
> > > 'axi-config'. Or just put all the properties into the node directly.
> > > Grouping them has little purpose.
> >
> > Hm, you suggest to remove the vendor prefix, right?
> 

> Yes, we don't do vendor prefixes on node names either.

Ok.

> 
> > If so what about
> > the rest of the changes introduced here in this patch? They concern
> > "snps,mtl-tx-config" and "snps,mtl-rx-config" properties (please note
> > these changes are a bit more complicated than once connected with
> > "snps,axi-config"). Should I remove the vendor-prefix from them too?
> 

> Yes.

Ok.

-Sergey

> 
> > Anyway that seems a bit questionable, because all the "snps,*-config"
> > properties/nodes seems more vendor-specific than generic. Am I wrong
> > in that matter?
> >
> > If you think they are generic, then the "{axi,mtl-rx,mtl-tx}-config"
> > nodes most likely should be described in the dedicated DT schema...
> >
> > -Sergey
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
