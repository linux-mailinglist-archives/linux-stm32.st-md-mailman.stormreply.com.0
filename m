Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2296A356
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 17:52:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAE26C71292;
	Tue,  3 Sep 2024 15:52:29 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AEDEC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 15:52:23 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a429so5844182a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Sep 2024 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725378742; x=1725983542;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DuEfnvjjt6m1/doYMjeYKF5Vb/dLCWma3sPSNO69eh8=;
 b=oHgYTnwa9H69QT7gqpFrDCVMMHcGMCwpmddFJPUBByKnEtQUs+h4+vvzz+tVFwnmm/
 jHB7gU8ZWyeYkr/6qAeGsP6A83xaVfovmN9P6nwwATyKAB33uDMXAYDPCjmQTvuxOtKB
 XMOxHWEOoQfoRKPrPcClH3j3XxHeTjFEmNvE9EyLRhtrI6OwTn0FaiGI84y40Fph08de
 UaePzFMUCYNIS1KegNpXRgwfD5vd8uilQ7LGCnrbKxJhJ7fdWQQ7/fGudxo8Y6EGjluE
 ADn1MWRCBoQs8xwMNkjEu5fjnRlttfT+ddQadIo2XtL8K41M1ljMmTCky/PBvQKZG11A
 Vm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725378742; x=1725983542;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DuEfnvjjt6m1/doYMjeYKF5Vb/dLCWma3sPSNO69eh8=;
 b=D58L0qsETn/X6w6BoIa10NXDZPzsJzt1vsj2CaYqXOawHnVe4eIoBfgkBtsbTZMQ/G
 1VjKbZLbUJWQHrMzklM0qi16jiLgRdD0sDWweqdlGccAao7CJ5KUAY36lViAyL2MuCcg
 0U1Kif/AkzJDwQ1TP1+Ir++NWrG991Zj5NDEMv1SjB0zrg9bkwl1LIK+LzeHrB8ZKC1A
 iO54BzkJsiESYQh3zGFzBPqcXpIALxjBwwJmZPujvKdZ+nP24DRy8Z5/fjGwf8UmcrkD
 WbRBCYjiiFmE4pXCcXa8MwFhVmgSVWAvlwfMMhjlsqd5nKrfmD/hpwwClzNqB2vCHj/G
 ee6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBwpxh3ZbDeNXpF0iKVat/B7djgSH2kDZCTAINFwSe6mhSyqmsO3cjVdGdZk6tGUJI/I2+VpRwsjrrhw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzIm9x1hHFZBAQfdafr1wMeSeLUqo0Y+C/pJ0Nw6a142PR+/yZj
 MB1V2jTDFExsknSfk5r1vUPZhze/koAViqMGQdj27HdC4xTZ7DPfuO6Try4RIvw=
X-Google-Smtp-Source: AGHT+IGX8n0w2RrQgN7NxW87zoP0ZbH3F+TZlJRkbLUatpnJln6Op8KzPk3dbNz6NHkJ9YOZ5PBNdQ==
X-Received: by 2002:a17:907:86a9:b0:a86:73cb:99ef with SMTP id
 a640c23a62f3a-a89faf0fc8dmr584529166b.39.1725378742211; 
 Tue, 03 Sep 2024 08:52:22 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb2a3sm701051566b.3.2024.09.03.08.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 08:52:21 -0700 (PDT)
Date: Tue, 3 Sep 2024 17:52:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <7mfqy5mcwxrppb25j57za7jzk6d5llexfgnngl66tle3ic32yy@63cj63tsh3xh>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-6-lizetao1@huawei.com>
 <nyfm5mxrrvfeu7s25qzjxbatvgnppq7exmca3sccmm6lz7nxan@xxsdgcrueoen>
 <0becf4e0-2f66-4c26-b0b3-59ee232eaaef@huawei.com>
MIME-Version: 1.0
In-Reply-To: <0becf4e0-2f66-4c26-b0b3-59ee232eaaef@huawei.com>
Cc: andrew@lunn.ch, heiko@sntech.de, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, radhey.shyam.pandey@amd.com,
 ajay.kathat@microchip.com, florian.fainelli@broadcom.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 yisen.zhuang@huawei.com, linux-sunxi@lists.linux.dev,
 jacky_chou@aspeedtech.com, hauke@hauke-m.de, kvalo@kernel.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 salil.mehta@huawei.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 claudiu.beznea@tuxon.dev, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 olteanv@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 05/12] net: ftgmac100: Convert
 using devm_clk_get_enabled() in ftgmac100_setup_clk()
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
Content-Type: multipart/mixed; boundary="===============8544141347462985219=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8544141347462985219==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="se74eiqu42ro53lu"
Content-Disposition: inline


