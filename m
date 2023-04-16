Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A46E56E3C08
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Apr 2023 23:12:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4916FC6B448;
	Sun, 16 Apr 2023 21:12:29 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F417C6B446
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Apr 2023 21:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=PcdhZzelGiLWVRkQSPYVU84yN6BD
 oaInWPYe2mWzyWI=; b=0vlvYnXM0yc2UOV09gFwoU0Plkbv9q8QVtBV91C/Xct+
 nQaNG2FpJ5ue/IGfl/+vqlk/skwVcvLJ/OiMlAMchiTrl0GtHOLktk8sjvMT1ycY
 6D3x7GP9CzLuMSAWyzexEUQPLk1ptIFAEipKhWYtxMOtuO22My5NQaelxoDf/TM=
Received: (qmail 2639833 invoked from network); 16 Apr 2023 23:12:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 16 Apr 2023 23:12:19 +0200
X-UD-Smtp-Session: l3s3148p1@dHlEh3r5xr4gAQnoAEhOALUKm+CIhvWF
Date: Sun, 16 Apr 2023 23:12:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZDxkrVOhrEMg0oWh@sai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Julius Werner <jwerner@chromium.org>,
 Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sander Vanheule <sander@svanheule.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Justin Chen <justinpopo6@gmail.com>,
 =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Jamie Iles <jamie@jamieiles.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Jamie Iles <jamie@jamieiles.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fu Wei <fu.wei@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-renesas-soc@vger.kernel.org, Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andy Gross <agross@kernel.org>, Evan Benn <evanbenn@chromium.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Guenter Roeck <linux@roeck-us.net>, Corentin Labbe <clabbe@baylibre.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-watchdog@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: watchdog: indentation,
 quotes and white-space cleanup
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
Content-Type: multipart/mixed; boundary="===============6658453201373095848=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6658453201373095848==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8XwfRVUNrqARVTo"
Content-Disposition: inline


--+8XwfRVUNrqARVTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 15, 2023 at 11:51:08AM +0200, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for Renesas =
WDT


--+8XwfRVUNrqARVTo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ8ZKIACgkQFA3kzBSg
KbYctA//WZaNN4qBA3XDpxqd0lCrFYt2SAthM8gh8vN6cczN1b9Nak3ux3+Boc1k
TKtCJ81t8g4Gg65bxDolozTwVxdZ3qsHXLOtRJrlLwn4SQjNtyjQPxt+FSYxe/AJ
gDf8hNvHEHfeKRFI4boNK2fzxDkjE9R8RMrZnh63OnGtcCNQvEp6MkZimwStVVlX
TwYmE7rf6r8dbq7n3yDuWZFJB+eXi1ld0LNJrsROMMc5m88KNRHWi4r9Dxjg+UfK
VjpH5kYQFUtnFrd9Q8kcPdV/r9L9sVW3jdZJG5KB5xMPfZk4sX8wpXf28gqyOrW0
ENNFH8YV1rbQxZ8c6wszQs5+HJDbJmAetk9rJ32K98sTissdzrVZxm3hM8jSbO63
3oD8Gsy5wFifbAKlMukOSCavhnsbHQEUs0QLkBDOnOBCRGItoabDJLAT3TsLMyKq
ln8lCA9vu9InZ0UCtC0RJKpkFHxXorcEGZ3mu7xPeT7eUW9Qj6hsJ3nhvfgD9Tsd
jOFUoL9NSbGmTvFfM3wQDG1e9kFKvVZ01wN/8GRDEkKlOxP5O3oCvUW4VSa1Rq6u
fXpV0eFgzt0452QFbx0/Q5RU9+N25EOGcM3zZXzc7SHs2/yvNnCWvmB/RY9o6wxB
2YGS7nThdzLseBhIGuQPyyrmhwtJImDqa8043vnHIxUJ4RiG4i4=
=fYC2
-----END PGP SIGNATURE-----

--+8XwfRVUNrqARVTo--

--===============6658453201373095848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6658453201373095848==--
