Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6099885351D
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 16:51:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B2BCC6C83D;
	Tue, 13 Feb 2024 15:51:39 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32E78C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 15:51:37 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-511976c126dso1257923e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 07:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707839496; x=1708444296;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j5nluc7rACTm9e7KyTW8p7QXPYnj/OIsgMqpSFU5hoo=;
 b=EdIV1ltmlUo33wLe1dBEYODg6gULtYYvekIgXOg7BGHrCRmXn6AFM7EBhIP8xj2ubG
 SuOylBrkqTKSl8iMygq/UhuWepxK6YtCAOOJr36kjHzrSPBxUrZPFi5J4+bmSIY4enSj
 /kBt3tsT1WdcHxCOuOL0j3FTGAlkg8lmVEHC6Y7zxwNQJ1T0e6nRJJmOJ6Ag5yMEcmhR
 OxehB6v6flvlrWq3R0bwfTA0ry5W8PQ6ICUhHqkzJYnmZD0ZtsmuaHgUuXCATHcRGwRc
 +kAEKcSxHbuMtqZiwN2suug3Sgk9UizTx/0JxjJ8Te2zf9ejXedrHzMESQVXIXADj7uH
 Tnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707839496; x=1708444296;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j5nluc7rACTm9e7KyTW8p7QXPYnj/OIsgMqpSFU5hoo=;
 b=PA8NjLtTIsUgz63fQYH/qDnC3eufzLDP+HgInUHFuryQ2AwsDxe7PxHq7QldLMHKgG
 4XvR21cnKJZAHmlEEv3BA7dzYKoP9Xew44Q/QO/y/vmDP9Czar0FiONkJYX47UXQBVKY
 lPP/+jZruEvij7uLeGpIVPq8lt0yhZ5dqKBh220WUqEs/OGwfc4RF+fa12a/ji1pTKqb
 pGbXZFJ4sTe4XCD1+xMe17XRdqr6WeAvfGaRpMEiFcP5bz7S1LKJwaVOQQ20QbHpTgIg
 2IBpEnIwr6WEVCtr3hb5A2ikKVQ2apRDV6XGveBU78Mc3Fxk5NdUjVX+SCL9/X/GH7PG
 Qs3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe4i8Nz2tw+xs42VQRuB0ILoD4CSt6xwm+TS/V153MJYqjcCWPUxMFx2BE713YhpvLiTCo9x/zuImg0sU+2roNhgfo2aF247WIlFUe017M0OyvxcdSrW9S
X-Gm-Message-State: AOJu0YwP3T9Gd1sqJ+wqafT5yPH0IArzVsVnUsxhfhnoi1e+GKgLK6N+
 lKbWab2/ugb23n7nrW7BmZjfIiKPS/v1EvXKyyfQcd74bPGLNt3a
X-Google-Smtp-Source: AGHT+IFWyZC7z5UQHaeXsMQIqqpgCO/rfzao3TGvlmhOSjICYP0D1kLKY44LrpKKMyl7qF3fXdcQ5g==
X-Received: by 2002:ac2:46e8:0:b0:511:933c:64e9 with SMTP id
 q8-20020ac246e8000000b00511933c64e9mr3107277lfo.66.1707839495973; 
 Tue, 13 Feb 2024 07:51:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2oInC5bB4kgCVw92bLjNBtS/DiMGH11yOilf5sZB3nJEhEzIMK5ObuBiemAzgrxXQX8ldO48VfVkhateEJLgxBjOgRw3/1c9D2hGGO2lCiTP0aW3iNECsttorD1dAiznuZW7O2OZobKuTBU7TA9GpwAukumir45Z3wotrHqqaMMuR750vPkB2xqcbdGumM7g0+WGghRHEZ86kchEnZCpgAI6jL36/qJPKt31Sgvh6eMudbWOzXSQO77YTV0FGdO7UGroFpmATuEsw1e7peKIdnUYlcHhRTzzMseThuiHpwYdhj/puLf5fS41Qy+ibjOMztsyACOtBSoqsTqfBjRe5QQD8nFbGqSuJbC7fvc/q+6TUTD6/A6h5afFEuBWI+xlyZ1GDxh0lu+3Y3me6XBTgU8yJits=
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ig12-20020a056402458c00b0056213094d7bsm140732edb.69.2024.02.13.07.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:51:35 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 13 Feb 2024 16:51:34 +0100
Message-Id: <CZ42KOP6ECUC.EEIHWA147NV9@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Serge Semin" <fancer.lancer@gmail.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
 <20240202-stmmac-axi-config-v2-3-64eab2bab17b@nvidia.com>
 <uzzzxx3mv6yoslijhhzdzyossvcvi52jgbulza54uqh2wrm5kd@ddd5o56b2dhu>
