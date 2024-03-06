Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 979D0874097
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 20:39:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E23DC6A613;
	Wed,  6 Mar 2024 19:39:57 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39864C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 19:39:56 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-4d33b077ec9so1734e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Mar 2024 11:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709753995; x=1710358795;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cUaL5wX9lCcHMpyt8Zu+oEHigjdI4PKIxNn0fnhJ8Po=;
 b=X9M+durruT/7mafHJC8En2GeQ6kELnJ2M7XzsRMTM9+0EHwy+r6fYR0VsKUe11Hcc2
 XOVjNvBZoPymcPZwsCWsAtVEAJBCyPiXUG1KG1inmu3ecsUSZHsO0Wilm6bkNEM8iNir
 AT/uJr5eKM5xxeCFc12z2fRJJN3EQT0w/Je2iq5n36bx7oYheuVxg7ppLqhuMNIrfnXp
 pvtN3q03aOVFtoKvMT+V8wLuA9q37C5pWppVVvTV/LSWto4BHehkjrwpjOUkwsT+SEpj
 aBOwDAO2pCv5cAqE4mhrbuV3A3fqpXiBJW31Ap50VZgI36Bcys0TJILNqJJRv+eLjP9K
 z66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709753995; x=1710358795;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUaL5wX9lCcHMpyt8Zu+oEHigjdI4PKIxNn0fnhJ8Po=;
 b=K1uSdl8nfYAqQL05dXV+PCiMIsbU8W+UeVDaz5u1XuB15Ct4TdEbrVkxhye1KCl1F5
 CNNXd+NSF4GODoGj73yU/BUyMXK2P1/MSc1ks8nFqRySetrnA073rtolk6AYZfaGmEJZ
 GYt0vp7pWiEWxm8I+VtYb/VmllGShYHsIRq/lALG9wRWbZA01Flb7kTz6d7aguGMAlA1
 d6w8wFA1pVCKUNexzumQDMjp3W8Dd+9spHkbHzwtPf9nOS3iSk7085WawtKXK3BDdIse
 tC7SD3Q2gSfALJwnP4TYtxjYquwm52rCSogDEL6BiB5EFfdZpR9xmMuO4aVL8sRYrCTf
 4dfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZD5y1X7JK+l3OKtmJB3iSBF896Zyc0+QLzEjpT+BG1Q0O0O4yldRWhIjmIXBx/5ifOqyGKjp24gKO1R9azm4XgpQ12mtOPha0QoVu29hKcDAd4FbL7hOH
X-Gm-Message-State: AOJu0Yxg/Eck2JKysqtY6PiEHxMeWZYAr1b7eOhZgv8lVH18f3JGmUSD
 ygOIjUZ2EJSvagBiicqm8xiZKuvrDF0eD6/DsG5mUjGdk62lseRqlamnG11weZ4=
X-Google-Smtp-Source: AGHT+IGXg5I00ytK4b1k0hPS2EZIeSRWy/K14ck3db1WCJDBJQ/eqPd+cm7XflCOTeslEXOmUhInbA==
X-Received: by 2002:a05:6122:30ab:b0:4c7:5fee:f525 with SMTP id
 cd43-20020a05612230ab00b004c75feef525mr6341546vkb.13.1709753994992; 
 Wed, 06 Mar 2024 11:39:54 -0800 (PST)
Received: from ishi ([185.243.57.249]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056122033400b004d347f2551asm1500370vko.40.2024.03.06.11.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 11:39:54 -0800 (PST)
Date: Wed, 6 Mar 2024 14:39:52 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZejGiKovtkCrydzp@ishi>
References: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
 <20240227173803.53906-8-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240227173803.53906-8-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 07/11] counter: stm32-timer-cnt: add
 checks on quadrature encoder capability
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
Content-Type: multipart/mixed; boundary="===============4815748715206714352=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4815748715206714352==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O7snGDCakkkZmDqH"
Content-Disposition: inline


--O7snGDCakkkZmDqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 06:37:59PM +0100, Fabrice Gasnier wrote:
> This is a precursor patch to support capture channels on all possible
> channels and stm32 timer types. Original driver was intended to be used
> only as quadrature encoder and simple counter on internal clock.
>=20
> So, add a check on encoder capability, so the driver may be probed for
> timer instances without encoder feature. This way, all timers may be used
> as simple counter on internal clock, starting from here.
>=20
> Encoder capability is retrieved by using the timer index (originally in
> stm32-timer-trigger driver and dt-bindings). The need to keep backward
> compatibility with existing device tree lead to parse aside trigger node.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--O7snGDCakkkZmDqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZejGiAAKCRC1SFbKvhIj
K5KbAP9fffVz3i5+FStoFd1EjIyVXWU6OcHNjQXPePsUhuk1WQEAoZG/LUlGu/3W
4MPtiZAoi8G7OzYxEFU0+n2pwYQl1As=
=Pqa6
-----END PGP SIGNATURE-----

--O7snGDCakkkZmDqH--

--===============4815748715206714352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4815748715206714352==--
