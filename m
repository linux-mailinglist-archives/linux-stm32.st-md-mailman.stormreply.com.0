Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89551B1C7C1
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Aug 2025 16:40:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 484C4C3F933;
	Wed,  6 Aug 2025 14:40:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A26D1C36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Aug 2025 14:40:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9819745B14;
 Wed,  6 Aug 2025 14:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656DDC4CEEB;
 Wed,  6 Aug 2025 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754491232;
 bh=HUIQMF66FePlPJPI95nNDJ3aspbdARZuuJ251SnikDY=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=IskJItYmLX5jAxfvXhleCpKfKPoi3Vkbu7FwALAhjf8RypT/4QavaYWH5zCy5Ueem
 bJIgqpiyLjnsaMf9XCKTtGZdsh5R7kBqHa2CG5SG69O+SW2TEP9SQ1vWlNjW+WviTs
 BK2kqREG9emx/bW4dNggalAuQ/JtpWwK0eynay43oAN7oomekJjih61UR03g+V4DoO
 ji0vEIWQp9kAt1NSYGYdX/Y9/oginVWqdLtr56wageF1TO45IXzJf/mzJrlvoBNCtZ
 vEew0PzJ6iEYXXF0WHORm8aEArs+E7w/5cnokyiYS6HVvbMinfzmru9B8gBkkVAWHk
 +W4Eq0FkZM76Q==
Date: Wed, 06 Aug 2025 09:40:31 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com>
References: <20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com>
Message-Id: <175449112431.639622.3115502959226804810.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] arm64: dts: st: Add memory-region-names
 property for stm32mp257f-ev1
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


On Wed, 06 Aug 2025 10:09:35 +0200, Patrice Chotard wrote:
> Add memory-region-names property for stm32mp257f-ev1.
> This allows to identify and check memory-map area's configuration.
> 
> Cc: stable@vger.kernel.org
> Fixes: cad2492de91c ("arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 1 +
>  1 file changed, 1 insertion(+)
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
 Base: using specified base-commit 038d61fd642278bab63ee8ef722c50d10ab01e8f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: ommanager@40500000 (st,stm32mp25-omm): memory-region-names:0: 'mm_ospi1' is not one of ['ospi1', 'ospi2']
	from schema $id: http://devicetree.org/schemas/memory-controllers/st,stm32mp25-omm.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
