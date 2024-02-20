Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3385BEC1
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 15:28:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BD6BC69067;
	Tue, 20 Feb 2024 14:28:43 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DFC8C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 14:28:42 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a3e550ef31cso277127866b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708439321; x=1709044121;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vz5RzTNhpTPMTVMz3nxEsmiIaAzAhCmMLP53qUjHq3g=;
 b=DXO0q5pdac/DWmdfJqY031BXRhROwW1X4UubgG2Uzeyhq4Uwi++aXcN31qQLJjspTX
 gBXmWYmn5jwCNxFL36jQtL6282thTsPYXCT5FTPgG9Smxk3az90cuTzlyvjqPNAIQ2Wy
 bHpER25MbiR8HeIHrUelPAqH3nBAyn0JkfP532OszSyMOBtzxiBzAGTrxmI7ySfp8pRT
 SnorLt2QKLUBfYnEK1NB9y7aA636AKuFBqJDpwLzzfKkQEKiWaxDGeOB62mrnpWyckKL
 HN5Ghkc8BgboN9NXuB9rZLFNdm+vuZEbEqpYN0YgrQpeM2k5cWhAcjKrzX8UpX5wcD67
 5h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708439321; x=1709044121;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vz5RzTNhpTPMTVMz3nxEsmiIaAzAhCmMLP53qUjHq3g=;
 b=KZ+l6ocIyi8BOiC5UY5X5gmEna5FOOabwHdRB+at9tSiHBxH5QAoO2ixNZAyojLwwh
 KffN2l6dblZfrVWEi/h2Iiod+jOe8LqvFS0/F3/bj9BUMEQS6Fgro0KmZPEAHO6p2gAV
 +tQAa7BUegG2n004Z9M6PTyynp8CmHEgBtxbPFwW3CiUPtQBvF5N1WoQ0YQaQos0OmJB
 lG2eP7k/xzjhWC858pGoky7MKAsvuYNtqXWRBqFxPOhK5Q1+EVTDXTIXl3Yku5ZlY2rW
 R0O2+e35falw1aFRoLLW55O2bK5k2raa2nyuI9SfexCzL+606CrOs9oXipqXsk7bY1ht
 Ye9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhYlEJ6kxtBuJ2vrH5MpAHyJ3kWXee8ChXJMMZV878QNrNe7suyrAzIIFB3cP/HRH/TN29SlB8a3L9Em6R5U6EaxYaiw3XSf7tECuZ/owE3BXWMCV7GrSE
X-Gm-Message-State: AOJu0Yy3sg1acUghcgiVg/5xDHwSzMMV/CVBzb57Wgu+WbZUJf2Cut9v
 9idjI8peyQsKHLbl9oQeWE0pIoT5m6LeI6T+jXDSbdP8AVztG5w1
X-Google-Smtp-Source: AGHT+IFqSZIGLTjK5nMNqJ0mC/A+H31d6ZqUqt7xA4Zv5XlbR7MTAcjYaOiWvzrP3SvxWDabVUin/A==
X-Received: by 2002:a17:906:b0c:b0:a3e:5b7f:6d31 with SMTP id
 u12-20020a1709060b0c00b00a3e5b7f6d31mr4677754ejg.5.1708439320970; 
 Tue, 20 Feb 2024 06:28:40 -0800 (PST)
