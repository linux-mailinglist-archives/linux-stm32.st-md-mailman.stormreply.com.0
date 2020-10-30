Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 267CA2A0F34
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 21:09:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCEC0C3FADC;
	Fri, 30 Oct 2020 20:09:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7EA4C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 20:09:24 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA87E2075E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 20:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604088562;
 bh=dsb2fGpwSeCxaqOUaIEQtAt8Ev0KBIXRf/w3waNhKws=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C7kxkKrxR6DMsZCWkCPW2z3xH1cj5sJoA50H0JjBsmJ5y+NZkzIscLRN8uh9+LmvV
 rC5P1iFjJTq9PMYwOq6pLF4EksuZ9zTcv/WO0lE4JKrT+5pwQPfHId9AoRgXB1u1AJ
 qyx82wFKRb9ICX5wZkT44IM9eVY6IWMXRzsQqGHk=
Received: by mail-oi1-f177.google.com with SMTP id 9so7881789oir.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 13:09:22 -0700 (PDT)
X-Gm-Message-State: AOAM532sa/aRGlezx6V/MeLl+n6+YhtsbpPyfvL9J16zC2W/uyQkSw9h
 BENYGtGhf8jvDyYa5QfE6G4J/3BbxFYIfVmCLw==
X-Google-Smtp-Source: ABdhPJxMveXb1QdoW8X4k60f8AsyuwhhjJRLNbCCb75J76E+r24ilhIfqWLz6ySjO7R/sD1GTdxpf4/zJ14/IGJYpM0=
X-Received: by 2002:aca:5dc2:: with SMTP id r185mr2849061oib.106.1604088561838; 
 Fri, 30 Oct 2020 13:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
 <20201021130033.GI2703@paasikivi.fi.intel.com>
 <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
 <20201021214058.GJ2703@paasikivi.fi.intel.com>
 <327ae9d5-8683-488f-7970-4983e2fec51d@st.com> <20201026141714.GA83693@bogus>
 <20201030174236.GV26150@paasikivi.fi.intel.com>
In-Reply-To: <20201030174236.GV26150@paasikivi.fi.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 30 Oct 2020 15:09:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+po4grPDJH6=ayFWrO5J=GzmSHNsgRjQ=ERsVCYzVXQg@mail.gmail.com>
Message-ID: <CAL_Jsq+po4grPDJH6=ayFWrO5J=GzmSHNsgRjQ=ERsVCYzVXQg@mail.gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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

