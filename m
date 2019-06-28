Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5657F5A0C9
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 18:28:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E63CBC35E01;
	Fri, 28 Jun 2019 16:28:14 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B015DC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aiJProecfCoOFOmMzWWwfmO5TFzjKsVdJFvDr/zMYYo=; b=HBGZ+5qpNe4XDtk4pe9C5Q4z1
 5uaCDcqpoKb76uGbK0SMlo3mlLJGiIdvt73p4wedBNFu0A4+LMJdGnDslEkQBY3+FchygQrM9X5r3
 l7fn98KeEEsrcTVcf4Ue4NC+97J4U5bYAg7Svk9esf8foCGUGYAjsZHC8Pl6tFfkLBuMM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hgtjO-00075K-Pu; Fri, 28 Jun 2019 16:28:10 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 660E0440050; Fri, 28 Jun 2019 15:32:29 +0100 (BST)
Date: Fri, 28 Jun 2019 15:32:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190628143229.GI5379@sirena.org.uk>
References: <1561709289-11174-1-git-send-email-fabrice.gasnier@st.com>
 <1561709289-11174-3-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1561709289-11174-3-git-send-email-fabrice.gasnier@st.com>
X-Cookie: You need not be present to win.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] regulator: add support for the
	stm32-booster
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
Content-Type: multipart/mixed; boundary="===============4201687903652591394=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4201687903652591394==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ZmrHH5cGjskQnY1"
Content-Disposition: inline


--+ZmrHH5cGjskQnY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 10:08:07AM +0200, Fabrice Gasnier wrote:
> Add support for the 3.3V booster regulator embedded in stm32h7 and stm32m=
p1
> devices, that can be used to supply ADC analog input switches.
>=20
> This regulator is supplied by vdda. It's controlled by using SYSCFG:
> - STM32H7 has a unique register to set/clear the booster enable bit
> - STM32MP1 has separate set and clear registers to configure it.

This doesn't apply against current code, please check and resend.

--+ZmrHH5cGjskQnY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0WJPwACgkQJNaLcl1U
h9CEYwf/S479W8LgrEaeHTTFG3CzS+H7XcqwsFf6ZMmLHg4A/fZD3UOrWsupb7XW
5Pn1ugPul+BpUs3M6dew3VdsiqOt/JWl3QC0KPKetya58X+NKnGTtnv+F17u5WyL
pv5f6/FzM3/rN6AhpDN3pbRxUbMj87J3dxVDS/rNh6IYiTjrkIvkXIWO1oiN84aD
KjarUQFfuqKmKDGsCvkzysX+e7npMdAyqntAdYJqtBVsUHPWDPygEfgedZlFjFUa
ktNcysf3sDZpFdDiqzCgLYA52R2rWjJGQbZN9TlMx5iK45iLVjGjTbf11arVCcUw
HT/WrvMzxZT3GvZsaV/sSCOpY7di8A==
=l6Rr
-----END PGP SIGNATURE-----

--+ZmrHH5cGjskQnY1--

--===============4201687903652591394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4201687903652591394==--
