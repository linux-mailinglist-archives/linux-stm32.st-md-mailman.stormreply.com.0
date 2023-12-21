Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF081C07A
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 22:51:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEA05C6B477;
	Thu, 21 Dec 2023 21:51:46 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA14CC6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 21:51:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0D95ACE210F;
 Thu, 21 Dec 2023 21:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29B9C433C9;
 Thu, 21 Dec 2023 21:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703195502;
 bh=wVhTpALcMiNCntelNMpcmyS353uCxC0tr69XZxUeP7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=grvlhMPdSPsEsMrM435z6Ee777r4kKrlEfU5VJO4IHAn4V7pnANe2YaPn9yqlGBHg
 U7IjIExcXlK1D9VjptD8QyQ+42pMJbqVtaZr9Lh6/W9NcKiHa/4Pi1lg/vqCN4EdnL
 6kO0lUSi+dNbPKTQgm7u7+8N5icMjEm+Xx0mdV8DwQ4PENu1D0ga/Kb1YDb+J4XM0f
 ANsuXOYE3cY800vWiRTMZq07yWnLPeaBKYK201IO8zMr9PmgVqaDHP5agM0fLCgIzx
 SLr/TsqKDLJRLArQCYcVOAdjwxzBrLiXnruS1js2v2YjfWlxH3LNi3VupaDmJHLxBr
 igbLYfklcAyjA==
Received: (nullmailer pid 153686 invoked by uid 1000);
 Thu, 21 Dec 2023 21:51:38 -0000
Date: Thu, 21 Dec 2023 15:51:38 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <170319549389.153568.1692332156021513651.robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-2-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-2-gatien.chevallier@foss.st.com>
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
	catalin.marinas@arm.com, edumazet@google.com,
	linux-i2c@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-phy@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com, andi.shyti@kernel.org,
	lars@metafoo.de, herbert@gondor.apana.org.au,
	hugues.fruchet@foss.st.com, lee@kernel.org,
	linux-arm-kernel@lists.infradea, linux-serial@vger.kernel.org,
	d.org@stm-ict-prod-mailman-01.stormreply.prv, pabeni@redhat.com,
	wg@grandegger.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	peng.fan@oss.nxp.com, will@kernel.org, richardcochran@gmail.com,
	robh+dt@kernel.org, mkl@pengutronix.de, kuba@kernel.org,
	mchehab@kernel.org, arnd@kernel.org, rcsekar@samsung.com,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
	linux-crypto@vger.kernel.org, gregkh@linuxfoundation.org,
	dmaengine@vger.kernel.org, davem@davemloft.net, jic23@kernel.org,
	Oleksii_Moisieiev@epam.com
Subject: Re: [Linux-stm32] [PATCH v8 01/13] dt-bindings: document generic
	access controllers
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


On Tue, 12 Dec 2023 16:23:44 +0100, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the generic access controllers bindings for the
> access controller provider and consumer devices. Those bindings are
> intended to allow a better handling of accesses to resources in a
> hardware architecture supporting several compartments.
> 
> This patch is based on [1]. It is integrated in this patchset as it
> provides a use-case for it.
> 
> Diffs with [1]:
> 	- Rename feature-domain* properties to access-control* to narrow
> 	  down the scope of the binding
> 	- YAML errors and typos corrected.
> 	- Example updated
> 	- Some rephrasing in the binding description
> 
> [1]: https://lore.kernel.org/lkml/0c0a82bb-18ae-d057-562b
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
> 	- Renamed access-controller to access-controllers
> 	- Example updated
> 	- Removal of access-control-provider property
> 
> Changes in V5:
> 	- Diffs with [1]
> 	- Discarded the [IGNORE] tag as the patch is now part of the
> 	  patchset
> 
>  .../access-controllers.yaml                   | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