On Fri, Oct 30, 2020 at 12:42 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rob,
>
> On Mon, Oct 26, 2020 at 09:17:14AM -0500, Rob Herring wrote:
> > On Thu, Oct 22, 2020 at 02:56:17PM +0000, Hugues FRUCHET wrote:
> > > Hi Sakari,
> > >
> > > + Jacopo for his work on ov772x binding related to BT656
> > >
> > > On 10/21/20 11:40 PM, Sakari Ailus wrote:
> > > > Hi Hugues,
> > > >
> > > > On Wed, Oct 21, 2020 at 02:24:08PM +0000, Hugues FRUCHET wrote:
> > > >> Hi Sakari,
> > > >>
> > > >> On 10/21/20 3:00 PM, Sakari Ailus wrote:
> > > >>> Hi Hugues,
> > > >>>
> > > >>> On Tue, Oct 20, 2020 at 12:14:49PM +0200, Hugues Fruchet wrote:
> > > >>>> Add support of BT656 parallel bus mode in DCMI.
> > > >>>> This mode is enabled when hsync-active & vsync-active
> > > >>>> fields are not specified.
> > > >>>>
> > > >>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> > > >>>> ---
> > > >>>>    .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
> > > >>>>    1 file changed, 30 insertions(+)
> > > >>>>
> > > >>>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > > >>>> index 3fe778c..1ee521a 100644
> > > >>>> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > > >>>> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > > >>>> @@ -44,6 +44,36 @@ properties:
> > > >>>>          bindings defined in
> > > >>>>          Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > >>>>
> > > >>>> +    properties:
> > > >>>> +      endpoint:
> > > >>>> +        type: object
> > > >>>> +
> > > >>>> +        properties:
> > > >>>> +          bus-width: true
> > > >>>> +
> > > >>>> +          hsync-active:
> > > >>>> +            description:
> > > >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> > > >>>> +              embedded synchronization is selected.
> > > >>>> +            default: 0
> > > >>>> +
> > > >>>> +          vsync-active:
> > > >>>> +            description:
> > > >>>> +              If both HSYNC and VSYNC polarities are not specified, BT656
> > > >>>> +              embedded synchronization is selected.
> > > >>>> +            default: 0
> > > >>>
> > > >>> Should I understand this as if the polarities were not specified, BT.656
> > > >>> will be used?
> > > >>
> > > >> Yes, this is what is documented in video-interfaces.txt:
> > > >> "
> > > >>     Note, that if HSYNC and VSYNC polarities are not specified, embedded
> > > >>     synchronization may be required, where supported.
> > > >> "
> > > >> and
> > > >> "
> > > >>                          /* If hsync-active/vsync-active are missing,
> > > >>                             embedded BT.656 sync is used */
> > > >>                          hsync-active = <0>;     /* Active low */
> > > >>                          vsync-active = <0>;     /* Active low */
> > > >> "
> > > >> and I found also this in
> > > >> Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > >> "
> > > >>             hsync-active:
> > > >>               description:
> > > >>                 If both HSYNC and VSYNC polarities are not specified,
> > > >> embedded
> > > >>                 synchronization is selected.
> > > >>               default: 1
> > > >>
> > > >>             vsync-active:
> > > >>               description:
> > > >>                 If both HSYNC and VSYNC polarities are not specified,
> > > >> embedded
> > > >>                 synchronization is selected.
> > > >>               default: 1
> > > >
> > > > Having the defaults leads to somewhat weird behaviour: specifying the
> > > > default value on either property changes the bus type.
> > > >
> > > >> "
> > > >>
> > > >> In the other hand I've found few occurences of "bus-type"
> > > >> (marvell,mmp2-ccic.yaml), it is why I asked you if "bus-type" is the new
> > > >> way to go versus previous way to signal BT656 (without hsync/vsync) ?
> > > >> As explained previously, I prefer this last way for backward compatibility.
> > > >
> > > > If you have a default for bus-type (BT.601), this won't be a problem.
> > > >
> > > > The old DT bindings were somewhat, well, opportunistic. The v4l2-of
> > > > framework-let did its best and sometimes it worked. The behaviour is still
> > > > supported but not encouraged in new bindings.
> > > >
> > >
> > > OK, so let's go for the new way.
> > > I've found an interesting patch from Jacopo that is of great help:
> > > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20200910162055.614089-4-jacopo+renesas@jmondi.org/
>
> I wonder if Jacopo tested it. The idea seems interesting nonetheless.
>
> > >
> > > Here is a draft proposal before I push a new version, please comment:
> > >
> > >          properties:
> > >            bus-type:
> > >              enum: [5, 6]
> > >              default: 5
> > >
> > >            bus-width:
> > >              enum: [8, 10, 12, 14]
> > >              default: 8
> > >
> > >            hsync-active:
> > >              enum: [0, 1]
> >
> > For common properties, you can assume there's a common schema. As 0 and
> > 1 are the only possible values, you don't need to define them here
> > unless only a subset is valid for this device.
> >
> > >              default: 0
> > >
> > >            vsync-active:
> > >              enum: [0, 1]
> > >              default: 0
> > >
> > >            pclk-sample:
> > >              enum: [0, 1]
> > >              default: 0
> > >
> > >            remote-endpoint: true
> > >
> > >          allOf:
> > >            - if:
> > >                properties:
> > >                  bus-type:
> > >                    const: 6
> >
> > To fix the error, you need:
> >
> > required:
> >   - bus-type
> >
> > The problem is the above schema is also true if the property
> > is not present.
>
> Hmm. The idea was that we could keep this consistent with old bindings that
> only documented parallel mode, and thus didn't need bus-type. This is
> actually quite common --- adding support for something that wasn't known or
> cared for during the original review.

TBC, the 'required' here is required for the 'if' in the if/then
schema to work as you want. It's not making 'bus-type' a required
property.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
