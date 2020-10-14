Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFF28E6C6
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 20:56:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06A2BC424AF;
	Wed, 14 Oct 2020 18:56:27 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E2A6C32E91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 18:56:24 +0000 (UTC)
Date: Wed, 14 Oct 2020 20:56:01 +0200
From: Paul Cercueil <paul@crapouillou.net>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-Id: <DLG7IQ.15UXZI2H6RYC3@crapouillou.net>
In-Reply-To: <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Wei Xu <xuwei5@hisilicon.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes
	name
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



Le mer. 14 oct. 2020 =E0 13:14, Serge Semin =

<Sergey.Semin@baikalelectronics.ru> a =E9crit :
> In accordance with the Generic EHCI/OHCI bindings the corresponding =

> node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Let's fix the DTS files, which have the nodes defined =

> with
> incompatible names.
> =

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> =

> ---
> =

> Please, test the patch out to make sure it doesn't brake the =

> dependent DTS
> files. I did only a manual grepping of the possible nodes =

> dependencies.
> ---
>  arch/arc/boot/dts/axs10x_mb.dtsi               | 4 ++--
>  arch/arc/boot/dts/hsdk.dts                     | 4 ++--
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 2 +-
>  arch/arm/boot/dts/bcm5301x.dtsi                | 4 ++--
>  arch/arm/boot/dts/bcm53573.dtsi                | 4 ++--
>  arch/arm/boot/dts/hisi-x5hd2.dtsi              | 4 ++--
>  arch/arm/boot/dts/lpc18xx.dtsi                 | 4 ++--
>  arch/arm/boot/dts/stm32mp151.dtsi              | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi       | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi       | 4 ++--
>  arch/mips/boot/dts/ingenic/jz4740.dtsi         | 2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi         | 2 +-

For jz4740.dtsi and jz4770.dtsi:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>  arch/mips/boot/dts/mti/sead3.dts               | 2 +-
>  arch/mips/boot/dts/ralink/mt7628a.dtsi         | 2 +-
>  arch/powerpc/boot/dts/akebono.dts              | 6 +++---
>  16 files changed, 28 insertions(+), 28 deletions(-)
> =

> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi =

> b/arch/arc/boot/dts/axs10x_mb.dtsi
> index 99d3e7175bf7..b64435385304 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -87,13 +87,13 @@ gmac: ethernet@18000 {
>  			mac-address =3D [00 00 00 00 00 00]; /* Filled in by U-Boot */
>  		};
> =

> -		ehci@40000 {
> +		usb@40000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D < 0x40000 0x100 >;
>  			interrupts =3D < 8 >;
>  		};
> =

> -		ohci@60000 {
> +		usb@60000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D < 0x60000 0x100 >;
>  			interrupts =3D < 8 >;
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index dcaa44e408ac..fdd4f7f635d3 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -234,7 +234,7 @@ phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
>  			};
>  		};
> =

