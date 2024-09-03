Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5088296968E
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 10:09:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 105C4C78013;
	Tue,  3 Sep 2024 08:09:45 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D06EC78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 08:09:44 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-534366c1aa2so5187616e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Sep 2024 01:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725350983; x=1725955783;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DEGxfQbmvQ7ocJLBpc0e2cOp9yeV28k7sarvQaoPLOE=;
 b=lz17wLXFzO7lgxutWQ95Cdnxnx+Fd5JWdAmWYgtL6NV+v4UHeoJEv0nfvh7X6r0i0t
 nL2wC+5G+8kMboxx6DxpUiVNDGbCHedbfGKPe5ZKR1BpUH6ozzTROlmOml+fQqmTGsGG
 pvzu0wBnnXGubZrqFriVkfjHMmsZHfydUk0/zLMER9DqSUFNCz067zmF5hJXA9zasbjG
 2g9dqi26PZHteOtNN73TS09NCPDwgtlDpzyegIXSi+dKp7iEY4st//QGplSP2JcWv1cI
 XPOeKMhVnAiQOkpKgLk6/3dsJBQOlwCCdgpqor/bIlZN+5ywhwZlofMzwdzLFp4sqE4i
 7GTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725350983; x=1725955783;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DEGxfQbmvQ7ocJLBpc0e2cOp9yeV28k7sarvQaoPLOE=;
 b=LLGIK0M76FbmATIkrZgwtlAypsTPzTJgYO/DQNpA9WfBPVWlMLu7/4y7PNxZpe/T+T
 xe1FAWpkjV/dIzs4Cwf6BKrD0eoQPHrXJdCeT1YEGLgdqvdcW1sIceCX3x7dwoRmjs4I
 XhvacP1O6arGCQcRTqy7b0mMc7J04/VJuIv+ANvgNlrq5x0JnzLQl0cfTIYSsK5ltqjo
 Tr4k370VjYkebqEjwMgkG0yvtMw5zOh1zQl43Zxl3TPTgaTMqRAQy9738o3IwpUim6bc
 Iyg4K+0pY21m7pO3fBPcIEszwm+HWIIu7ZGgruger3ELxPDn/diN9ufby9ifTOdVprhg
 kAmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYkMZLxaVFk8cF8kdXGSLH0azZgylqf+l2zuXz8yvefQLNVDqpBmGHX86+27jNt16X5JrciJQg9wpXcQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTxIa5kNUcsCpfle4Bn9X7s/gCF4WThouMkRQMNpghwZwXmsNW
 bXLGxgzsrgWtaYHOTyahBuoEpfM6waxZ7evKBRidIf7SQrWnQhP0ec1vgfPViY0=
X-Google-Smtp-Source: AGHT+IFYKyym0YuUdTDq7DecK3lEk0OE1VtjFf04ZMXnGn6KhugpgO6dUgJJH2bhiMsBfP+cs+oWvQ==
X-Received: by 2002:a05:6512:3c81:b0:52e:a7a6:ed7f with SMTP id
 2adb3069b0e04-53546bbdf6amr6618557e87.60.1725350983003; 
 Tue, 03 Sep 2024 01:09:43 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb9f7sm649600166b.42.2024.09.03.01.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 01:09:42 -0700 (PDT)
Date: Tue, 3 Sep 2024 10:09:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <nyfm5mxrrvfeu7s25qzjxbatvgnppq7exmca3sccmm6lz7nxan@xxsdgcrueoen>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-6-lizetao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20240831021334.1907921-6-lizetao1@huawei.com>
Cc: andrew@lunn.ch, heiko@sntech.de, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, radhey.shyam.pandey@amd.com,
 ajay.kathat@microchip.com, florian.fainelli@broadcom.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 yisen.zhuang@huawei.com, linux-sunxi@lists.linux.dev,
 jacky_chou@aspeedtech.com, hauke@hauke-m.de, kvalo@kernel.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 salil.mehta@huawei.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 claudiu.beznea@tuxon.dev, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 olteanv@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 05/12] net: ftgmac100: Convert
 using devm_clk_get_enabled() in ftgmac100_setup_clk()
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
Content-Type: multipart/mixed; boundary="===============5230197756553391885=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5230197756553391885==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pq2mmaq7abqtyo6k"
Content-Disposition: inline


