Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A1F298EF6
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 15:17:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 009D7C36B37;
	Mon, 26 Oct 2020 14:17:21 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 787BFC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 14:17:18 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id k68so8088035otk.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 07:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dc1ciPuMA7ubdROI7zF7CaERUaIteiAuLeWwB2ABFhk=;
 b=QiDpJ7WhXD4EcZ7l3xn0tTaipBBGg22HfhyRvQAp/yhCEPZT3O+BVWfjxm+xOkxaGV
 M5HjX0go0VpGeGTvytEswe0KVZnmZRpenNUo0GLtrJPJHth9yn9awZvN1Cmn7RzIj6h3
 kNF38wcjBnikLLxs8pwStl8FPdfJJh3ks91GzW42MDxznQeUXYiT+lGvGAHlZ1EjlOru
 Rr6MEITqt4PKDJ4B2cabQzsoH2DsXkKZ5mpwLLXRSTdPGsxPUvu9FYyXiMYqI8CiG8tt
 2MSXclNVCNHkDcIK5KB67NDc1TuUqdyKE91t/6vh1S/hSrO/HGSkR1q6oOL0vwDW+N2J
 +aWA==
X-Gm-Message-State: AOAM530R7P0Jcdhua5jP8LOlUCEwZGkGBZzgLnwSGh/USREzMaSKP3iq
 SKKfhmNBk9gLD5a0oW92ZA==
X-Google-Smtp-Source: ABdhPJxeX9H8Aa3GCK1uZXLbFTHOGdVKHTEc5BetlCh0FzS1zdLK28AWaEUXI4q9MeI/bigvCpyeWw==
X-Received: by 2002:a9d:645:: with SMTP id 63mr11055273otn.182.1603721836759; 
 Mon, 26 Oct 2020 07:17:16 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y8sm3963281oon.16.2020.10.26.07.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:17:15 -0700 (PDT)
Received: (nullmailer pid 94983 invoked by uid 1000);
 Mon, 26 Oct 2020 14:17:14 -0000
Date: Mon, 26 Oct 2020 09:17:14 -0500
From: Rob Herring <robh@kernel.org>
To: Hugues FRUCHET <hugues.fruchet@st.com>
Message-ID: <20201026141714.GA83693@bogus>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
 <20201021130033.GI2703@paasikivi.fi.intel.com>
 <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
 <20201021214058.GJ2703@paasikivi.fi.intel.com>
 <327ae9d5-8683-488f-7970-4983e2fec51d@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <327ae9d5-8683-488f-7970-4983e2fec51d@st.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain VOLMAT <alain.volmat@st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
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

On Thu, Oct 22, 2020 at 02:56:17PM +0000, Hugues FRUCHET wrote:
> Hi Sakari,
> 
> + Jacopo for his work on ov772x binding related to BT656
> 
> On 10/21/20 11:40 PM, Sakari Ailus wrote:
> > Hi Hugues,
> > 
> > On Wed, Oct 21, 2020 at 02:24:08PM +0000, Hugues FRUCHET wrote:
> >> Hi Sakari,
> >>
> >> On 10/21/20 3:00 PM, Sakari Ailus wrote:
> >>> Hi Hugues,
> >>>
> >>> On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
> >>>> Add support of BT656 parallel bus mode in DCMI.
> >>>> This mode is enabled when hsync-active & vsync-active
> >>>> fields are not specified.
> >>>>
> >>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> >>>> ---
> >>>>    .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
> >>>>    1 file changed, 30 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >>>> index 3fe778c..1ee521a 100644
> >>>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >>>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> >>>> @@ -44,6 +44,36 @@ properties:
> >>>>          bindings defined in
> >>>>          Documentation/devicetree/bindings/media/video-interfaces.txt.
> >>>>    
> >>>> +    properties:
> >>>> +      endpoint:
> >>>> +        type: object
> >>>> +
> >>>> +        properties:
> >>>> +          bus-width: true
> >>>> +
> >>>> +          hsync-active:
> >>>> +            description:
> >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> >>>> +              embedded synchronization is selected.
> >>>> +            default: 0
> >>>> +
> >>>> +          vsync-active:
> >>>> +            description:
> >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> >>>> +              embedded synchronization is selected.
> >>>> +            default: 0
> >>>
> >>> Should I understand this as if the polarities were not specified, BT.656
> >>> will be used?
> >>
> >> Yes, this is what is documented in video-interfaces.txt:
> >> "
> >>     Note, that if HSYNC and VSYNC polarities are not specified, embedded
> >>     synchronization may be required, where supported.
> >> "
> >> and
> >> "
> >> 				/* If hsync-active/vsync-active are missing,
> >> 				   embedded BT.656 sync is used */
> >> 				hsync-active = <0>;	/* Active low */
> >> 				vsync-active = <0>;	/* Active low */
> >> "
> >> and I found also this in
> >> Documentation/devicetree/bindings/media/renesas,vin.yaml
> >> "
> >>             hsync-active:
> >>               description:
> >>                 If both HSYNC and VSYNC polarities are not specified,
> >> embedded
> >>                 synchronization is selected.
> >>               default: 1
> >>
> >>             vsync-active:
> >>               description:
> >>                 If both HSYNC and VSYNC polarities are not specified,
> >> embedded
> >>                 synchronization is selected.
> >>               default: 1
> > 
> > Having the defaults leads to somewhat weird behaviour: specifying the
> > default value on either property changes the bus type.
> > 
> >> "
> >>
> >> In the other hand I've found few occurences of "bus-type"
> >> (marvell,mmp2-ccic.yaml), it is why I asked you if "bus-type" is the new
> >> way to go versus previous way to signal BT656 (without hsync/vsync) ?
> >> As explained previously, I prefer this last way for backward compatibility.
> > 
> > If you have a default for bus-type (BT.601), this won't be a problem.
> > 
> > The old DT bindings were somewhat, well, opportunistic. The v4l2-of
> > framework-let did its best and sometimes it worked. The behaviour is still
> > supported but not encouraged in new bindings.
> > 
> 
> OK, so let's go for the new way.
> I've found an interesting patch from Jacopo that is of great help:
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20200910162055.614089-4-jacopo+renesas@jmondi.org/
> 
> Here is a draft proposal before I push a new version, please comment:
> 
>          properties:
>            bus-type:
>              enum: [5, 6]
>              default: 5
> 
>            bus-width:
>              enum: [8, 10, 12, 14]
>              default: 8
> 
>            hsync-active:
>              enum: [0, 1]

