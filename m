Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B38233B83DA
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 15:48:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5509BC56639;
	Wed, 30 Jun 2021 13:48:34 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71F56C06B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=aZ8iO9XBy3P3r9iXiFyK52CCdtNx
 JUEpRXml++Cfx6g=; b=aXzYKQ8Gkzzam+WMp5k1pRjO7qvLN91VBiIe35APextO
 agZbM5Qf/IdCH8e44yA1B7PS+hpuFjJJs52twGzHC69ly+8o3rQzyNhX8FZd51rT
 aRPm/lRoi3o6hjJs8/CVd9i/KcVpii2arlUgN1x0Hf31k6OcZzUuPMaJvO0XTaQ=
Received: (qmail 885806 invoked from network); 30 Jun 2021 15:48:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Jun 2021 15:48:31 +0200
X-UD-Smtp-Session: l3s3148p1@Y8kk+vvFAuYgAwDPXwaiAGDoJRk6bv4I
Date: Wed, 30 Jun 2021 15:48:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <YNx2K7Eeqm09Vot6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-8-wsa+renesas@sang-engineering.com>
 <YNM/TZMWwCLGSEJO@ninjato>
 <20210630131118.GB12109@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20210630131118.GB12109@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH 7/7] i2c: stm32f7: : use proper DMAENGINE
 API for termination
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
Content-Type: multipart/mixed; boundary="===============6977663273563463574=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6977663273563463574==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qWmVXpjpnw6hcZzE"
Content-Disposition: inline


--qWmVXpjpnw6hcZzE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alain,

> thanks for the update. If you are ok with that I modify the patch
> to partially rely on _async / synchronize whenever needed and push it again
> separately.

Perfect, thanks!

All the best,

   Wolfram


--qWmVXpjpnw6hcZzE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDcdicACgkQFA3kzBSg
KbaXXhAAmxrPbldmgXhVpi+qevyfoKn/StAf2BS8zj+S+vIDRB2yAVQ/yM9t9ooX
bwPOkJx2oGMcJ1uwFjbyTGvS47iHeW4KAbpIUxr5MmwW5QSXrfn42mfih94g9UaP
HZzIaM3IY+2oP+0sJ4WrGGI0ZqDJ0ISTnGn/5q0jocO5LelzMMnE99qMw5Z7BsUF
2Bi5AwaRzqAyDimWIhjktwNAJBDX+fBZcGpgYbmqVhF2R16UIoIVHCLcVumD23lA
hDU/ows5Wp1bzdh38qadVkaOean/FPSERnTFDx/QkBaGhMc5tz5HQshx4ILGUKI7
hJJsFjPUsi+6GFHoe5gv7sW948ONb48WxKzbhD10KS+D4k5pAzHWs1rmGgdA+UVD
hA90vjuDoB9VIlhcTe6K4LIQGfJBzXZOpo4MYTqLxBAnPQF57GQWcdmH5vSlsxV2
ALPwHYco8CRyxHzpzUU00Q+l/0T9vhuG1lE3LjSRETvUQjB2D4HznNhXqw7SpFxs
vPfT0AodIvOZXEcCtZHCVXZjceBCoGFYKLXHzsM+XAG5XmwcrO9v1FlfTyTqNwr6
EEzsUP+lRpEg1SWRlj00U7ckAkR4mo8CjpQwLGy4ilA74TuIFGI83ILuQ8hPBdS4
Bxdmh62TR6fODqWc7pXdSFx8Jd2EcWqKDLaR6uMExB7XFrVelNU=
=iyIW
-----END PGP SIGNATURE-----

--qWmVXpjpnw6hcZzE--

--===============6977663273563463574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6977663273563463574==--
