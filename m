Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C822A0C9E
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 18:42:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43557C3FADC;
	Fri, 30 Oct 2020 17:42:46 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B41BEC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 17:42:44 +0000 (UTC)
IronPort-SDR: pkXHeJlyiXO23bOalKsTaNWMECvTv1kqpJZBeIR2XYRlP/0VOnP78aGdzyLmtbQJNfHGk7dtyh
 q0fy7vhfYYyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="230278725"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="230278725"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 10:42:42 -0700
IronPort-SDR: u0VlTcOCWik0vZQo+TUUWNyFbz904SGSGwgQ7zW6+hUGJedWePSms1/vxj414WiHgmu0fXoOy2
 yfm4rHDjQjlg==
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="469590759"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 10:42:38 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 270E120736; Fri, 30 Oct 2020 19:42:36 +0200 (EET)
Date: Fri, 30 Oct 2020 19:42:36 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20201030174236.GV26150@paasikivi.fi.intel.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
 <20201021130033.GI2703@paasikivi.fi.intel.com>
 <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
 <20201021214058.GJ2703@paasikivi.fi.intel.com>
 <327ae9d5-8683-488f-7970-4983e2fec51d@st.com>
 <20201026141714.GA83693@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026141714.GA83693@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Yannick FERTRE <yannick.fertre@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain VOLMAT <alain.volmat@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 2/2] media: dt-bindings: media: st,
 stm32-dcmi: Add support of BT656
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

Hi Rob,

On Mon, Oct 26, 2020 at 09:17:14AM -0500, Rob Herring wrote:
> On Thu, Oct 22, 2020 at 02:56:17PM +0000, Hugues FRUCHET wrote:
> > Hi Sakari,
> > 
> > + Jacopo for his work on ov772x binding related to BT656
> > 
> > On 10/21/20 11:40 PM, Sakari Ailus wrote:
> > > Hi Hugues,
> > > 
> > > On Wed, Oct 21, 2020 at 02:24:08PM +0000, Hugues FRUCHET wrote:
> > >> Hi Sakari,
> > >>
> > >> On 10/21/20 3:00 PM, Sakari Ailus wrote:
> > >>> Hi Hugues,
> > >>>
> > >>> On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
> > >>>> Add support of BT656 parallel bus mode in DCMI.
> > >>>> This mode is enabled when hsync-active & vsync-active
> > >>>> fields are not specified.
> > >>>>
> > >>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> > >>>> ---
> > >>>>    .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
> > >>>>    1 file changed, 30 insertions(+)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > >>>> index 3fe778c..1ee521a 100644
> > >>>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > >>>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > >>>> @@ -44,6 +44,36 @@ properties:
> > >>>>          bindings defined in
> > >>>>          Documentation/devicetree/bindings/media/video-interfaces.txt.
> > >>>>    
> > >>>> +    properties:
> > >>>> +      endpoint:
> > >>>> +        type: object
> > >>>> +
> > >>>> +        properties:
> > >>>> +          bus-width: true
> > >>>> +
> > >>>> +          hsync-active:
> > >>>> +            description:
> > >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> > >>>> +              embedded synchronization is selected.
> > >>>> +            default: 0
> > >>>> +
> > >>>> +          vsync-active:
> > >>>> +            description:
> > >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> > >>>> +              embedded synchronization is selected.
> > >>>> +            default: 0
> > >>>
> > >>> Should I understand this as if the polarities were not specified, BT.656
> > >>> will be used?
> > >>
> > >> Yes, this is what is documented in video-interfaces.txt:
> > >> "
> > >>     Note, that if HSYNC and VSYNC polarities are not specified, embedded
> > >>     synchronization may be required, where supported.
> > >> "
> > >> and
> > >> "
> > >> 				/* If hsync-active/vsync-active are missing,
> > >> 				   embedded BT.656 sync is used */
> > >> 				hsync-active = <0>;	/* Active low */
> > >> 				vsync-active = <0>;	/* Active low */
> > >> "
> > >> and I found also this in
> > >> Documentation/devicetree/bindings/media/renesas,vin.yaml
> > >> "
> > >>             hsync-active:
> > >>               description:
> > >>                 If both HSYNC and VSYNC polarities are not specified,
> > >> embedded
> > >>                 synchronization is selected.
> > >>               default: 1
> > >>
> > >>             vsync-active:
> > >>               description:
> > >>                 If both HSYNC and VSYNC polarities are not specified,
> > >> embedded
> > >>                 synchronization is selected.
> > >>               default: 1
> > > 
> > > Having the defaults leads to somewhat weird behaviour: specifying the
> > > default value on either property changes the bus type.
> > > 
> > >> "
> > >>
> > >> In the other hand I've found few occurences of "bus-type"
> > >> (marvell,mmp2-ccic.yaml), it is why I asked you if "bus-type" is the new
> > >> way to go versus previous way to signal BT656 (without hsync/vsync) ?
> > >> As explained previously, I prefer this last way for backward compatibility.
> > > 
> > > If you have a default for bus-type (BT.601), this won't be a problem.
> > > 
> > > The old DT bindings were somewhat, well, opportunistic. The v4l2-of
> > > framework-let did its best and sometimes it worked. The behaviour is still
> > > supported but not encouraged in new bindings.
> > > 
> > 
> > OK, so let's go for the new way.
> > I've found an interesting patch from Jacopo that is of great help:
> > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20200910162055.614089-4-jacopo+renesas@jmondi.org/

