Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C0C4EAA5E
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 11:19:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2F60C5EC47;
	Tue, 29 Mar 2022 09:19:35 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1FAFC5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 09:19:34 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17680240012;
 Tue, 29 Mar 2022 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648545573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OYEQcpxV5ZoCImFdldnCROqjeYEuOqk5lTqs4xQNOw=;
 b=E0C2ytxPlV1W+Oe2MExHPN7L1HAoV5OikaBi/U7DewsMCqNtbPDqkZmi2EkEtqy1h9eSgE
 iiefcHj+RmgZ+f+Nhg1dBvgQLIyFkVMlqvsI0mQLoe4LXrWKzoi2/xC4DJe0nxuepZkThU
 FRyNwSRBCCVeRjb5oEYt0caD6HgzFm/e5R4zbhwmHQOWSB6a/GJnngaEUVODgCoYqdO+7g
 DcfNnSRhpGEP/dmCe7VL2vFiRtpk1xrIevN5WpjBBTppF28IllsoBjw5Ux75BSFoUNa40U
 iEy83TwJxTr5nOyIxsdHupHOzrfEzXzdR3N0Ts3ALvlLshPNCnGr1VoMVatfnA==
Date: Tue, 29 Mar 2022 11:19:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Message-ID: <YkLPIgwClJAUc1Uf@piout.net>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 28/03/2022 15:21:08+0200, Jonathan Neusch=E4fer wrote:
> On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> >  create mode 100644 arch/arm/boot/dts/freescale/Makefile
> =

> Freescale has been part of NXP for a while, so it might make sense to
> merge the freescale and nxp directories. I can't speak for
> NXP-the-company, so that's just my view as a bystander.
> =


Maybe we should wait for the market consolidation to end so we can put
all the files in a single subfolder?

this would save us from all the bikeshedding ;)

> >  create mode 100644 arch/arm/boot/dts/kirkwood/Makefile
> =

> The Kirkwood family should probably be sorted into Marvell.
> =

> >  create mode 100644 arch/arm/boot/dts/layerscape/Makefile
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-moxa-uc-8410a.dts =
(100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-qds.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-tsn.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-twr.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a.dtsi (100%)
> =

> The Layerscape family is part of Freescale/NXP.
> =

> >  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi
> =

> armv7-m.dtsi is a bit confusing, because it contains a few devices at
> fixed addresses, so it looks vendor-specific at a first glance into the
> file. However, if it is actually as vendor-neutral as the name implies,
> I think it should live dts/ directly, rather than in vendor
> subdirectories.
> =

> >  rename arch/arm/boot/dts/{ =3D> nxp}/lpc18xx.dtsi (100%)
> =

> Here we have the NXP LPCxxxx family, which is AFAIK unrelated to the
> i.MX family (and thus the bulk of the Freescale legacy).
> =

> >  create mode 100644 arch/arm/boot/dts/vybrid/Makefile
> =

> Vybrid is another chip family of NXP, with a good deal of Freescale
> legacy in it as evidenced by the "fsl," prefix in the devicetrees.
> =

> =

> =

> Thanks,
> Jonathan



> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
