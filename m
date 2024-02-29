Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F3986D2B6
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Feb 2024 19:58:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 267B6C6C83D;
	Thu, 29 Feb 2024 18:58:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40030C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Feb 2024 18:58:15 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-412c286be35so3942115e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Feb 2024 10:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709233094; x=1709837894;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QOMkV8+zwYA3EDl4Oj8veMVbhFWWtMnCBkuFp1N+OIc=;
 b=HX3DMoSFKZ4j9HvEBy7ZJVyZFJJHdK3+EMrIVi/3Vdygn5z74jiHKqfAj/4KTbFn2b
 QELFWAReqkC8oK82MfACr4ZgPf6TzdSd+YBcMkyRkqwBblkb7j9ulKVx7WnkRlLZz5RI
 JXIQd4j+vAiOhFdW/B1W25+JoGLSziK9FMgXXURKOltOn3ng9Ob3Gw8Y2YlFg51xolNq
 k8KMR+vfRH3zBYHdiKnfJxv8ViNPBxQK9T8i1dkfI/xCGs4qVcrU6WI600VjFWS5CbkN
 XccIU/vuSxyYbg2LtsFALiw24XMY8RVIcmrMGdoiVZ/PWa1JLEJGUMel0s62ZacR2hdy
 EyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709233094; x=1709837894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QOMkV8+zwYA3EDl4Oj8veMVbhFWWtMnCBkuFp1N+OIc=;
 b=frhuS5J53DFp7hp/s2HALJNHa1hMKUJiL/rYfH0F4oCDG7Zx/vdJD5fEzrEQImlhBc
 xz2U/I5q0OEDg+0a6A+4LYMxDAweKjMDtBKTBFRNMHijXx4wz2GsNoZ8u+lU9aGQMoGm
 AAOo7AGCGGdE8J4UnSpfpjjtQrM08dIWwfGinyjsQg+t0gdBfcyhmC/6CZ4oNSG9QSGg
 u1e+lqR2cNoonKzLV0483bV3TWOhKopoMXNqy7r2uHHI+aOlyV8qS6ZhvWeKeO0Vursm
 TkSwV7u9zMEJJIw9zHJwhF6RDb72IV2wW51xSjcg9jJdRpCSMivYd8G5PbH5akahlRYO
 FQyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFNb7ClNBLTElbmJUfKvHn3cvKpVZssrYfC9cVBwu95eht3s3RglkweLUmJqfZHSb6RYG0JaSE7U15LhqH2Mu74tXpzmnKBAj4PCWVtP+ENnFACAPvNBLe
X-Gm-Message-State: AOJu0YwiBARmkOCw21qIR2YrjnFDTVJcE/NnSjX5Y+6yTPyfXsEzdXIs
 9u3dCBExW+4lKbTcWfRS7h3KDy0nm/QTxsO5QiUIzat0ww//eyloZKCi2XPdvvs=
X-Google-Smtp-Source: AGHT+IE6N6/fBwdedrFzOy5DgpuEwQoJ27wC7Wfz2Gw6PuOexlU0y1KaywrIq7wNyzeVlhR8897a1g==
X-Received: by 2002:a05:600c:1d24:b0:412:b74a:452a with SMTP id
 l36-20020a05600c1d2400b00412b74a452amr2732349wms.29.1709233094459; 
 Thu, 29 Feb 2024 10:58:14 -0800 (PST)
Received: from ishi ([185.243.57.250]) by smtp.gmail.com with ESMTPSA id
 fc18-20020a05600c525200b00412aeb77bbcsm2863560wmb.19.2024.02.29.10.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 10:58:14 -0800 (PST)
Date: Thu, 29 Feb 2024 13:58:08 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZeDTwKMP7MX0Nlx5@ishi>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-5-fabrice.gasnier@foss.st.com>
 <ZZwm7ZyrL7vFn0Xd@ubuntu-server-vm-macos>
 <599a7357-b4d6-4581-9d5c-c1d0ade3e410@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <599a7357-b4d6-4581-9d5c-c1d0ade3e410@foss.st.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-iio@vger.kernel.org,
 lee@kernel.org, linux-kernel@vger.kernel.org,
 Julien Panis <jpanis@baylibre.com>, Syed Nayyar Waris <syednwaris@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 04/10] counter: stm32-timer-cnt:
	introduce clock signal
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
Content-Type: multipart/mixed; boundary="===============7466182381944259861=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7466182381944259861==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="el6dlSHLw0+sJrWy"
Content-Disposition: inline


--el6dlSHLw0+sJrWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 06:43:20PM +0100, Fabrice Gasnier wrote:
> On 1/8/24 17:46, William Breathitt Gray wrote:
> > On Wed, Dec 20, 2023 at 03:57:20PM +0100, Fabrice Gasnier wrote:
> >> Introduce the internal clock signal, used to count when in simple risi=
ng
> >> function. Also add the "frequency" extension to the clock signal.
> >>
> >> With this patch, signal action reports a consistent state when "increa=
se"
> >> function is used, and the counting frequency:
> >>     $ echo increase > function
> >>     $ grep -H "" signal*_action
> >>     signal0_action:none
> >>     signal1_action:none
> >>     signal2_action:rising edge
> >>     $ echo 1 > enable
> >>     $ cat count
> >>     25425
> >>     $ cat count
> >>     44439
> >>     $ cat ../signal2/frequency
> >>     208877930
> >>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> >=20
> > Reviewed-by: William Breathitt Gray <william.gray@linaro.org>
> >=20
> > The code is all right, but some minor suggestions below.
> >=20
> >> +static struct counter_comp stm32_count_clock_ext[] =3D {
> >> +	COUNTER_COMP_SIGNAL_U64("frequency", stm32_count_clk_get_freq, NULL),
> >=20
> > It might be worth introducing a new COUNTER_COMP_FREQUENCY() macro now
> > that we have a second driver with the 'frequency' extension
> > (ti-ecap-capture also has 'frequency'). But it's up to you if you want
> > to add a precursor patch to this series, or I'll introduce it separately
> > myself in a independent patch.
>=20
> Thanks for suggesting.
>=20
> I added a precursor patch to this series.
> I guess you wishes to see it used in both ti-ecap-capture and
> stm32-timer-cnt. I only cared about stm32-timer-cnt in this series.
>=20
> Can I let you do ti-ecap-capture change if/when you're going to apply it?

Thanks Fabrice, I'll pick up the precursor patch so we an start using it
in other drivers. Syed will take on the ti-ecap-capture change, and I've
CC'd Vignesh and Julien to this email as well so they are aware of the
incoming patch.

William Breathitt Gray

--el6dlSHLw0+sJrWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZeDTwAAKCRC1SFbKvhIj
K3yKAP9au8psfZPV7oz/mKiqINUHWTZ0uA0altrVA9qTHRrJWQEA6q36cJEVxyKY
FxE179tE7UvScdEB6mKG/o/bFy2hVQk=
=nCx4
-----END PGP SIGNATURE-----

--el6dlSHLw0+sJrWy--

--===============7466182381944259861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7466182381944259861==--
