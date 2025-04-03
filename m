Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67356A7A1AB
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 13:10:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DC99C78F85;
	Thu,  3 Apr 2025 11:10:13 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C9EDC78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 11:10:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6CBEDA40818;
 Thu,  3 Apr 2025 11:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F2AC4CEE3;
 Thu,  3 Apr 2025 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743678610;
 bh=htwI5zsh8ZDaI94Lm8c3UJRY0TNj20AHOyFODzHrsRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JDOhLyn0xYLRzSvccPU8EviC8cR6irF7BDJvH8ACOAdUQzHQH7oP/7wYujcxO+NjF
 GgY2xgBpssfWkG1WsjPDgdBi0nkVLNmQuj7vdHyeM2DsDwYSPD9qDsrfuYj0WWsPah
 G7FDtZORFO+rimKjF7CbjHQbT9uuROt2jdGtPEDeuW/dt5Kx2J1GvenawEct3O0SoS
 Uo8PX1xw/niwV9hUIuhDFfnkEKfrdyMd0X5Sf46MelotqgSxu2VVk6SA7mz/eOaFDJ
 HoPO9zn4Vc6zD+ANTRl/YKXupC3sqi6yHP4dPfKlO5jsS9+ko5WOXpbKrRmvIzhObh
 m92UasI15X0dw==
Date: Thu, 3 Apr 2025 12:10:05 +0100
From: Mark Brown <broonie@kernel.org>
To: shao.mingyin@zte.com.cn
Message-ID: <f78f066f-2be6-47f3-bb06-03f1c2ed3d22@sirena.org.uk>
References: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
MIME-Version: 1.0
In-Reply-To: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
X-Cookie: Logic is the chastity belt of the mind!
Cc: linux-kernel@vger.kernel.org, zhang.enpei@zte.com.cn, tiwai@suse.com,
 linux-sound@vger.kernel.org, lgirdwood@gmail.com, yang.yang29@zte.com.cn,
 xu.xin16@zte.com.cn, mcoquelin.stm32@gmail.com, ye.xingchen@zte.com.cn,
 perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] sound: soc: stm: stm32_sai: Use
	dev_err_probe()
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
Content-Type: multipart/mixed; boundary="===============6195330122309090604=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6195330122309090604==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VJtFOiDls7d3k31G"
Content-Disposition: inline


--VJtFOiDls7d3k31G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 03:41:42PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--VJtFOiDls7d3k31G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfubIwACgkQJNaLcl1U
h9CeLQf/R93pQE1PWEoaKn2ix4KLyiBG73yedrtnMdMp+o5mrdfBQ7mMCsCUr9D2
OYklJCVdg5UGii26J9AHrpPFJ/maeTRCZLWSYi8jSkDvVOzITy74IiQN+3fMSyvo
lG/EJg7WhDkLyGdQm3FM6/GD3QqppgcfzTFJkKTGxFwXeTCYJoanUdk2rn7iNqyO
ZIfIQYS56l4O1FR/xTJG+n5iyS2HsYUACJRFyrnHW+CjpGpEVXRWEMOmhzhVl0TQ
EjDsPh4BWWbOX2Cvca66T1c5mJ5SHEFBlcQEIJ+RaDP5koM9IiMMuRAKY98HA3rK
mYbd3uFbhvGA9EVRiMkS/8iOsQJUTA==
=LR/E
-----END PGP SIGNATURE-----

--VJtFOiDls7d3k31G--

--===============6195330122309090604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6195330122309090604==--
