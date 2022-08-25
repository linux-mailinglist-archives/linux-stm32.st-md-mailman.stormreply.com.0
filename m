Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4155A13D4
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 16:38:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C0FCC6410A;
	Thu, 25 Aug 2022 14:38:15 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 639C5C640FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 14:38:14 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 z23-20020a4ad1b7000000b0044931ffdcafso3458705oor.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=dD45AotZgawn6j7yXm8vQJ+UE0Dbo/KkcTzZcEiShZk=;
 b=K+RHoh+HUw7Lslc17S1hk0nZmNLDzJbF6N73rs6R1mYJ3SRr9ELrDwFpg8vwZDVZZk
 kWho5V+GGmA/3LXG0xZg/pXSPJIsSxNTZm3LoYXiEWZUz3DwzwEDHf86rQPNrypZ8hNe
 JFIsycyNk6fxTk+XVGjPCwqV5/oFim0dzEXAnh5TQJJ6w7AugQtrZxfVxzxbw8FR07AL
 t/GgwYpeJJPm7NGYhygh5BCUkXY5dG2rGrr2b/kwecVXAfTN/nrvEhWhUhUXtZoEbJl2
 8nf109NW7dKi+crgRh0sRpGxoBzEb/HvWY+Fdrcy3D1FDyxKcIuoDJK70zQ/5RiqyXt4
 H2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=dD45AotZgawn6j7yXm8vQJ+UE0Dbo/KkcTzZcEiShZk=;
 b=62HQHEA0jUME6kkgsh1thfU2ddJ3R7euu/PiZPPcmHA8F/orcncaPkZ7fUk2yWGXXX
 TfwejObeFIZsjul542/CmLUdkruzBfrHESu1SnrvUzegSVf3/pUESsQy5w9nbs5IpElO
 WoRdcNbMBbwrUW3d4TYUBylrHX/V54TfhAekOWWZeZOCQ29V8qXDZ+kKWIGS68QDk00G
 7vtV8JoDsz+arOiE1CjJf+wwoQXvaxCYE3fAKjg4oSTB9Crutrp0ZJcxKm2gZhK9IOaH
 j+NsjYrUdRZhJDC570AGTIoXGD7YsPeVdDb5/MdKQcPiZXue9qfnC2YmwStnOUvS1P5F
 8Rdg==
X-Gm-Message-State: ACgBeo3LmpKp67XnCiwP+GDNqaQcPMtokDNoYRqnT7q1JCc2r27jgeBi
 gXYnAsV/6HPaK/GkmQsxWlhNJg==
X-Google-Smtp-Source: AA6agR5b55IUOFFbPyjXVGsBwjiEhvECpdWI/tNtXaH7xbcjDHW403RlhV5oD7vQe80xy+iy4VwRYg==
X-Received: by 2002:a4a:c113:0:b0:435:4ce0:9794 with SMTP id
 s19-20020a4ac113000000b004354ce09794mr1364871oop.87.1661438293205; 
 Thu, 25 Aug 2022 07:38:13 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net.
 [69.109.179.158]) by smtp.gmail.com with ESMTPSA id
 k19-20020a9d7013000000b0063696cbb6bdsm5196989otj.62.2022.08.25.07.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 07:38:12 -0700 (PDT)
Date: Thu, 25 Aug 2022 10:03:43 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: linux-iio@vger.kernel.org
Message-ID: <YweBP30SLb5JMDq0@fedora>
References: <20220815220321.74161-1-william.gray@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220815220321.74161-1-william.gray@linaro.org>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Jonathan.Cameron@huawei.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 David Lechner <david@lechnology.com>
Subject: Re: [Linux-stm32] [PATCH] counter: Move symbols into COUNTER
	namespace
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
Content-Type: multipart/mixed; boundary="===============2537039443245452260=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2537039443245452260==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Awi6TV3gD/mTDbk7"
Content-Disposition: inline


--Awi6TV3gD/mTDbk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 06:03:21PM -0400, William Breathitt Gray wrote:
> Counter subsystem symbols are only relevant to counter drivers. A
> COUNTER namespace is created to control the availability of these
> symbols to modules that import this namespace explicitly.
>=20
> Cc: Patrick Havelange <patrick.havelange@essensium.com>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Oleksij Rempel <linux@rempel-privat.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: David Lechner <david@lechnology.com>
> Signed-off-by: William Breathitt Gray <william.gray@linaro.org>

Applied to counter-next branch.

William Breathitt Gray

--Awi6TV3gD/mTDbk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCYweBPwAKCRC1SFbKvhIj
Kz8xAQDVpcs6TSh1nCA9NTh9HkIp7VdzcBsSUUucshnYANY8FAEAhqF9QuAzFdoP
jT18GCZH6jgDLd+3tR1jau8IU8doFwI=
=6kcl
-----END PGP SIGNATURE-----

--Awi6TV3gD/mTDbk7--

--===============2537039443245452260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2537039443245452260==--
