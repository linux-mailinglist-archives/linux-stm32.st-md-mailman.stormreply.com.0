Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZYSIGxlXS2q9PgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 09:19:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E120870D714
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 09:19:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=GM4o0Yir;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82A39C8F273;
	Mon,  6 Jul 2026 07:19:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43DE5C7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 07:19:51 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-474560436c3so2591965f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1783322390; x=1783927190;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VIt88eh6zWv+oEhKK/Aw514C6mk0Vd1i5LusZK/Ssuc=;
 b=GM4o0Yir3S7B0A5n6zGDtQRNPgaQ4mc0M2zS+QWpeRVUyEKxZcMsqIiE87YMUJK2Wi
 7JHGdktSlO6vFt7/un5HfaYsgpFlNlZ80yIBMEXCFSn8Izc8NFB1nw1kWcBvOUtR1+Bb
 lsIHKFnF674rGOA9xa4EM3d+7ZIhEm5A9F8dz9MPtVzR2IBfUzMRIhsHL7iKiKgZW3MO
 NgIst5ybakpJkfV9v1yqurLRgwvcmZ0dKw2c4nV/OJvAvgdjXD+d14rGpT4uC3CbLJjA
 SYPEbImaBtc+OUd0UE/+eAiYMsxFLwx4fR4+uu2vkHQrVD3y7PeWN9Nf+VsWCrgTWcAd
 /2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783322390; x=1783927190;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VIt88eh6zWv+oEhKK/Aw514C6mk0Vd1i5LusZK/Ssuc=;
 b=lzjAT3/4KzRm492DpUA1PBQ3+YDw3t4PRXQhnGKx0iFmd5KFqeZBhGCfuZTUHdsyk+
 OaTRUUGM84hOM5X9xBriXjBsTqRjd5YUbtbTcG7swN0JgccOQVpcq5gegfpSieeo0IZV
 icuZz6ToWVzzi75E0z9ZdWvXmkLpJ/6bvoHAToBAuNPOf8Fcq5zmhIAz3irqya0yXnLa
 5ciVPT/gxt204qtFHPK/qlb4T0W1twusTTDrA9JtzptbuII3Xhkc5hpEEaucYl0n7S2w
 +q5zsgJYcqUgzQCOsqjbBSW7u1/U8QVd++XTkCYob1PFTFvlekhOOj3kzeCKZSKayzRE
 D/kw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoWa0B4Rve+Eml+dNtUniJdg72x0WZewOdP4YAntEnc22+LS8Yp1oAgs6md81cAkjECnfsoABr8BZH7iQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKU+26aldygQfg7t9ggA8ylpvySbOYcNOYd+t+EGdgvDuXMnEe
 JPFT5xSrPXCwg79c8/JhEk8zNanr8MdkQ+/dGFkWOWz90vK/lBif41h7NsVy+cKzJ6A=
X-Gm-Gg: AfdE7clQqrSGiurtKzgt+/zm99c40+1oRsVChi2l6jU7kPyryr3Z7yWY+WKdgZPRJtL
 4/XEJtsdqQwxGC8bD9FEJYNNqwAxLfKFV45gwtg3IjWIj9Gz3gfFEg74AzUUeU8UnwMW2qObRMw
 nMVK07eLGIDgjdwkS1d1atZzZIc2XvDV44VS2TS/OdtKM92RzvZ078TCaxhoE7N3sOczMT/kQ3f
 tC1xAIeSk7y4BgAqhmQOw4Vw5dlurrCfvg2yhM0gDuvG0gOWF9iwoT2PMOdJE0TH09XVHBWzbX1
 AwU9XPvs1JRrL8TmdenDJKu6VUG0R4qVJdRoOdsw4GZz4y1Eg52HN4WI+35ZSeqz4MKmdaCTmn/
 OuoGQGXojTK8TMLVthxaMqUCMgk/Zwzy1sDtBjmMFbke24jsUVG9tB72YHzoKx46ZysF0kYBwRY
 ssrl8HAVK/K8soKVvQGdUjIPO/zW1osOW+IyTH63FHFujW+WaDgrVrKvkJIUBweVZeFrQpdAPH7
 NcT
X-Received: by 2002:a05:6000:d4f:b0:478:4de8:9b91 with SMTP id
 ffacd0b85a97d-47aac7d018dmr7577860f8f.41.1783322390409; 
 Mon, 06 Jul 2026 00:19:50 -0700 (PDT)
Received: from localhost
 (p200300f65f47db0426af56a07ec3b32d.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:26af:56a0:7ec3:b32d])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-47aa039bcdasm23183058f8f.21.2026.07.06.00.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 00:19:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 09:19:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Chen Wang <chen.wang@linux.dev>
