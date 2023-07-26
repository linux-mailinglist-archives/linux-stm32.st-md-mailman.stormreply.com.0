Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 417A1763D27
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 19:03:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0085EC6B45C;
	Wed, 26 Jul 2023 17:03:42 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36101C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 17:03:41 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso61085965e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690391020; x=1690995820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RidFgmIYodB4LoijuDUvWl2A58yPKSzZPeSa6pREuP4=;
 b=eWH5pKbpRVoI/ESaC8uvPUlYLQ4GjPOPmCqDQ3/0VsVJ0iMBCevILPbEzc9DYDgbKN
 NielMbT9E5i6K6cOpJBhw94g7iAFwUnTVLJ1edqJ8+2YZ7ueD47XIbGq5BxVToWpAgkS
 7bZmrUlcrAAWhFovk6EGiV6f34/lPk9r6LaDWXJ0MS9FA0i/Y+jl7jNJVLyzEHKnd8bU
 CdV7Eg2HSD8ftHrHknGOAwBLDASr3qogT7tj0zgVhHGpVuvDfbyb9dnH5mwSwjhXjzR4
 JcMb48/PXpHEBxnUtw71iWz29+0Ki5f1bBku9jjmbFUZBE6tUA3Ks2TzC1+F/UA1t0DT
 lBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690391020; x=1690995820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RidFgmIYodB4LoijuDUvWl2A58yPKSzZPeSa6pREuP4=;
 b=e8UUnV6YUp1sF5IboqaddY1g8zR47u5ApP2cGSm5kP6C62xRzpmO3LY+Ybw1Sq6BRk
 E26CpU02hJy0ZUfioZtAPmpUAuXdRC+jBymOL32Qm6nY5P0QMaX4l9zaxUsoUDNCkKM5
 /83H5MPgDUkK6e2uhq+tVDBLBJtqRpwGPSIrWSswxrs0O6LLeipgnIpWnxqQt0OZuuIO
 nLzlylTkyVIIfMSPB+GyKEoHieu/D5tb4H1su/HM2S4wO8yV9m8lJnzmndnpFag88MWi
 M6Wmhf9g/KA+43+aMb77yLbGYvq4vgBgEKzTVswFIIkT+CbdFdL0QyRJDBmwzIauTnVb
 36sQ==
X-Gm-Message-State: ABy/qLZ35esRoD22kt+x7vk+KljWLmWw+1DkTSz67Ln227qiQp6GB1zy
 aZN1zZpot+LHI361eCUMLdI=
X-Google-Smtp-Source: APBJJlFvg7Yxfd2N1g9PwD8D88WAdjE44Fv6yFqKb8JhOXAIlUE51SrUpYGeR/UUqRlsRrfxQZvSuQ==
X-Received: by 2002:a5d:65d1:0:b0:317:6efd:3a6b with SMTP id
 e17-20020a5d65d1000000b003176efd3a6bmr1889672wrw.24.1690391020221; 
 Wed, 26 Jul 2023 10:03:40 -0700 (PDT)
Received: from skbuf ([188.25.175.105]) by smtp.gmail.com with ESMTPSA id
 h4-20020adfe984000000b003175f00e555sm10449511wrm.97.2023.07.26.10.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:03:39 -0700 (PDT)
