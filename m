Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qOx4EpHHT2oboQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 18:08:49 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0AA7334DE
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 18:08:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=lBQjAdBD;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 691C7C8F298;
	Thu,  9 Jul 2026 16:08:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77C19C7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 16:08:46 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47de008b020so4818f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1783613326; x=1784218126;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Gov176wXURlzSR3dUDxqqJ+JUc69jBkAANSG0MToDuM=;
 b=lBQjAdBDOc4HivgiZ31RHsHvz3hAorCsOQKHaY29bu4dYRyzNQzd7WOZm1F7dAYYl1
 2+fSqqsb+Das1qGUFgu9gYINWsfgTg9aefHGp3eKbEd61d6WUIV1wLSPbsWZia1Qnj4Y
 aP9yMQL/sr3IU/7oQMKj9dThYleSweTNfr34TE/0FsPfO2m3jdNsVqw+llXZY3SiUB3p
 fY7K5vgP/L2NaMx4WBO0Rdi6DF+2/nrVdgDhxLiHGaLfrU2U6ekU0WYxosQA8QL6V571
 WC+G6mPyTzCDz46u2PxZogoEXTu2dZtf8+FJF+/Lx6zzR7F2kHcksQTS9hUoYcpc5iAL
 KpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783613326; x=1784218126;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Gov176wXURlzSR3dUDxqqJ+JUc69jBkAANSG0MToDuM=;
 b=ZS/QH4TYEIfUWAX2jlpcCf6l4OjY0wWmpu5bw4JA/DiN+LaLj2tMUVtvs/XrfPK3yS
 pZ0DZ7l0fOXYhWZSd96eChR/ltp4Kj03fxzT9ZmIbRzk/GeAU/c95jMEjMS8LPEpMh85
 1Z0lS2f1Qlwz8WaQ/uOs93IpUeUvW2GR5UTf9U8rjnHMe+3DGUm2FunmFCpodqRbTXsx
 gBne99ArY9mjN2xFaq8kCy77DJ0p6qLE4vhb6h7IvkD7XWR/QrZOGks0hJt9eBMrjwUm
 wqvTlIoMQ2zTi3qC7p5NfEcu0XhiCn4PKD5BprBCMCCcWrTPuPT/sjiMVO0MafajSxHC
 r1TA==
X-Forwarded-Encrypted: i=1;
 AHgh+RodL5TO8LdeqC1DrIrikGuhZ026nWNIxGrs4kqjgcfMBQLkh+7Jvsn9i9m0CaO8WPLGJhWDvx21fR8z+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwoUWNbuhb3EfggQuUQnA4VfdtdvOOrpWCnz2MYFAZO52TcsgO4
 kPqxltHujIlYFs2ZMvXJ5vYyICYeOU4UG+gOlPBdwi3Lwc/rlGSMh4xpbhW1bMXrsdw=
X-Gm-Gg: AfdE7cm75htVEJqdvsEW8+cFGDgSX0q7HtgwEecbMpkMT0uzxl+fC5ohuV815uu4u2I
 +09mrrzzIkoj9vQP9C5uRIkE3rahU5t9MDhH2iqAVkHcsmDY9+WKM9QnTtPKX6v8SM+tTrX7y3Z
 g8+/2Zu1ur2nqpjqgCmSvWvqdeH9XVPRErr0vJq+LXiwD2uKKyzqzIeJKBB9hJ+GD7nQ61OUFbr
 +AkS8ydRUHH9BDGW5Y5Ynw7KYAcCKXG11aq8oNmE/c9pVB65+NtssOH1PsAVpg3zMZe3nSXtEse
 Cessoq9rD+518Bj5YMWk8rPoiaxwjQeEtNvSnQlpqb4LiPH9SFKHs8RacaSTP/2POhVD5+Cr0Px
 KDrPfqQxQzmcsw2m4eoiowUiH+kO0gXEvu2g1y/rqSwl1WvYlNtAOIzNkXlUpI/5SQL2TSE/9pG
 FTnnTVTcolyXts34bKBzdMlO73ZhyYARPdK2Q/B+ttqWiTFWe54sK8H8HUIW+NLII1U8NSTAAdV
 uMb