> -		ohci@60000 {
> +		usb@60000 {
>  			compatible =3D "snps,hsdk-v1.0-ohci", "generic-ohci";
>  			reg =3D <0x60000 0x100>;
>  			interrupts =3D <15>;
> @@ -242,7 +242,7 @@ ohci@60000 {
>  			dma-coherent;
>  		};
> =

> -		ehci@40000 {
> +		usb@40000 {
>  			compatible =3D "snps,hsdk-v1.0-ehci", "generic-ehci";
>  			reg =3D <0x40000 0x100>;
>  			interrupts =3D <15>;
> diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi =

> b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> index cbb179770293..90a412026e64 100644
> --- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
> @@ -46,7 +46,7 @@ ethernet@18000 {
>  			clock-names =3D "stmmaceth";
>  		};
> =

> -		ehci@40000 {
> +		usb@40000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D < 0x40000 0x100 >;
>  			interrupts =3D < 8 >;
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi =

> b/arch/arm/boot/dts/bcm5301x.dtsi
> index 0016720ce530..bf5656d79a55 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -261,7 +261,7 @@ usb2: usb2@21000 {
> =

>  			interrupt-parent =3D <&gic>;
> =

> -			ehci: ehci@21000 {
> +			ehci: usb@21000 {
>  				#usb-cells =3D <0>;
> =

>  				compatible =3D "generic-ehci";
> @@ -283,7 +283,7 @@ ehci_port2: port@2 {
>  				};
>  			};
> =

> -			ohci: ohci@22000 {
> +			ohci: usb@22000 {
>  				#usb-cells =3D <0>;
> =

>  				compatible =3D "generic-ohci";
> diff --git a/arch/arm/boot/dts/bcm53573.dtsi =

> b/arch/arm/boot/dts/bcm53573.dtsi
> index 4af8e3293cff..51546fccc616 100644
> --- a/arch/arm/boot/dts/bcm53573.dtsi
> +++ b/arch/arm/boot/dts/bcm53573.dtsi
> @@ -135,7 +135,7 @@ usb2: usb2@4000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> =

> -			ehci: ehci@4000 {
> +			ehci: usb@4000 {
>  				compatible =3D "generic-ehci";
>  				reg =3D <0x4000 0x1000>;
>  				interrupt-parent =3D <&gic>;
> @@ -155,7 +155,7 @@ ehci_port2: port@2 {
>  				};
>  			};
> =

> -			ohci: ohci@d000 {
> +			ohci: usb@d000 {
>  				#usb-cells =3D <0>;
> =

>  				compatible =3D "generic-ohci";
> diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi =

> b/arch/arm/boot/dts/hisi-x5hd2.dtsi
> index 3ee7967c202d..693b85b2cc7d 100644
> --- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
> +++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
> @@ -452,14 +452,14 @@ gmac1: ethernet@1841000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb0: ehci@1890000 {
> +		usb0: usb@1890000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x1890000 0x1000>;
>  			interrupts =3D <0 66 4>;
>  			clocks =3D <&clock HIX5HD2_USB_CLK>;
>  		};
> =

> -		usb1: ohci@1880000 {
> +		usb1: usb@1880000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x1880000 0x1000>;
>  			interrupts =3D <0 67 4>;
> diff --git a/arch/arm/boot/dts/lpc18xx.dtsi =

> b/arch/arm/boot/dts/lpc18xx.dtsi
> index 10b8249b8ab6..82ffd7b0ad8a 100644
> --- a/arch/arm/boot/dts/lpc18xx.dtsi
> +++ b/arch/arm/boot/dts/lpc18xx.dtsi
> @@ -121,7 +121,7 @@ mmcsd: mmcsd@40004000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb0: ehci@40006100 {
> +		usb0: usb@40006100 {
>  			compatible =3D "nxp,lpc1850-ehci", "generic-ehci";
>  			reg =3D <0x40006100 0x100>;
>  			interrupts =3D <8>;
> @@ -133,7 +133,7 @@ usb0: ehci@40006100 {
>  			status =3D "disabled";
>  		};
> =

> -		usb1: ehci@40007100 {
> +		usb1: usb@40007100 {
>  			compatible =3D "nxp,lpc1850-ehci", "generic-ehci";
>  			reg =3D <0x40007100 0x100>;
>  			interrupts =3D <9>;
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi =

> b/arch/arm/boot/dts/stm32mp151.dtsi
> index bfe29023fbd5..576f7da564c5 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1404,7 +1404,7 @@ ethernet0: ethernet@5800a000 {
>  			status =3D "disabled";
>  		};
> =

> -		usbh_ohci: usbh-ohci@5800c000 {
> +		usbh_ohci: usb@5800c000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x5800c000 0x1000>;
>  			clocks =3D <&rcc USBH>;
> @@ -1413,7 +1413,7 @@ usbh_ohci: usbh-ohci@5800c000 {
>  			status =3D "disabled";
>  		};
> =

> -		usbh_ehci: usbh-ehci@5800d000 {
> +		usbh_ehci: usb@5800d000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x5800d000 0x1000>;
>  			clocks =3D <&rcc USBH>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi =

> b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> index 12bc1d3ed424..a4acecb75c89 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> @@ -585,7 +585,7 @@ pcie: pcie@9860000 {
>  			status =3D "disabled";
>  		};
> =

> -		ohci: ohci@9880000 {
> +		ohci: usb@9880000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x9880000 0x10000>;
>  			interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> @@ -600,7 +600,7 @@ ohci: ohci@9880000 {
>  			status =3D "disabled";
>  		};
> =

> -		ehci: ehci@9890000 {
> +		ehci: usb@9890000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x9890000 0x10000>;
>  			interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi =

> b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> index 50ceaa959bdc..1226440d54ad 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
> @@ -373,7 +373,7 @@ refclk: refclk {
>  			#clock-cells =3D <0>;
>  		};
> =

> -		usb_ohci: ohci@a7030000 {
> +		usb_ohci: usb@a7030000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x0 0xa7030000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> @@ -382,7 +382,7 @@ usb_ohci: ohci@a7030000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb_ehci: ehci@a7020000 {
> +		usb_ehci: usb@a7020000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x0 0xa7020000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi =

> b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
> index 4773a533fce5..93f99a5255ac 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
> @@ -1253,7 +1253,7 @@ uart0: uart@602b0000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb_ohci: ohci@a7030000 {
> +		usb_ohci: usb@a7030000 {
>  			compatible =3D "generic-ohci";
>  			reg =3D <0x0 0xa7030000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> @@ -1262,7 +1262,7 @@ usb_ohci: ohci@a7030000 {
>  			status =3D "disabled";
>  		};
> =

> -		usb_ehci: ehci@a7020000 {
> +		usb_ehci: usb@a7020000 {
>  			compatible =3D "generic-ehci";
>  			reg =3D <0x0 0xa7020000 0x0 0x10000>;
>  			interrupt-parent =3D <&mbigen_usb>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi =

> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index 1520585c235c..b989ff62ffbc 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -281,7 +281,7 @@ dmac: dma-controller@13020000 {
>  		clocks =3D <&cgu JZ4740_CLK_DMA>;
>  	};
> =

> -	uhc: uhc@13030000 {
> +	uhc: usb@13030000 {
>  		compatible =3D "ingenic,jz4740-ohci", "generic-ohci";
>  		reg =3D <0x13030000 0x1000>;
> =

> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi =

> b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> index fa11ac950499..e45c03038826 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -417,7 +417,7 @@ dmac1: dma-controller@13420100 {
>  		interrupts =3D <23>;
>  	};
> =

> -	uhc: uhc@13430000 {
> +	uhc: usb@13430000 {
>  		compatible =3D "generic-ohci";
>  		reg =3D <0x13430000 0x1000>;
> =

> diff --git a/arch/mips/boot/dts/mti/sead3.dts =

> b/arch/mips/boot/dts/mti/sead3.dts
> index 192c26ff1d3d..1cf6728af8fe 100644
> --- a/arch/mips/boot/dts/mti/sead3.dts
> +++ b/arch/mips/boot/dts/mti/sead3.dts
> @@ -56,7 +56,7 @@ gic: interrupt-controller@1b1c0000 {
>  		interrupt-parent =3D <&cpu_intc>;
>  	};
> =

> -	ehci@1b200000 {
> +	usb@1b200000 {
>  		compatible =3D "generic-ehci";
>  		reg =3D <0x1b200000 0x1000>;
> =

> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi =

> b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> index 892e8ab863c5..45bf96a3d17a 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -275,7 +275,7 @@ usb_phy: usb-phy@10120000 {
>  		reset-names =3D "host", "device";
>  	};
> =

> -	ehci@101c0000 {
> +	usb@101c0000 {
>  		compatible =3D "generic-ehci";
>  		reg =3D <0x101c0000 0x1000>;
> =

> diff --git a/arch/powerpc/boot/dts/akebono.dts =

> b/arch/powerpc/boot/dts/akebono.dts
> index df18f8dc4642..343326c30380 100644
> --- a/arch/powerpc/boot/dts/akebono.dts
> +++ b/arch/powerpc/boot/dts/akebono.dts
> @@ -126,7 +126,7 @@ SATA0: sata@30000010000 {
>  			interrupts =3D <93 2>;
>  		};
> =

> -		EHCI0: ehci@30010000000 {
> +		EHCI0: usb@30010000000 {
>  			compatible =3D "ibm,476gtr-ehci", "generic-ehci";
>  			reg =3D <0x300 0x10000000 0x0 0x10000>;
>  			interrupt-parent =3D <&MPIC>;
> @@ -140,14 +140,14 @@ SD0: sd@30000000000 {
>  			interrupt-parent =3D <&MPIC>;
>  		};
> =

> -		OHCI0: ohci@30010010000 {
> +		OHCI0: usb@30010010000 {
>  			compatible =3D "ibm,476gtr-ohci", "generic-ohci";
>  			reg =3D <0x300 0x10010000 0x0 0x10000>;
>  			interrupt-parent =3D <&MPIC>;
>  			interrupts =3D <89 1>;
>  			};
> =

> -		OHCI1: ohci@30010020000 {
> +		OHCI1: usb@30010020000 {
>  			compatible =3D "ibm,476gtr-ohci", "generic-ohci";
>  			reg =3D <0x300 0x10020000 0x0 0x10000>;
>  			interrupt-parent =3D <&MPIC>;
> --
> 2.27.0
> =



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
