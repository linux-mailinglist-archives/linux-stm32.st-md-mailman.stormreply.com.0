Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7B2EFF0E
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 14:54:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99D5FC36B0B;
	Tue,  5 Nov 2019 13:54:35 +0000 (UTC)
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 641DFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 13:54:34 +0000 (UTC)
X-AuditID: c0a8fbf4-199ff70000001fa6-ac-5dc17f19b60c
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 7A.86.08102.91F71CD5; Tue,  5 Nov 2019 14:54:33 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 14:54:27 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Thread-Topic: [PATCH 00/62] Add definition for GPIO direction
Thread-Index: AQHVk8EYmzhgkSAfS0Ot5MRDeZesqad8bpwAgAAJlQCAAASWgIAADAaA
Date: Tue, 5 Nov 2019 13:54:27 +0000
Message-ID: <fdcfc69b39990dd382804db45422ed692881ea15.camel@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
 <20191105131125.GP32742@smile.fi.intel.com>
In-Reply-To: <20191105131125.GP32742@smile.fi.intel.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-ID: <6F950CBC594F95498FB52FF5A6B6196B@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwbZRjPe3e9HrCaWwf2hW0xNsbFLcCmJjyajeAfMyfTqZnRBYN4yI0S
 SyFtQVg04AZOSupYrFBOPrSByYdV12p0HbBRYcLYQBwgyPgK4PjIAC1TPlb1bnWDv+53z+/r
 fZPnZUj1h0wEk2YwC0YDr9fSwdSluvVzkeF5rYl7/xqMgnNTXQj6er0EeK4zYD1RRkDxUhkJ
 Tms7BcuVVyjoK3QhuGj9kYS1hTYlTPS/CPU2Cobev0DAeo+fhALRQUHDJ+cpmHZPEmC78wUB
 rskBBZxs7CbBXX0HgWWtnoTrngoaPq05TcHISAOC72YXCLAMTCmgaFmkYcb5qwI6am4jmKiv
 oKCitoOCKr9TAQuzR6HFfZUA3+JFBbTevEVBr72HhOlyNw3+710UnKrvk2SNUwh+Xh0iYOZb
 DdxwuxVg//ICglVPFQXDZz5GYF2spaF51IfiHuf6T3mU3De+EzS3OFio5MSxazRnX3dQnOdS
 BFfs85LceXFEyfX+cZnkXA1FNHdjoInmqjpf5tw1eVyP/XPElSzdksYrteilHQkh+5N5c/aR
 tFRDdOybIbqVs6PKzMtP51TYvEQ+KnjKgoIYzD6Jy4b9pAUFM2q2H+GuJicd+PkJ4dLxfIUF
 MQzN7seWIaVsCGUP4bWFQSRjkp0Ow3398TLeJkm6TtahgOYAbhxz07I1lH0WLzYxMqTYR3C7
 dZcMVexhfM12NFA0g/DSB6dJ2RnEAq7+bfZuCmJ34qL8BSLQpMGu3/9WBI7M4pqmHjKAw/Ds
 5D//z7W4eXWCkvNJ9jH8tSc6YI3D1T1FZAA/jG3FE3cvomK34s7yKaoEPShuahA33OImt7jJ
 LW5yf4YUDQin82n6VN4s7IsyCllRxgxduvR5KyPdhQKbvfwD+tf7nBcRDPKicIbQhqni01oT
 1Q8kZ6Tk6niTLsmYpRdMXoQZUhuq6rU3J6pVKXzuccGYcY/azlBajWrXxJlENSt3vS0ImYLx
 HruDYbRYlX1cCt1qFFKFnGNpevMGTTBBcnhwRKhJMKQIRj7LrEuSlyPJJG2HTG2Rervelewq
 UyafLk0D1itoD1MyW+kgmbbKWgeppgwZBiFCo2qSpaws1WUZ7hfNIQ2DtNtU5vckdov0vO/n
 zEkVhFTx/GSLXGHmN6iIfJRLvNBup/Pe6XaUhoxbCw88c2j5dox2sZuIW2/YPZ81/kqO0rd9
 WLOn8nBfP7yRIJR+tNPvFEc7KnLDE2wx5e2x+r0P+QuER9tf7207ZsuOPFjkPPvnzauvxte1
 KJMjX7OPZnY+EV0YHfYLPzVpHmHmDs4nfRW7cmQpRtTPjzlqw7WUScfv200aTfx/DlaFoZsE
 AAA=
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/62] Add definition for GPIO direction
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


