Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 123892A6F61
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 22:08:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1350C36B36;
	Wed,  4 Nov 2020 21:08:09 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A21FDC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 21:08:06 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id u127so23678004oib.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Nov 2020 13:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E6N7y6aqHymIOGjWcFaM/nQ9os/1RczW+s0nXe0CnlM=;
 b=Poh3E9XiJXuwthi69YjzmotgOayKNXldr7W51aU94dd4SJpTDWuy6Oz98l/LuHHcua
 L2/rh9sOWXpCzyUW0OyXWrtXknRK/7owM6rupPwOCyEjYg7tPDX5i39ooJJNc/60jexX
 ZpP6KT8ULJwuRTesMZ7TRwAGDBZOyg1M3eB1aaAJfqHMlhSiXM+BcZUf7ehvDGBG5tsX
 HpxLk+UAffrByFbeFPb2D0Ts5ZrvPhvFv/4dGu+uP09ZbcFzgzoMfRgz2boyjOJuDsK2
 XhA/p14Y/vdcXf5w8pYZ4Ibrq7ANY+SQGpSXiYKka+KmptNEpRcOu62CS+sVoHWhhgAO
 0WIA==
X-Gm-Message-State: AOAM530oDJBPuSL24qMKnM3VoW8gWYkk0mwqc4tpNqe5a7UcL8X4zAM/
 ukslxTyLj58xoXLcZTLIdg==
X-Google-Smtp-Source: ABdhPJwgJn7aeZ8zCXOQwqnAD2VEZKNdyYfV8x1BfKUkOMGErVQR7l0m5hQ7mxJhgu8/lVoowdOfmw==
X-Received: by 2002:aca:d6d3:: with SMTP id n202mr3608860oig.74.1604524085067; 
 Wed, 04 Nov 2020 13:08:05 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p72sm803239oop.28.2020.11.04.13.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 13:08:04 -0800 (PST)
Received: (nullmailer pid 4127142 invoked by uid 1000);
 Wed, 04 Nov 2020 21:08:03 -0000
Date: Wed, 4 Nov 2020 15:08:03 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <20201104210803.GA4115079@bogus>
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
 <20201029154016.GA1917373@bogus>
 <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
 <CAL_JsqKs-Po8BdShjQNDNPjNWBCD3FSPdq4KbQGx3=VnV+3nPw@mail.gmail.com>
 <ebccf61a-c88f-c7f4-9f06-01d2bd1f43de@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebccf61a-c88f-c7f4-9f06-01d2bd1f43de@st.com>
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v3 1/4] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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

On Fri, Oct 30, 2020 at 04:27:14PM +0100, Amelie DELAUNAY wrote:
> 
> 
> On 10/30/20 3:29 PM, Rob Herring wrote:
> > On Thu, Oct 29, 2020 at 11:49 AM Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
> > > 
> > > 
> > > 
> > > On 10/29/20 4:40 PM, Rob Herring wrote:
> > > > On Thu, Oct 29, 2020 at 10:58:03AM +0100, Amelie Delaunay wrote:
> > > > > Power operation mode may depends on hardware design, so, add the optional
> > > > > property power-opmode for usb-c connector to select the power operation
> > > > > mode capability.
> > > > > 
> > > > > Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> > > > > ---
> > > > >    .../bindings/connector/usb-connector.yaml      | 18 ++++++++++++++++++
> > > > >    1 file changed, 18 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > index 728f82db073d..200d19c60fd5 100644
> > > > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > @@ -93,6 +93,24 @@ properties:
> > > > >          - device
> > > > >          - dual
> > > > > 
> > > > > +  power-opmode:
> > > > 
> > > > I've acked this version:
> > > > 
> > > > https://lore.kernel.org/r/20201020093627.256885-2-badhri@google.com
> > > > 
> > > 
> > > frs is used for Fast Role Swap defined in USB PD spec.
> > > I understand it allows to get the same information but I'm wondering why
> > > the property name is limited to -frs- in this case. What about a
> > > non-power delivery USB-C connector ?
> > 
> > I've got no idea. The folks that know USB-C and PD details need to get
> > together and work all this out. To me, it looks like the same thing...
> > 
> 
> It looks but...
> 
> The purpose of power-opmode property is to configure the USB-C controllers,
> especially the non-PD USB-C controllers to determine the power operation
> mode that the Type C connector will support and will advertise through CC
> pins when it has no power delivery support, whatever the power role: Sink,
> Source or Dual
> The management of the property is the same that data-role and power-role
> properties, and done by USB Type-C Connector Class.
> 
> new-source-frs-typec-current specifies initial current capability of the new
> source when vSafe5V is applied during PD3.0 Fast Role Swap. So here, this
> property is not applied at usb-c controller configuration level, but during
> PD Fast Role Swap, so when the Sink become the Source.
> Moreover, the related driver code says FRS can only be supported by DRP
> ports. So new-source-frs-typec-current property, in addition to being
> specific to PD, is also dedicated to DRP usb-c controller.
> The property is managed by Type-C Port Controller Manager for PD.

But it's the same set of possible values, right? So we can align the 
values at least.

Can we align the names in some way? power-opmode and frs-source-opmode 
or ??

Are these 2 properties mutually exclusive? If so, that should be 
captured.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
