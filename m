Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A6D043B1
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 17:13:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83776C8F284;
	Thu,  8 Jan 2026 16:13:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 041E4C8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 16:13:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C971C44365;
 Thu,  8 Jan 2026 16:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82124C116C6;
 Thu,  8 Jan 2026 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767888835;
 bh=UmQqqGxCtoML0TFTnsyx6uOawh78jvPvwr1IW3fraBg=;
 h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
 b=egbNkSitGtEcHBSEwQqD07FdV8haTfnFGpB1/o+ku9arLELZZZw/Jjc4ml1Tib0VI
 VWq56zmjZQHgLCp+h9vKEtVPpy3sReRUAFlOSMte+eOzN3bfWmQdowrzrPeYTBMGKv
 LX2kEC65RaiNN21cC8tQahEilgirOs186J0zsLCBLNNP7kEe4jw/n4z67rZegWN9GN
 9PjB2spPtoWQ1otRtp+PKrvIXSAWaKa2EyKbAmru/1TyMnCO32/GHUl3X2XMgW2nPA
 wQsRCpcG/3Q/vQR+GrHy97/Rt+CTrwbdyqK19LSn5T+6WntELTePyvQKhAZ+LTHq5P
 qfI+21uComC2g==
From: Rob Herring <robh@kernel.org>
Date: Thu, 08 Jan 2026 10:13:54 -0600
MIME-Version: 1.0
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
References: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
Message-Id: <176788870833.376387.4028010130652032446.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: nvmem: add STM32 TAMP
	NVRAM
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


On Wed, 07 Jan 2026 20:45:32 +0100, Dario Binacchi wrote:
> Add devicetree bindings for TAMP backup registers. These 32-bit
> registers are retained in all low-power modes and in VBAT mode. As a
> result, they can also be used to store sensitive data because their
> content is protected by a tamper detection circuit.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../bindings/nvmem/st,stm32-tamp-nvram.yaml   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
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


This patch series was applied (using b4) to base:
 Base: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20260107194541.1843999-1-dario.binacchi@amarulasolutions.com:

arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: tamp@46010000 (st,stm32-tamp): '#address-cells', '#size-cells', 'nvram@46010100', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: tamp@46010000 (st,stm32-tamp): '#address-cells', '#size-cells', 'nvram@46010100', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
