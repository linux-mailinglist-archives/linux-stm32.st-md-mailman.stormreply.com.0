Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD0855F974
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 09:44:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6A32C5F1EE;
	Wed, 29 Jun 2022 07:44:48 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 458F4C04001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 07:44:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6SMm-0000bt-4b; Wed, 29 Jun 2022 09:44:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6SML-003M5m-9u; Wed, 29 Jun 2022 09:43:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6SMO-001qhO-2i; Wed, 29 Jun 2022 09:43:40 +0200
Date: Wed, 29 Jun 2022 09:43:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Crt Mori <cmo@melexis.com>
Message-ID: <20220629074337.mks23y5rt6c536wl@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <CAKv63uu1XXP_XptZOeefDS_RVJvu3six5ZnJ9-oOVCPAK4D9aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKv63uu1XXP_XptZOeefDS_RVJvu3six5ZnJ9-oOVCPAK4D9aw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>, Ricardo Ribalda <ribalda@kernel.org>,
 Jimmy Su <jimmy.su@intel.com>, Russell King <linux@armlinux.org.uk>,
 Arec Kao <arec.kao@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>,
 Gwendal Grignou <gwendal@chromium.org>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Moses Christopher Bollavarapu <mosescb.dev@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Benson Leung <bleung@chromium.org>, Evgeniy Polyakov <zbr@ioremap.net>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Olli Salonen <olli.salonen@iki.fi>,
 Kevin Cernekee <cernekee@chromium.org>, Luka Perkov <luka.perkov@sartura.hr>,
 Jose Cazarin <joseespiriki@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Beer <daniel.beer@igorinstitute.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Marc Hulsman <m.hulsman@tudelft.nl>, Chanwoo Choi <cw00.choi@samsung.com>,
 Antti Palosaari <crope@iki.fi>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>, Viorel Suman <viorel.suman@nxp.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Shunqian Zheng <zhengsq@rock-chips.com>, lijian <lijian@yulong.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Alejandro Tafalla <atafalla@dnyon.com>, Petr Machata <petrm@nvidia.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Jean Delvare <jdelvare@suse.com>, Bastien Nocera <hadess@hadess.net>,
 linux-pm@vger.kernel.org, Eddie James <eajames@linux.ibm.com>,
 Riku Voipio <riku.voipio@iki.fi>, James Schulman <james.schulman@cirrus.com>,
 Scott Wood <oss@buserror.net>, Cai Huoqing <cai.huoqing@linux.dev>,
 Jonas Malaco <jonas@protocubo.io>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-omap@vger.kernel.org, Petr Cvek <petrcvekcz@gmail.com>,
 Mac Chiang <mac.chiang@intel.com>, Joe Tessler <jrt@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Robert Jones <rjones@gateworks.com>,
 Jan-Simon Moeller <jansimon.moeller@gmx.de>,
 George Joseph <george.joseph@fairview5.com>,
 Robin van der Gracht <robin@protonic.nl>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, Phong LE <ple@baylibre.com>,
 linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Heungjun Kim <riverful.kim@samsung.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Lin <CTLIN0@nuvoton.com>,
 Vladimir Oltean <olteanv@gmail.com>, Maslov Dmitry <maslovdmitry@seeed.cc>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Woojung Huh <woojung.huh@microchip.com>, Miaoqian Lin <linmq006@gmail.com>,
 Dan Robertson <dan@dlrobertson.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, David Airlie <airlied@linux.ie>,
 Jon Nettleton <jon.nettleton@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 David Rhodes <david.rhodes@cirrus.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maximilian Luz <luzmaximilian@gmail.com>, linux-i2c@vger.kernel.org,
 Martiros Shakhzadyan <vrzh@vrzh.net>, Guenter Roeck <groeck@chromium.org>,
 Matthias Schwarzott <zzam@gentoo.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Dmitry Rokosov <DDRokosov@sberdevices.ru>, Akihiro Tsukada <tskd08@gmail.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Saranya Gopal <saranya.gopal@intel.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Evgeny Novikov <novikov@ispras.ru>, Frank Rowand <frowand.list@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-stm32@st-md-mailman.stormreply.com,
 Zheyu Ma <zheyuma97@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Charles Gorand <charles.gorand@effinnov.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Miguel Ojeda <ojeda@kernel.org>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Martin Donnelly <martin.donnelly@ge.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Rudolf Marek <r.marek@assembler.cz>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-watchdog@vger.kernel.org,
 Corey Minyard <minyard@acm.org>, Ido Schimmel <idosch@nvidia.com>,
 acpi4asus-user@lists.sourceforge.net,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-media@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Alex Deucher <alexander.deucher@amd.com>, Jiri Valek - 2N <valek@2n.cz>,
 Dmitry Vyukov <dvyukov@google.com>, linux-rpi-kernel@lists.infradead.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Wayne Chang <waynec@nvidia.com>,
 Sing-Han Chen <singhanc@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Jens Frederich <jfrederich@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "David S. Miller" <davem@davemloft.net>, Wolfram Sang <wsa@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-usb@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, CGEL ZTE <cgel.zte@gmail.com>,
 Colin Leroy <colin@colino.net>, linux-integrity@vger.kernel.org,
 alsa-devel@alsa-project.org, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Daniel Palmer <daniel@0x0f.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Stephen Kitt <steve@sk2.org>, Sean Young <sean@mess.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 platform-driver-x86@vger.kernel.org, Krzysztof Opasiak <k.opasiak@samsung.com>,
 linux-mtd@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nikita Travkin <nikita@trvn.ru>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Jasmin Jessich <jasmin@anw.at>,
 Jiri Slaby <jirislaby@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-rtc@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Nick Dyer <nick@shmanahar.org>,
 Stefan Mavrodiev <stefan@olimex.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-staging@lists.linux.dev, wengjianfeng <wengjianfeng@yulong.com>,
 Eric Dumazet <edumazet@google.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 George McCollister <george.mccollister@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Mats Randgaard <matrandg@cisco.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Rui Miguel Silva <rmfrfs@gmail.com>,
 linux-pwm@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Kees Cook <keescook@chromium.org>, Wenyou Yang <wenyou.yang@microchip.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-input@vger.kernel.org,
 linux-clk@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Sven Peter <sven@svenpeter.dev>,
 Martin Kepplinger <martink@posteo.de>, Daniel Vetter <daniel@ffwll.ch>,
 openipmi-developer@lists.sourceforge.net,
 Robert Marko <robert.marko@sartura.hr>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-hwmon@vger.kernel.org,
 Felipe Balbi <balbi@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Zheng Yongjun <zhengyongjun3@huawei.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Sebastian Reichel <sre@kernel.org>, linux-fbdev@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Kirill Shilimanov <kirill.shilimanov@huawei.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, patches@opensource.cirrus.com,
 Adam Ford <aford173@gmail.com>, Peter Rosin <peda@axentia.se>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Hector Martin <marcan@marcan.st>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Seven Lee <wtli@nuvoton.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Ricard Wanderlof <ricardw@axis.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Alexander Potapenko <glider@google.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>, chrome-platform@lists.linux.dev,
 Peter Huewe <peterhuewe@gmx.de>, UNGLinuxDriver@microchip.com,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Tobias Schrammm <t.schramm@manjaro.org>, Richard Weinberger <richard@nod.at>,
 Jonas Karlman <jonas@kwiboo.se>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-serial@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Shawn Tu <shawnx.tu@intel.com>,
 devicetree@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Dongliang Mu <mudongliangabcd@gmail.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Eduardo Valentin <edubezval@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Michael Srba <Michael.Srba@seznam.cz>, Yan Lei <yan_lei@dahuatech.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kasan-dev@googlegroups.com,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Nicola Lunghi <nick83ola@gmail.com>,
 Xin Ji <xji@analogixsemi.com>, Angela Czubak <acz@semihalf.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Mark Gross <markgross@kernel.org>,
 Kevin Tsai <ktsai@capellamicro.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Juerg Haefliger <juergh@gmail.com>, netdev@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Leon Luo <leonl@leopardimaging.com>,
 Takashi Iwai <tiwai@suse.com>, Robert Foss <robert.foss@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Rob Herring <robh+dt@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
 Yizhuo <yzhai003@ucr.edu>, Colin Ian King <colin.king@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 6/6] i2c: Make remove callback return void
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
Content-Type: multipart/mixed; boundary="===============0584562134017279792=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0584562134017279792==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udaf7kclxozlbsvv"
Content-Disposition: inline


