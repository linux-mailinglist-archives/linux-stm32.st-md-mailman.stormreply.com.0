Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKMcCtPRGmqM9AgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 14:02:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B42D260CB1C
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 14:02:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D464C36B3E;
	Sat, 30 May 2026 12:02:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 879A9C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 May 2026 12:02:24 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso34630935e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 May 2026 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1780142544; x=1780747344;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BgNiBxvAE0zM3QGPzW0VTokh/HeWsq2F7ow5cn6lSMc=;
 b=gv3ca0B+cxBZ+rttqJpQSXXEEimq9voR84LvQEQyj3Yx4CFtm7Y28YtXeixA8G7q6v
 s/wcPRw1+ECXTlOqWr7CoybaqfyBIuO1Y8EHjUF3viIgCF7Q0bFiyD9+eYymFkTJTD+w
 McY7JhkeaKM4Fqayf9cUU8Ms8TdT/5yDgxD6hGXAOHgWR2oLSbiwOtD67Rga4Y0wGXYu
 DSiReguL5ct2TsDceDauJKnjaJwmHY/+0JLubSnWA9Tjl4pe6fbKEJSAGqyL7y3+00bz
 9FMAgGroqgBnIAVX+8GLFgeZOl/mU9zkEXUdwD4Z5hMLrA3IeTMy3Y4hvrbKFeMK9oWP
 2hcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780142544; x=1780747344;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BgNiBxvAE0zM3QGPzW0VTokh/HeWsq2F7ow5cn6lSMc=;
 b=nt3vo+owyRnURt0qesTi/8NNMNeNuzdNyJMw6RiLbcsI8/vpodfN/op5+v089uZFXs
 73bPaa65uSF5/5JCBUOpJBnaMbKlM+ju3+bdPR7K+9txq1U5FFuwWVHN/iM7J/haTXLb
 AirINWn553DZvGtCNhDGhD2xTfUjS0TpjBFWpSBlREQFMGE8OD9sGU1F9CrUEwh+RNeR
 g50Yh/q10VGPoplY92o4N43vW3K30kAr9kXpkQqOnQfYZEYUMVAOFyp2DGZP0seaEaxa
 UoEtKfkEM/2y4w0tjCPTHDw2+Oqu6Ii+1Bahe/JVflztRS9udLppVZyamtGUIDRGpXbQ
 mBTw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8EcgCDlvW0y3t4uNXu9KE7+wiNCYaSrRbwBW9S4bYjY+LqJal/IqKog+3E8pKwBQgGdOmCJYaFjr7cQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrGNNVKAbGmVpUXTKluKZXXIIkrEf8fiy7U5z/Q3FxjKXLmd8b
 WaidSka0pFdMiwh3BP0IAstnc36a1DAlGLQmhSi9mWL7+Wv7g18GcDnmAghZAKvzR8U=
X-Gm-Gg: Acq92OFtxaZDq4XLrFDp1Wxa5qTpmRHdrzLss8+j29qJoP5h277b/3Huj58LR10cvVc
 Cr0b3whtQe1XYq2nrsXCb4fSLyipnoRREx941dvWuEME+0y0iXfAff3DBnMty37VCfUgyon2JFF
 NK+GqjX0ELEOlaamVr11D1WtdNYpIJ2vuA7x4PsulJimoJudgqz2TCOIqskLLiGrXx6Ok1nCcZs
 lyU6HDGbTapyTk440FMkotpfMtJ/DHFBA7Fs1uwjS8FFgVxeCnm6dCQFDHISvkmHiYwMisPnsLE
 jKhO2xtHNnDLyQTp6EbzSmT2lQBjIY2uetjV0dtf3aQ0+WDUhntwSuWJLZ+a588raby3OpuXEje
 PZ2+uWM9nmw/G5Mzze8+xW6fQRQqe7P5BE7jBamGz+9ij8Dkl9xsO8/v1ylVtgPsAAslKYYiRMi
 Iu1ZPUKE4UEtKJjy4cHeM2D+V51d+TdTwHXxAgUDakIDXGPgo4lQ==
X-Received: by 2002:a05:600c:6558:b0:48f:d5a0:284e with SMTP id
 5b1f17b1804b1-490a294b864mr44962555e9.28.1780142543403; 
 Sat, 30 May 2026 05:02:23 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4909caa7faasm103845575e9.11.2026.05.30.05.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 05:02:22 -0700 (PDT)
