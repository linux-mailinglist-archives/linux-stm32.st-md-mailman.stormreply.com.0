Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA97ACA9B
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Sep 2023 17:51:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A318C6A5EA;
	Sun, 24 Sep 2023 15:51:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DCDFC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 15:51:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qkRO5-0002j6-Pr; Sun, 24 Sep 2023 17:51:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qkRNp-008fPX-Q2; Sun, 24 Sep 2023 17:50:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qkRNp-004RHy-E4; Sun, 24 Sep 2023 17:50:57 +0200
Date: Sun, 24 Sep 2023 17:50:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <20230924155057.e4k4ruv5iggbt6q6@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <ZQ+jddG+UbuSD7pP@google.com>
MIME-Version: 1.0
In-Reply-To: <ZQ+jddG+UbuSD7pP@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Guenter Roeck <groeck@chromium.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 chrome-platform@lists.linux.dev,
 Michael Hennerich <michael.hennerich@analog.com>,
 Samuel Holland <samuel@sholland.org>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Liang He <windhl@126.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
 Miloslav Trmac <mitr@volny.cz>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, Benson Leung <bleung@chromium.org>,
 linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 linux-sunxi@lists.linux.dev, ye xingchen <ye.xingchen@zte.com.cn>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>,
 linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, Siarhei Volkau <lis8215@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Chen Jun <chenjun102@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/52] input: Convert to platform remove
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
Content-Type: multipart/mixed; boundary="===============1955668508384750990=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1955668508384750990==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w2nepdqjggoh4sie"
Content-Disposition: inline


--w2nepdqjggoh4sie
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Sat, Sep 23, 2023 at 07:48:21PM -0700, Dmitry Torokhov wrote:
> On Wed, Sep 20, 2023 at 02:57:37PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > this series converts all platform drivers below drivers/input to use
> > remove_new. The motivation is to get rid of an integer return code
> > that is (mostly) ignored by the platform driver core and error prone on
> > the driver side.
> >=20
> > See commit 5c5a7680e67b ("platform: Provide a remove callback that
> > returns no value") for an extended explanation and the eventual goal.
> >=20
> > There are no interdependencies between the patches. As there are still
> > quite a few drivers to convert, I'm happy about every patch that makes
> > it in. So even if there is a merge conflict with one patch until you
> > apply or a subject prefix is suboptimal, please apply the remainder of
> > this series anyhow.
>=20
> Applied the lot (fixing the i8042-sparcio patch subject), thank you!

Thanks. In the meantime I found out why my process failed here: I only
fixed *.c, but this driver struct is defined in a header file
i8042-sparcio.h.

This file is only included by drivers/input/serio/i8042.h which in turn
is only included by drivers/input/serio/i8042.c. So there is only one
instance created, but I'd call that unusual anyhow.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--w2nepdqjggoh4sie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUQWuAACgkQj4D7WH0S
/k4z2wf/fRpeO2RuT0KNoThVdJCLb7VTgbHa+9l0qDPdA3JAbYzxbQ6K12SP/CIT
/y1woqUQa2ATctxXvuRS1TmBlYCbX5IQB/D24pgnGlz+UOGxAoNPNd1HsFSWGnRo
Retc138nrb3r+4HCwC6nBZ9VHaYy8kZMDs121e3M/t/bwVJQROuWowsT+b9gzqD+
XSwiABX3Ij7bgUS+iwf1FN68HK10/dd/jhSPepCDr4Q+4JMDp7gus6xC5ImGlDHx
hRvacVKc88L7gt/mlcj8JDmugGjcMWAlNGxQRqrhdWC0ANnGgN5L32jbH+HGk85t
hmCwwQWgjsTehkTnb/axaDJK83wyhw==
=h4JX
-----END PGP SIGNATURE-----

--w2nepdqjggoh4sie--

--===============1955668508384750990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1955668508384750990==--
