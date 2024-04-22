Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5AC8AC855
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 11:04:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3794C6DD6E;
	Mon, 22 Apr 2024 09:04:32 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DE69C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 09:04:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1rypal-0000jv-Fo; Mon, 22 Apr 2024 11:04:03 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mkl@pengutronix.de>)
 id 1rypaj-00Desi-1p; Mon, 22 Apr 2024 11:04:01 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 7FC1A2BCE42;
 Mon, 22 Apr 2024 09:04:00 +0000 (UTC)
Date: Mon, 22 Apr 2024 11:04:00 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Message-ID: <20240422-vigilant-chupacabra-of-lightning-f11220-mkl@pengutronix.de>
References: <20240422-v6-9-topic-imx93-eqos-rmii-v1-0-30151fca43d2@pengutronix.de>
 <20240422-v6-9-topic-imx93-eqos-rmii-v1-3-30151fca43d2@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240422-v6-9-topic-imx93-eqos-rmii-v1-3-30151fca43d2@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: imx@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 3/3] net: stmicro: imx: set TX_CLK
	direction in RMII mode
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
Content-Type: multipart/mixed; boundary="===============6416907886102249438=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6416907886102249438==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="54trwo3z7e7ncsqb"
Content-Disposition: inline


--54trwo3z7e7ncsqb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22.04.2024 10:46:19, Steffen Trumtrar wrote:
> In case of RMII connection, the TX_CLK must be set to output direction.
> Parse the register and offset from the devicetree and set the direction
> of the TX_CLK when the property was provided.
>=20
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 27 +++++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-imx.c
> index 6b65420e11b5c..0fc81a626a664 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -37,6 +37,9 @@
>  #define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 1)
>  #define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
> =20
> +#define MX93_GPR_ENET_QOS_TX_CLK_SEL_MASK	GENMASK(1, 1)
> +#define MX93_GPR_ENET_QOS_TX_CLK_SEL		(0x1 << 1)
> +
>  #define DMA_BUS_MODE			0x00001000
>  #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
>  #define RMII_RESET_SPEED		(0x3 << 14)
> @@ -57,7 +60,9 @@ struct imx_priv_data {
>  	struct clk *clk_tx;
>  	struct clk *clk_mem;
>  	struct regmap *intf_regmap;
> +	struct regmap *enet_clk_regmap;
>  	u32 intf_reg_off;
> +	u32 enet_clk_reg_off;
>  	bool rmii_refclk_ext;
>  	void __iomem *base_addr;
> =20
> @@ -116,6 +121,18 @@ static int imx93_set_intf_mode(struct plat_stmmacene=
t_data *plat_dat)
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
>  		val =3D MX93_GPR_ENET_QOS_INTF_SEL_RMII;
> +
> +		/* According to NXP AN14149, the direction of the
> +		 * TX_CLK must be set to output in RMII mode.
> +		 */
> +		if (dwmac->enet_clk_regmap)
> +			regmap_update_bits(dwmac->enet_clk_regmap,
> +					   dwmac->enet_clk_reg_off,
> +					   MX93_GPR_ENET_QOS_TX_CLK_SEL_MASK,
> +					   MX93_GPR_ENET_QOS_TX_CLK_SEL);

Please add error handling.

> +		else
> +			dev_warn(dwmac->dev, "TX_CLK can't be set to output mode.\n");

As far as I understand the AN14149, setting the TX_CLK_SEL is mandatory
for PHY_INTERFACE_MODE_RMII. IMHO this should be error, shouldn't it?

> +
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> @@ -310,6 +327,16 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, stru=
ct device *dev)
>  			dev_err(dev, "Can't get intf mode reg offset (%d)\n", err);
>  			return err;
>  		}
> +
> +		dwmac->enet_clk_regmap =3D syscon_regmap_lookup_by_phandle(np, "enet_c=
lk_sel");
> +		if (IS_ERR(dwmac->enet_clk_regmap))
> +			return PTR_ERR(dwmac->enet_clk_regmap);
> +
> +		err =3D of_property_read_u32_index(np, "enet_clk_sel", 1, &dwmac->enet=
_clk_reg_off);
> +		if (err) {
> +			dev_err(dev, "Can't get enet clk sel reg offset (%d)\n", err);
> +			return err;
> +		}

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--54trwo3z7e7ncsqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmYmJ/0ACgkQKDiiPnot
vG+rRAf/TCKV4SbXHqD5urbJNkZpU+ifAdUP8XnGCC49D+SYNZCjA4f8QR3fZ6Nc
cfBefjXWzvGrGQPcDx0oEssnxQXSXLGYsm68ZDuHJXoZyEqwuPr2g4KNYmKidHT/
bcUXJGJi8joRtN6RsQ8O/tkjC5OtfP2ydBNaZT8Vw3xxwHtv2PT9x7O66lGWVYLW
0FRe2Jva6Gq3MYr/SpVi16FrUDIMjyQPGuOuqWergNCESFEwPwcqK6vjHNXj2h3c
MUDoLwWv/Iuz/fohieOBSTSZIbIp7kbDZr23Pbc89XRI7ts6XtguerNGw6tEmefQ
Uqe8uR3JnqblFK2pOEeelWhnp+tFKQ==
=WXS4
-----END PGP SIGNATURE-----

--54trwo3z7e7ncsqb--

--===============6416907886102249438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6416907886102249438==--
