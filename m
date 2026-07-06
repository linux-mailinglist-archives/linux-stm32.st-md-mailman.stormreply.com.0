Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Otu3JOuFS2rWSwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 12:39:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B49FF70F4D6
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 12:39:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=cRAlevLy;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FA52C8F274;
	Mon,  6 Jul 2026 10:39:38 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08876C7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 10:39:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-474303f3c72so1665534f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1783334376; x=1783939176;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Go7lNGQE+yUmjPgVI2sZRhO3/S4lEXiftKalvVFj+z0=;
 b=cRAlevLyPErx9hR2i5baoxPidN27XzrKg7Gwfk6YVKOMJBJv/d3rA3m/uHT//SaQkO
 ib+XiNrq8bR2uCjVpcc2xL9TAQGZFmQOhiFXG7BfqVSwLYFrPoe/3fqpESOEZAgvdD8/
 8/s5FORXOn/fFMsF0oYpG6B/X9oxlC+nsDu9VmbW8YJ5bmvezR+hy0FC3no5wwlTZKat
 Qe36LfHJPrBnhqp7i21OkR41lVrZ3wfzyLfVu1upkPY9LvbdDG0hcd8J1iQ2+5Q3ZO4L
 YleXdbmftEZsHig9WG17DJtsSvBTNOSwjblhB4QKXmSmBrdUSBrDWGhygGWSxIF1f7k/
 rVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783334376; x=1783939176;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Go7lNGQE+yUmjPgVI2sZRhO3/S4lEXiftKalvVFj+z0=;
 b=pNrXkoQHcQmoZjemDZGiKhmVhLkXTJEgQpCniN72E3k9xm8V6EYvA3HC+rKAfrORvz
 rkBWh+eX0K/QbVfP266fhBerkqmjN9DHvtmMJb/hXGjVbji9SXVXWTUDvtl3To+A9u4Y
 kgCxR/SYzA9wqYHAvlsyH4dd8e7srf2On0EhFx14iKC167GIIQC3/doXNSYFbetRxnXl
 DemzEEzmte5F1DIyWN/toQB+S1uJV/kA6Q9e7JO7NwzjEpFk1NXI8l0UGnGeQGEnLSuW
 lDjeS5CNm3jDitUQqi5upSxtkqsAlxbDKXqij5zqKYs3R5PFl9YWmnR+sPN1/EbRpFMz
 E5yw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoNHnMWgNTHmBeMz6yoyHASx1SL0BHPqbNbbO27zvIayUSpObyfOr93Vq3XWjXKFqOXqEqGH6ehakNVAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxf/RUYNiuq2o67aIdypPhRuiVdX0Dj8aEZI9hb04lqNiwuiEAP
 ShHFTZ4Y2CbH4CZOBjmNJq7qBZb463DDL2oFj2ARrBNOmna7E+TCHaIMADhhIJfgHwA=
X-Gm-Gg: AfdE7cmynkz3mq+gAQJW5FChe9pchARyAw/Qh+Ldfwa4XAyDcEZsjrkESizyGHoQTTh
 1PoLc2NpkFTGjjjHTVGR1nBpmJmWkKBarc4N8r0pPQ/vzx+Df0cwI2Gwq/JAm2oAz2lhCAh8QL1
 3aJ9K0h4U+ltLHv13taqnPkaoywvaYDov0t/xunQoiiWZmKLhloUC6/Sj8RiEEd+QcAAlQ07cVJ
 z/E5wovb9z1+yyzyM5EG9UKJ+I8WZSlw+gKxk94DXPlRJi3RACvbnngy0R6ycJbOAFVYBAs3J7B
 7MDhyezKbsNOCU0Em1y08+ia9fMaEhsBR9mQxMhRVgMFcI/H0n/adx8gKFwCWUmxSsVahIJYOQp
 ud7VtA8O4UStM0UHxV/k8xT8aKA1xeBs/5SjQ1vZeDKtou2WB4VfM94Fu77umHJR6zekbNs7GKk
 uLnLl8zt45xOtAIixCQZCEcoSyeGHKx5B7oS6yHPeU/kxjeMoWt/dbUwmUbHjnFHZbBrWxb5zs9
 7Ta
X-Received: by 2002:a05:6000:4698:b0:475:36a:8c97 with SMTP id
 ffacd0b85a97d-47aab76f017mr8079359f8f.45.1783334376207; 
 Mon, 06 Jul 2026 03:39:36 -0700 (PDT)
