Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE62764835
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 09:15:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CA55C6B463;
	Thu, 27 Jul 2023 07:15:45 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 377E6C6B45C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 07:15:44 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1690442143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8m3mzI1aA9mXZdzH6s+hpaz9dxHNXMPqBJ1rzdpS2jo=;
 b=SF/iTuLcGPGtPtCRUUxAfd7TRft7VufsFPz8Dn9tTB+d/DYg5t4SDusksaNaoaouk1XFtd
 YSg62oPI/yr0Jtu1kMlgeyKYK/QSRkE4hWP/fGJRh+zB5e/W7Qzg+vzMDnsu7XDR43MAQ+
 H+a7ZLtqUCYDwPFD6lvR4IaXmb/XYdyj6TQxZXxRapk6fmw2wFmy+hdMOTkNA4qHvzDdKZ
 dO6tZ2LI1qJ/QBsJQwdw4hQZRdohZVGvT0rytHwN+DWdP1fH12BOZ9ovBl7M77TPnzDkxC
 SnNClZItl4/H0L2BP/MzKD7rhpOIjzAJ4zzCefcClDS4m8v17glRy9eGvSM7mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1690442143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8m3mzI1aA9mXZdzH6s+hpaz9dxHNXMPqBJ1rzdpS2jo=;
 b=C2TYWFLd+lhEgNYUYAw7Am9SDW+imtlZadp4yG+KgNTlxzAJVbDMe/EicMrkuBDg4fdjXx
 /nIOSvFayC0i8mBQ==
To: Johannes Zink <j.zink@pengutronix.de>, Richard Cochran
 <richardcochran@gmail.com>
In-Reply-To: <8742d597-e8b1-705f-6616-dca4ead529f4@pengutronix.de>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org> <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
 <09a2d767-d781-eba2-028f-a949f1128fbd@pengutronix.de>
 <ZME/GjBWdodiUO+8@hoboy.vegasvil.org>
 <8742d597-e8b1-705f-6616-dca4ead529f4@pengutronix.de>
Date: Thu, 27 Jul 2023 09:15:40 +0200
Message-ID: <873519u8o3.fsf@kurt>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel test robot <lkp@intel.com>, "David
 S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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
Content-Type: multipart/mixed; boundary="===============8425199776108609264=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8425199776108609264==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Johannes, Richard,

On Thu Jul 27 2023, Johannes Zink wrote:
>> BTW this driver is actually for an IP core used in many, many SoCs.
>>=20
>> How many _other_ SoCs did you test your patch on?
>>=20
> I don't have many available, thus as stated in the description: on the i.=
MX8MP=20
> only. That's why I am implementing my stuff in the imx glue code, you're=
=20
> welcome to help testing on other hardware if you have any at hand.

I can assist with testing on Intel real time platforms, stm32mp1 and
Cyclone V (and imx8mp). Just Cc me on the next the version of this
patch.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmTCGZwTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgpkDD/0XLGgz0IfBLidKI4LeAHxLFHmXdMLs
r/y2GNDHujOGXMKWcNMlZPAkNGQ4Vg7FbTNuke6amJZGsF7UzePbqaxjLYwAa8cE
lqq/BnuJ4Q8amgFisK5w9evKSlKIvLhO5keflLpf/tfCrKRiGM3eA4b0JTLN/IJi
FLYbbK/y1TreFttirsnl8HIaEZJg1y8b5b4YcSM/EGpae76QNtsig6MZLTnAyaPv
bwLN+S1qDSVFfZ8oNo/+Mu0v8nce4N38MWsumSho4a9vqGs1R8r7mFBPxZOZnCFx
XaXxJrkciNU4NydVBKRAG70EgDR10/8+Bm2DHqOAUhmX2PP/TGDROAzZaIRbVDOt
gRSaYdlB6+T8zc0JY8+ASkf3I1himqgr8ZOtgEBtqPlOoU/8EislrHH6lfN57lY3
/ymnkrscBIOQy/PDMT20aON8ERnsr/WS3zE7HtD5XE71HoMCspNtBSotxBAo/eyt
knqNN5Z+RWh7W/+hmXA8LUiNNvk2JKEuylei5XPWD0WbIrr0kkb+TdUKnwum0bbT
4tDTOsluKkImHl1GxsCVPPKlHX81SqBs6QOlt+vW3Fbx8gH06VTSC4guUW0y6kf2
VfsxsC23638zsie0jUAr2otpRj6mxAr32iwDekWt/manauTzBAEOFQYMFz2XYVR/
sHGpI9yCoIVfXw==
=7Odq
-----END PGP SIGNATURE-----
--=-=-=--

--===============8425199776108609264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8425199776108609264==--
