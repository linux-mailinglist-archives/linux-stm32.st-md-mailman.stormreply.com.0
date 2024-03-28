Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFD388711E
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Mar 2024 17:47:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D152C6DD95;
	Fri, 22 Mar 2024 16:47:39 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7950BC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=qvSq
 9KJ8v4lS2XRWA030SlZVY6brnDRMxRpdfBEXl68=; b=SusbELVLWoGcXjR0uw/N
 vi0sJrpp2Y39ZnmOG7CNzMgPhLJURyC8Ho1V2uCRlcvnaxkMo5ejfDKJAgJ8LD5+
 ErO+aG0llBV4NOPJR7LTMZIboa5omtT/2jAbOJcqJOQ/wBxQNzfz5+r/+Eu9muqU
 u3o0Cfqet5Kvqs6P5W5slQ6Inml6Pmf4/TNCQC3zDhVHGnArXFWwCjrnwGWQo0Vk
 kR4mF6CHRGyH7rhaQs2WGWMZhevxcrSvBnSpJ6U14YPLXLKwARnJ4YpJUailRc5N
 gw95oEIJLLt23XAQDl4rzIwSuGoN/zc3BQAG+xnAB9zO2ISuT7ciBBNHPzUvdSSR
 FA==
Received: (qmail 3923149 invoked from network); 22 Mar 2024 17:47:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 22 Mar 2024 17:47:24 +0100
X-UD-Smtp-Session: l3s3148p1@gWAOlEIU/rlehhtF
Date: Fri, 22 Mar 2024 17:47:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <Zf22G4jC2gIlzhi_@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-i2c@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Jean-Marie Verdun <verdun@hpe.com>,
 Nick Hawkins <nick.hawkins@hpe.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Khalil Blaiech <kblaiech@nvidia.com>,
 Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Ajay Gupta <ajayg@nvidia.com>,
 Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
 Robert Richter <rric@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Conghui Chen <conghui.chen@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
MIME-Version: 1.0
In-Reply-To: <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Ajay Gupta <ajayg@nvidia.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Michael Ellerman <mpe@ellerman.id.au>,
 Khalil Blaiech <kblaiech@nvidia.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Yicong Yang <yangyicong@hisilicon.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Ryan Wanner <Ryan.Wanner@microchip.com>, Andi Shyti <andi.shyti@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, Jean-Marie Verdun <verdun@hpe.com>,
 linux-tegra@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
 Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Peter Korsgaard <peter@korsgaard.com>, Benjamin Fair <benjaminfair@google.com>,
 Michal Simek <michal.simek@amd.com>, Nancy Yuen <yuenn@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Conghui Chen <conghui.chen@intel.com>,
 Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>, Vignesh R <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, Tali Perry <tali.perry1@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Jan Dabros <jsd@semihalf.com>,
 openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Sven Peter <sven@svenpeter.dev>, virtualization@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 64/64] i2c: reword i2c_algorithm in
 drivers according to newest specification
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
Content-Type: multipart/mixed; boundary="===============5849174204402036076=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5849174204402036076==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9lYJOkUv0cPFV6j6"
Content-Disposition: inline


--9lYJOkUv0cPFV6j6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # for at91
> Probably file names themselves will need some care, in a second time.

Totally true. I am aware of that. But one step after the other...


--9lYJOkUv0cPFV6j6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9thcACgkQFA3kzBSg
KbYGfw/+LQ3hxBO2X+O6EGQNj9zWf2B5N5sjnoAM9/9Me+X81oLmIkTF01pWe8R3
bIHrKR3dMTkxZIPm+WlZDGrUAEK1UKTgtzjM7MWEsb+rQ2RpH3/Wk+gKVsGI0Qt3
9oT+NKxyhdMXSggbOzoquWHAzB/LzL0sYoDtGre6k/rDEduSPqkDlaZ+BGmDO6uq
I2efrkUJgN0Qf5YyqKeu54G5K0e8xk+/Igp4Z9GlSJ4BOMOFSVmDO8DFw8SU92Nt
E8o1H2djbmOzxgdzIVVNQm9meh3ywyJ5ioL1gR0PyaG52jNMyQTxo9s8KI4Kok2g
NTj9dthAfLnCNRnrG/DHKAVnA7bX1SQ/CtddEvpZjY8DUfElpO10ejozu0aXXKzu
KXLxApqMcuzEVYG8LP/NqXNqPu8QhYdWWgwhiyEok9nsJWBIcv+Jsu/LFMoReo+j
PaiXkF3ANW6doXSn9v1B8jOdoGQnPsaPjpXbI69ZNNX2/Q3AoFrunfzrWh58hU2E
VEHLY/ZrvSe/8PiFCPPauo1jjT9a3sgW2moYeh9DjpkjwWFPamUol3fhtH811QGe
qw/gHCLtNeD4zyV5YtMs1YSn5kClt4DzjPXISGI7uvZIvsYuZlN8QnbKk9No5YjY
eLqZFiQT/VIBRHqACzaH7xbkdHW6UNcT5irBPAyy7YWElz0nkTA=
=ScZ5
-----END PGP SIGNATURE-----

--9lYJOkUv0cPFV6j6--

--===============5849174204402036076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5849174204402036076==--
