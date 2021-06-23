Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D253B1BF5
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 16:04:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CD6BC5662F;
	Wed, 23 Jun 2021 14:04:07 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4740C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=5Hz0NBW+dm9DpC3tg2xUSrZvo02x
 pLXSDQ9mKWvGrZo=; b=a6nXb2FF57WWdN3KkRmaItssShKrVhGSiOUgJWDdzz6Z
 8SHdsvJ6rzucr3NnxXaon6EMCxloUccpk3EPZ8FZM223BlageQ/l3j22cMtfDGfl
 LDuDMfsfFiR9Bol7p1MaFvD+apa+YzC4dKwVEPvlnPlYTuwfGM3u3TydGRjmRhY=
Received: (qmail 2628777 invoked from network); 23 Jun 2021 16:04:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 23 Jun 2021 16:04:03 +0200
X-UD-Smtp-Session: l3s3148p1@0guzYG/FUsUgAwDPXwWqAK4jk/jYs7Oa
Date: Wed, 23 Jun 2021 16:03:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Message-ID: <YNM/TZMWwCLGSEJO@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-8-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20210623095942.3325-8-wsa+renesas@sang-engineering.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============0143073050703548992=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0143073050703548992==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1fTcwnSHuuE3QDd/"
Content-Disposition: inline


--1fTcwnSHuuE3QDd/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 11:59:41AM +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Eeks, this is called from irq context as well. Broken patch :(


--1fTcwnSHuuE3QDd/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDTP0oACgkQFA3kzBSg
KbYBHQ/+IJf8b0KVc9LD1AjbSx3G6RbvdgxCXWltzxHXyso9+q5IVQ4IT+JLUNQj
RZWpX8WMrnxCyAG6soDPaScazxJz0WowMManZgOUTjhj59pRl8dnBGy/n/Diws2N
FajIRvjSf0pBF9SlSvGYzrbX1+rd+lUi73JKzH3f5gJKu7Pl3kkXILijIPDUp2zI
64zXApYYlJsJgGJmNEOq4YYoqYPVvQZ8PayjSgEoQXX77ebW45hqc+o3RHUeTu0P
dx5irTMfEw6Brk35lPfkmsTxDf6/mHvzU0B4PAxl5FGWsKdj/9dRGtfqEpN6WJyp
zpzelpZZr9o0l4kieCCgAxeea2qYqcX0OvRn3q51DjL5FTBy8u3p/siL1wVLluKT
Tf5RjgIKR02Hg8+noq1AKConkhynExZLjBCyS99Ct3F0bQqagI6HvxKl2azkWlcC
ETwznqWrENqwvkh4Mwmt5tu5ifRtw6D5iWJSYZbNgSls/0eiww04cuH+5yQf9zUF
++Pp2ltIuoYN+yxWKcSi34pFMeDpFoZAACJ17cKWz3TNM9aufhhgh9zsOKWwM9Bd
cMT854BLnaXbc6jSZfuAh/b6ol2oWsF4O50EsJKVbZuGmD2YZ6HqWZBMEOb8vuVO
xyRAfKXxXDVjqNAdKv5uHSHwE2GGCOxPN05gyQVn2MSUYesejDg=
=FXBJ
-----END PGP SIGNATURE-----

--1fTcwnSHuuE3QDd/--

--===============0143073050703548992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0143073050703548992==--
