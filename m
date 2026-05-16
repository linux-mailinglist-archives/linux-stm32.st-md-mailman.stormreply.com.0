Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJTGBLwKCGqPWAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2026 08:12:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BF555A732
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2026 08:12:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7B44C8F266;
	Sat, 16 May 2026 06:12:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8317C87ECB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2026 06:12:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-449de065cb3so399945f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2026 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778911929; x=1779516729;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0HSemYvAyg7oF7KkWKvgahNXBgqxEPfiGmMTx54Opx8=;
 b=aest1jIxQlTaam+eZHWmTEl8Lqqf2qitAJz2LLCbBIso9FXg9/HZ5pATPX8emX8qQd
 yeA4VKfkQ56cWeYtInp1XspZXqTtCD6zNAvgtX8iNcNd9QA4k5gv3GW26W6kIKqDgt2c
 q8WF5aCbMrXc8PQJwEN6L5oIRTsVWyenv74vzIquAOwMg7vJv3iEjWBCJLSGqS7iGYH6
 5Jg1i6mCrgvytJWeCL5d1g1ImVz3Z0oR0MLEcs6ysWBATa6b5FGaG85W6+qpN/Fw5WdY
 ggVhOeTAVX9IaZG5uNxBrIAydgPYwlsWycaqzQAlgNMR+Bstm3C8SNT7oryf4FNBTQVK
 nyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778911929; x=1779516729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0HSemYvAyg7oF7KkWKvgahNXBgqxEPfiGmMTx54Opx8=;
 b=DDxoxbLVMsqJWg2KXOOPwupKmLi/ugNRP7qrDtEjkZExRnSu7/0X+Y8Pn8umRIpMzY
 fR0r84Eh79oi+PPSIhkCpB3SjDK5xIPEY5cKox4LS+BYoQXFUTXlVGEsNtGjyop7/yVy
 Nl2BTVbX9C/TO8poLcKvlC9OXCuW6aE1wlCcCVo55KHrSoBwm4mGRnxZu3tw5l1GU3gP
 jutw+TU+qonTbk/Oe2youRfDx1dp+5F0jdP/Fy5GcpJ8LvamBkcsxP/pmZWGubqK2luK
 gu0/xaDDzx2Y/rfDUnFWquL7gxoYe1Dfac0JP3j+dM/T0yYC8Tgii9CibhJ8KJweYAo6
 1h0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+48/buPM1+12a0gcur/enl5evAVw7vv2iCgfcTmN8F6kj4QEXF9EFe05wypAixIeRowsG0QwbvqrWX6w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9SA7kQOfoF7oZAwgnQ21ahBOpva+I3C8PSDO0Exf42tlQxvP3
 BjVa18ryxZV34tDrYFGNPx7/DyMYuVZX9KCbUpyKZqP4MSKOWAikC/iNPXeHUkOBt3s=
X-Gm-Gg: Acq92OHxG5T0Ww0O8q+SnaPOScZyn3ce22ZeQtj+5xi4yPLzBrxxhxI+KWvPW4KVu5g
 uFkBWVB0LQUIelAGtM3HELPw81QzxV2s827rNXq5DEgZx4i9E55fYrgmVeklX0CuQNJskvDlw7i
 XBWvgu4rpCIgrcPy5En4Z8U3mFmdmZP079oRodhfmfLQeSj051vzfXLrDHqIbd5zmWtZ1PZbdzH
 jNsrFvk+8N8UHmYSHvA6X/n5ryKJjhRMsCmYWY7NS9zRDxPUha/s0qXTsnGjjAGHeLlfkC41auB
 4wsCBJ8tlFiJFufBZv+v8qC5cm4bMUvQeM7gQCc29aqWw+CdXSQjW/alp/wq76Ne+fLtqF3LZWH
 2poRCxqtLnx3uxxbEzM11bkdlgIV+KrZwsjXacXPkI1E39PST5UGPIvI930XdVi+2B0UqdJO/oh
 /prwkdVq+J9Ph0LHTUEtGjFdfLeuGPerL7T/LFQwY=
X-Received: by 2002:a05:6000:1ac7:b0:43f:e272:edff with SMTP id
 ffacd0b85a97d-45e5c57d308mr9641215f8f.4.1778911928801; 
 Fri, 15 May 2026 23:12:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-45d9ed2f738sm19944411f8f.16.2026.05.15.23.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 23:12:08 -0700 (PDT)
