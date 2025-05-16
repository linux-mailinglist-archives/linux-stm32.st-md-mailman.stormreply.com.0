Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 003C8AB9959
	for <lists+linux-stm32@lfdr.de>; Fri, 16 May 2025 11:50:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4521C7A826;
	Fri, 16 May 2025 09:50:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E44D3C7A825
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 09:50:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so15146375e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747389023; x=1747993823;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w/bSlJSdmlkbWHZjun7hsykkC3laoNdDkksj4oYoPL0=;
 b=TRuCPqYBT25p4zfKdPHLOscCqJxMkclvpNJJmWyzM0o6CT4JBdZ9FRfNN+Q5IvOSXA
 cfdUHArxoxOsOwLXju+Rc7M5c6+VaYu/9fYGkeQsVM5YFOnTdjR9kqtiJxSItF5S5B+y
 Pvze5M9hlvTG4Rlv5LhxWtV7oTJCHbJNv4AfO8RfBCWr/MxK2VkON6L2Mh5Uqyn671db
 +WY0dHfEHdP9KqHZ5pj42IQeD8XL/w6uYE0CpnpQY6l0azs9cSLFwpnxNsR1e4ORSGea
 2VM56lMvujUFT/lB+d+9gKz0Q/2x6f/UgQciMDyq0wwEgfx8gDjkOMyYXya1Hnd5Pd5T
 gXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747389023; x=1747993823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/bSlJSdmlkbWHZjun7hsykkC3laoNdDkksj4oYoPL0=;
 b=kM2ZD8DdKwRSoKlN8W8ToQmBsi0pJ2nIJaKX4fEKqWvnKc0uh4N+rF6KtiCE2ltVKn
 yQgCMybSZdAfFZAYaharGkXUaHqTbv4BiNM4VYZOcPWDq+d2mHbRx+A0GHYiGFqrOZcD
 p72KeF9vWgLXyEHxB/TU3CRDYtvNhbXZYeZJTXJjNaHwKH8L2NPp0tnDgmjjyuBIK7r5
 NSUTTh0KbZujfU7V30GDPCW51Dkq7Zr2RJixOp2gmslprhJ58fLc1qpCFUr8nIudcdoi
 z5f1PHZvtlGkvAudbYMx7lAzoPiWO739E7qzvHpm3/5aU6Zj15Y6HrC3tRoaBcUzap2g
 iP1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXF8TyKslWkFtYXT3C9U7xujKrzB+ajpyO5yt9MqKxjAkXRjQ35Q5LJXHyDFlDSH8k3d6LZxbGvmJ6ww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/zioNYbbeZ+KVxh2Z9rmV8YQYG2TAji+NHxuOYiqYZFZ0o31t
 cczqeP5npRXA/O3f9atQLYNzj7xn0i66k09WUuoEXx33LWYWLBJnkE23zgXCd0QyA2o=
X-Gm-Gg: ASbGncsKipifd/YiHVlIYLR8TCp8KAQe+W03s3cwbGMO/6M8h9QCGZVoM5JxHMTii1J
 FRZLUalWo6zJi0g62u5E2HfKqhof+trve3cNNObLPAZzcPmt6rn90UdDFfsWOyimcgOv/PfLnCp
 CyoUH2uS/fcBquIIckjYtoLIhxsiYMcYj3gexQjhueh3s1dzLxQOSGsEq3WLOMLbvoxxnbx3Qgo
 lDSUKu7Tl3lCJrxzWicNff9oaCpgVZrSaYYqJxBRD62DQ7KrNJoXokjvFJ2BJePp9hfvN99d56O
 sx4P4cjFL/4lCgMlccDafzcy3s8K/h2pSGWPeueTMKC0D+FpEdVx4zcVR1Bd0mXGidl/pr809i5
 wxklGLJClrBRJhyptzYCZTVQIindB
X-Google-Smtp-Source: AGHT+IG8U8vuqf70rCyQDtiOWmQQMlATnOz4eXDJINSunO9kjrn7q2b9sgtlTI0vMJw9CTIra++GNw==
X-Received: by 2002:a05:600c:4f42:b0:43d:abd:ad1c with SMTP id
 5b1f17b1804b1-442fd60b64dmr24944235e9.6.1747389022959; 
 Fri, 16 May 2025 02:50:22 -0700 (PDT)
Received: from localhost
 (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f00:7808::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442fd51583dsm26876685e9.22.2025.05.16.02.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 02:50:22 -0700 (PDT)
Date: Fri, 16 May 2025 11:50:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <k5sznrkn6shjn3d5uj675sktkgwf3aivfr7hchialln433ktjs@u42bfyo7tnej>
References: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
 <xvhstvgs5bpfebeolozdbxh2empviijqq6hg2k2kuav5xykpqw@a3jgkrqzj4xm>
MIME-Version: 1.0
In-Reply-To: <xvhstvgs5bpfebeolozdbxh2empviijqq6hg2k2kuav5xykpqw@a3jgkrqzj4xm>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add nvmem-cells to
 ethernet nodes for constant mac-addresses
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
Content-Type: multipart/mixed; boundary="===============5752544876642860720=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5752544876642860720==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6opi2kcagpe26yym"
Content-Disposition: inline


--6opi2kcagpe26yym
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: dts: stm32: Add nvmem-cells to ethernet nodes for
 constant mac-addresses
MIME-Version: 1.0

Hello,

On Thu, Apr 24, 2025 at 05:07:00PM +0200, Uwe Kleine-K=F6nig wrote:
> On Fri, Mar 28, 2025 at 06:14:05PM +0100, Uwe Kleine-K=F6nig wrote:
> > The efuse device tree description already has the two labels pointing to
> > the efuse nodes that specify the mac-addresses to be used. Wire them up
> > to the ethernet nodes. This is enough to make barebox pick the right
> > mac-addresses and pass them to Linux.
> >=20
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> I wonder if this patch is on someone's radar?!

I still wonder. Is this just due to -ENOTIME for the maintainers, or are
there doubts about this patch?

Best regards
Uwe

--6opi2kcagpe26yym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgnCloACgkQj4D7WH0S
/k7CMQf/WwQ49zZfeEgNvOM7sUOEODuoH5TsG5AeMQFlVrrfQhA4KJYPKKM36JLN
aGpv/eqpwjRlZY6ur8W4bTvjTMfO8vWhQgHTJV6uR5ZWkOcaTxjrjLtmCj2yRF2J
jeip+Wm6yq9kgdADVApinoD38wgz8V1oUyT/JpQZNUe20lnsxAKYo4mb0L5mjWu9
Np9Vfgu3cPmB9liK2DFaCJ7j6NGXhkCiILu2+9egPMCdF+m8ZYhCBryCULuP2lub
aZ8EW1P2lBercWsbHqq1HZ15EiHZpJbcxRD/yt5qBhrRbSLD0oHixaDXF+yJM5ws
pGB/wSviPXFOMFjOvhbUMlI7zcIaEA==
=riy4
-----END PGP SIGNATURE-----

--6opi2kcagpe26yym--

--===============5752544876642860720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5752544876642860720==--