Received: from localhost
 (p200300f65f47db0426af56a07ec3b32d.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:26af:56a0:7ec3:b32d])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-47a9de1d8cdsm25702223f8f.1.2026.07.06.03.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 03:39:35 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:39:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Message-ID: <akuFirxGTqu_gt4O@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
 <aktWoIfY_DdO6gb4@monoceros>
 <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Hammer Hsieh <hammerh0314@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Magnus Damm <magnus.damm@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 chrome-platform@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Sven Peter <sven@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, Inochi Amaoto <inochiama@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Samuel Holland <samuel.holland@sifive.com>, linux-renesas-soc@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>, Chen Wang <chen.wang@linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Paul Walmsley <pjw@kernel.org>,
 Neal Gompa <neal@gompa.dev>, sophgo@lists.linux.dev,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: Re: [Linux-stm32] [PATCH v1 4/5] pwm: Unify coding style of
	of_device_id arrays
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
Content-Type: multipart/mixed; boundary="===============8594972338598385464=="
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
	FORGED_RECIPIENTS(0.00)[m:philmd@oss.qualcomm.com,m:sean.anderson@linux.dev,m:alexandre.belloni@bootlin.com,m:mwalle@kernel.org,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:paul@crapouillou.net,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:groeck@chromium.org,m:linux-riscv@lists.infradead.org,m:michal.simek@amd.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:jbrunet@baylibre.com,m:hammerh0314@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:asahi@lists.linux.dev,m:j@jannau.net,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:piotr.wojtaszczyk@timesys.com,m:linux-pwm@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:chrome-platform@lists.linux.dev,m:ma
 rtin.blumenstingl@googlemail.com,m:rjui@broadcom.com,m:s.hauer@pengutronix.de,m:vz@mleia.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:bleung@chromium.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:neil.armstrong@linaro.org,m:sbranden@broadcom.com,m:inochiama@gmail.com,m:nicolas.ferre@microchip.com,m:samuel.holland@sifive.com,m:linux-renesas-soc@vger.kernel.org,m:alchark@gmail.com,m:chen.wang@linux.dev,m:kernel@pengutronix.de,m:khilman@baylibre.com,m:pjw@kernel.org,m:neal@gompa.dev,m:sophgo@lists.linux.dev,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:geert@glider.be,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[65];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linux.dev,bootlin.com,kernel.org,sntech.de,glider.be,lists.linux.dev,nxp.com,tuxon.dev,crapouillou.net,gmail.com,samsung.com,chromium.org,lists.infradead.org,amd.com,st-md-mailman.stormreply.com,vger.kernel.org,baylibre.com,broadcom.com,jannau.net,linaro.org,timesys.com,googlemail.com,pengutronix.de,mleia.com,linux.alibaba.com,collabora.com,microchip.com,sifive.com,gompa.dev,mail.toshiba];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,wikipedia.org:url,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B49FF70F4D6


--===============8594972338598385464==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vyrf5kfcddz5uoeo"
Content-Disposition: inline


--vyrf5kfcddz5uoeo
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 10:28:16AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Uwe,
>=20
> On 6/7/26 09:19, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> > Hello Chen,
> >=20
> > On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
> > > On 7/5/2026 11:14 PM, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > >    - Use a single space in a of_device_id array terminator; A singl=
e space
> > > >      after the opening { and before the closing } in non-empty
> > > >      initializers;
> > > >    - No comma after an array terminator;
> > > >    - Also no trailing comma after a named initializer iff the
> > > iff -> if
> >=20
> > This is actually intended. iff =3D "if and only if", see e.g.
> > https://en.wikipedia.org/wiki/If_and_only_if .
>=20
> I agree this scientific idiomatic expression is not well known
> by non-native English speakers, and using the expanded form is
> just simpler to review (thinking at non-native English speaker
> reading your commit in the future).

fine for me, I'll fixup to=20

 - Also no trailing comma after a named initializer if (and only if) the
   closing } is on the same line;

when applying.

Best regards
Uwe

--vyrf5kfcddz5uoeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpLheQACgkQj4D7WH0S
/k6DEQf+JKDZ+NcR412RMDPBxcWuk831SswOfJipQJVDxTsFWtpZIrZIbOu0ZlBp
IEWpfB5nRfHwTSxF6Ceuf2jTc+wkwcRBKeH4MQsZFpGxBjGa4k7YEEfMSDU9S1vU
39G1FIVXnf0sDkUOUGf5zIomYewh4gdCoWRwDnCHsV4QnZKAaKCCEpX0U6QdW2OP
diy3iqasYf6KZyXnUyj0HBQRGjBYY4jBvVutXt4KtCqAKW+AcCANOtubadJgydWD
xXNkFLpscFQ9aVdyKZK19UP9yKdOwzkjR9pul+TqXDviO0c5UoAZEwMZYDbB1YPi
AJloqZ9/3vBcnEjZo3eWYk8zkrQifQ==
=vnC0
-----END PGP SIGNATURE-----

--vyrf5kfcddz5uoeo--

--===============8594972338598385464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8594972338598385464==--