Received: from localhost
 (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 vi10-20020a170907d40a00b00a3e7713dcbesm2523386ejc.39.2024.02.20.06.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 06:28:40 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 20 Feb 2024 15:28:39 +0100
Message-Id: <CZ9Z70HO2C7J.398BRNM8NBIG1@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Serge Semin" <fancer.lancer@gmail.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240219-stmmac-axi-config-v3-0-fca7f046e6ee@nvidia.com>
 <20240219-stmmac-axi-config-v3-3-fca7f046e6ee@nvidia.com>
 <xne2i6jwqaptsrd2hjdahxbscysgtj7iabqendyjb75fnrjc5z@js7n7qngtzym>
In-Reply-To: <xne2i6jwqaptsrd2hjdahxbscysgtj7iabqendyjb75fnrjc5z@js7n7qngtzym>
Cc: Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-tegra@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Configure
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
Content-Type: multipart/mixed; boundary="===============4290464016755656984=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4290464016755656984==
Content-Type: multipart/signed;
 boundary=54d881cc30ca662a73cfdacbec92cecca394f1f83ef4012a7b29e0247a47;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--54d881cc30ca662a73cfdacbec92cecca394f1f83ef4012a7b29e0247a47
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 19, 2024 at 7:32 PM CET, Serge Semin wrote:
> On Mon, Feb 19, 2024 at 05:46:06PM +0100, Thierry Reding wrote:
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
> Let's get back to the v2 discussion:
>
> On Mon Feb 5, 2024 at 1:44 AM CET, Serge Semin wrote:
> > The entire series can be converted to just a few lines of change:
> >     plat =3D devm_stmmac_probe_config_dt(pdev, res.mac);
> >     if (IS_ERR(plat)) {
> >             err =3D PTR_ERR(plat);
> >             goto disable_clks;
> >     }
> > +
> > +   if (IS_ERR_OR_NULL(plat->axi)) {
> > +           plat->axi =3D devm_kzalloc(&pdev->dev, sizeof(*axi), GFP_KE=
RNEL);
> > +           if (!plat->axi) {
> > +                   ret =3D -ENOMEM;
> > +                   goto disable_clks;
> > +           }
> > +   } /* else memset plat->axi with zeros if you wish */
> > +
> > +   plat->axi->axi_wr_osr_lmt =3D 63;
> > +   plat->axi->axi_rd_osr_lmt =3D 63;
> > +   plat->axi->axi_blen[0] =3D 256;
> > =20
> >     plat->has_xgmac =3D 1;
> >     plat->flags |=3D STMMAC_FLAG_TSO_EN;
> >     plat->pmt =3D 1;
> >
> > Please don't overcomplicate the already overcomplicated driver with a
> > functionality which can be reached by the default one. In this case
> > the easiest way is to let the generic code work and then
> > override/replace/fix/etc the retrieved values. Thus there won't be
> > need in adding the redundant functionality and keep the generic
> > DT-platform code a bit simpler to read.
>
> You responded with:
>
> On Tue, Feb 13, 2024 at 04:51:34PM +0100, Thierry Reding wrote:
> > I'm not sure I understand how this is overcomplicating things. The code
> > is pretty much unchanged, except that the AXI configuration can now hav=
e
> > driver-specified defaults before the DT is parsed. Perhaps I need to ad=
d
> > comments to make that a bit clearer?
> >=20
> > While your version is certainly simpler it has the drawback that it no
> > longer allows the platform defaults to be overridden in device tree. I
> > would prefer if the defaults can be derived from the compatible string
> > but if need be for those defaults to still be overridable from device
> > tree.
>
> Currently available functionality is easier to read and understand: by
> default the data is retrieved from the DT, if no AXI DT-node found you
> can allocate/create your own AXI-configs, if there is AXI DT-node you
> can fix it up in whatever way your wish. Thus the default behavior is
> straightforward. You on the contrary suggest to add an additional
> field to the resources structure which would need to be merged in with
> the data retrieved from DT. It makes the stmmac_axi_setup() method and
> the entire logic more complex and thus harder to comprehend.

I suppose that's subjective. Being able to let the driver provide
defaults that can then be overridden by values from DT doesn't seem like
a very exotic (or complicated) feature to me. We do that elsewhere all
the time. Do the comments that I added in this version not sufficiently
explain what's going on?

> The driver is already overwhelmed with flags and private/platform data
> fixing the code here and there (see plat_stmmacenet_data, it's a
> madness). So please justify in more details why do you need one more
> complexity added instead of:
> 1. overriding the AXI-configs retrieved from DT,

Again, overriding the AXI configs read from DT doesn't keep the current
default behaviour of DT being the final authority. That's a policy that
should remain intact. This patch (series) is about allowing the driver
to override the AXI defaults with something that's sensible based on
the compatible string. The current defaults, for example, cause the GBE
on Tegra devices to run at around 100 Mbps even on a 1 Gbps link.

> 2. updating DT on your platform

That's one possibility and was in fact the first variant I used, but it
has a few drawbacks. For example, it means that I need to create the AXI
node just to make the device functional, but if possible it's better to
derive all necessary information from the compatible string. Having this
in a separate AXI configuration node is duplicating information that's
already implied by the compatible string.

Also, on Tegra we have a few instances of this device that are all
configured the same way. Since the AXI configuration node is supposed to
be a child of the Ethernet controller node, we end up having to
duplicate even more information.

Thierry

--54d881cc30ca662a73cfdacbec92cecca394f1f83ef4012a7b29e0247a47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXUtxgACgkQ3SOs138+
s6FwXw/+NI5f4NQaxXMdNTZw4i9JMgVZR8IurQ/Weei3I0HDz7t17hwB+g3eRjuk
6XhD92hL3YpUuV6Ii96Wfb0JrtL5j651COCXyaRxaGU/vRvtYJvwEmpRLKEds35H
6oARkoy40FoDUKKbnsrVT81ERAKSZgVNyAIFWM3byS4ez3R6Kp+Lf9BiRjkVlvbo
KWdb1KfGC+EOCv2WIVFZA2R4OH1H4AmOp2cJa/PWha3+FW66aj9Xdgena7wu4KiJ
R/Q+gmFK3uPG6pBO3O2+HF1SkI8ECAW73rX90qzw/3Ie0i5yPaqPo8yxmLI29AhM
mPY7vq8hGnCTKiYwvy4je86ajKD/zrjiaxCNlgl155dk3Q+2iYNgDXcFlIb0au9Q
AK6Mu8AAxrVkp14t94gpkZvb5EnUKYQO1OtZKiv+jmKXYyoaESSlmw9kvmySifJY
T6aNUw91fFA5eiRu59oHnjbz2WIt+/yLTgJyVZURT+4E8Ajvs6v4kLVvv5hGp5d7
E5gU8XQGnWcCFlDT0ojxQXV55arCHXuP85ijD+sqFJhjBAcysNBRgEHLH0lHs6/W
NmO8VFLECjL0932LLbhiZV4XrP9ou4wSP4Hz576nGLMlJRmNAlOepaOO8XYFyOuc
J/afiFERL2IogN5FYu075zt3Tg2/4jXPJMOJE1BQMPNwPAirrbo=
=1yTl
-----END PGP SIGNATURE-----

--54d881cc30ca662a73cfdacbec92cecca394f1f83ef4012a7b29e0247a47--

--===============4290464016755656984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4290464016755656984==--
