Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7F157E403
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jul 2022 18:02:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03B07C57B6C;
	Fri, 22 Jul 2022 16:02:55 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91900C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 16:02:53 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5460224000C;
 Fri, 22 Jul 2022 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1658505773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cKG0lEYF348X//U1pESwwqdpnRBOQ0QEs5ZB22edgwM=;
 b=RgNRybfSVRwwGQB9674BRQtSIt3YcXmaOZRK1Gr2bUKatx6KUeQS6Vx1xDwfB2Uj9FWprO
 U/3BrpXAvYY/RPMUw77VaJ7BeSnLP28jkRVMKBEvurpdUB6+WnXX56jfKZrbgiGE2zDdGh
 Mlbwg01OocQkm7gnVWzH1ZxSHgSv0H45XFFKWPSTIPQNQQeIlC8nq25DcTjK914mQe3xwU
 2e8vHjUZ0UGlCdlgm4s6Vyz/AsDAOWKfAjflTltyrFoWonxDhh34YJB5sF70bqUkNIwbqZ
 96WSB6JESv+mFOiv5c86KL7gAlztgTywpR//qQU3AoFYdBKoQfgiOF0HQiakfA==
Date: Fri, 22 Jul 2022 18:02:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Valentin CARON <valentin.caron@foss.st.com>
Message-ID: <YtrKK1+Bp60MSHhp@mail.local>
References: <20220504130233.330983-1-valentin.caron@foss.st.com>
 <20220504130617.331290-1-valentin.caron@foss.st.com>
 <YnLhw+Y7m8G2xJpK@mail.local>
 <ceb2d1a3-dccd-865e-ed74-54444e49f349@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ceb2d1a3-dccd-865e-ed74-54444e49f349@foss.st.com>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: rtc: stm32: add alarm A
 out property to select output
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

On 23/05/2022 14:34:22+0200, Valentin CARON wrote:
> Hi Alexandre,
> 
> On 5/4/22 22:27, Alexandre Belloni wrote:
> > Hello,
> > 
> > On 04/05/2022 15:06:13+0200, Valentin Caron wrote:
> > > STM32 RTC can pulse some SOC pins when an alarm of RTC expires.
> > > 
> > > This patch adds property to activate alarm A output. The pulse can
> > > output on three pins RTC_OUT1, RTC_OUT2, RTC_OUT2_RMP
> > > (PC13, PB2, PI8 on stm32mp15) (PC13, PB2, PI1 on stm32mp13).
> > > 
> > > Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> > > ---
> > >   .../devicetree/bindings/rtc/st,stm32-rtc.yaml | 19 ++++++++++++++++++-
> > >   1 file changed, 18 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> > > index 56d46ea35c5d..71e02604e8de 100644
> > > --- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> > > @@ -59,6 +59,13 @@ properties:
> > >         Refer to <include/dt-bindings/rtc/rtc-stm32.h> for the supported values.
> > >         Pinctrl state named "default" may be defined to reserve pin for RTC output.
> > > +  st,alarm:
> > > +    $ref: "/schemas/types.yaml#/definitions/uint32"
> > > +    description: |
> > > +      To select and enable RTC Alarm A output.
> > > +      Refer to <include/dt-bindings/rtc/rtc-stm32.h> for the supported values.
> > > +      Pinctrl state named "default" may be defined to reserve pin for RTC output.
> > > +
> > >   allOf:
> > >     - if:
> > >         properties:
> > > @@ -75,6 +82,9 @@ allOf:
> > >           st,lsco:
> > >             maxItems: 0
> > > +        st,alarm:
> > > +          maxItems: 0
> > > +
> > >           clock-names: false
> > >         required:
> > > @@ -95,6 +105,9 @@ allOf:
> > >           st,lsco:
> > >             maxItems: 0
> > > +        st,alarm:
> > > +          maxItems: 0
> > > +
> > >         required:
> > >           - clock-names
> > >           - st,syscfg
> > > @@ -117,6 +130,9 @@ allOf:
> > >           st,lsco:
> > >             maxItems: 1
> > > +        st,alarm:
> > > +          maxItems: 1
> > > +
> > >         required:
> > >           - clock-names
> > > @@ -153,8 +169,9 @@ examples:
> > >         clocks = <&rcc RTCAPB>, <&rcc RTC>;
> > >         clock-names = "pclk", "rtc_ck";
> > >         interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> > > +      st,alarm = <RTC_OUT1>;
> > >         st,lsco = <RTC_OUT2_RMP>;
> > Shouldn't that be exactly the opposite? You have two pins that can
> > output different functions. The property should be the pin and the value
> > the function. I'd go even further and I would say this is actually
> > pinmuxing.
> > 
> You're right, if the property is the pin and the value the function, this
> looks like a pinctrl node.
> We choose to develop theses functionalities in the reverse order, to avoid
> the complexity of adding
> the pinctrl framework to our driver. Moreover, LSCO and AlarmA may haven't a
> peripheral client and
> this would probably require to also implement pinctrl hogging.
> 
> Is the implementation that we have proposed is acceptable regarding theses
> elements ?
> 


I still think that the pin has to be the property and the function the value.

Or we could find a generic name and provide an array of pin, function
pair

Or, go for pinmuxing

My point here is that this is a common feature an RTCs and I don't want
every vendor to come up with their own properties.

Regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
