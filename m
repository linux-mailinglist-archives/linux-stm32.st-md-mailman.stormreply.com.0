Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F81EA1D6CF
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2025 14:29:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57FDDC71289;
	Mon, 27 Jan 2025 13:29:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C24BC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 13:29:01 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso50989225e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 05:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737984541; x=1738589341;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FvzYFhX8SUBJyGpqjsoQ6jIbjkQaAtJdp897xoVPh9M=;
 b=fbak6x2Z2j/6N3rg9uc8MshkYcLVRrYxR1EIbG3lsqXfFl03qKS5b4yH3ylKWccMVW
 hPy1ywFXEANdJvvsEuYOx7Wyq0t4bfU4z62iXjUAJ4K6LdS+CEoRV0qwq3OR8cRuKSnW
 AvD+gGZTVNxYbdkOEe8dmYAxwQLGLb+5O4lStfrBmbfImRZO11VmfSldNpHzos5/41el
 GvlTzk/cwFBXfYmvE9zNSiNDXurufjlr8oB2wGJUzGJ4uZN2oFv2aKItQLk4VNL1+rK7
 TqQgKNMO21egF3urJcG8k+BAUYA391e0c2YafG7nYGDA/oEd9ntqlx8ozkLu2xLsy6wr
 NFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737984541; x=1738589341;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvzYFhX8SUBJyGpqjsoQ6jIbjkQaAtJdp897xoVPh9M=;
 b=LTofl+OF0SJG1JUmbdXBlTWV18F44dVXzt+eimFMXVEpCYGiQwXrSWq6q3VJgaKIg7
 ML+DEU7E7LEeX7ZpSjsje4hPK5SE0U0utrvdOORXV/SW7Uy8nFCKyud2tgmdLtEu2hEL
 U9MPW0QeX5kwPgSa4fIS6lmaIWULJWRep1Kllvo7BYPsSXwLM+jL1SVNg2oo/hq3foF2
 0RYT11LQiqWLzwlTPxKIFEUDvkk7IfRoQZLmnmvJnYOHO+H7P6iotj8fgilU2KzkDHDo
 qy/Y4f6j7y3gKhlFxSwAjPiMdTAaujDv6F/Oxbh+oC2y6ZmvnKo4Xm3KMb3UDJpDWloE
 UE4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM1khUlLk9WU23NjKWanDh0bPpOht5+JBlw/sSjdlfjQsuN/yTxlHr7xwQmHzP+TIIzwx2CL8VF3p2Sg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyMZ603Wa7COebg02R849eoypfyvr5dVGfbkBySOOGW0K2txnaF
 5on3gatIFN0KXS3dAb2DjHCQEbvgtoGqdwlxZAm+pBvoC4gpwF3e
X-Gm-Gg: ASbGnctlpeo165TI3rewHoX7zKW3iS8CjBkGrVSdKzc1EV/Pn/GxVAKBXHmcMXhobnI
 oazkguj6lNhY0iY4dpKEclY3G18lNfkVAm5lKBHWqTQc+yKxUjoh1OrO/3rLXODJ3Goa+zKz3q3
 U4aQB3sDAZlJQlaeiw9xUwe2nGyN0WBAW4NbLTV9MHt9tYhXscFL/Qx6c/Xmkp6Dg/fHG/xqrX5
 CAceBnMdZmF6ayX1eQbygU17oFeVspFnYvtcHgc4xiEKqK9/+yUUBP4rJWChGvdo4mnqCrRR7QK
 GanUcafEMeC8v/8ppjpIq8oEsDkoc9Cc4MvFJZtGzzJcEMB1TYBrdCwWb0WJ19l1k/Q=
X-Google-Smtp-Source: AGHT+IFdDa7a3oSeFSq3XdbGtmA71EbKMopM7KAl71p/Rr59XXaBfgDYSq3pBLs5ZQTyA8iqtGNjYg==
X-Received: by 2002:adf:ef04:0:b0:385:f23a:2fe1 with SMTP id
 ffacd0b85a97d-38bf566f7c9mr25956570f8f.26.1737984540632; 
 Mon, 27 Jan 2025 05:29:00 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d7a7sm11357596f8f.32.2025.01.27.05.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:28:58 -0800 (PST)
Date: Mon, 27 Jan 2025 14:28:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <kyskevcr5wru66s4l6p4rhx3lynshak3y2wxjfjafup3cbneca@7xpcfg5dljb2>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
 <20250125230347.0000187b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250125230347.0000187b@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, Ido Schimmel <idosch@idosch.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Brad Griffis <bgriffis@nvidia.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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