X-Received: by 2002:a05:6000:230b:b0:46d:f979:1827 with SMTP id
 ffacd0b85a97d-47df757026bmr3824909f8f.23.1783613325532; 
 Thu, 09 Jul 2026 09:08:45 -0700 (PDT)
Received: from localhost
 (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-47aa0960816sm50486350f8f.29.2026.07.09.09.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 09:08:43 -0700 (PDT)
Date: Thu, 9 Jul 2026 18:08:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <ak_DIUQI9MX5aB8e@monoceros>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <ak41yQp3x78s4Fmx@ashevche-desk.local>
MIME-Version: 1.0
In-Reply-To: <ak41yQp3x78s4Fmx@ashevche-desk.local>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Sven Peter <sven@kernel.org>,
 linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Chunyan Zhang <zhang.lyra@gmail.com>,
 Lee Jones <lee@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-msm@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Samuel Holland <samuel@sholland.org>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, imx@lists.linux.dev,
 =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
 Tom Rix <trix@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>,
 Krzysztof Kozlowski <krzk@kernel.org>, Fred Treven <fred.treven@cirrus.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Benson Leung <bleung@chromium.org>, Samuel Kayode <samkay014@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Linus Walleij <linusw@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 asahi@lists.linux.dev, Zha Qipeng <qipeng.zha@intel.com>,
 Neal Gompa <neal@gompa.dev>, Xu Yilun <yilun.xu@intel.com>,
 Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Peter Tyser <ptyser@xes-inc.com>, Janne Grunau <j@jannau.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>, mfd@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 James Ogletree <jogletre@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Colin Foster <colin.foster@in-advantage.com>,
 Ben Bright <ben.bright@cirrus.com>, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v2 00/23] mfd: Use named initializers for
 arrays of *_device_data
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
Content-Type: multipart/mixed; boundary="===============8272347783279493041=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:geert+renesas@glider.be,m:alim.akhtar@samsung.com,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:cw00.choi@samsung.com,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:s.hauer@pengutronix.de,m:linux-sound@vger.kernel.org,m:sudeep.holla@kernel.org,m:sven@kernel.org,m:linux-omap@vger.kernel.org,m:andy@kernel.org,m:sbranden@broadcom.com,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:kernel@pengutronix.de,m:alexandre.belloni@bootlin.com,m:david.rhodes@cirrus.com,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:magnus.damm@gmail.com,m:ckeepax@opensource.cirrus.com,m:michael.hennerich@analog.com,m:mazziesaccount@gmail.com,m:linux-arm-msm@vger.kernel.org,m:rogerq@kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead
 .org,m:wens@kernel.org,m:mika.westerberg@linux.intel.com,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:thomas.richard@bootlin.com,m:samuel@sholland.org,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:mathieu.dubois-briand@bootlin.com,m:imx@lists.linux.dev,m:andre.draszik@linaro.org,m:trix@redhat.com,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:zhaoqunqin@loongson.cn,m:krzk@kernel.org,m:fred.treven@cirrus.com,m:festevam@gmail.com,m:jernej.skrabec@gmail.com,m:andreas@kemnade.info,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:rjui@broadcom.com,m:tharvey@gateworks.com,m:j.neuschaefer@gmx.net,m:rf@opensource.cirrus.com,m:baolin.wang@linux.alibaba.com,m:bleung@chromium.org,m:samkay014@gmail.com,m:support.opensource@diasemi.com,m:linusw@kernel.org,m:claudiu.beznea@tuxon.dev,m:asahi@lists.linux.dev,m:qipeng.zha@intel.com,m:neal@gompa.dev,m:yilun.xu@intel.com,m:tony@atomide.com,m:liviu.dudau@arm.com,m:ptyser@xes-inc.com,m:j@jannau.ne
 t,m:florian.fainelli@broadcom.com,m:peter.griffin@linaro.org,m:sravanhome@gmail.com,m:mfd@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jogletre@opensource.cirrus.com,m:patches@opensource.cirrus.com,m:nicolas.ferre@microchip.com,m:colin.foster@in-advantage.com,m:ben.bright@cirrus.com,m:linux@ew.tq-group.com,m:geert@glider.be,m:marekvasut@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[88];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[glider.be,samsung.com,st-md-mailman.stormreply.com,gmail.com,vger.kernel.org,iki.fi,baylibre.com,bootlin.com,lists.linux.dev,pengutronix.de,kernel.org,broadcom.com,cirrus.com,chromium.org,opensource.cirrus.com,analog.com,lists.infradead.org,linux.intel.com,linaro.org,sholland.org,redhat.com,nxp.com,loongson.cn,kemnade.info,gateworks.com,gmx.net,linux.alibaba.com,diasemi.com,tuxon.dev,intel.com,gompa.dev,atomide.com,arm.com,xes-inc.com,jannau.net,collabora.com,microchip.com,in-advantage.com,ew.tq-group.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,stormreply.com:url,stormreply.com:email,monoceros:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF0AA7334DE


--===============8272347783279493041==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ka4fpqo6ejmxfupn"
Content-Disposition: inline


--ka4fpqo6ejmxfupn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/23] mfd: Use named initializers for arrays of
 *_device_data