Message-ID: <aktWoIfY_DdO6gb4@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
MIME-Version: 1.0
In-Reply-To: <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 Janne Grunau <j@jannau.net>, Michal Simek <michal.simek@amd.com>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Hammer Hsieh <hammerh0314@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kevin Hilman <khilman@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
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
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Sven Peter <sven@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, Inochi Amaoto <inochiama@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Samuel Holland <samuel.holland@sifive.com>, linux-renesas-soc@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>, asahi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Paul Walmsley <pjw@kernel.org>,
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
Content-Type: multipart/mixed; boundary="===============8382419762671516541=="
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
	FORGED_RECIPIENTS(0.00)[m:chen.wang@linux.dev,m:sean.anderson@linux.dev,m:alexandre.belloni@bootlin.com,m:mwalle@kernel.org,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:paul@crapouillou.net,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:groeck@chromium.org,m:j@jannau.net,m:michal.simek@amd.com,m:festevam@gmail.com,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jbrunet@baylibre.com,m:hammerh0314@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:khilman@baylibre.com,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:piotr.wojtaszczyk@timesys.com,m:linux-pwm@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:chrome-platform@lists.linux.dev,m:martin.
 blumenstingl@googlemail.com,m:rjui@broadcom.com,m:s.hauer@pengutronix.de,m:vz@mleia.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:bleung@chromium.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:neil.armstrong@linaro.org,m:sbranden@broadcom.com,m:inochiama@gmail.com,m:nicolas.ferre@microchip.com,m:samuel.holland@sifive.com,m:linux-renesas-soc@vger.kernel.org,m:alchark@gmail.com,m:asahi@lists.linux.dev,m:kernel@pengutronix.de,m:zhang.lyra@gmail.com,m:pjw@kernel.org,m:neal@gompa.dev,m:sophgo@lists.linux.dev,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:geert@glider.be,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[64];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linux.dev,bootlin.com,kernel.org,sntech.de,glider.be,lists.linux.dev,nxp.com,tuxon.dev,crapouillou.net,gmail.com,samsung.com,chromium.org,jannau.net,amd.com,lists.infradead.org,vger.kernel.org,baylibre.com,broadcom.com,st-md-mailman.stormreply.com,linaro.org,timesys.com,googlemail.com,pengutronix.de,mleia.com,linux.alibaba.com,collabora.com,microchip.com,sifive.com,gompa.dev,mail.toshiba];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wikipedia.org:url,linux.dev:email,baylibre.com:from_mime,baylibre.com:email,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E120870D714


--===============8382419762671516541==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64vjgbl764osolti"
Content-Disposition: inline


--64vjgbl764osolti
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
MIME-Version: 1.0

Hello Chen,

On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
> On 7/5/2026 11:14 PM, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> >   - Use a single space in a of_device_id array terminator; A single spa=
ce
> >     after the opening { and before the closing } in non-empty
> >     initializers;
> >   - No comma after an array terminator;
> >   - Also no trailing comma after a named initializer iff the
> iff -> if

This is actually intended. iff =3D "if and only if", see e.g.
https://en.wikipedia.org/wiki/If_and_only_if .

> >     closing } is on the same line;
> >=20
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
>=20
> [......]
>=20
> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-s=
g2042.c
> > index 7d07b0ca7d29..0b6461172e6a 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> > @@ -225,11 +225,10 @@ static const struct sg2042_chip_data sg2044_chip_=
data =3D {
> >   static const struct of_device_id sg2042_pwm_ids[] =3D {
> >   	{
> >   		.compatible =3D "sophgo,sg2042-pwm",
> > -		.data =3D &sg2042_chip_data
> > -	},
> > -	{
> > +		.data =3D &sg2042_chip_data,
> > +	}, {
> >   		.compatible =3D "sophgo,sg2044-pwm",
> > -		.data =3D &sg2044_chip_data
> > +		.data =3D &sg2044_chip_data,
> >   	},
> >   	{ }
> >   };
>=20
> Changes to sophgo related files=EF=BC=9A
>=20
> Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks
Uwe

--64vjgbl764osolti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpLVxEACgkQj4D7WH0S
/k6otAf+MDN98V1OLHB7JSvapxuE4DwDpddJFumdMe3z/vu/P/VdI1oEao4PKhGo
2fMsJUgJT4k/6wIfoB6C3asAQFoEg3UirigbTf0d26+LpcWXfr+MJ/e2tzlX/Yzn
2dH88yKAhOR4HFj73YAi1FscS6vtyPmk7w2A84lWRMvteeY+zJan75O9xwgRC7FX
gEMJExnAEBHY9tEW8dgB3EK07MFFQWLlVpGQll6BbLHxOcMIz17Pj/sI6+7Sv0xW
cahUhiwZ1m+Y0EElAHIwQFoWyyyg7KINbFYsCsnyL1ev/EbUFyGCMRuR270OEIJW
bKMoVE2keTYc8IQjmKqk7x/VPRLsTw==
=LX/u
-----END PGP SIGNATURE-----

--64vjgbl764osolti--

--===============8382419762671516541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8382419762671516541==--