--pq2mmaq7abqtyo6k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Aug 31, 2024 at 10:13:27AM +0800, Li Zetao wrote:
> Use devm_clk_get_enabled() instead of devm_clk_get() +
> clk_prepare_enable(), which can make the clk consistent with the device
> life cycle and reduce the risk of unreleased clk resources. Since the
> device framework has automatically released the clk resource, there is
> no need to execute clk_disable_unprepare(clk) on the error path, drop
> the cleanup_clk label, and the original error process can return directly.
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 27 ++++++------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index 4c546c3aef0f..eb57c822c5ac 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1752,13 +1752,10 @@ static int ftgmac100_setup_clk(struct ftgmac100 *=
priv)
>  	struct clk *clk;
>  	int rc;
> =20
> -	clk =3D devm_clk_get(priv->dev, NULL /* MACCLK */);
> +	clk =3D devm_clk_get_enabled(priv->dev, NULL /* MACCLK */);
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
>  	priv->clk =3D clk;
> -	rc =3D clk_prepare_enable(priv->clk);
> -	if (rc)
> -		return rc;
> =20
>  	/* Aspeed specifies a 100MHz clock is required for up to
>  	 * 1000Mbit link speeds. As NCSI is limited to 100Mbit, 25MHz
> @@ -1767,21 +1764,17 @@ static int ftgmac100_setup_clk(struct ftgmac100 *=
priv)
>  	rc =3D clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
>  			  FTGMAC_100MHZ);
>  	if (rc)
> -		goto cleanup_clk;
> +		return rc;
> =20
>  	/* RCLK is for RMII, typically used for NCSI. Optional because it's not
>  	 * necessary if it's the AST2400 MAC, or the MAC is configured for
>  	 * RGMII, or the controller is not an ASPEED-based controller.
>  	 */
> -	priv->rclk =3D devm_clk_get_optional(priv->dev, "RCLK");
> -	rc =3D clk_prepare_enable(priv->rclk);
> -	if (!rc)
> -		return 0;
> +	priv->rclk =3D devm_clk_get_optional_enabled(priv->dev, "RCLK");
> +	if (IS_ERR(priv->rclk))
> +		return PTR_ERR(priv->rclk);
> =20
> -cleanup_clk:
> -	clk_disable_unprepare(priv->clk);
> -
> -	return rc;
> +	return 0;

You're changing semantics here. Before your patch ftgmac100_setup_clk()
was left with priv->clk disabled; now you keep it enabled.

Further note that there is a bug here, because in ftgmac100_probe()
(i.e. the caller of ftgmac100_setup_clk())
clk_disable_unprepare(priv->clk) is called in the error path.
(I only looked quickly, so I might have missed a detail.)

So while your patch is an improvement for clock enable/disable
balancing, it might regress on power consumption.

>  }
> =20
>  static bool ftgmac100_has_child_node(struct device_node *np, const char =
*name)
> @@ -1996,16 +1989,13 @@ static int ftgmac100_probe(struct platform_device=
 *pdev)
>  	err =3D register_netdev(netdev);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to register netdev\n");
> -		goto err_register_netdev;
> +		goto err_phy_connect;
>  	}
> =20
>  	netdev_info(netdev, "irq %d, mapped at %p\n", netdev->irq, priv->base);
> =20
>  	return 0;
> =20
> -err_register_netdev:
> -	clk_disable_unprepare(priv->rclk);
> -	clk_disable_unprepare(priv->clk);
>  err_phy_connect:
>  	ftgmac100_phy_disconnect(netdev);
>  err_ncsi_dev:
> @@ -2034,9 +2024,6 @@ static void ftgmac100_remove(struct platform_device=
 *pdev)
>  		ncsi_unregister_dev(priv->ndev);
>  	unregister_netdev(netdev);
> =20
> -	clk_disable_unprepare(priv->rclk);
> -	clk_disable_unprepare(priv->clk);
> -
>  	/* There's a small chance the reset task will have been re-queued,
>  	 * during stop, make sure it's gone before we free the structure.
>  	 */

Best regards
Uwe

--pq2mmaq7abqtyo6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbWxEIACgkQj4D7WH0S
/k6TJAf/W0v6Vj052O0cQyhSYINBBv+sQ3nGD2cYN9LDziAoSbDf3PwBT94aietu
gEoZvEGnvfzGCHrHLRszB/l6AIW7FxiMo0V+zz66sZS/9h/4hmtifwLWFnGieXDf
T4Pj1jlkN0LB30u8Weay3UEPbLD9qsDFiHNisjQ164GhANBLtMuI1HkNtmEz/96z
kd9zkwXSIbpKN64wLAfEctAZq6+UX74/6cdaEc6CtrdC8Ipv6cQqfjsedO7YfVRu
7IgXK4ashAN8mOti5j66/tm48sDXkxsfjNEAE5xp3ei6+HB61uLmcSKb1XMDXLnP
JDkq0K28JtDXWQyiLytwTQvbzx80mw==
=PiiM
-----END PGP SIGNATURE-----

--pq2mmaq7abqtyo6k--

--===============5230197756553391885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5230197756553391885==--