Date: Sat, 30 May 2026 14:02:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <ahrP4STTFdUsBp0O@monoceros>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <ahp7WuHiPYa7Q_pX@google.com>
MIME-Version: 1.0
In-Reply-To: <ahp7WuHiPYa7Q_pX@google.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nick Dyer <nick@shmanahar.org>, Kees Cook <kees@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, David Heidelberg <david@ixit.cz>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ingo Molnar <mingo@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Johannes Kirchmair <johannes.kirchmair@skidata.com>,
 Anshul Dalal <anshulusr@gmail.com>, bui duc phuc <phucduc.bui@gmail.com>,
 Thorsten Blum <thorsten.blum@linux.dev>, Josua Mayer <josua@solid-run.com>,
 Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org,
 Jeff LaBundy <jeff@labundy.com>, platform-driver-x86@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Minseong Kim <ii4gsp@gmail.com>, Job Noorman <job@noorman.info>,
 Oleh Kuzhylnyi <kuzhylol@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org,
 Petr Hodina <petr.hodina@protonmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v1] Input: Use named initializers for
 arrays of i2c_device_data
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
Content-Type: multipart/mixed; boundary="===============6944133701874951741=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [1.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:alexandre.belloni@bootlin.com,m:nick@shmanahar.org,m:kees@kernel.org,m:claudiu.beznea@tuxon.dev,m:david@ixit.cz,m:marco.crivellari@suse.com,m:javier.carrasco@wolfvision.net,m:mingo@kernel.org,m:m.tretter@pengutronix.de,m:andriy.shevchenko@linux.intel.com,m:geert+renesas@glider.be,m:johannes.kirchmair@skidata.com,m:anshulusr@gmail.com,m:phucduc.bui@gmail.com,m:thorsten.blum@linux.dev,m:josua@solid-run.com,m:zhao.xichao@vivo.com,m:linux-input@vger.kernel.org,m:jeff@labundy.com,m:platform-driver-x86@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:sakari.ailus@linux.intel.com,m:michael.hennerich@analog.com,m:ii4gsp@gmail.com,m:job@noorman.info,m:kuzhylol@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:support.opensource@diasemi.com,m:mpenttil@redhat.com,m:y.oudjana@protonmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linusw@kernel.org,m:clamor95@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:nicolas.ferre@microchip.
 com,m:jekhor@gmail.com,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:hansg@kernel.org,m:dmitrytorokhov@gmail.com,m:geert@glider.be,m:phucducbui@gmail.com,m:marek.vasut@mailbox.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,shmanahar.org,kernel.org,tuxon.dev,ixit.cz,suse.com,wolfvision.net,pengutronix.de,linux.intel.com,glider.be,skidata.com,gmail.com,linux.dev,solid-run.com,vivo.com,vger.kernel.org,labundy.com,mailbox.org,analog.com,noorman.info,lists.infradead.org,diasemi.com,redhat.com,protonmail.com,oss.qualcomm.com,st-md-mailman.stormreply.com,microchip.com];
	NEURAL_HAM(-0.00)[-0.122];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B42D260CB1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============6944133701874951741==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hgmmhirtt5ohzik"
Content-Disposition: inline


--5hgmmhirtt5ohzik
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello Dmitry,

On Fri, May 29, 2026 at 10:56:48PM -0700, Dmitry Torokhov wrote:
> I like the ability to properly set up pointers for driver data, however
> I do not think we should use named initializers for name field. As long
> as we are not planning on moving its position I like the brevity of just
> saying
>=20
> 	{ "ili210x", .driver_data_ptr =3D &ili210x_chip },
>=20
> Can we keep the old style for the name field?

I have no strong opinion here, my patch introduces the named initializer
for both members for consistency. Note that my patches for all the other
subsystems (and also other *_device_id) do the same and you're the first
maintainer with that expressed preference.

I even sent a few patches that adapt initializers without .driver_data
(e.g.
https://lore.kernel.org/all/177932943265.3832404.360063047381979287.git-pat=
chwork-notify@kernel.org/)
that got positive feedback so far.

So if you're ok with having input differ in style from (up to now) all
other subsystems, I can rework the patch.

Best regards
Uwe

--5hgmmhirtt5ohzik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoa0coACgkQj4D7WH0S
/k5r2ggAr649aJrsJJlkFeVB/fh8+B5LDe4ym+MWA77b0yhq2eW8wormOagLI3cS
ZsKy4bfc4GPxEs6Hq4U1Xtb5rZQ4FZl0S07+51ZaYlq5RbMC/B/SVTiuASJVBVPZ
B4s5kh1AWRq20efV0vpGmMVkGWdWbbWfSDJ88TI8OoCIHy0LYFyBfz9XdnD2pdag
csvvcPKwLzXbvnQDsAb1CyMxa0P5xeJSgzH5Zq3dkY7GCsHzqv+4dmXzIRjgXwmE
F0tGpraE9YOlHYxoqXNfPa2xIKxihaRChziJOKNt3hN9BQ75tAHWpwEFGWDYHn8c
xpL0QD4yV6RvVsMilRsLYNC4h2ZaoA==
=umK9
-----END PGP SIGNATURE-----

--5hgmmhirtt5ohzik--

--===============6944133701874951741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6944133701874951741==--
