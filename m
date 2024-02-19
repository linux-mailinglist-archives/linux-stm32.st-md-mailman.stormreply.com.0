Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1485A7F9
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 16:58:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 561BDC6B45E;
	Mon, 19 Feb 2024 15:58:29 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F960C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 15:58:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so4275393a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 07:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708358307; x=1708963107;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:to:from:subject:message-id:date:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tiqLc5KdCmtjYQt/eIFsjHHh0iB3V/zgzPhPHivKtAs=;
 b=FNDlyigbV8pm2iEeZAwxEjVRQAN1XVxP7ujMen1lyCFKay7X20/84J/d8RHb5vjkVH
 mXwR7X24lNQrIABTWpT8m8fDMyAoIMLN7fizG6xhvAi+vGa6fO/euxo0mwgAk4SWyy5i
 608AhXLAQfWHyu3e+a2SXrh9isPXulRywFAw3rcNKMGDMd9J5NEL5Dvg59eH3PtWS95r
 fLc0gkRBI9G52h5/yh/oFKWQbivIU/u2fw11wivBB2ZPbZ7Ex67QXnNDZNZuq3zxFNyc
 rNrebuJ30CTWC6HkDty9NXimVCb4TKajO1x34iJJ0ru19shI9eUnKck8Osm81QeOyA8T
 3Oiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708358307; x=1708963107;
 h=in-reply-to:references:to:from:subject:message-id:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tiqLc5KdCmtjYQt/eIFsjHHh0iB3V/zgzPhPHivKtAs=;
 b=tw9GNiS06QUufIbr8joLSZ/8/HFDwQq6vveLvHrD4frMkVWHjX8npZDavv5ADJHlec
 PU1gyMtN+s9CQhpKVPiRb7fosbXtnq2OnpsDwHWV8zQDrNDTV1dtXFVJPsaYugRWZEll
 KhqY/unVHnnTiqq7aJ49fZ4fAisg1wSw4/tpab4maA8EPBSQ0djS/NCRMs+7Dzant96e
 RM9bx6EZ/lfN/gJyP1KKhHEl7xIG8FN802xvB3aYvmIXZ/oy0N7Bsy8qGI5JIlwKX5Gq
 MXOyUmmYEigh7T+B/rrNJr6jYSUBjHvDAh6Iex8fbb7RAdENiRg8T1ITDkV7cpxKr/uX
 OFaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGzBSfVni/kNv2BCCicxa5PINfs/+GdgJRkUVgx6Oi4mfDLMldAJC9uAv3l+dLfhXOTXne1bAjxXvMnL/8x9E01iZx3exmIQ0fWBdaEOo+vnxm/5njVARt
X-Gm-Message-State: AOJu0YyJ/8+Pyh0GRidRkbT0xZg6rclo88nxxuuhl32iNeSZSrg6ui6a
 y/vQ8REmok304tmDx/YBFV+9nXh5k4DGk1+zH4SEGghjvPkkwb1X
X-Google-Smtp-Source: AGHT+IFtwqfaW9gJsxLy3j5F49CYy1xFjRlT0RRadI4Z0IOCUNhh1itGGGOPl5tKEJMCv67TBumOMw==
X-Received: by 2002:a17:906:851:b0:a3d:80d7:d1e3 with SMTP id
 f17-20020a170906085100b00a3d80d7d1e3mr7428154ejd.77.1708358306585; 
 Mon, 19 Feb 2024 07:58:26 -0800 (PST)
Received: from localhost
 (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 rf23-20020a1709076a1700b00a3da5bf6aa5sm3076542ejc.211.2024.02.19.07.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 07:58:26 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 19 Feb 2024 16:58:25 +0100
Message-Id: <CZ96H72GI4Z0.SZJBZXA1VXJZ@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-tegra@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] phy: constify of_phandle_args in xlate
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
Content-Type: multipart/mixed; boundary="===============6353120492721927499=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6353120492721927499==
Content-Type: multipart/signed;
 boundary=f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Feb 17, 2024 at 10:39 AM CET, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c              |  2 +-