In-Reply-To: <uzzzxx3mv6yoslijhhzdzyossvcvi52jgbulza54uqh2wrm5kd@ddd5o56b2dhu>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-tegra@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Configure
 AXI on Tegra234 MGBE
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
Content-Type: multipart/mixed; boundary="===============2821778488545421035=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2821778488545421035==
Content-Type: multipart/signed;
 boundary=cfa596c0b51d52dd3aecf0f90e9ae3c845fbf778d202ed71698f391c8fdb;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--cfa596c0b51d52dd3aecf0f90e9ae3c845fbf778d202ed71698f391c8fdb
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 5, 2024 at 1:44 AM CET, Serge Semin wrote:
> On Fri, Feb 02, 2024 at 12:53:35PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Allow the device to use bursts and increase the maximum number of
> > outstanding requests to improve performance. Measurements show an
> > increase in throughput of around 5x on a 1 Gbps link.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> > index bab57d1675df..b6bfa48f279d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> > @@ -199,6 +199,12 @@ static void mgbe_uphy_lane_bringup_serdes_down(str=
uct net_device *ndev, void *mg
> >  	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> >  }
> > =20
> > +static const struct stmmac_axi tegra234_mgbe_axi =3D {
> > +	.axi_wr_osr_lmt =3D 63,
> > +	.axi_rd_osr_lmt =3D 63,
> > +	.axi_blen =3D { 256, },
> > +};
> > +
> >  static int tegra_mgbe_probe(struct platform_device *pdev)
> >  {
> >  	struct plat_stmmacenet_data *plat;
> > @@ -284,6 +290,9 @@ static int tegra_mgbe_probe(struct platform_device =
*pdev)
> >  	if (err < 0)
> >  		goto disable_clks;
> > =20
> > +	/* setup default AXI configuration */
> > +	res.axi =3D &tegra234_mgbe_axi;
> > +
> >  	plat =3D devm_stmmac_probe_config_dt(pdev, &res);
> >  	if (IS_ERR(plat)) {
> >  		err =3D PTR_ERR(plat);
>
> The entire series can be converted to just a few lines of change:

Sorry for the delay, I missed this reply.

>  	plat =3D devm_stmmac_probe_config_dt(pdev, res.mac);
>  	if (IS_ERR(plat)) {
>  		err =3D PTR_ERR(plat);
>  		goto disable_clks;
>  	}
> +
> +	if (IS_ERR_OR_NULL(plat->axi)) {
> +		plat->axi =3D devm_kzalloc(&pdev->dev, sizeof(*axi), GFP_KERNEL);
> +		if (!plat->axi) {
> +			ret =3D -ENOMEM;
> +			goto disable_clks;
> +		}
> +	} /* else memset plat->axi with zeros if you wish */
> +
> +	plat->axi->axi_wr_osr_lmt =3D 63;
> +	plat->axi->axi_rd_osr_lmt =3D 63;
> +	plat->axi->axi_blen[0] =3D 256;
> =20
>  	plat->has_xgmac =3D 1;
>  	plat->flags |=3D STMMAC_FLAG_TSO_EN;
>  	plat->pmt =3D 1;
>
> Please don't overcomplicate the already overcomplicated driver with a
> functionality which can be reached by the default one. In this case
> the easiest way is to let the generic code work and then
> override/replace/fix/etc the retrieved values. Thus there won't be
> need in adding the redundant functionality and keep the generic
> DT-platform code a bit simpler to read.

I'm not sure I understand how this is overcomplicating things. The code
is pretty much unchanged, except that the AXI configuration can now have
driver-specified defaults before the DT is parsed. Perhaps I need to add
comments to make that a bit clearer?

While your version is certainly simpler it has the drawback that it no
longer allows the platform defaults to be overridden in device tree. I
would prefer if the defaults can be derived from the compatible string
but if need be for those defaults to still be overridable from device
tree.

Thierry

--cfa596c0b51d52dd3aecf0f90e9ae3c845fbf778d202ed71698f391c8fdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXLkAcACgkQ3SOs138+
s6HY6g//TyBX07vSPy79ApF01cK74bhK4woNCTlScH1jk/Pky8il9Yw+GrXfnnEk
9d6LiXfIWLHIvPLS4xcvwM0dT/FTTdDjgS41G2X0p06Bn7BGTHVJ+xuPjKh6yRuv
mVbYhtqUJynPHkT9R3OIBKZ6E3nTNGPp8ocpAe82uN6Opl1QI4BRJ8syKYciUcHj
REtkb1HZBXlxYhnWlFCHEsyD+mNdnZ1Z1mD50lauYCdkjhu/GnL8Czt1ScCy8q/s
URZ/Ft5r+6M8aBVyfRfR+r9XalZiRtxksOL2Ova79dlistCGl8S2NNWw7M3vxHPO
HvfhWMHyf0ywdQXoYEhTW/pt98X+fJPtIhnCfSrdOac58+WRSCiKekarM2WkS4ma
lUm4Azh/xK5z4zexVXB6j5Szgb9Hz/u3twxKvnNxu/frAJL7WesujOUy2RR+g2CM
KI3xDH9t2yuWE45vhv2MGAuPEeAtVmG5R2OxV7duuCXHCsY7njs6bZLyT1nX6eC1
ON9D4tsIj6TGo51UPokLNU04KzDB/D2xEqzqeV1GUuEXe/CsJIey76JpFT0UvJry
D1/UtEp+lAczY85TRiILc6z+NqSCq4p3kEqi+txrfr806bkHfBmRz/ZxlZbgrYPZ
ijRgUxzyXZxcL0ci0o8g+YFcoXfTJhD5cTt8NvBoolThfwHM/aY=
=vhC9
-----END PGP SIGNATURE-----

--cfa596c0b51d52dd3aecf0f90e9ae3c845fbf778d202ed71698f391c8fdb--

--===============2821778488545421035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2821778488545421035==--
