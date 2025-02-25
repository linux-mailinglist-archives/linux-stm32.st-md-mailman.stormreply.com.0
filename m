Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD3EA44AA2
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 19:37:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFE75C78F9F;
	Tue, 25 Feb 2025 18:37:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6885AC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 18:37:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4397dff185fso52200525e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 10:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740508669; x=1741113469;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3iaVHc4/XfXA2DF9jl+povuubBeCM8bFfr3Gc9B5VcM=;
 b=J6mAR5zKv1T5s1dCa0LGTer+52G09zQkCLQiopvmHK9MVqpdLIxnZky8GJ9/a9omkv
 5VaPcjeov4TPxkoeGjpYXRai3hlJffgSMkc9b9bbhsxZcNdqEyFXkzY4ZtQHKd9agO9x
 JcwHCmJP4wPDFj3agTSf9mbTqPWECm5Fka5hRzony2MvFxSgUA563Zt7p2EYORa0AsZh
 TB1BJ/vJ1zwjNfIoUTJQersZGPZbiuvo38jx5mXPk3MxgYeNa7sNBWiP51yzt5DU8nnI
 Zm7CedvgmBK5schWcd39Md5bjAW91lUzWyrrVTtb4oY+ncu2k6Dj4qKbwd6xP0/vrjGo
 nfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740508669; x=1741113469;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3iaVHc4/XfXA2DF9jl+povuubBeCM8bFfr3Gc9B5VcM=;
 b=boUzZSo+BUC1glkSRwQ3LtHxhLE+cWCfwEaXJUhTsjeFb+9eVFW2OVp85HZRPRDSrd
 gLSGKiwvTOmVwz0WQqSgoBHLdmf/WmaFX4yr2esi1/DwQZwFV4c37XIbAISgllZcOziV
 YDxNAYKjThjLEdui7fk53NDPZgZgVSioYp89PBFL0vA9MvtB3K3Hw0jNvgBSNmmjOgdl
 su5XcZ6XiRbcMBAWoBIQ7bm3uhzphzZz6t8tOGyR9P9bY13UKh2oUBWzYoKlTJ10zl2a
 wWU/Ue2VMa1hx/ww3MiNSJ3pYQuIZ318fiBzSL0O3cv2T+/Q22SKgXKSWvL4RZutLL+o
 PJUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvNMTIc7SJWeU3uRM/YCmYo7eCsh5zA3XSvvNjAfdDOc8ZIepWT2hss4qDcKOQxgE8iImqvPc4YmIluw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNAGYTsPuGC7GeDHDLZSigE5VXmw1C1iTBR8HWtaX9xPE15q2o
 2BEkkgfWaot5ZihyOfNoN0qodAp8cEoKK1rBHd/AzGG4AAotHWLo
X-Gm-Gg: ASbGncvvzYUWrBvA0DNLxInQIebelbCw3onbYhQzKsIpUg6ALxsl1yG1TpCxqQ1L5Gd
 OhC24zN7+vvG3h5CB1LDZ5MH23KzITLoN9fD2looBUPDCavVGWsZVyU1m7IXtASLqp35ndPUVRY
 ICWlUEQAkVVvpyoBA9Mw/W8wc+zIGujORegFREiw8LU+mv/oq/dUlkg7z9t3pbtMsf+Gu7bD6WZ
 U7qMwfsGP/7SNGEt0VnJDimmfcAgPnKy+r7fhWIjtWNoxrRnZj5BF2mJxYXjzq64P0xKEUX/uEy
 YzswN38D62d55w9UaO0gf7Zw9YA2f78TfloV0cA3v1UGsIUKCx73tNMcKHMIt+VT5JlYVwhWnzP
 GuF04dA/4AV9R
X-Google-Smtp-Source: AGHT+IH5jV0WLJwr4meYw5t5geNhiZJeRS99N5uTizzJ/xzS+uRzG3Le5O1v29l/A3y6EY3d135kgQ==
X-Received: by 2002:a05:600c:1d0e:b0:439:6712:643d with SMTP id
 5b1f17b1804b1-43ab8fd8620mr5118395e9.9.1740508668374; 
 Tue, 25 Feb 2025 10:37:48 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce735sm149842745e9.3.2025.02.25.10.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 10:37:46 -0800 (PST)
Date: Tue, 25 Feb 2025 19:37:44 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <5qx6hg33brb2zjjqzk3cr7dt56m5jxcwzioejtw5woweemskg5@suu43pp3nsg4>
References: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/2] net: stmmac: dwc-qos:
 clean up clock initialisation
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
Content-Type: multipart/mixed; boundary="===============4845264915548031981=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4845264915548031981==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f3i4x2skmc3z4dxx"
Content-Disposition: inline


--f3i4x2skmc3z4dxx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: dwc-qos: clean up clock
 initialisation
MIME-Version: 1.0

On Mon, Feb 24, 2025 at 04:53:16PM +0000, Russell King (Oracle) wrote:
> Hi,
>=20
> My single v1 patch has become two patches as a result of the build
> error, as it appears this code uses "data" differently from others.
> v2 still produced build warnings despite local builds being clean,
> so v3 addresses those.
>=20
> The first patch brings some consistency with other drivers, naming
> local variables that refer to struct plat_stmmacenet_data as
> "plat_dat", as is used elsewhere in this driver.
>=20
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 53 ++++++++++++----=
------
>  1 file changed, 29 insertions(+), 24 deletions(-)

Tested and works fine on Jetson TX2:

Tested-by: Thierry Reding <treding@nvidia.com>

--f3i4x2skmc3z4dxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+DfgACgkQ3SOs138+
s6Hc5xAAns6YS5EqizTjVtcybrFLTInegeZ0X+D5ciydxOvm9iHAwZY2/4ywuY9e
gq6UePIgB51vAzfDfxy5R5X4GvK5+922IL841tyDAJejg54ylBHTFiDoWJVNXUll
QJbbhM+dL0vRRaxTqPzJfJzkIO7ZyU0BylQwr3GYka21DUkYK4J/LnTleP1b3LMu
1W0QlEMWq5DznlUJuQ8C9Tn1C4Pr4+ZRmDjSPF7t8coFAP5XNs9Db5KK0DWkTWto
P0HugDfCHPdDHodfPFzHnT9QxCESDiIHjX4P+PTcR9w4eqg+gjMkiXq1EDpTYu/O
ph05+xPdywaHeGftW0K2RAf3ZdSRep1YWI90autg4U/g0JTq/P9fCyOwR8p3WEen
AtGz3MvZmcGbe6FGY7ZjnY/tVKAwPVP07DVSJcD1DzTe+YusCryfWRUTIHfpe69L
Ric7GRdggYEOZL88Y/bpybtv6kb3baNOpUDwKHj8xDn72FA8coa6Xl8KYDhZvzQe
4jxMzrghudcWAQ8XKxgxB2q+lZ7B+ZFRt1xU6jc7x+KdMsAGI8XHXc1Y0LiiJMfs
xNyl8+5hHbissm7ie2JbC/UyuXB4pCtB51+qfRJrzdZs+DTHXbyZZT5TtUWbtHpB
AzcgVhxrv05jSv7AzsbQiFjNoCC9WZvdMfzZg3Ja2bAh62bFw+o=
=BS53
-----END PGP SIGNATURE-----

--f3i4x2skmc3z4dxx--

--===============4845264915548031981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4845264915548031981==--