--se74eiqu42ro53lu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Sep 03, 2024 at 06:46:48PM +0800, Li Zetao wrote:
> =E5=9C=A8 2024/9/3 16:09, Uwe Kleine-K=C3=B6nig =E5=86=99=E9=81=93:
> > On Sat, Aug 31, 2024 at 10:13:27AM +0800, Li Zetao wrote:
> > > Use devm_clk_get_enabled() instead of devm_clk_get() +
> > > clk_prepare_enable(), which can make the clk consistent with the devi=
ce
> > > life cycle and reduce the risk of unreleased clk resources. Since the
> > > device framework has automatically released the clk resource, there is
> > > no need to execute clk_disable_unprepare(clk) on the error path, drop
> > > the cleanup_clk label, and the original error process can return dire=
ctly.
> > >=20
> > > Signed-off-by: Li Zetao <lizetao1@huawei.com>
> > > ---
> > >   drivers/net/ethernet/faraday/ftgmac100.c | 27 ++++++---------------=
---
> > >   1 file changed, 7 insertions(+), 20 deletions(-)
> > >=20
> > > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/e=
thernet/faraday/ftgmac100.c
> > > index 4c546c3aef0f..eb57c822c5ac 100644
> > > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > > @@ -1752,13 +1752,10 @@ static int ftgmac100_setup_clk(struct ftgmac1=
00 *priv)
> > >   	struct clk *clk;
> > >   	int rc;
> > > -	clk =3D devm_clk_get(priv->dev, NULL /* MACCLK */);
> > > +	clk =3D devm_clk_get_enabled(priv->dev, NULL /* MACCLK */);
> > >   	if (IS_ERR(clk))
> > >   		return PTR_ERR(clk);
> > >   	priv->clk =3D clk;
> > > -	rc =3D clk_prepare_enable(priv->clk);
> > > -	if (rc)
> > > -		return rc;
> > >   	/* Aspeed specifies a 100MHz clock is required for up to
> > >   	 * 1000Mbit link speeds. As NCSI is limited to 100Mbit, 25MHz
> > > @@ -1767,21 +1764,17 @@ static int ftgmac100_setup_clk(struct ftgmac1=
00 *priv)
> > >   	rc =3D clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
> > >   			  FTGMAC_100MHZ);
> > >   	if (rc)
> > > -		goto cleanup_clk;
> > > +		return rc;
> > >   	/* RCLK is for RMII, typically used for NCSI. Optional because it'=
s not
> > >   	 * necessary if it's the AST2400 MAC, or the MAC is configured for
> > >   	 * RGMII, or the controller is not an ASPEED-based controller.
> > >   	 */
> > > -	priv->rclk =3D devm_clk_get_optional(priv->dev, "RCLK");
> > > -	rc =3D clk_prepare_enable(priv->rclk);
> > > -	if (!rc)
> > > -		return 0;
> > > +	priv->rclk =3D devm_clk_get_optional_enabled(priv->dev, "RCLK");
> > > +	if (IS_ERR(priv->rclk))
> > > +		return PTR_ERR(priv->rclk);
> > > -cleanup_clk:
> > > -	clk_disable_unprepare(priv->clk);
> > > -
> > > -	return rc;
> > > +	return 0;
> >=20
> > You're changing semantics here. Before your patch ftgmac100_setup_clk()
> > was left with priv->clk disabled; now you keep it enabled.
> Before my patch, ftgmac100_setup_clk() was only left with priv->clk disab=
led
> when error occurs, and was left with priv->clk enabled when no error occu=
rs
> because when enabling priv->rclk successfully, it will return 0 directly,
> and when enabling priv->rclk failed, it will disable priv->clk.
>=20
> It turns out that the code logic is a bit counter-intuitive, but the
> readability has been improved after adjustments.

Indeed. This is IMHO worth mentioning in the commit log to prevent the
next reviewer stumble over the same code construct.

Best regards
Uwe

--se74eiqu42ro53lu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbXMLEACgkQj4D7WH0S
/k5L/wf9Gs22UgHjYPS/+O96Cu4w4UcP3q7nPHpOoDSXi2BXtkrd7ABWKXFV2G9v
0DkiId7UylOmQ86aa7znTZywltkTX8AItXV6lq02kZPov3/57jw8RcpHRc694mrH
PxmFxBPFAtoh5SlzCoBzgViqv+dfxcd9r4yniENbBn1gH2j1SH/XsJRypXr8PaUy
HHvPiIhlO4ylM2U3QM3ojnUNGER5I5Oq2Ge8PYhd7B118KogrbcAlMm52+cN+Emt
M+kDaR5zXhRN/Xlknj3YnVNtzyYxfF6iNjOLSVQue1CxjbsHXwYWt+gUMwZ9U7mi
M/GMHgxWenCtKXfzEgHtrXqAzvSsNA==
=H+qA
-----END PGP SIGNATURE-----

--se74eiqu42ro53lu--

--===============8544141347462985219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8544141347462985219==--