Content-Type: multipart/mixed; boundary="===============7328975105308613968=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7328975105308613968==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="le5bosxlscibz3la"
Content-Disposition: inline


--le5bosxlscibz3la
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
MIME-Version: 1.0

On Sat, Jan 25, 2025 at 11:03:47PM +0800, Furong Xu wrote:
> Hi Thierry
>=20
> On Sat, 25 Jan 2025 12:20:38 +0200, Ido Schimmel wrote:
>=20
> > On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> > > On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch>
> > > wrote:=20
> > > > > Just to clarify, the patch that you had us try was not intended
> > > > > as an actual fix, correct? It was only for diagnostic purposes,
> > > > > i.e. to see if there is some kind of cache coherence issue,
> > > > > which seems to be the case?  So perhaps the only fix needed is
> > > > > to add dma-coherent to our device tree?   =20
> > > >=20
> > > > That sounds quite error prone. How many other DT blobs are
> > > > missing the property? If the memory should be coherent, i would
> > > > expect the driver to allocate coherent memory. Or the driver
> > > > needs to handle non-coherent memory and add the necessary
> > > > flush/invalidates etc. =20
> > >=20
> > > stmmac driver does the necessary cache flush/invalidates to
> > > maintain cache lines explicitly. =20
> >=20
> > Given the problem happens when the kernel performs syncing, is it
> > possible that there is a problem with how the syncing is performed?
> >=20
> > I am not familiar with this driver, but it seems to allocate multiple
> > buffers per packet when split header is enabled and these buffers are
> > allocated from the same page pool (see stmmac_init_rx_buffers()).
> > Despite that, the driver is creating the page pool with a non-zero
> > offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
> > headroom, which is only present in the head buffer.
> >=20
> > I asked Thierry to test the following patch [1] and initial testing
> > seems OK. He also confirmed that "SPH feature enabled" shows up in the
> > kernel log.
>=20
> It is recommended to disable the "SPH feature" by default unless some
> certain cases depend on it. Like Ido said, two large buffers being
> allocated from the same page pool for each packet, this is a huge waste
> of memory, and brings performance drops for most of general cases.
>=20
> Our downstream driver and two mainline drivers disable SPH by default:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/=
drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c#n357
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/=
drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c#n471

Okay, that's something we can look into changing. What would be an
example of a use-case depending on SPH? Also, isn't this something
that should be a policy that users can configure?

Irrespective of that we should fix the problems we are seeing with
SPH enabled.

Thierry

--le5bosxlscibz3la
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeXihUACgkQ3SOs138+
s6FoPhAAqxOsjlx6etEbkgUZAt/RbOShSCthQYEh+Lc+Fk856UbSJeQ3h2jIDUKE
LeAtoppjWnoZbrJGesP99QLBsq5R1ouYiacktzWwyp9PciXmWivAxAmdUZ5kqXsC
Y/OrrsL7PLxMlhij/qY+pMBH1UiTfuLLftMNxYAY/3w5QIAt1hfFIlA0qEb2B+ZN
C9Ir1Ma1TRKSosngX/WNlEacT9jh4mpx7zk8IcD5LEur3mEIWcGrF82zhUf+3Xi0
92sBCxHz4ydKwXTOtFZDm8EiBo43Xo9R14OTaOR9Q8Odv3Hz0ywEuMDjt4NzryXd
bm014ztiC52fmSkDCIy3TM42q3NNBVlDUJDqYZjc/9S+MBhPNyyug8WKsnz6QWiV
4DPxCw/mrKYZNOjQnUOGx/WTpkQY8lSs4LGNusP2Fg+FUcqbfnODBO6nRFOUSI4z
dI1Bn34IjnEIM+zddlYP8Q+JNbcVK3JUWF93lVX2YdJGmELCNEGMrt5TDxMOJSNm
AFTJdmNRUvGf6hM7xhqOZXABWY6/qKQhR3UaKWavOJMc5kG6gQbxsIHpHE6zWRig
jFEnol2StQW1PAm2fCdlrBdFADFzgrkfsvbIv9r/XegXU/vTIQXmLm5U4O8DJ58Q
y4HTY/66dTEmd//qV+a3jonm88YEvcXIXiaJBFvchrJflKFtHYY=
=dCSI
-----END PGP SIGNATURE-----

--le5bosxlscibz3la--

--===============7328975105308613968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7328975105308613968==--
