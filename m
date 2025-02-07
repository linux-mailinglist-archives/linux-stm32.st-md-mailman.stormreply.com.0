Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2802A2C917
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 17:42:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F5F5C78025;
	Fri,  7 Feb 2025 16:42:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF0FBC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 16:42:15 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so28020565e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Feb 2025 08:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738946535; x=1739551335;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FiPV/oHe7RmZIp/M852C28biSFhSs4bIOllT1QoCRG4=;
 b=HQ8V+S92BekfL72HHUPKM8LjlPocKBeU9kZlS8QMgTer/ZNGuI9lhG8i3uQzufffMK
 RFzyzAdZjCTSXpBH2LUQ/yoRCHgxAQz1OJjOnmKFB3sSMr0CskwsZs2UQYiXkfarlU10
 oBBuebex8c24dXZcaUu0sXRUXVGds4gtktbWgakcy7bN5dN0WE4fV2nyI1rxbPqRsmFM
 dpVGoc+ILJNPbuFLD13obxBMiUmBjWLwrEg93Id1QufGHm9cBPpCnbfByfJw/Uez/SRT
 TIUXbDcCzaWy+QFNGNQPYph94MGhAVS5r+LNRszJe6rBoajmu3hcfP0IObmGjEB4C+au
 TjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738946535; x=1739551335;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FiPV/oHe7RmZIp/M852C28biSFhSs4bIOllT1QoCRG4=;
 b=EeAg7oQvxalU6q++MdoSctHxjwgeUoRfh/+wlrIeMDjG+DXJ2ds1MWJEcU6OnBObOZ
 PpXZJfqsldvRrV3CuczwTdK/939xZl4IzK+rZ78UFPL6I21rDv7YaBerQib0Xdvm+cwh
 tiilv8d5zd5nRrqK74uuvZg1V9nLYbBl3t3jZjLYjyQw6cu2zXyMp/vw5qfsvX4DFCBW
 EHfMB1vVjgMnKv0RBQF/A4E+Kcgp2fAxzXAlIw/wdnk87Du/r4WAU6oA2okeC3X+X+12
 6yDbL2BEfn4cM/xpe+HzUmtWeqemkKhSpvlkdbsOWMDkNsM3vMviLIMgfMkEBkO1cdOG
 DoHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIo2shid24so5Lw+Bn6H180xxRK1HKd33AEGc3J8o0zm1o6zqlxRG11lGypVeh0zB24+atL7LDztTfug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxZ+tmUK7zoDAJKJgqDkrdqDrCRWxXzWsdr7iY69wCX45Vpo9dL
 1OVABAI6P+g0cUBWp4lmyRzNszzFNB8HqWCdKHmIkCT10DR0Rjrg
X-Gm-Gg: ASbGncuPEKovC/a12kKD1cNs+RLzMOhNlWLX4AXuFNflYHoGgTZEfzN8JCC3l3DbZGk
 +Q9b2LknOuUr0eyfJvzkRbdWzzYiCs/s043GNEtePxED3oYQUBnnt/M7x5T/X8p3OaFsnA1n6E6
 obFMWEU/KpHfUA0AF7dPikerhTtict0+U282VggGuMVL52kGCSUNIQ2zRw5AzaLep6thj+1FzGg
 ZIYpyEwZB4dAD0FuMlhSML0BxFvM1xrejPIKDM0jARJX7lut1yvtZD3UXuQT3QfeVAk4w9qVmXi
 WP9TKnFmpmbTY6KoG4t+ruRUgM4oEWUWESGCkVfeCPCWrksu+rCdtm7H0Qdlohjp8p7gViYp69m
 1aA==
X-Google-Smtp-Source: AGHT+IF7y5ag5xXtJbBXF9RYFf/lu5m+MBmyeyrGK4CKk4esPPFHu01PFcCg+qkitoVRNQ1xblHDPw==
X-Received: by 2002:a05:6000:1863:b0:38d:d0e7:7d5c with SMTP id
 ffacd0b85a97d-38dd0e77fc3mr943984f8f.23.1738946534954; 
 Fri, 07 Feb 2025 08:42:14 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390db11264sm94032655e9.35.2025.02.07.08.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 08:42:13 -0800 (PST)
Date: Fri, 7 Feb 2025 17:42:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <heg3exbrmo4zt64cdeolououo25lj2idusepuyuu7iggxgn5fe@6bky6h5pe3tu>
References: <20250207085639.13580-1-0x1207@gmail.com>
 <8fc7c79d-ace8-4e05-acef-1699ee6c4158@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <8fc7c79d-ace8-4e05-acef-1699ee6c4158@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brad Griffis <bgriffis@nvidia.com>,
 Furong Xu <0x1207@gmail.com>, Ido Schimmel <idosch@idosch.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Apply new page pool
 parameters when SPH is enabled
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
Content-Type: multipart/mixed; boundary="===============3026228121389088204=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3026228121389088204==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fkugobpneo3jjh3p"
Content-Disposition: inline


