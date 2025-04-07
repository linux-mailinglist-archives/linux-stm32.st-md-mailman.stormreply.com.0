Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFE3A7E3C8
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 17:17:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EE83C6DD9F;
	Mon,  7 Apr 2025 15:17:00 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80995C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 15:16:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so816575066b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744039019; x=1744643819;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qxnBAvpwCrecjAvuTm91rB4larlUyZM1HHjTp7DbEqQ=;
 b=cJa3at4A9tSp7mUj6AZVkkLBlk/2WGKnDq+n/LdEKeYMGumZMMqHP1obrcqddRQKsE
 ulpggj7zRxcb1H7Eg9wJd/iTkaFMj1ASNVN6sQb4jDTi2sQPuCpdxpjtAXyZUqPA+vZJ
 /OkiGgEHifOBbsMCmO/HwAY/G7v7cCm8x7F13WTb5We/ddx8+avXpiC+Idybfr5dD1M+
 A7ST6RubS3Fm0O6iBQVWsEBaXd68ww5V2IyryicEdrsieS+J9hI6vqi2NVxppkYmjtPG
 QV1957J667e/RMGJ5myzs+A7ZRNo+Qem3FP/lx4gPP80SLweLyopkUGy2LKCVA+HvhTE
 GypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744039019; x=1744643819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxnBAvpwCrecjAvuTm91rB4larlUyZM1HHjTp7DbEqQ=;
 b=X1htozoa2zeg/axSnxeSssvgv8nHpcLq0pQOy2mT1Hzq5dzD1yPejpV62L9yhi0Lzo
 mk5g6soLAZ/n/fqm6ZnMP4vP6Wv416S+sAq3pxhpDfMQYx8iLXrBiYFcOyqAv5CPT+kq
 yCnciX2VkUVGMt2aYtW8j+Ek9FnGs2XXSU7jkz9R/cOw7ujrECK+E86/Q+x9k/o6Wc2E
 37zOxAIfYxSaOxh+bl21Y7o5m/tsWmXtqnALXnnqddX2rB3R1jMnPTxTYV7q4gFb2xhX
 +dZYSDL+9HnoSsDGi+4+2eUBU/HE2esYecCnTNG5ilzamwAs2P3RXJgnTsIn4ZeAv3ov
 LYUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCOY6iImKNlS+zmMe7j9IL1vE03zqp3LH9YRfSZOPf/2Vpgluh+gGecxCFgapWDTkwtTNYVdN74VgxmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8lXCTvtwTawLmhGvQQL72oieCKhqYNIe0ZFFpIoQDJD9Hw/CF
 7XkgXOZeb4MUjZtEfVCK7Bw+C9J4pafFAn0GSZnfifpsqa6t6/haJV7BDTtO+tM=
X-Gm-Gg: ASbGnctksv4/JdE0Cxx7u3NtooEQpstdGtyDvF4/TFN9eIETbF3EPtXCUBPVi0rq45f
 yluDGlasqFZVRTYMa4iZHwFmBnfbQfIqvKbAppaVvWU0S4iirKEbxsm/RCfE79O43Dz4dBSWPR5
 WZfxFA+zLzovw9qApLuV3sAHOw3QPMWJ0CAlQ0toqyFDdDQ105mNpYdiniRNVdE7NVJKrOBbAxe
 s+ffX1W0RQly01RzU29FnZIL/uBW51p/6w5Q27akvfLoLq5VyXZCqDaWs7GtGydIgNP0+wGOfBe
 SUH2+jHLySgHDsgQvBl+p/ilek59+zgRPSA7cug/MIfiu4Gx+A==
