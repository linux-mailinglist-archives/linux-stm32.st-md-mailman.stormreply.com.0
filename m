Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CE39491DB
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 15:43:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30C9DC71290;
	Tue,  6 Aug 2024 13:43:54 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBC10C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 13:43:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 49A08CE0A15;
 Tue,  6 Aug 2024 13:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6082DC32786;
 Tue,  6 Aug 2024 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722951824;
 bh=jLZ8/crj4eIQwfYXP+sNMTE8scOkvbmNX5FsTSwedS8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=uATHyePtxkmuWED1PZfsxldEPKpj9cUVGy85ZA63fEyikFo/BXh9daSthWYIMHeHp
 FfUIkVuewHYAGJZKproVZ/LNoCQ3/tV5gRlnZ+8DxpPYWkpe9MG9Fr0dp39APZpbsk
 PIxugFjWdwgQ7UxOnwuX9ekE14dmByUUYysy0Ds7exflE0bDk/dzFAmVfM65d+MztZ
 dEK1h5uH43FZtQEc3L9Bqa1ISDc11y3uzV3KBhaG6nyFGsM7ptE7fxGYABZ8sRWgy9
 HTH4KEE8ah8wZxe6ipsnqjvupeU+gSKPP1yWcuIK73kzQS1joom8mDcGJSuu1fkQWP
 l1ICY8c9PR7rg==
Date: Tue, 06 Aug 2024 07:43:43 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
In-Reply-To: <20240806120332.405064-1-o.rempel@pengutronix.de>
References: <20240806120332.405064-1-o.rempel@pengutronix.de>
Message-Id: <172295171745.1220395.8839837354648720418.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Jander <david@protonic.nl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] arm: dts: st: Add MECIO1 and MECT1S
	board variants
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


On Tue, 06 Aug 2024 14:03:32 +0200, Oleksij Rempel wrote:
> From: David Jander <david@protonic.nl>
> 
> Introduce device tree support for the MECIO1 and MECT1S board variants.
> MECIO1 is an I/O and motor control board used in blood sample analysis
> machines. MECT1S is a 1000Base-T1 switch for internal machine networks
> of blood sample analysis machines.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/arm/stm32/stm32.yaml  |   8 +
>  arch/arm/boot/dts/st/Makefile                 |   3 +
>  arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts |  48 ++
>  arch/arm/boot/dts/st/stm32mp151c-mect1s.dts   | 297 ++++++++++
>  arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts |  48 ++
>  .../arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi | 533 ++++++++++++++++++
>  6 files changed, 937 insertions(+)
>  create mode 100644 arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts
>  create mode 100644 arch/arm/boot/dts/st/stm32mp151c-mect1s.dts
>  create mode 100644 arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts
>  create mode 100644 arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y st/stm32mp151c-mecio1r0.dtb st/stm32mp151c-mect1s.dtb st/stm32mp153c-mecio1r1.dtb' for 20240806120332.405064-1-o.rempel@pengutronix.de:

arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: switch@0: Unevaluated properties are not allowed ('reset-gpios' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
