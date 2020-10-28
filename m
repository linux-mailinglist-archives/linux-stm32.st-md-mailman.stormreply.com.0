Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2DB29CE86
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Oct 2020 08:34:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC32AC36B37;
	Wed, 28 Oct 2020 07:34:50 +0000 (UTC)
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0351C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 07:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 957093D16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 08:34:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R31Q6R5tKG9t
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 08:34:47 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 43D123D41; Wed, 28 Oct 2020 08:34:46 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
From: Alexander Dahl <ada@thorsis.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 28 Oct 2020 08:34:38 +0100
Message-ID: <5231529.NqohY00Rok@ada>
In-Reply-To: <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
 <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
	warnings for pwm-leds
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Ahmad,

Am Dienstag, 27. Oktober 2020, 11:58:10 CET schrieb Ahmad Fatoum:
> Hello,
> =

> On 10/27/20 11:05 AM, Alexander Dahl wrote:
> > Hello Ahmad,
> > =

> > thanks for your feedback, comments below.
> > =

> >>> -	led-rgb {
> >>> +	led-controller-2 {
> >> =

> >> Is a single RGB LED really a controller?
> > =

> > I just followed the recommendations by Rob here.
> =

> Do you happen to know if the new multicolor LED support could be used her=
e?

AFAIK not yet. The multicolor class should be ready and it is used by some =

drivers for I=B2C connected LED controllers, but if I understood Pavel =

correctly, additional work has to be done for a gpio and/or pwm multicolor =

driver. See this thread from August for example:

https://lore.kernel.org/linux-leds/2530787.iFCFyWWcSu@g550jk/

> =

> I find it unfortunate that the device tree loses information relevant to
> humans to adhere to a fixed nomenclature. Apparently led-controller isn't
> even codified in the YAML binding (It's just in the examples). If you
> respin, please add a comment that this is a single RGB led. I'd prefer to
> keep the information in the DTB as well though.

The "new" attributes 'function' and 'color' attributes should cover this =

information. IIRC those were introduced sometime before v5.4 and documentat=
ion =

is in the leds/common.yaml binding. I don't see it in the scope of this pat=
ch =

series, but if we would merge this warning fix first, the information is lo=
st, =

so maybe those attributes should be added before? =


My heuristics on that would be looking at the label and if there's a distin=
ct =

color in it, add the color property. I could do that for all pwm LEDs known=
 to =

the tree currently. That would be a bigger task for GPIO leds though. ;-)

> =

> >>>  		compatible =3D "pwm-leds";
> >>> =

> >>> -		led-red {
> >>> +		led-2 {
> >> =

> >> Shouldn't this have been led-1 as well or is the numbering "global" ?
> > =

> > Also good question. This numbering is for dts only, it usually does
> > not correspond with LEDs on the board, so it could be numbered per
> > led-controller as well?
> =

> I'd prefer that it starts by 1. That way it's aligned with PWM channel
> ID.

Ack.

> =

> Thanks for fixing the dtschema warnings by the way!

Well, I "introduced" them by converting the leds-pwm binding to yaml (not =

merged yet), so I could as well fix the warnings then? ;-)

Greets
Alex

> =

> Cheers,
> Ahmad
> =

> > Greets
> > Alex
> > =

> >>>  			label =3D "mc1:red:rgb";
> >>>  			pwms =3D <&leds_pwm 1 1000000 0>;
> >>>  			max-brightness =3D <255>;
> >>>  			active-low;
> >>>  		=

> >>>  		};
> >>> =

> >>> -		led-green {
> >>> +		led-3 {
> >>> =

> >>>  			label =3D "mc1:green:rgb";
> >>>  			pwms =3D <&leds_pwm 2 1000000 0>;
> >>>  			max-brightness =3D <255>;
> >>>  			active-low;
> >>>  		=

> >>>  		};
> >>> =

> >>> -		led-blue {
> >>> +		led-4 {
> >>> =

> >>>  			label =3D "mc1:blue:rgb";
> >>>  			pwms =3D <&leds_pwm 3 1000000 0>;
> >>>  			max-brightness =3D <255>;


-- =




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
