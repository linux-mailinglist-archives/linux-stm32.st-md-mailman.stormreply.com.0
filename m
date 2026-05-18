Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPo6JBfGCmqa7wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 09:56:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23589568349
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 09:56:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37140C5663A;
	Mon, 18 May 2026 07:56:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3D42C56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:56:04 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so8168035e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779090964; x=1779695764;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ML+fhGCtqrS6nYIK3KHsCQErHIIB6z1uyNGHrfcGFy4=;
 b=CLredxt6jpObHLxEWxUkCQUo5mS5WQvJamqovWxqqo2KpOfWZblMqb58cox1V/HtAp
 3qIX+UPQtg2LVSa6U467WzZbcdsMS3VXNl3Nu8B968brYNdDX3qKjIgVzXCJQd0IDFh4
 NToK6HjntqnX2xMnmBVAIfuQsOP1H3SycouyBH9VE6UUr4LwFRBlPwjU5uM4WdcoAyfU
 FKB6NmXOh1ZyCwjKq0/1WXfxjxXy04iODznyNdu7OXOlbc+a17xXSHKqH5OVuUXAvHOY
 RiQpGghJfXdAxSZymCDXD7KDfKZRA88Vudv/05W0rhFvyO7qT5nHAA+AJgAQX+oSwf2Z
 W+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779090964; x=1779695764;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ML+fhGCtqrS6nYIK3KHsCQErHIIB6z1uyNGHrfcGFy4=;
 b=NpJNlEIstNLZpNtx8lvkD/aCcH7fxdRE77/vNlhau9E95OTrRpaWEuleL7Ka2LONd7
 pw7zz2HlvV4x3fZoX/nGWRb52hFRuS6kKAl8XJbeX4vBuLwPTz5DJ6SeCcczQbJwpjgL
 ZSH6+C8GWEIebHWEMlESSYVEI1Qw4sGQzC+BLqBuYdtIVRArc2teN0XxLnCIWrD52JHr
 7h2Z83AE8oiP92dan/4ZjXxJZNcx+LDVg7hwDXrdFcXkyxtAY+ay6Gp6H7Ga6OYir+OD
 HPjVWTwkKZCT9dPyzjpGwgH3qE9pQtxTMDVOTMtaQLthf+oLy0ksBkN63fRKlp+0soRp
 DuZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+F0mjmHda4TD78TxKnSeKoNxmXAM79bCKbvok65mK4cEZwugL910Zbzpm1zfWpmSc5mQYV7ILnVQQ0aw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAZ8m4y3XSc+602TaCMDOTzJuA/+SuqVNbQmLCmLO156atwr8b
 1hOa4v5G+mGNCPdSEj3oiiuLl+Rhs6x7M8cglg57gYbJGHdvE8dhCXv+Yj2lGtUBKu0=
X-Gm-Gg: Acq92OEsn9hHDis+FeVgc6TBnfYw8GMI3QuC8opNFYZKMLKtx4RFdxny+tMUqjEEdLU
 K/ItdRTH9wpc3pW1IuLsl1V6+BRML4jjhmiv7ZtxaivSXfBs3caYKS34TPXJunLPZa/qE4EFaCF
 ZBGtMtjiA6+Q6vgBMOP/AB8UMyPtvdkEVPqZXFAZ1388fTyGCXYOqdf2lKXnLzIhi3yo1NEU4Xt
 Wi76Gxl6MhVx6jxawgzlxycvdMqjtGebqEtRhmfTD28kQxgJ+bKc/8JKxXKUBgZu2U528/2xG4O
 xD41gDc6Y5Ds3gC/Tzmiw/MVt3mKQsTWD12V7/wCh5Es8b6IH58VgePqPK8YjsAxEuLSPbwdOS4
 wWxQeibIDoGafsZzUS5GWvT+2QIOcENxXjEIEI8cLRamruqu83GQdmgSWZl9TcyaPoHmmqfsk9v
 gkQpD+lgfjTRNNVgcMaDnaT8AmbeiiQyx/ZLlnkzcuAfMVKAc92aEh2T2sOasCHVbmpP0O2/Zf2
 CW84qD1nfxmtMvdO7sH3LJRvkh2u1XHYx8i
X-Received: by 2002:a05:600c:a406:b0:48a:599a:3716 with SMTP id
 5b1f17b1804b1-48fe651487emr168781505e9.23.1779090964101; 
 Mon, 18 May 2026 00:56:04 -0700 (PDT)
Received: from localhost
 (p200300f65f47db049367b55fc4056f2b.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:9367:b55f:c405:6f2b])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-45da15a562dsm35387139f8f.33.2026.05.18.00.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 00:56:03 -0700 (PDT)
Date: Mon, 18 May 2026 09:56:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <agrFDLaPu1nnLIN4@monoceros>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
 <agrAG3cLjEAPV90B@ashevche-desk.local>