On Tue, 2019-11-05 at 15:11 +0200, andriy.shevchenko@linux.intel.com
wrote:
> On Tue, Nov 05, 2019 at 12:54:55PM +0000, Vaittinen, Matti wrote:
> > On Tue, 2019-11-05 at 14:20 +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 05, 2019 at 12:09:10PM +0200, Matti Vaittinen wrote:
> > > > The patch series adds definitions for GPIO line directions.
> > > > 
> > > > For occasional GPIO contributor like me it is always a pain to
> > > > remember
> > > > whether 1 or 0 was used for GPIO direction INPUT/OUTPUT.
> > > > Judging
> > > > the
> > > > fact that I removed few comments like:
> > > > 
> > > > /* Return 0 if output, 1 if input */
> > > > /* This means "out" */
> > > > return 1; /* input */
> > > > return 0; /* output */
> > > > 
> > > > it seems at least some others may find it hard to remember too.
> > > > Adding
> > > > defines for these values helps us who really have good - but
> > > > short
> > > > duration - memory :]
> > > > 
> > > > Please also see the last patch. It adds warning prints to be
> > > > emitted
> > > > from gpiolib if other than defined values are used. This patch
> > > > can
> > > > be
> > > > dropped out if there is a reason for that to still be allowed.
> > > > 
> > > > This idea comes from RFC series for ROHM BD71828 PMIC and was
> > > > initially
> > > > discussed with Linus Walleij here:
> > > > https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com/
> > > > but as this has no dependencies to BD71828 work (which probably
> > > > takes a
> > > > while) I decided to make it independent series.
> > > > 
> > > > Patches are compile-tested only. I have no HW to really test
> > > > them.
> > > > Thus I'd
> > > > appreciate carefull review. This work is mainly about
> > > > converting
> > > > zeros
> > > > and ones to the new defines but it wouldn't be first time I get
> > > > it
> > > > wrong
> > > > in one of the patches :)
> > > 
> > > For all patches I have been Cc'ed to, NAK.
> > > 
> > > I don't see the advantages now since all known hardware uses the
> > > single bit to
> > > describe direction (even for Intel where we have separate gating
> > > for
> > > in and out
> > > buffers the direction we basically rely on the bit that enables
> > > out
> > > buffer).
> > > 
> > > So, that said the direction is always 1 bit and basically 0/1
> > > value. 
> > 
> > Yes. At least for now. And this patch didn't change that although
> > it
> > makes it possible to do so if required.
> > 
> > > Which one
> > > is in and which one is out just a matter of an agreement we did.
> > 
> > This one is exactly the problem patch series was created for. Which
> > one
> > is IN and which is OUT is indeed a matter of an agreement - but
> > this
> > agreement should be clearly visible, well defined and same for all.
> > 
> > It's *annoying* to try finding out whether it was 1 or 0 one should
> > return from get_direction callback for OUTPUT. This is probably the
> > reason we have comments like
> > 
> > return 1; /* input */
> > 
> > there.
> > 
> > As this is global agreement for all GPIO framework users - not
> > something that can be agreed per driver basis - we should have GPIO
> > framework wide definitions for this. We can just add definitions
> > for
> > new drivers to benefit - but I think adding them also for existing
> > drivers improves readability significantly (see below).
> > 
> > > I would also like to see bloat-o-meter statistics before and
> > > after
> > > your patch.
> > > My guts tell me that the result will be not in the favour of
> > > yours
> > > solution.
> > 
> > Can you please tell me what type of stats you hope to see? 
> 
> bloat-o-meter. It's a script that compares two object files to see
> which
> functions got fatter, and which are slimmer. You may find it in the
> kernel tree
> sources (scripts/ folder).

Right. Uwe explained that to me.

> > I can try
> > generating what you are after. The cover letter contained typical
> > +/-
> > change stats from git and summary:
> > 
> > 62 files changed, 228 insertions(+), 104 deletions(-)
> > 
> > It sure shows that amount of lines was increased (roughly 2 lines
> > more
> > / changed file)
> 
> Which is making unneeded churn.

Not unneeded. A few of us see the value of naming the 1 and 0.

> > - but I guess that was expected as I don't like
> > ternary.
> 
> And I like them, so, what to do?

Well, if you maintain those files and like ternary, then they can be
ternary. I don't really care as long as I don't need to be the one
maintaining them. Not really a battle I want to invest in. I can even
go and drop the patches for files you are maintaining if you see that's
the way to go. It's easier for me.

As I said, I don't plan to change the meaning of 1 and 0 - although I
thought that allowing it might help in the future. Main goal was to
name the 1 and 0. Naming can be done even if all users were not
converted to use the names - as long as values behind names are not
changed. Changing the values is a burden that can be carried by others
when it is needed - we can now just make it easier or harder.

So as to what to do - please just give me the final decision so that I
know if I should just drop the intel patches or use the ternary.
Unfortunately I don't right now have the time to waste arguing over it
;)

Br,
	Matti
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
