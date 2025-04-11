Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB8DA8641A
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 19:09:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64020C78006;
	Fri, 11 Apr 2025 17:09:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86D2AC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 17:09:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4C44043BB9;
 Fri, 11 Apr 2025 17:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8125C4CEE2;
 Fri, 11 Apr 2025 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744391387;
 bh=CYf2lwADdkdY+jMx3e4q4vSSDlVFa9/AluyS7+Ilp+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HHD9ESS+Wwm07AxSNelkTJuvoioLtFD/zyYbdBJegPnHeWQW4ILRIfX810X/SF2Th
 mqBsyyHWBxewvFX8KzEphYORGbHG8XRsaZAQMKrSBUEEN/5EgNVLezQpNsIafBYo5Q
 M+96DadKU1NiZGtkOJLqQb7P8yyJ5CRFKnn70nzMl1NgXaOA0gJVydU9O0TEHelxbo
 OMBMgc/Oi7LMLXoNouhMUfIT614+1KptJAbBPCHzdRoZzlldf6xdYdZefJoYZ0a6bh
 ZAHfjBt/oj67vxnb22tW/XP1245yi7vOlGDIfSQ1M2nWeXkcyRg0iRJLbNyMY2u6cr
 mYLK13XvZDIJA==
Date: Fri, 11 Apr 2025 12:09:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <174439138531.3430719.4031301893879549125.robh@kernel.org>
References: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
 <20250410-upstream_ospi_v6-v9-1-cf119508848a@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410-upstream_ospi_v6-v9-1-cf119508848a@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 1/3] dt-bindings: memory-controllers:
 Add STM32 Octo Memory Manager controller
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


On Thu, 10 Apr 2025 11:27:42 +0200, Patrice Chotard wrote:
> Add bindings for STM32 Octo Memory Manager (OMM) controller.
> 
> OMM manages:
>   - the muxing between 2 OSPI busses and 2 output ports.
>     There are 4 possible muxing configurations:
>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>         output is on port 2
>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>         OSPI2 output is on port 1
>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>   - the split of the memory area shared between the 2 OSPI instances.
>   - chip select selection override.
>   - the time between 2 transactions in multiplexed mode.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 +++++++++++++++++++++
>  1 file changed, 226 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
