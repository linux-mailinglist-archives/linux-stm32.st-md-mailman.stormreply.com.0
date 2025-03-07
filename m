Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E34A55C2C
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 01:49:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 036CCC78F85;
	Fri,  7 Mar 2025 00:49:13 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C8CAC78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 00:49:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741308510; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fDBTJhinHdTlSpSH3MYpzEfEF6DFRAiHWSWw5JfeoHmjLxG7vVW6DxYj1F5mehhAH6VUa+v6uSuUIvxHCDzfzdmBJM9I9hbT5ZZHBl5AgsTdiiCVPCrL5Ez2VMyg1NcnS8UL9oUt42V0j+JiN71Gw+4uN8xhhFY4KFISFRymoio=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741308510;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=h8rRhlaMIsLXodKw1Q1H9pitBk0/63QeWI3gE5xZArE=; 
 b=Jk/bUElkg2chwiMbrAOCtLc1UTwkUgR5f0CWK0bRUL0d9Zti0XPJMwQi1iHsXxODILH1zu/JA/wg1yvKWSN6CNC4gVNrG7spyHmwao7oZwrvRMhxEVimbPfmoiLgUW7N9T/Niixy5lpLpaZgMtOfKxbSk49YmVLoNHjnIKasR90=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741308510; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=h8rRhlaMIsLXodKw1Q1H9pitBk0/63QeWI3gE5xZArE=;
 b=iwmd/f2pIkqdP0YMHqbjz1g5Q7sh+sb2H3vrbiiGX4rWy0+2dXYeKzC7X3pqrcKY
 a/Jmie4G7MYI/1hkaz/uafpW98wzeXDMrfYf3NnxxpGORNujntMGGAQ4C5KXvsurwZL
 jV5YGtpNXrBNc5Cfet1/HMgaDgha/wh9uS6O5Ti4=
Received: by mx.zohomail.com with SMTPS id 1741308507900364.38915076979447;
 Thu, 6 Mar 2025 16:48:27 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
 id 89085180CAC; Fri, 07 Mar 2025 01:48:22 +0100 (CET)
Date: Fri, 7 Mar 2025 01:48:22 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Dragan Simic <dsimic@manjaro.org>
Message-ID: <7pzama5c5u2voshlkougczic3mnqn4ezotdaqyflcjtb6k7myh@6biehccwcizx>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-4-jonas@kwiboo.se>
 <8323ba9aba1155004bcd201b4fd7b2fa@manjaro.org>
MIME-Version: 1.0
In-Reply-To: <8323ba9aba1155004bcd201b4fd7b2fa@manjaro.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/241.192.19
X-ZohoMailClient: External
Cc: Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] net: stmmac: dwmac-rk: Use
 DELAY_ENABLE macro for RK3588
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
Content-Type: multipart/mixed; boundary="===============0337570683080421621=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0337570683080421621==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ki57npegzizchtuo"
Content-Disposition: inline


--ki57npegzizchtuo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for
 RK3588
MIME-Version: 1.0

Hi,

On Thu, Mar 06, 2025 at 10:33:23PM +0100, Dragan Simic wrote:
> Hello Jonas,
>=20
> On 2025-03-06 21:38, Jonas Karlman wrote:
> > Support for Rockchip RK3588 GMAC was added without use of the
> > DELAY_ENABLE macro to assist with enable/disable use of MAC rx/tx delay.
> >=20
> > Change to use a variant of the DELAY_ENABLE macro to help disable MAC
> > delay when RGMII_ID/RXID/TXID is used.
> >=20
> > Fixes: 2f2b60a0ec28 ("net: ethernet: stmmac: dwmac-rk: Add gmac
> > support for rk3588")
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 37eb86e4e325..79db81d68afd 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > @@ -91,6 +91,10 @@ struct rk_priv_data {
> >  	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE : soc##_GMAC_TXCLK_DLY_DISABLE) |
> > \
> >  	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE : soc##_GMAC_RXCLK_DLY_DISABLE))
> >=20
> > +#define DELAY_ENABLE_BY_ID(soc, tx, rx, id) \
> > +	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE(id) :
> > soc##_GMAC_TXCLK_DLY_DISABLE(id)) | \
> > +	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE(id) :
> > soc##_GMAC_RXCLK_DLY_DISABLE(id)))
> > +
> >  #define PX30_GRF_GMAC_CON1		0x0904
> >=20
> >  /* PX30_GRF_GMAC_CON1 */
> > @@ -1322,8 +1326,7 @@ static void rk3588_set_to_rgmii(struct
> > rk_priv_data *bsp_priv,
> >  		     RK3588_GMAC_CLK_RGMII_MODE(id));
> >=20
> >  	regmap_write(bsp_priv->grf, RK3588_GRF_GMAC_CON7,
> > -		     RK3588_GMAC_RXCLK_DLY_ENABLE(id) |
> > -		     RK3588_GMAC_TXCLK_DLY_ENABLE(id));
> > +		     DELAY_ENABLE_BY_ID(RK3588, tx_delay, rx_delay, id));
> >=20
> >  	regmap_write(bsp_priv->grf, offset_con,
> >  		     RK3588_GMAC_CLK_RX_DL_CFG(rx_delay) |
>=20
> Thanks for this patch...  It's looking good to me, and good job
> spotting this issue!  Please, free to include:
>=20
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--ki57npegzizchtuo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfKQlIACgkQ2O7X88g7
+pqmUQ/+Pwe2OzjCoW17WKQbluD9itbsu6/qTK/72qQxcnuYYRWGr7jwxff62Xas
0ocMSrO7kTdcbgVUXF9oeURevU/kv0xvLaUK98zXfXAU3nDVDdZJcp9MHQV2e2lZ
U7SQkX+/SG5QWMJlQnj7ds73kZfSHBhXW5smWDt+r84OMSLOyWf1PgASH/WhP1MP
VMlp78mMl34DUh8cIKWywg0SlGeEETPd2QJgrLDQDBc4oYz2MMbNDU1+NkVc+bmb
30kGT/MbjUc/KfGwTK2P8l2JO8N3MuV16+0GLAU+CcGJyoMYPQEbz3lv+WW1ZDa5
hNAgydbYtgjqxJPtlJs2ywrF6aZeIcHSapMGDAuzqNkrauMVYNE0x1C40KTcrbT8
JEurU9KVGqiazUrNcFsrlqLBCSDok17GmJIsRXcaxIHiRVHkeEFawGUNCj71IX9A
MTPnOauFJmc4EDf8qwnEAQeLlWzahjsvt4eAHJHczr5Qjje4x4Gei6X49crQmkWb
Kmb0WlwJv1tNMRaluwCLHXSunGQd39WRJ9Ujl/JDpwwyi7xSBZikK2aLS9vtSW99
UzIAbnWaAT1qO90FqXjlnDcU1KZHR7GJjAMxz23KXRKAOdT+rViZ268aKTRf23HM
5pFgSMuptSxKMkBdUa/+SCYSo3+BRKI9M1xOoVWHlrqq4ZpCxQU=
=L1gX
-----END PGP SIGNATURE-----

--ki57npegzizchtuo--

--===============0337570683080421621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0337570683080421621==--