Date: Sat, 16 May 2026 08:12:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Message-ID: <aggJiZk8Kp-309q7@monoceros>
References: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20260515095839.4005460-2-u.kleine-koenig@baylibre.com>
Cc: imx@lists.linux.dev,
 =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
 Tony Lindgren <tony@atomide.com>, linux-i2c@vger.kernel.org,
 Fred Treven <fred.treven@cirrus.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>, linux-omap@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Andreas Kemnade <andreas@kemnade.info>, Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-sound@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Samuel Kayode <samkay014@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Bright <ben.bright@cirrus.com>
Subject: Re: [Linux-stm32] [PATCH v1] mfd: Use named initializers for arrays
 of i2c_device_data
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
Content-Type: multipart/mixed; boundary="===============2327548626019948062=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 60BF555A732
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
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:imx@lists.linux.dev,m:andre.draszik@linaro.org,m:tony@atomide.com,m:linux-i2c@vger.kernel.org,m:fred.treven@cirrus.com,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-omap@vger.kernel.org,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:krzk@kernel.org,m:cw00.choi@samsung.com,m:andreas@kemnade.info,m:andy@kernel.org,m:ckeepax@opensource.cirrus.com,m:michael.hennerich@analog.com,m:linux-sound@vger.kernel.org,m:msp@baylibre.com,m:rogerq@kernel.org,m:rf@opensource.cirrus.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:jogletre@opensource.cirrus.com,m:samkay014@gmail.com,m:support.opensource@diasemi.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:ben.bright@cirrus.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[lists.linux.dev,linaro.org,atomide.com,vger.kernel.org,cirrus.com,st-md-mailman.stormreply.com,gmail.com,iki.fi,baylibre.com,kernel.org,samsung.com,kemnade.info,opensource.cirrus.com,analog.com,lists.infradead.org,diasemi.com];
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action


--===============2327548626019948062==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sdvcea3fsfmjq6y"
Content-Disposition: inline


--2sdvcea3fsfmjq6y
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] mfd: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

On Fri, May 15, 2026 at 11:58:39AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> index 6a7b7a697fb7..fb23d5ed1f26 100644
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -518,8 +518,8 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct i2c_device_id tps65910_i2c_id[] =3D {
> -       { "tps65910", TPS65910 },
> -       { "tps65911", TPS65911 },
> +       { .name =3D "tps65910", .driver_data =3D TPS65910 },
> +       { .name =3D "tps65911", .driver_data =3D TPS65911 },
>         { }
>  };
> =20

The indention in this hunk uses spaces instead of tabs (both with and
without my patch). I fixed that in my tree, so if it comes to a v2 the
indention will be fixed there.

> [...]
> diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
> index 8ecfe878a5ba..1c0ba450ef9b 100644
> --- a/drivers/mfd/wm8400-core.c
> +++ b/drivers/mfd/wm8400-core.c
> @@ -135,7 +135,7 @@ static int wm8400_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct i2c_device_id wm8400_i2c_id[] =3D {
> -       { "wm8400" },
> +       { .name =3D "wm8400" },
>         { }
>  };
> =20

ditto.

Best regards
Uwe

--2sdvcea3fsfmjq6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoICrIACgkQj4D7WH0S
/k7niwf+L8OYV1m8gjYa2gWHbcQnsCJgzdFKCpbXliu2T5EWq+pQK9qpV9Z1VizU
c2aUOPFJ5EiekEJu5DCu2EP0hYSk7XVsIzj1X6S2yAUDcUn5KFqmgkRAQsZKxRUN
To4/9O43tr+/WYuyUT/kM1mZFYHw3kubucsATq5rprulQ8SwNsFWG1hADna3KAHe
VE+iBDWGgcWuextWGVmh9DL+KyuYXcHSYZ6jwMkUkzdTGE6XIJeZ4AgCXM5X6wl/
9G5OpBfgo0IXSCrfxQRCx2Rq617B5x7i9u3851/XC/G8l04/lZOsk8vW92H4tVvR
IqdTaRQtvMJ/Itv6B4DadpEPZbkW2g==
=AyjU
-----END PGP SIGNATURE-----

--2sdvcea3fsfmjq6y--

--===============2327548626019948062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2327548626019948062==--
