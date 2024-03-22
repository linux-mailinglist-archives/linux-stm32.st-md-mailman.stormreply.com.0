Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29A8871AC
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Mar 2024 18:09:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AB8DC6DD9D;
	Fri, 22 Mar 2024 17:09:56 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29F4BC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=WFSR
 OxQZOVxFu47A+8VqRSUCe8TRaljA8PS0t5b553Y=; b=cNmYtKwO5Cu5IWiuRD5o
 Rra1wfWzl7faA6KT3pVfA9ipAZ93fnWCDyioXrFmupshiecN38ZhuEn20Lv197ck
 wliUCprkQUA+jo49CTtVw9txv7lkqS3TK7Sph3u8PGimL8isWCSjBtDUOvzRJC0c
 HV4nrVroNyYOMldN5AgE4PNKHFpmVyKgXYoBCwPSXbXBzaxGbeNIbPfQZpKPIkJj
 OW/7uewh3zH5HPeHcYM/IfiHiY62bvPzBSsPOmiOjbDOgKSwOamu6D/qtV+wk6R+
 BNT0hTYDcakbO1754UvcuMCQVFvDQRT4cCISEjn5KLHZbq2psaT5U9oxZ+uoJ87t
 pw==
Received: (qmail 3929014 invoked from network); 22 Mar 2024 18:09:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 22 Mar 2024 18:09:43 +0100
X-UD-Smtp-Session: l3s3148p1@P2He40IU0sJehhtF
Date: Fri, 22 Mar 2024 18:09:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <groeck@google.com>
Message-ID: <Zf27VpOHPXAtHCLr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Guenter Roeck <groeck@google.com>,
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
 <Zf22G4jC2gIlzhi_@shikoro>
 <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>
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
 linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
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
Content-Type: multipart/mixed; boundary="===============4939334043505946297=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4939334043505946297==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="un7BlYMtStBuO9gz"
Content-Disposition: inline


--un7BlYMtStBuO9gz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Kind of odd though to change function names but not parameter names of
> those very same functions.

Ouch, this is definitely a valid point. Seems like this series will need
a respin after all. Will wait for further comments, though.

Thanks!


--un7BlYMtStBuO9gz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9u1YACgkQFA3kzBSg
KbZSKA//Q8484MbfzpPKmvUS0QA73oCgcHXOiIKbRKOfwXWkquKc1vuGV6LbxWG+
oPc84UQGrv+MjAhAMX/ZpO2VdGp+ej/a1j1kNYihlqVTkY/rRWPMa5y1oNB2H5Xq
tFjFmqgwbqm/K/OND3KcJw8zAmXCTgCvgQDyQx76B6KMydRGzKel/sM29TwW6mTm
HCQ9klGLK273LaNEAwn4vkLQ6BtVmjI1CpnjIp3hSRWdW9IytTQlM2weh0gQ+D2p
OerYgE9JUZp4dgPgLIR60J3AER1DaZtHMVH5NwMLT8xMLa/L3RgkSaTbxa/D2tvm
K2XQbEWvx8HsxtEIUEcIy936gmSyZ7Nta1mJv+5yN+DLHdGoo9KNl6vcMxzXLgpM
02/ySV8tMq+Q4cX/fIVZxaeudi69toWj1QcjLg11KaJDo4ndbPqBwYRkSYJ+o2Nh
aJNDu7J+5ud051bq05bFRaCitl7kyEdv5WEjwk5RTLDD1xvwR84SZ3ElcQ6Jnb/I
VaA1JNnKw/et4KmEF4A65wphnC8pC/gmH5c9SrPs6w7dUw44dla+p+jPrgtvUOnY
sqhCnFNLZ5MGuyhTemuWVdGNNvwwuTYFf/VYKi7mdRVsCRdLQIoHklH7FUfmwhpM
G5oEk4nI7j9MbLPl4WOjrZ9k5wZQnd5zRSWHj/aw5xmVCbNVKsQ=
=dqSs
-----END PGP SIGNATURE-----

--un7BlYMtStBuO9gz--

--===============4939334043505946297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4939334043505946297==--