X-Google-Smtp-Source: AGHT+IFzTIXbrDVkyQ6AbBiDuE5pSliyWRspT9PlDuGXWQ5GmY7qspmZDr7hbN6PADzz8nJe3cDOSw==
X-Received: by 2002:a17:907:9716:b0:ac8:179a:42f5 with SMTP id
 a640c23a62f3a-ac8179a43b5mr48095166b.14.1744039018700; 
 Mon, 07 Apr 2025 08:16:58 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac7c01c2c3asm768777166b.176.2025.04.07.08.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:16:57 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:16:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Message-ID: <wn3ef55yaangw4p5cihu2rafqlm7ckmylner6q5irtpu6yq3cw@tyjieqhlq6vc>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
 <lzwvrhmx3yqv2v2qkpiq5e542eflnnwvhm63fjmq6szh4bh47b@zk4hifurejja>
MIME-Version: 1.0
In-Reply-To: <lzwvrhmx3yqv2v2qkpiq5e542eflnnwvhm63fjmq6szh4bh47b@zk4hifurejja>
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] pwm: Some fixes preparing chardev
	support
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
Content-Type: multipart/mixed; boundary="===============8409288583030584952=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8409288583030584952==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvxqsbn576kt2xa5"
Content-Disposition: inline


--pvxqsbn576kt2xa5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 12:24:31PM +0200, Uwe Kleine-K=F6nig wrote:
> On Sat, Apr 05, 2025 at 11:27:11AM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > while working on character device support for PWMs I found a few
> > inconsistencies that are fixed in this series. After that I plan to work
> > on getting the character device support into shape to get it into
> > mainline, too.
> >=20
> > While some of these patches qualify as fixes I think there is no urge to
> > get them into 6.15, but given there is a bunch of such changes I might
> > send them to all together to Linus for inclusion to 6.15.
> >=20
> > Best regards
> > Uwe
> >=20
> > Uwe Kleine-K=F6nig (6):
> >   pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
> >   pwm: stm32: Search an appropriate duty_cycle if period cannot be
> >     modified
> >   pwm: stm32: Don't open-code TIM_CCER_CCxE()
> >   pwm: stm32: Emit debug output also for corner cases of the rounding
> >     callbacks
> >   pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was
> >     rounded up
> >   pwm: Do stricter return value checking for .round_waveform_tohw()
>=20
> I applied patches #1, #2 and #5 to
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fi=
xes

And patches #3, #4 and #6 applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

with=20

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index dca5d09d80b9..4b148f0afeb9 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -213,10 +213,10 @@ static int stm32_pwm_round_waveform_fromhw(struct pwm=
_chip *chip,
 {
 	const struct stm32_pwm_waveform *wfhw =3D _wfhw;
 	struct stm32_pwm *priv =3D to_stm32_pwm_dev(chip);
+	unsigned long rate =3D clk_get_rate(priv->clk);
 	unsigned int ch =3D pwm->hwpwm;
=20
 	if (wfhw->ccer & TIM_CCER_CCxE(ch + 1)) {
-		unsigned long rate =3D clk_get_rate(priv->clk);
 		u64 ccr_ns;
=20
 		/* The result doesn't overflow for rate >=3D 15259 */

squashed into #4 to fix the build failure that the 0day robot reported
in this thread.

Best regards
Uwe

--pvxqsbn576kt2xa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfz7GUACgkQj4D7WH0S
/k6YPgf/SN1j5yOtJmC7QVuGTcUlTuOBLQ2qNU8p1Lg66BPQ6jADoLAXq6aILNiA
Yd2vrJGFq4Aiw1p6B2xWwmzt7C2QdcqKRD8qdbDsfR1STaNLoseLs6nNG4PvbrKw
5HI6vqngB8oD4YE1TRq98S9/J0oGXmP9sHJk7LsHRbsVlaZggTLGXHqqc4wxJFNx
cOBJ4o8zEfjytVTIA4E5wYf86/ag/ZjROBWuZTuhzZG57hkeM3rzGnMtT58/8A98
VaEFgkpFp15TF3utVme6ORwWOm1JNGUJYyV67iDMY4h7IawmHHcstQYR5iOHfqoU
jzQYSZKQ/foRNzTwC+xzpVl5326WiA==
=EicF
-----END PGP SIGNATURE-----

--pvxqsbn576kt2xa5--

--===============8409288583030584952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8409288583030584952==--
