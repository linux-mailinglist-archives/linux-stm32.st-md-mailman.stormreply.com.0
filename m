Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4ABE3C03
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2019 21:31:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA314C36B0B;
	Thu, 24 Oct 2019 19:31:56 +0000 (UTC)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24B64C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2019 19:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lTuul7TgwXeA9Ghbz5R/7bfDVQxiZGtF3PKzuNptlLQ=; b=gECSwfOZ7/f2ONTAalZGsPJpT
 RH0nFXIJbGATQ4dHCHdhS1N6yGiS0Wdu4rR9VqvC4F6ApYi+dcn56+c9lXhCQEOKFRkgtFHWrq/uy
 04Aqni5w/hpDDRPZch3UxLbXnpYtaHPllUlnq7Ca0EAKbGklZ6Od8BNQWvQZmWqrf0rdI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNipu-0003ze-Cx; Thu, 24 Oct 2019 19:31:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D6BFA274293C; Thu, 24 Oct 2019 20:31:53 +0100 (BST)
Date: Thu, 24 Oct 2019 20:31:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Pascal Paillet <p.paillet@st.com>
Message-ID: <20191024193153.GL46373@sirena.co.uk>
References: <20191024154121.8503-1-p.paillet@st.com>
MIME-Version: 1.0
In-Reply-To: <20191024154121.8503-1-p.paillet@st.com>
X-Cookie: Filmed before a live audience.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-stm32@st-md-mailman.stormreply.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/1] Enable stm32_pwr regulator driver for
	stm32mp157
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
Content-Type: multipart/mixed; boundary="===============7713863387063597536=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7713863387063597536==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FxavXfDenm+F7xE/"
Content-Disposition: inline


--FxavXfDenm+F7xE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 05:41:20PM +0200, Pascal Paillet wrote:

> Enable the STM32 PWR regulator driver for stm32mp157 machine.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--FxavXfDenm+F7xE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2x/CkACgkQJNaLcl1U
h9BxkQf/WRgcuq2/+kReBuvdqevH/9DkhUJYjZIbFkXlaaWYqaUrYdDfbDAY+nYa
P2vzQh6utFbrvk4h3oC3QEOJlNSm0JKBcvTQF9t3/G3MurCCEYD/49i1OSJCdl0p
GcnyWnaheaO6jlSfYf92tGsRTetAFiUBxyMKvYRoKSu1i6701KtV1/CdUaOceNFS
1SKDUbeq/Y9ZfrzIUePmiM/syu1T/trfsOaH9scEiWAaHBEdxF7lddMPe2OOju+k
8AGCyrZ9y1ibX9fY4zMA3SYN3hm93kYI9/B1etslWK4D9u6cYDzdY3mrUaJPKZCa
MeCMSEjq/i9zEuKLAY31BLEGVift9Q==
=bSjw
-----END PGP SIGNATURE-----

--FxavXfDenm+F7xE/--

--===============7713863387063597536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7713863387063597536==--