--udaf7kclxozlbsvv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jun 29, 2022 at 09:24:55AM +0200, Crt Mori wrote:
> On Tue, 28 Jun 2022 at 16:04, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >  static const struct i2c_device_id mlx90614_id[] =3D {
> > diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperatu=
re/mlx90632.c
> > index 7ee7ff8047a4..e8ef47147e2b 100644
> > --- a/drivers/iio/temperature/mlx90632.c
> > +++ b/drivers/iio/temperature/mlx90632.c
> > @@ -924,7 +924,7 @@ static int mlx90632_probe(struct i2c_client *client,
> >         return iio_device_register(indio_dev);
> >  }
> >
> > -static int mlx90632_remove(struct i2c_client *client)
> > +static void mlx90632_remove(struct i2c_client *client)
> >  {
> >         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
> >         struct mlx90632_data *data =3D iio_priv(indio_dev);
> > @@ -936,8 +936,6 @@ static int mlx90632_remove(struct i2c_client *clien=
t)
> >         pm_runtime_put_noidle(&client->dev);
> >
> >         mlx90632_sleep(data);
> > -
> > -       return 0;
> >  }
> >
> For both mlx drivers
>=20
> Reviewed-by: "Crt Mori <cmo@melexis.com>"

Thanks, it was more complicated than (IMHO) necessary to find these
lines. I suggest to strip the irrelevant part the quoted mail for the
next time.

I added your tag without the quotes to my tree.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--udaf7kclxozlbsvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK8AqYACgkQwfwUeK3K
7Am8Mwf+IBff11UStG2Xle0ayEs0RLJMDDLQ5ZsJcINntMkiJCCyvH1HrHqcvTWo
BtqcH/0oNBe5ko1loRbRALlOyYe7r1Q7508Zv+qkQf4Y8DOUmzWtlruJlDlo/HwV
DqiQBR0Ccfi3rbtXz0hWtvpecZWbgaQd9E/ZiIunLKUo3QcVz8lf+5jLQIZgy5EM
reJKul9dQD15zMfxqR2qzIVJIT1EK3OVYfO9Q0siHiTLkJ1EoQtEpW/nGYsZcKbj
OXsaiHqv4yt5atJH7kx1PzmSggDluMwRWcKmTrnQTrOTD766dAE3bxP2z1V8FUTn
HkMp469vyvmib6S/lNJi+NYdz9jcJw==
=41Qj
-----END PGP SIGNATURE-----

--udaf7kclxozlbsvv--

--===============0584562134017279792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0584562134017279792==--