MIME-Version: 1.0
In-Reply-To: <agrAG3cLjEAPV90B@ashevche-desk.local>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Nick Dyer <nick@shmanahar.org>,
 Kees Cook <kees@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 David Heidelberg <david@ixit.cz>, Marco Crivellari <marco.crivellari@suse.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Johannes Kirchmair <johannes.kirchmair@skidata.com>,
 Anshul Dalal <anshulusr@gmail.com>, bui duc phuc <phucduc.bui@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Josua Mayer <josua@solid-run.com>,
 Xichao Zhao <zhao.xichao@vivo.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 platform-driver-x86@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Minseong Kim <ii4gsp@gmail.com>, Job Noorman <job@noorman.info>,
 Oleh Kuzhylnyi <kuzhylol@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============7675359297304582081=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 23589568349
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:alexandre.belloni@bootlin.com,m:clamor95@gmail.com,m:nick@shmanahar.org,m:kees@kernel.org,m:claudiu.beznea@tuxon.dev,m:david@ixit.cz,m:marco.crivellari@suse.com,m:javier.carrasco@wolfvision.net,m:thorsten.blum@linux.dev,m:m.tretter@pengutronix.de,m:geert+renesas@glider.be,m:johannes.kirchmair@skidata.com,m:anshulusr@gmail.com,m:phucduc.bui@gmail.com,m:mingo@kernel.org,m:josua@solid-run.com,m:zhao.xichao@vivo.com,m:geert@linux-m68k.org,m:linux-input@vger.kernel.org,m:jeff@labundy.com,m:platform-driver-x86@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:sakari.ailus@linux.intel.com,m:michael.hennerich@analog.com,m:ii4gsp@gmail.com,m:job@noorman.info,m:kuzhylol@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:support.opensource@diasemi.com,m:mpenttil@redhat.com,m:y.oudjana@protonmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:n
 icolas.ferre@microchip.com,m:jekhor@gmail.com,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:hansg@kernel.org,m:geert@glider.be,m:phucducbui@gmail.com,m:marek.vasut@mailbox.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,shmanahar.org,kernel.org,tuxon.dev,ixit.cz,suse.com,wolfvision.net,linux.dev,pengutronix.de,glider.be,skidata.com,solid-run.com,vivo.com,linux-m68k.org,vger.kernel.org,labundy.com,mailbox.org,linux.intel.com,analog.com,noorman.info,lists.infradead.org,diasemi.com,redhat.com,protonmail.com,oss.qualcomm.com,st-md-mailman.stormreply.com,microchip.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	NEURAL_SPAM(0.00)[0.493];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email]
X-Rspamd-Action: no action


--===============7675359297304582081==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ledpsosxjgbf2xjn"
Content-Disposition: inline


--ledpsosxjgbf2xjn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

On Mon, May 18, 2026 at 10:30:35AM +0300, Andy Shevchenko wrote:
> On Mon, May 18, 2026 at 09:24:35AM +0200, Geert Uytterhoeven wrote:
> > Hi Uwe,
> >=20
> > On Fri, 15 May 2026 at 18:48, Uwe Kleine-K=F6nig (The Capable Hub)
> > <u.kleine-koenig@baylibre.com> wrote:
> > > My additional motivation for this effort is CHERI[1]. This is a hardw=
are
> >=20
> > Nice!
> >=20
> > > extension that uses 128 bit pointers but unsigned long is still 64 bi=
t.
> > > So with CHERI you cannot store pointers in unsigned long variables.
> >=20
> > Good luck fixing all implicit assumptions about this in the kernel!
> > Also, good luck convincing people to use uintptr_t instead ;-)
> >=20
> > https://lore.kernel.org/all/CAHk-=3Dwj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVL=
MXHe7A1d-g@mail.gmail.com
>=20
> Yeah, I believe Linus will have a strong opinion about all this CHERI stu=
ff :-)
> But let see, it might be surprising turn around.

Yeah, it's not yet the time to start that discussion, I want to have the
patch stack in a better state before that.

I think the strongest argument will be that

	"unsigned long" [...] is an integer type large enough to hold a
	pointer.

just isn't true for CHERI.

Best regards
Uwe

--ledpsosxjgbf2xjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoKxg8ACgkQj4D7WH0S
/k75XQf/fJBvg+bkcjF1RD9zN6ORGpW8MCPpjekC79O2A1nW+vWJClXaxkKullcM
RNcA6S+Y0Uw9HmLHEkyScdB1VYiKlnOw/gzCrSTCR9JK7CYN1rKq99EoMheR7+DD
uVa7Rai/eEhJYIh7vpBfGS/QtapI3qrJCb9hfOrfkP16by8BWbMcqFzUpGd9CBPh
pb6E63QmhOxL3fyFRcnpEzRCgyg3eTVKynQ+7tPmH2cU7leNveZhBkWfkLYDJWgM
a6K+Do5D2xWle5UGHlxxgWvA3SdTvGEXpIXWD2JM67KsBrmKuAVx2Oxzh7rYfORT
A1krybshSByxRK8iPTzSCW+n+EBR/A==
=/va5
-----END PGP SIGNATURE-----

--ledpsosxjgbf2xjn--

--===============7675359297304582081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7675359297304582081==--
