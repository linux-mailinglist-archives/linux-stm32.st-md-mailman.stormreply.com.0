Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 414982AF9AE
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Nov 2020 21:25:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04A71C3FAE2;
	Wed, 11 Nov 2020 20:25:10 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B92CBC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 20:25:07 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id u127so3648514oib.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 12:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d2UhCfR+FPSqXBFp8I37OaKb4IVpY8wcdSKJRwOBPY4=;
 b=i7B2uKZ5e9Km7cj6v+rkN5pL8U0WURYpWEyM11NO7w/pUq3HiV67UvMK3I8TNHhxnI
 x9nDhuOiZfROEsxrn9HABBxPXoFJ4AjTCkC2ARvYUI5YEUQeGSjO8G/Be1XZOkqDObTw
 LpRBS8mNbwymVrBXysZ0cPmJuDHUtNzPDvI9vPIlJxHWkyfGEG7P8bNPkp6XQYz2dYSo
 7+TmYMS0wFT2qLuH+8aijiD4M1tIKUSYQ1FMfopxTKFE1QbF9mJWi7LhtLIqe0WcCkpm
 Y8BzrsRvQ76tTblxT8yIK76i4TAW+51Ci/TOrl3KuKQetkQrmHgCyzYdcPX33RaZGZ3j
 Ub7w==
X-Gm-Message-State: AOAM53068ER84pR5GQ62AGWlUAZVOGJWqaFG0O/YEFZnBpOvqb5wfYKk
 urclIsGJdGUNWwyHm5J3cw==
X-Google-Smtp-Source: ABdhPJwIarYJoYP3z9DEt3WpnwufR8NzTSpJNI9E1JK3YX6Ww4fDqfbKq2zguFglhqIi+It5Da5dLg==
X-Received: by 2002:a05:6808:56a:: with SMTP id
 j10mr3367292oig.121.1605126306388; 
 Wed, 11 Nov 2020 12:25:06 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 132sm660445oid.54.2020.11.11.12.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 12:25:05 -0800 (PST)
Received: (nullmailer pid 1968388 invoked by uid 1000);
 Wed, 11 Nov 2020 20:25:04 -0000
Date: Wed, 11 Nov 2020 14:25:04 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <20201111202504.GA1964362@bogus>
References: <20201106165805.31534-1-amelie.delaunay@st.com>
 <20201106165805.31534-2-amelie.delaunay@st.com>
 <CAL_Jsq+A=nixpdrT3Omq7Osat=_Egb5g6VGao=gY4CEssOe+xQ@mail.gmail.com>
 <a0e0bde1-5657-c0f9-9123-6b1dd5a1bd73@st.com>
 <CAL_JsqLcTNNWm7ChBjhFaTvfDm-kSYXrppcGU8uFTGEEuaT5Tg@mail.gmail.com>
 <5df74edf-b6f9-3397-4c85-683987dd5743@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5df74edf-b6f9-3397-4c85-683987dd5743@st.com>
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Badhri Jagan Sridharan <badhri@google.com>, Jun Li <lijun.kernel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 1/5] dt-bindings: connector: add
 typec-power-opmode property to usb-connector
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

On Mon, Nov 09, 2020 at 05:10:23PM +0100, Amelie DELAUNAY wrote:
> 
> 
> On 11/9/20 5:02 PM, Rob Herring wrote:
> > On Mon, Nov 9, 2020 at 9:54 AM Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
> > > 
> > > On 11/9/20 4:03 PM, Rob Herring wrote:
> > > > On Fri, Nov 6, 2020 at 10:58 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:
> > > > > 
> > > > > Power operation mode may depends on hardware design, so, add the optional
> > > > > property typec-power-opmode for usb-c connector to select the power
> > > > > operation mode capability.
> > > > > 
> > > > > Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> > > > > ---
> > > > > Hi Bahdri, Rob,
> > > > > 
> > > > > I've added the exlusion with FRS property, but new FRS property name
> > > > > should be use here so, be careful.
> > > > > 
> > > > > ---
> > > > >    .../bindings/connector/usb-connector.yaml     | 24 +++++++++++++++++++
> > > > >    1 file changed, 24 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > index 62781518aefc..a84464b3e1f2 100644
> > > > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > @@ -93,6 +93,24 @@ properties:
> > > > >          - device
> > > > >          - dual
> > > > > 
> > > > > +  typec-power-opmode:
> > > > > +    description: Determines the power operation mode that the Type C connector
> > > > > +      will support and will advertise through CC pins when it has no power
> > > > > +      delivery support.
> > > > > +      - "default" corresponds to default USB voltage and current defined by the
> > > > > +        USB 2.0 and USB 3.2 specifications, 5V 500mA for USB 2.0 ports and
> > > > > +        5V 900mA or 1500mA for USB 3.2 ports in single-lane or dual-lane
> > > > > +        operation respectively.
> > > > > +      - "1.5A" and "3.0A", 5V 1.5A and 5V 3.0A respectively, as defined in USB
> > > > > +        Type-C Cable and Connector specification, when Power Delivery is not
> > > > > +        supported.
> > > > > +    allOf:
> > > > > +      - $ref: /schemas/types.yaml#definitions/string
> > > > > +    enum:
> > > > > +      - default
> > > > > +      - 1.5A
> > > > > +      - 3.0A
> > > > 
> > > > Use the enums here. Unless you want to define it as actual current as
> > > > a numerical value.
> > > 
> > > If I understand your point correctly, I think I should remove allOf here
> > > and stick with what is done to describe power-role and data-role
> > > property. Right ?
> > 
> > No, use the numerical values like FRS:
> > 
> > +      "1" refers to default USB power level as described by "Table
> > 6-14 Fixed Supply PDO - Sink".
> > +      "2" refers to 1.5A@5V.
> > +      "3" refers to 3.0A@5V.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2, 3]
> 
> But it changes the type-c class philosophy. There is already an API to
> convert string into enum, the same kind is used for data-role and power-role
> properties.
> Moveover, FRS values doesn't fit with typec_pwr_opmode enum:
> enum typec_pwr_opmode {
> 	TYPEC_PWR_MODE_USB,
> 	TYPEC_PWR_MODE_1_5A,
> 	TYPEC_PWR_MODE_3_0A,
> 	TYPEC_PWR_MODE_PD,
> };

Okay, then strings it is I guess.

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
