Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DB8AA0F52
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 16:44:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FE98C78F67;
	Tue, 29 Apr 2025 14:44:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3802CC78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 14:44:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 42BEE615CC;
 Tue, 29 Apr 2025 14:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14C7C4CEE3;
 Tue, 29 Apr 2025 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745937860;
 bh=4rr0S3mSjoui4D8DbAX2wTbORXf1cAmtg5M9HmjHuhU=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=d3YUk0Ov4iLTp8IvzNdV/ZNp8XRfU0tpb5oO11Ch7TeqYX980y0eKGMK/tSkiZdHG
 vKKfoEdkR1s+NYjN7a+AJ5LIM2s8BnXPc1k9zkOx3UAgsn7GdLXMskG8pcyMg6PZjr
 hnW+l0awaOZdLhL+FF6sOcWJBst8YDQPRSyQW//eEcvnLFRkEHcFbRJrI4NtMZ4/5s
 9oXWECSmFA4F6IcyherLCLXt/f8gFvTWDlZX+lIkLCg2rPK6y/rBhahA2HfK5II7y2
 TITnqai63Vv44JqE0pz38xD3AqDqqBaPCzJM4ILcDM3e08c2AK0fAgXs+F+HIJjvhE
 S2Zreml59gaJw==
Date: Tue, 29 Apr 2025 09:44:18 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
References: <20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com>
Message-Id: <174593770361.4057747.4332961101566967821.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 0/3] arm64: dts: st: Add SPI NOR
 support for stm32mp257f-ev1
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


On Mon, 28 Apr 2025 10:40:20 +0200, Patrice Chotard wrote:
> Add SPI NOR support for stm32mp257f-ev1 board by adding:
>   _ Octo memory Manager node in stm32mp251.dtsi
>   _ OSPI port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>   _ Add SPI NOR support for stm32mp257f-ev1.dts
> 
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Changes in v9:
>   - split patchset by susbsystem, current one include only DTS related
>     patches.
>   - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
> 
> ---
> Patrice Chotard (3):
>       arm64: dts: st: Add OMM node on stm32mp251
>       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
> 
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 54 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 32 ++++++++++++++++
>  3 files changed, 137 insertions(+)
> ---
> base-commit: 65954899a157832f68536b488194cf698248a26e
> change-id: 20250410-upstream_omm_ospi_dts-04b97cc02e52
> 
> Best regards,
> --
> Patrice Chotard <patrice.chotard@foss.st.com>
> 
> 
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
 Base: using specified base-commit 65954899a157832f68536b488194cf698248a26e

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: /soc@0/ommanager@40500000: failed to match any schema with compatible: ['st,stm32mp25-omm']
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/ommanager@40500000: failed to match any schema with compatible: ['st,stm32mp25-omm']
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: /soc@0/ommanager@40500000/spi@0: failed to match any schema with compatible: ['st,stm32mp25-ospi']
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/ommanager@40500000/spi@0: failed to match any schema with compatible: ['st,stm32mp25-ospi']
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: /soc@0/ommanager@40500000/spi@1: failed to match any schema with compatible: ['st,stm32mp25-ospi']
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/ommanager@40500000/spi@1: failed to match any schema with compatible: ['st,stm32mp25-ospi']





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
