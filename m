Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B93C31099A
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 11:56:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54266C57B53;
	Fri,  5 Feb 2021 10:56:26 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C88BBC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 10:56:24 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l7ymj-00035C-2Q; Fri, 05 Feb 2021 11:56:21 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l7ymd-0004Fb-NN; Fri, 05 Feb 2021 11:56:15 +0100
Date: Fri, 5 Feb 2021 11:56:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20210205105615.qumu45huvntf2v4j@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
 <YBwnUrQqlAz2LDPI@kroah.com>
 <20210204165951.GB1463@shell.armlinux.org.uk>
 <20210204181551.ethtuzm65flujmwe@pengutronix.de>
 <20210205093744.kr4rc7yvfiq6wimq@pengutronix.de>
 <YB0baUzgvpd+EoO6@kroah.com>
MIME-Version: 1.0
In-Reply-To: <YB0baUzgvpd+EoO6@kroah.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Eric Anholt <eric@anholt.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-watchdog@vger.kernel.org,
 linux-rtc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Takashi Iwai <tiwai@suse.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [GIT PULL] immutable branch for amba changes
	targeting v5.12-rc1
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
Content-Type: multipart/mixed; boundary="===============2060084739898644044=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2060084739898644044==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vslstwmibba5nymi"
Content-Disposition: inline


--vslstwmibba5nymi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 11:18:17AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Feb 05, 2021 at 10:37:44AM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello Russell, hello Greg,
> >=20
> > On Thu, Feb 04, 2021 at 07:15:51PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Thu, Feb 04, 2021 at 04:59:51PM +0000, Russell King - ARM Linux ad=
min wrote:
> > > > On Thu, Feb 04, 2021 at 05:56:50PM +0100, Greg Kroah-Hartman wrote:
> > > > > On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linu=
x admin wrote:
> > > > > > On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wr=
ote:
> > > > > > > I'm glad to take this through my char/misc tree, as that's wh=
ere the
> > > > > > > other coresight changes flow through.  So if no one else obje=
cts, I will
> > > > > > > do so...
> > > > > >=20
> > > > > > Greg, did you end up pulling this after all? If not, Uwe produc=
ed a v2.
> > > > > > I haven't merged v2 yet as I don't know what you've done.
> > > > >=20
> > > > > I thought you merged this?
> > > >=20
> > > > I took v1, and put it in a branch I've promised in the past not to
> > > > rebase/rewind. Uwe is now asking for me to take a v2 or apply a pat=
ch
> > > > on top.
> > > >=20
> > > > The only reason to produce an "immutable" branch is if it's the bas=
is
> > > > for some dependent work and you need that branch merged into other
> > > > people's trees... so the whole "lets produce a v2" is really odd
> > > > workflow... I'm confused about what I should do, and who has to be
> > > > informed which option I take.
> > > >=20
> > > > I'm rather lost here too.
> > >=20
> > > Sorry to have cause this confusion. After I saw that my initial tag
> > > missed to adapt a driver I wanted to make it easy for you to fix the
> > > situation.
> > > So I created a patch to fix it and created a second tag with the patch
> > > squashed in. Obviously only one of them have to be picked and I hoped
> > > you (=3D Russell + Greg) would agree which option to pick.
> > >=20
> > > My preference would be if you both pick up v2 of the tag to yield a
> > > history that is bisectable without build problems, but if Russell (who
> > > already picked up the broken tag) considers his tree immutable and so
> > > isn't willing to rebase, then picking up the patch is the way to go.
> >=20
> > OK, the current state is that Russell applied the patch fixing
> > drivers/mailbox/arm_mhuv2.c on top of merging my first tag.
> >=20
> > So the way forward now is that Greg pulls
> >=20
> > 	git://git.armlinux.org.uk/~rmk/linux-arm.git devel-stable
> >=20
> > which currently points to=20
> >=20
> > 	860660fd829e ("ARM: 9055/1: mailbox: arm_mhuv2: make remove callback r=
eturn void")
> >=20
> > , into his tree that contains the hwtracing changes that conflict with =
my
> > changes. @Greg: Is this good enough, or do you require a dedicated tag
> > to pull that?
> >=20
> > I think these conflicting hwtracing changes are not yet in any of Greg's
> > trees (at least they are not in next).
> >=20
> > When I pull
> >=20
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git ne=
xt
> >=20
> > (currently pointing to 4e73ff249184 ("coresight: etm4x: Handle accesses
> > to TRCSTALLCTLR")) into 860660fd829e, I get a conflict in
> > drivers/hwtracing/coresight/coresight-etm4x-core.c as expected. My
> > resolution looks as follows:
>=20
> Ok, my resolution looked a bit different.
>=20
> Can you pull my char-misc-testing branch and verify I got this all
> pulled in correctly?

minor side-note: mentioning the repo url would have simplified that test.

I looked at

	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-=
misc-testing

commit 0573d3fa48640f0fa6b105ff92dcb02b94d6c1ab now.

I didn't compile test, but I'm willing to bet your resolution is wrong.
You have no return statement in etm4_remove_dev() but its return type is
int and etm4_remove_amba() still returns int but should return void.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vslstwmibba5nymi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAdJEwACgkQwfwUeK3K
7AkhPggAk0ucNSGkkTWYbQF9BBYOZDKVlqvPHzvkMilvBGuAa1EXhuHHKu3esHxh
NZf5xH5Lh7cnNyXodWF4Mp20NZfV0VFjzhbfNFexDfO2QfKJhJbATh9YiJ5onzsT
cbMDvw+fQNUmooGN1gOW4OCiRvEPcYf8Z/TdrAkBXuRDaCYLiqJBPX1PCFTumEr3
8Lxp3+k4zN9Wpkt17sqmgJxalvUHqNFOuL+1II2APrzMSZHB6T5fNtxEzMXUGXHx
LzNGWjnnUKovRddHUyjFZu+rr6B/MUELKSYf9WH7lPI6osLnyjQf6vtczDdyZmlP
PmCOMN9d1QJAKEMe6RJZvyfO22d11w==
=kmsA
-----END PGP SIGNATURE-----

--vslstwmibba5nymi--

--===============2060084739898644044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2060084739898644044==--