--fkugobpneo3jjh3p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net v1] net: stmmac: Apply new page pool parameters when
 SPH is enabled
MIME-Version: 1.0

On Fri, Feb 07, 2025 at 01:41:49PM +0000, Jon Hunter wrote:
> Hi Furong,
>=20
> On 07/02/2025 08:56, Furong Xu wrote:
> > Commit df542f669307 ("net: stmmac: Switch to zero-copy in
> > non-XDP RX path") makes DMA write received frame into buffer at offset
> > of NET_SKB_PAD and sets page pool parameters to sync from offset of
> > NET_SKB_PAD. But when Header Payload Split is enabled, the header is
> > written at offset of NET_SKB_PAD, while the payload is written at
> > offset of zero. Uncorrect offset parameter for the payload breaks dma
> > coherence [1] since both CPU and DMA touch the page buffer from offset
> > of zero which is not handled by the page pool sync parameter.
> >=20
> > And in case the DMA cannot split the received frame, for example,
> > a large L2 frame, pp_params.max_len should grow to match the tail
> > of entire frame.
> >=20
> > [1] https://lore.kernel.org/netdev/d465f277-bac7-439f-be1d-9a47dfe2d951=
@nvidia.com/
> >=20
> > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > Reported-by: Brad Griffis <bgriffis@nvidia.com>
> > Suggested-by: Ido Schimmel <idosch@idosch.org>
> > Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX pa=
th")
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index b34ebb916b89..c0ae7db96f46 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -2094,6 +2094,11 @@ static int __alloc_dma_rx_desc_resources(struct =
stmmac_priv *priv,
> >   	pp_params.offset =3D stmmac_rx_offset(priv);
> >   	pp_params.max_len =3D dma_conf->dma_buf_sz;
> > +	if (priv->sph) {
> > +		pp_params.offset =3D 0;
> > +		pp_params.max_len +=3D stmmac_rx_offset(priv);
> > +	}
> > +
> >   	rx_q->page_pool =3D page_pool_create(&pp_params);
> >   	if (IS_ERR(rx_q->page_pool)) {
> >   		ret =3D PTR_ERR(rx_q->page_pool);
>=20
>=20
> Thanks for sending this. I can confirm that it fixes the issue we are see=
ing
> and so ...
>=20
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Yes, I can confirm as well. I've tested based on the discussion in the
earlier thread and had the equivalent of this patch (modulo the ->sph
check, but that's always true on this system), so:

Tested-by: Thierry Reding <treding@nvidia.com>

--fkugobpneo3jjh3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmemN+MACgkQ3SOs138+
s6Fq3A//eleSd2dC6AIYwZSlmN2xxQXFAVjTTNU/LQhRI2PSENWvFHSXJDcGTG+U
OTEIid1JgSaw+/xwshMu0F6lR1OmIeBCMudKmla/AxFUEOYF2JWkYPQgCfGalJxe
Ig9uZMsXmaxIeunEhaRQhYiBU0F9l7+IKe5yr8sFnUNrI1UJUQ23aJqAnCxJmtW7
3w/KbNMMii2TygqUrDaVHaDqOe4azGVzAGNYSd1g1iNpVYiORO8t6VHpiUBtJfme
k3ryZ+ptRKVTJX6pdiUYtjfTlSOW9ncvlgwyD8OGGaLG1RsoOWBiVTdGm13XDbm2
tDEY4ggUyPYUmphjKNsCjivZ9vqeMWoQ35MDCR3/pI6j/RVDkNSQmEH55qLyW4WD
67s3SF4eoDiAQAzzZ1C9vp96I2bm10J/NX2flJ036cw+2SXAl2rprzDrARhTupC9
uKTCXlV7vep2zRRDIljBxZDE90WTUL4fj/u9cKDXjRkkYrf5inVJuMM9zTO56HGn
hyYqmUhDklG4jLYmEp/g2H9pberttT7RCVo6UeI/P+Ms9B5Xszf+tiIzGti/SrDv
pCTV4/2D/wucb7zdNeX+a2j6D1rr6CgITO5sWT7i2w/o/UcHoXQV4E/gY39V4s9O
g1NrNtk9aOd2qalUqpS56aboQSaz04QWnYNubjlbxDgT9R+f46E=
=AlgO
-----END PGP SIGNATURE-----

--fkugobpneo3jjh3p--

--===============3026228121389088204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3026228121389088204==--