MIME-Version: 1.0

Hello,

On Wed, Jul 08, 2026 at 02:34:33PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 08, 2026 at 01:15:07PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Hello,
> >=20
> > this series superseeds my previous patch "[PATCH v1] mfd: Use named
> > initializers for arrays of i2c_device_data"
> > (https://lore.kernel.org/lkml/20260515095839.4005460-2-u.kleine-koenig@=
baylibre.com)
> > that Lee asked me to rebase and also the series "[PATCH v1 0/3] mfd:
> > Initialize spi_device_id arrays using member names"
> > (https://lore.kernel.org/lkml/cover.1783003256.git.u.kleine-koenig@bayl=
ibre.com).
> >=20
> > The objective for this series is to prepare mfd for changing
> > of_device_id etc to make driver_data a union, see
> > https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylib=
re.com/
> > for the idea behind it.
> >=20
> > This series is based on yesterday's next/master and it does the
> > restructuring not only for i2c and spi (as the two series mentioned
> > above), but for all *_device_id structures that I intend to modify with
> > a union that affect mfd. So (I hope) this is the only patch series
> > affecting mfd for this quest.
> >=20
> > I don't care much about the last few patches unifying the coding style.
> > I think it's a good opportunity to do that, but if you don't like them,
> > just don't apply these.
>=20
> The patches bring inconsistency (or still leave it) with the terminator s=
tyle
> in both I=B2C and ACPI ID tables. Can you revisit that?

I found a few inconstencies for of_device_id, but not for acpi and i2c.
I have a script for the acpi and i2c (and now also for the of) changes
and don't spot inconsistencys in the terminator style for acpi and i2c
devices apart from comments.

(I looked at the output of:

	git grep -lE '(i2c|acpi)_device_id [a-z0-9_]*\[\]' drivers/mfd | xargs -r =
sed -rn '/(i2c|acpi)_device_id [a-zA-Z0-9_]*\[/,/^};/p' | grep -B1 ^\} | so=
rt | uniq -c

)

Do you mean to unify the comments, too?

Best regards
Uwe

--ka4fpqo6ejmxfupn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpPx4cACgkQj4D7WH0S
/k624gf/dzy2q/+UDcko+3qRC/vjduntKV5JaImo1jv66pbGa0vVyVdYDHS/QwvV
X+Jr6jTMyEZcw6O1onRP1ZIcKU6MTkl/wvtqeLkFJ4PXv/hKftTSkP/IHkLuekNm
Cn37LNIalY7gpr1gfPvcL5Q/BN1qqXCUggmW0xXf+Gi9W5bwWuTaRsJ9ehVptA3+
rMp5HAYJ1isaiiqfMZJ/TqtNWHN6aVh8ZS6YU5b2iDitwtnRCQD1pOcYCYaXgfrt
fbXqb+xpQvMfRgK+MLErhmJUfHf2tKi1s5OKoG1T9fiLCmp0VzTkB4+o4AgpQgeE
pUTRSN5jhrCLDAt7v6B6b4XHPcYmTQ==
=tSBk
-----END PGP SIGNATURE-----

--ka4fpqo6ejmxfupn--

--===============8272347783279493041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8272347783279493041==--
