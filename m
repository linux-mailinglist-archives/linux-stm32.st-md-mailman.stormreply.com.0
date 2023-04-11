Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BCE6DD902
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 13:12:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1888AC65E4F;
	Tue, 11 Apr 2023 11:12:21 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25F81C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 11:12:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pmBv0-0004gl-Lm; Tue, 11 Apr 2023 13:12:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pmBuf-00AURe-AU; Tue, 11 Apr 2023 13:11:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pmBue-00CH5H-AL; Tue, 11 Apr 2023 13:11:48 +0200
Date: Tue, 11 Apr 2023 13:11:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <20230411111148.yefmzohsvk3facq3@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230407101043.299f5e22@xps-13>
 <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
 <20230411102025.6b2fdc9e@xps-13>
MIME-Version: 1.0
In-Reply-To: <20230411102025.6b2fdc9e@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lucas Stach <dev@lynxeye.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-tegra@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-amlogic@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Miaoqian Lin <linmq006@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Jack Wang <jinpu.wang@ionos.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Vladimir Zapolskiy <vz@mleia.com>,
 Roger Quadros <rogerq@kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 linux-arm-msm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Valentin Korenblit <vkorenblit@sequans.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-oxnas@groups.io, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] mtd: nand: Convert to platform remove
 callback returning void
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
Content-Type: multipart/mixed; boundary="===============1705326412478380140=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1705326412478380140==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="he6vq5knkogtd7j7"
Content-Disposition: inline


--he6vq5knkogtd7j7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Miquel,

On Tue, Apr 11, 2023 at 10:20:25AM +0200, Miquel Raynal wrote:
> > On Fri, Apr 07, 2023 at 10:10:43AM +0200, Miquel Raynal wrote:
> > > I've looked at the different patches, they look good to me but as they
> > > are all trivial and exactly identical, would you mind sending this
> > > again all squashed in a single patch? A subsystem-wide conversion see=
ms
> > > appropriate. In all cases I plan to take this for the next merge
> > > window. =20
> >=20
> > I slightly prefer them separately, because I like small patches and
> > because the Acks and Reviews only apply to the individual drivers.
> > But I don't mind seriously, so here comes the series squashed into one.
>=20
> For any non trivial change, I would definitely do that as well.

A patch is only trivial as long as it doesn't do anything wrong.
I don't assume any problem, but it wouldn't be the first. The first was
bcm2835_spi_remove() being used in bcm2835_spi_shutdown().

> The thing is, by collecting the tags with b4, you lost all the Acks and
> Reviews targets, while we could prevent this, see below.
>=20
> > While going through the changed, probably the s3c24xx driver (which
> > isn't exactly identical to the other changes) could benefit from an
> > additional change throwing out the early exit (which---I guess---cannot
> > be hit).
>=20
> Yes, I believe the 'info =3D=3D NULL' condition is useless, feel free to
> drop it in a second patch if you wish.

Yeah.

> > BTW, I constructed the lists of acks/reviews myself and found the same
> > set. However b4 wailed about each patch claiming:
> >=20
> > 	    =E2=9C=97 BADSIG: DKIM/infradead.org
>=20
> No idea what this means, any pointer?

lists.infradead.org signs all outgoing mail and something between these
outgoing mails and b4 consuming them breaks the signature. I didn't
debug, but depending on where the problem is, either
postmaster@lists.infradead.org or the admins of lore.kernel.org or the
maintainer of b4 might want to know and fix.

> > And it didn't like you producing the tags, saying:
> >=20
> > 	NOTE: some trailers ignored due to from/email mismatches:
> > 	    ! Trailer: Acked-by: Roger Quadros <rogerq@kernel.org>
> > 	     Msg From: Miquel Raynal <miquel.raynal@bootlin.com>
> > 	    [...]
>=20
> Well, yes, I don't expect b4 to read plain english when I say "I
> collected them for you" ^^ But at least my list had a '# <area>' suffix
> for each of the Acked and Reviewed changes, which is now missing. I
> don't know  how useful they actually are, but it seems to me that the
> information was lost between v1 and v2?

That's right. I will resend in a separate thread with the annotations
fixed. Sorry for the noise.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--he6vq5knkogtd7j7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ1QHMACgkQj4D7WH0S
/k59PQgApmYCdD89s3AZJOYu84R1sSO13lJD2sW2YG/826FnsTQ8v5JAAMkZRhMV
k+MCufvC25ennRcrXR5Uv8O1rreswBF1+9WhnWNEGGzaOsRqvVjkbsrMHgpJUsh3
FMlNyvjm6KpNJhqF46lITimOhkWph7CAmCq1OMnfs5D1/biK19XqlwyNlOrka0XW
8dwB13fYwc9PnEdLkyfmzqtcQbGBezwBjXzPkAls4+2qwIJkinKwMZACrpKd1VUr
VOROg0xogL+KfIkaVvPu4UQTs2jpIf13YnyBfynr+pg81qKqHh6lHeS9zaMbTEhM
JRbE//97QsOix1ZjsQHXvFD4zk8yjQ==
=LsjF
-----END PGP SIGNATURE-----

--he6vq5knkogtd7j7--

--===============1705326412478380140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1705326412478380140==--
