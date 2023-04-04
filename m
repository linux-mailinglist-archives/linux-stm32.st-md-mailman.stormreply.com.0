Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A561D6D5ECA
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 13:16:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BDCFC6A614;
	Tue,  4 Apr 2023 11:16:15 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58CE2C6A612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 11:16:13 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id eh3so129008356edb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 04:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680606973;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a93jlFBEn37wnN+TcvU+K1AUTd72n1q82Rp2YlCTV3Q=;
 b=UyIkfrOmB7rJCwWoTVRwQQD9qhL2RcE3FbLY5o+pvNKiqfTCRdmL+TaH24hsQTY+ic
 /KodZsrgfNJPO93oHf67gUhdgVUgngVo1d/CxmFL4gU8qGrmHmcXfNtxCmkoESC7oU4H
 xVRn2djQO0j39P1cxFDg/84Ef4keE0k/wYGBgDm39dTMyYDywBQ7CZwLW3tYQpzmf9en
 yzJBz53R7NLVRYZN0nUvYPtv8HufFKZ1q+CcU/XYS/94AVd8BdW87AWvSyQJYmEisaat
 mKHEYQ0ytW8SuPd6GQOlgZ+GnQX/viQ6V/e83g9YIbapJakUswthgweaQ2og+JRWrT0X
 GaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680606973;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a93jlFBEn37wnN+TcvU+K1AUTd72n1q82Rp2YlCTV3Q=;
 b=clRODBAlYRmMaBhJ0kBpmZyGvBSnNQxD3plCVpLu972kUOKXCBt82ePf/NKHk8ZuHM
 qJJ3D3MdHNRUncYg4eYEncKxmRq/iLxd+myI8U1YLqN0LIQXGTJKiiZH+gGYtXchUL+W
 QUhFXB6fKdPv6ExcDn9XQhtZpefxzxBEHaNwAlHzEqQhlkLqXbU9FyHiYqfYmec8jJBo
 ycpuhH6FDc2mNwetgQ0k5dAYTeXVs4oso1v8EUzrJGd3dJ5EO/C29OWjsLRkx1L29hRz
 S1Ne2zz1PV8qxwWqrocAMt75CVabIY8bsXlKtFwxSRohQKMFwOwZtMBEhl2tY51K7l6t
 FmSw==
X-Gm-Message-State: AAQBX9f0s1kAbMHImiBxmLoqExC185MDB+dBpsTGd6y511eY5qeRra+6
 G/8vRdc1/qDozbTYNQEJ2qU=
X-Google-Smtp-Source: AKy350YX2rjJgE8ohoVGUGgdqkT4aMdrcxdH+2xwiWoRgZ0Iqukk70bnmVt/ZEgV6aKvJBaBqME0gg==
X-Received: by 2002:a17:907:170a:b0:8dd:5710:a017 with SMTP id
 le10-20020a170907170a00b008dd5710a017mr1740550ejc.4.1680606972817; 
 Tue, 04 Apr 2023 04:16:12 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a170906825800b008bc8ad41646sm5815788ejx.157.2023.04.04.04.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 04:16:12 -0700 (PDT)
Date: Tue, 4 Apr 2023 13:16:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZCwG-iyu43vKoFGu@orome>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-12-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230402143025.2524443-12-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-tegra@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 11/11] net: stmmac: dwmac-tegra:
 Convert to platform remove callback returning void
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
Content-Type: multipart/mixed; boundary="===============5709407856313763451=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5709407856313763451==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OpE5E+f+NrCfJbvo"
Content-Disposition: inline


--OpE5E+f+NrCfJbvo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 02, 2023 at 04:30:25PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--OpE5E+f+NrCfJbvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQsBvoACgkQ3SOs138+
s6EduRAAv3uNT9SNrysZJ44HOk63A5CQb1xTEVAacJguS9BsNgRfH79RGsaT9jWp
axQPQQcoyqH9pSmJLUdXyknDjQ0V2fLjCm7FlMTpPn+WGarF6FEBy2F/0Q7B30d/
LIb1zYnuwNfW6rCWzZo/cTK/Neck8+zC7TQRbAg5PMrNGZadZf/wEpg+tBY4lL+X
Dcrs4n+fD89x1VSEynqBIg3AyMFGsh1iWNQ9Icn7Hi9PUe2PiyUJmqmEPEwp6xEu
qD3AwrN0jX+exBIn4BxojVms2alChLZvTDVzxWM2l217ANgALCWf/MQlBcGhuPpl
j3wqdKpbRUcrg/B0BeFSQ1Fy2rrOnUbnexngxHsqG4voE6BZrXTicUjPH4pzOp7d
KvEtXVVMmo5n3mXMI8PBUsJl3k3YQnMEo+Bu1JHf9q8EYrOmDLXkkopP/BmTXrN3
WswMR7BcGyC1rkMJ6pmnAp0qvEd8E5BK5NM6I6npvs0qaqw6rzYLNylMQkAwLpgK
lVNsi8Gl/XSFtJwADUurLKiZCy/nkNXWh7O080/EZlKPkhEnvWemUndATh29ClmP
DI7BbFaLtnb73mTtfuBozbIiFsZMnu4KfCls72hS1zYrFJ9FahXTSE6ny1InV86T
UMNUYLR2MpLbYdqCJ07gm/3no/ErA/L4IRmzAWPMOLPu2gg869U=
=/3Yh
-----END PGP SIGNATURE-----

--OpE5E+f+NrCfJbvo--

--===============5709407856313763451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5709407856313763451==--