For common properties, you can assume there's a common schema. As 0 and 
1 are the only possible values, you don't need to define them here 
unless only a subset is valid for this device.

>              default: 0
> 
>            vsync-active:
>              enum: [0, 1]
>              default: 0
> 
>            pclk-sample:
>              enum: [0, 1]
>              default: 0
> 
>            remote-endpoint: true
> 
>          allOf:
>            - if:
>                properties:
>                  bus-type:
>                    const: 6

To fix the error, you need:

required:
  - bus-type

The problem is the above schema is also true if the property 
is not present. 

>              then:
>                properties:
>                  hsync-active: false
>                  vsync-active: false
>                  bus-width:
>                    enum: [8]
> 
>          required:
>            - remote-endpoint
> 
>          unevaluatedProperties: false
> 
> 
> Unfortunately, the "default: 5" for bus-type is not working !!
> If we don't specify "bus-type" in example, dt_binding_check is failing 
> as if default was 6, it's hardly understandable (see below) !
>          port {
>               dcmi_0: endpoint {
>                     remote-endpoint = <&ov5640_0>;
>                     bus-width = <10>;
>                     hsync-active = <0>;
>                     vsync-active = <0>;
>                     pclk-sample = <1>;
>               };
> => this should be OK but error claimed:
>    DTC 
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
>    CHECK 
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml: 
> dcmi@4c006000: port:endpoint:vsync-active: False schema does not allow [[0]]
> dcmi@4c006000: port:endpoint:hsync-active: False schema does not allow [[0]]
> dcmi@4c006000: port:endpoint:bus-width:0:0: 10 is not one of [8]
> 	From schema: Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> 
> => if "bus-type" is explicitly set to 5, all is fine (see below) !
>          port {
>               dcmi_0: endpoint {
>                     remote-endpoint = <&ov5640_0>;
>                     bus-type = <5>;
>                     bus-width = <10>;
>                     hsync-active = <0>;
>                     vsync-active = <0>;
>                     pclk-sample = <1>;
>               };
>          };
> 
>   DTC 
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
>    CHECK 
> Documentation/devicetree/bindings/media/st,stm32-dcmi.example.dt.yaml
> ~/.../media_tree$
> 
> 
> >>
> >>
> >> The bindings previously documented BT.601 (parallel) only, so
> >>> it was somewhat ambigious to begin with. Is there a risk of interpreting
> >>> old BT.601 bindings as BT.656?
> >> I don't think so.
> >>
> >> With bus-type property, I believe you could
> >>> avoid at least that risk.
> >> yes but as explained, I'll prefer not to amend current boards device
> >> tree files.
> > 
> > I don't think it matters from this point of view --- you can have a
> > default bus-type.
> > 
> >>
> >>>
> >>> Also not specifying at least one of the default values leads to BT.656
> >>> without bus-type. That could be addressed by removing the defaults.
> >>>
> >> I'm new to yaml, I've taken that from renesas,vin.yaml. Should I just
> >> drop the "default: 1" lines ?
> > 
> > That's one option, yes. Then you have to have those for BT.601 and it's no
> > longer ambiguous.
> > 
> 
> BR,
> Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