I wonder if Jacopo tested it. The idea seems interesting nonetheless.

> > 
> > Here is a draft proposal before I push a new version, please comment:
> > 
> >          properties:
> >            bus-type:
> >              enum: [5, 6]
> >              default: 5
> > 
> >            bus-width:
> >              enum: [8, 10, 12, 14]
> >              default: 8
> > 
> >            hsync-active:
> >              enum: [0, 1]
> 
> For common properties, you can assume there's a common schema. As 0 and 
> 1 are the only possible values, you don't need to define them here 
> unless only a subset is valid for this device.
> 
> >              default: 0
> > 
> >            vsync-active:
> >              enum: [0, 1]
> >              default: 0
> > 
> >            pclk-sample:
> >              enum: [0, 1]
> >              default: 0
> > 
> >            remote-endpoint: true
> > 
> >          allOf:
> >            - if:
> >                properties:
> >                  bus-type:
> >                    const: 6
> 
> To fix the error, you need:
> 
> required:
>   - bus-type
> 
> The problem is the above schema is also true if the property 
> is not present. 

Hmm. The idea was that we could keep this consistent with old bindings that
only documented parallel mode, and thus didn't need bus-type. This is
actually quite common --- adding support for something that wasn't known or
cared for during the original review.

I guess this could be done in the driver, too, adding a comment that the
bindings earlier did not require it.

> 
> >              then:
> >                properties:
> >                  hsync-active: false
> >                  vsync-active: false
> >                  bus-width:
> >                    enum: [8]
> > 
> >          required:
> >            - remote-endpoint
> > 
> >          unevaluatedProperties: false
> > 
> > 
> > Unfortunately, the "default: 5" for bus-type is not working !!
> > If we don't specify "bus-type" in example, dt_binding_check is failing 
> > as if default was 6, it's hardly understandable (see below) !
> >          port {
> >               dcmi_0: endpoint {
> >                     remote-endpoint = <&ov5640_0>;
> >                     bus-width = <10>;
> >                     hsync-active = <0>;
> >                     vsync-active = <0>;
> >                     pclk-sample = <1>;
> >               };
> > => this should be OK but error claimed:
> >    DTC 
> > Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
> >    CHECK 
> > Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
> > Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml: 
> > dcmi@4c006000: port:endpoint:vsync-active: False schema does not allow [[0]]
> > dcmi@4c006000: port:endpoint:hsync-active: False schema does not allow [[0]]
> > dcmi@4c006000: port:endpoint:bus-width:0:0: 10 is not one of [8]
> > 	From schema: Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > 
> > => if "bus-type" is explicitly set to 5, all is fine (see below) !
> >          port {
> >               dcmi_0: endpoint {
> >                     remote-endpoint = <&ov5640_0>;
> >                     bus-type = <5>;
> >                     bus-width = <10>;
> >                     hsync-active = <0>;
> >                     vsync-active = <0>;
> >                     pclk-sample = <1>;
> >               };
> >          };
> > 
> >   DTC 
> > Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
> >    CHECK 
> > Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
> > ~/.../media_tree$
> > 
> > 
> > >>
> > >>
> > >> The bindings previously documented BT.601 (parallel) only, so
> > >>> it was somewhat ambigious to begin with. Is there a risk of interpreting
> > >>> old BT.601 bindings as BT.656?
> > >> I don't think so.
> > >>
> > >> With bus-type property, I believe you could
> > >>> avoid at least that risk.
> > >> yes but as explained, I'll prefer not to amend current boards device
> > >> tree files.
> > > 
> > > I don't think it matters from this point of view --- you can have a
> > > default bus-type.
> > > 
> > >>
> > >>>
> > >>> Also not specifying at least one of the default values leads to BT.656
> > >>> without bus-type. That could be addressed by removing the defaults.
> > >>>
> > >> I'm new to yaml, I've taken that from renesas,vin.yaml. Should I just
> > >> drop the "default: 1" lines ?
> > > 
> > > That's one option, yes. Then you have to have those for BT.601 and it's no
> > > longer ambiguous.
> > > 
> > 
> > BR,
> > Hugues.

-- 
Kind regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