>  drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c     |  2 +-
>  drivers/phy/broadcom/phy-bcm-sr-pcie.c             |  2 +-
>  drivers/phy/broadcom/phy-bcm-sr-usb.c              |  2 +-
>  drivers/phy/broadcom/phy-bcm63xx-usbh.c            |  2 +-
>  drivers/phy/broadcom/phy-brcm-usb.c                |  2 +-
>  drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c    |  2 +-
>  drivers/phy/freescale/phy-fsl-lynx-28g.c           |  2 +-
>  drivers/phy/hisilicon/phy-histb-combphy.c          |  2 +-
>  drivers/phy/intel/phy-intel-lgm-combo.c            |  2 +-
>  drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c        |  2 +-
>  drivers/phy/marvell/phy-armada375-usb2.c           |  2 +-
>  drivers/phy/marvell/phy-armada38x-comphy.c         |  2 +-
>  drivers/phy/marvell/phy-berlin-sata.c              |  2 +-
>  drivers/phy/marvell/phy-mvebu-a3700-comphy.c       |  2 +-
>  drivers/phy/marvell/phy-mvebu-cp110-comphy.c       |  2 +-
>  drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c        |  2 +-
>  drivers/phy/mediatek/phy-mtk-tphy.c                |  2 +-
>  drivers/phy/mediatek/phy-mtk-xsphy.c               |  2 +-
>  drivers/phy/microchip/lan966x_serdes.c             |  2 +-
>  drivers/phy/microchip/sparx5_serdes.c              |  2 +-
>  drivers/phy/mscc/phy-ocelot-serdes.c               |  2 +-
>  drivers/phy/phy-core.c                             |  8 ++++----
>  drivers/phy/phy-xgene.c                            |  2 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |  2 +-
>  drivers/phy/ralink/phy-mt7621-pci.c                |  2 +-
>  drivers/phy/renesas/phy-rcar-gen2.c                |  2 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c           |  2 +-
>  drivers/phy/renesas/r8a779f0-ether-serdes.c        |  2 +-
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c |  2 +-
>  drivers/phy/rockchip/phy-rockchip-pcie.c           |  2 +-
>  drivers/phy/samsung/phy-exynos-mipi-video.c        |  2 +-
>  drivers/phy/samsung/phy-exynos5-usbdrd.c           |  2 +-
>  drivers/phy/samsung/phy-samsung-usb2.c             |  2 +-
>  drivers/phy/socionext/phy-uniphier-usb2.c          |  2 +-
>  drivers/phy/st/phy-miphy28lp.c                     |  2 +-
>  drivers/phy/st/phy-spear1310-miphy.c               |  2 +-
>  drivers/phy/st/phy-spear1340-miphy.c               |  2 +-
>  drivers/phy/st/phy-stm32-usbphyc.c                 |  2 +-
>  drivers/phy/tegra/xusb.c                           |  2 +-
>  drivers/phy/ti/phy-am654-serdes.c                  |  2 +-
>  drivers/phy/ti/phy-da8xx-usb.c                     |  2 +-
>  drivers/phy/ti/phy-gmii-sel.c                      |  2 +-
>  drivers/phy/xilinx/phy-zynqmp.c                    |  2 +-
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  2 +-
>  include/linux/phy/phy.h                            | 14 +++++++-------
>  46 files changed, 55 insertions(+), 55 deletions(-)

Makes sense:

Acked-by: Thierry Reding <treding@nvidia.com>

--f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXTeqIACgkQ3SOs138+
s6GdEBAAsZtqIRL7k6ZV5nu5N0juG6RO7Sm34o9+isHlbNUAhmDQeIXxdlWIF3qc
ap2W/H4jLtQnrDaCtdFWa5oPx8Ud41AKoeOQRlZq6goHZemt2JbUyB5IzsMIL0KN
FUGwvVEZdDnJbhe2+8YX0fN8WG4qpAYo7vrb1XsgP4RzGwgkwH64LbCOtoAoYtYl
rOc7hn6eNJrIYlW1LaU37BApWV0KgdMiI1YSILAT5YJK24fYst7j//8UxyEQP4aO
S+3uPr8/1K1JifAihpgqu7w5kyDcMW1ncoAamilKe2xDzz7wJ8wxtYcdypnwBSpd
/+rhMybnEj2kgbDrSbY+LVlczSU6Wf/SEtZzB+DOCE4+CZrtFyMVsSgAeVXFT1n0
L5vTh0182skHEAm97GXHwoQOmLND8wJJVZR+Sw1OApxEYI1Y8hTx33NrbA+5hiVq
15m0Jq8NXvpd237p5obNfFNuDmK/BlMhlq3x+3/aWGqT+pRlavF1i0HP/wEV9YoC
6zleWWkx9BAonksD76uhrk/LBnYnc3wb9O5B4KS6dp+tYE3ekIWauHxzhg4tpOcg
FqcY6ObCs+Jjtplo4vtrTBR6A4jdvunJQcp4WqSO/5RkZd/ySVdSbpvCdK1yy/JM
j7SSnUWV03IbkbGoBduin/a8YT84GAn3seVzxO0ik5dpZHGbAPM=
=Z186
-----END PGP SIGNATURE-----

--f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f--

--===============6353120492721927499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6353120492721927499==--