Date: Wed, 26 Jul 2023 20:03:36 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20230726170336.4t4wuw2v34haftk7@skbuf>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
 <ZMA45XUMM94GTjHx@shell.armlinux.org.uk>
 <PAXPR04MB91857EA7A0CECF71F961DC0B8900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ZME3JA9VuHMOzzWo@shell.armlinux.org.uk>
 <PAXPR04MB9185A31E1E3DEBABE03C60F78900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ZMFJ6ls0LHrUWahz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMFJ6ls0LHrUWahz@shell.armlinux.org.uk>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 dl-linux-imx <linux-imx@nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH] net: stmmac: dwmac-imx: pause
 the TXC clock in fixed-link
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Jul 26, 2023 at 05:29:30PM +0100, Russell King (Oracle) wrote:
> On Wed, Jul 26, 2023 at 04:10:11PM +0000, Shenwei Wang wrote:
> > > So, plat->phy_node will never ever be equal to your "dn" above.
> > > plat->phylink_node is the same as dwmac->dev->of_node above, and
> > > so plat->phylink_node will never be your "dn" above either.
> > >
> > > Those two together means that imx_dwmac_is_fixed_link() will _always_ return
> > > false, and thus most of the code you're adding is rather useless.
> > >
> > > It also means the code you're submitting probably hasn't been properly tested.
> > >
> > > Have you confirmed that imx_dwmac_is_fixed_link() will actually return true in
> > > your testing? Under what conditions did your testing reveal a true return value
> > > from this function?
> > >
> > 
> > We can't make that assumption. In my testing code, I had trace statements in that
> > section to indicate the code was actually executed. You may get some clues from the following DTS:
> > 
> > +&eqos {
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_eqos_rgmii>;
> > +       phy-mode = "rgmii-rxid";
> > +       phy-handle = <&fixed0>;
> > +       status = "okay";
> > +
> > +       fixed0: fixed-link {
> > +               speed = <1000>;
> > +               full-duplex;
> > +       };
> 
> This is just totally botched up.
> 
> "fixed0" is _not_ a PHY, therefore you should NOT be referencing it
> in phy-handle. Please see the DT binding document:
> 
>   phy-handle:
>     $ref: /schemas/types.yaml#/definitions/phandle
>     description:
>       Specifies a reference to a node representing a PHY device.
> 
>   fixed-link:
>     oneOf:
>       - $ref: /schemas/types.yaml#/definitions/uint32-array
>         deprecated: true
> ...
>       - type: object
>         additionalProperties: false
>         properties:
>           speed:
> ...
> 
> As I said, fixed-link is _not_ a PHY, and thus phy-handle must *not*
> be used to point at it.
> 
> The mere presence of a node called "fixed-link" will make this "eqos"
> device use that fixed-link node, and the phy-handle will be ignored.
> 
> So sorry, but as far as your patch goes, it's a hard NAK from me
> right now until the DT description is actually correct.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

Shenwei, the correct way to describe the link between the eQOS and the
SJA1105 port in imx93-11x11-evk-sja1105.dts is:

#include "imx93-11x11-evk.dts"

&eqos {
	/delete-property/ phy-handle;
	clk_csr = <5>;

	fixed-link {
		speed = <1000>;
		full-duplex;
	};

	mdio {
		/delete-property/ ethernet-phy@1;

		/* TJA1102 */
		phy0: ethernet-phy@8 {
			#address-cells = <1>;
			#size-cells = <0>;
			reg = <0x8>;

			phy1: ethernet-phy@9 {
				reg = <0x9>;
			};
		};

		/* TJA1102 */
		phy2: ethernet-phy@e {
			#address-cells = <1>;
			#size-cells = <0>;
			reg = <0xe>;

			phy3: ethernet-phy@f {
				reg = <0xf>;
			};
		};
	};
};

&iomuxc {
	pinctrl_lpspi8: lpspi8grp {
		fsl,pins = <
			MX93_PAD_GPIO_IO12__GPIO2_IO12  0x3fe
			MX93_PAD_GPIO_IO13__LPSPI8_SIN  0x3fe
			MX93_PAD_GPIO_IO14__LPSPI8_SOUT 0x3fe
			MX93_PAD_GPIO_IO15__LPSPI8_SCK  0x3fe
		>;
	};
};

&lpspi8 {
	fsl,spi-num-chipselects = <1>;
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_lpspi8>;
	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
	pinctrl-assert-gpios = <&pcal6524_b 3 GPIO_ACTIVE_LOW>;
	status = "okay";

	ethernet-switch@0 {
		reg = <0x0>;
		compatible = "nxp,sja1105q";
		#address-cells = <1>;
		#size-cells = <0>;
		spi-max-frequency = <4000000>;
		spi-cpha;
		status = "okay";

		ethernet-ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				ethernet = <&eqos>;
				phy-mode = "rgmii-id";
				tx-internal-delay-ps = <2000>;
				rx-internal-delay-ps = <2000>;
				reg = <0>;

				fixed-link {
					speed = <1000>;
					full-duplex;
				};
			};

			port@1 {
				phy-handle = <&phy0>;
				label = "swp1";
				phy-mode = "mii";
				reg = <1>;
			};

			port@2 {
				label = "swp2";
				phy-handle = <&phy1>;
				phy-mode = "mii";
				reg = <2>;
			};

			port@3 {
				label = "swp3";
				phy-handle = <&phy2>;
				phy-mode = "rmii";
				reg = <3>;
			};

			port@4 {
				phy-handle = <&phy3>;
				label = "swp4";
				phy-mode = "rmii";
				reg = <4>;
			};
		};
	};
};

The "mdio" node under "eqos" is just the OF node of the MDIO bus.
It doesn't necessarily mean that the net_device corresponding to the
stmmac uses all those PHYs. It uses just the PHY that it has a
phy-handle to. It may not even have a phy-handle at all, just a
fixed-link, like above.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
