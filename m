Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125D6714F3
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 08:18:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 264C7C69055;
	Wed, 18 Jan 2023 07:18:30 +0000 (UTC)
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D36E2C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 20:44:55 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7A08D1FAA6;
 Mon, 16 Jan 2023 21:44:53 +0100 (CET)
Date: Mon, 16 Jan 2023 21:44:52 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20230116204452.il4gase2szipeexz@SoMainline.org>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-13-nuno.sa@analog.com>
 <20220806192048.0ca41cc5@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220806192048.0ca41cc5@jic23-huawei>
X-Mailman-Approved-At: Wed, 18 Jan 2023 07:18:27 +0000
Cc: Gwendal Grignou <gwendal@chromium.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo Chen <haibo.chen@nxp.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 linux-imx@nxp.com, Zhang Rui <rui.zhang@intel.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org,
 Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v3 12/15] iio: adc: qcom-spmi-adc5:
 convert to device properties
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2022-08-06 19:20:48, Jonathan Cameron wrote:
> On Fri, 15 Jul 2022 14:29:00 +0200
> Nuno S=E1 <nuno.sa@analog.com> wrote:
> =

> > Make the conversion to firmware agnostic device properties. As part of
> > the conversion the IIO inkern interface 'of_xlate()' is also converted =
to
> > 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> > dependencies from IIO.
> > =

> > Signed-off-by: Nuno S=E1 <nuno.sa@analog.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> +CC Marijin who happend to post a patch for this driver that I just accep=
ted
> and hence probably has hardware access.  Any chance of a test for this se=
ries?
> =

> If not, no problem as this is fairly mechanical and we have testing on so=
me of
> the other drivers using the new code.
> =

> I'll probably queue this up in the meantime but it won't end up upstream
> for a few weeks yet.

Jonathan,

This CC just surfaced in my inbox while searching for our current
discussion around missing labels in qcom-spmi-vadc - and on the side a
userspace @xx label name ABI break (in qcom-spmi-adc5) caused by this
patch's fwnode_get_name change - we could've caught it if I had not
accidentally marked it as read and/or forgot about it.  My apologies.

- Marijn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
