Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BAA9A9877
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 07:33:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C22D7C7801A;
	Tue, 22 Oct 2024 05:33:09 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD9DDC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 05:33:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ABAB1A43DD5;
 Tue, 22 Oct 2024 05:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08A9C4CEC3;
 Tue, 22 Oct 2024 05:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729575180;
 bh=+AXgSFYf9fdnrGNfDlq51aKCvpEV7kB6VjY09xwkUmk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HjuNVGeQZysJqJjvaKZIug4hYiox80wcdeGnF0bZvrNWkdIGo12QQx8xVXJ+NvEVs
 6da2iye9KGPFGXBP21DAEGsL7uDmLsZZHrWeN1UNVCbl8oSPi3osHSQwoUjctYbp5L
 YDENOR3bgthFy+eQRro1u5edvviTN1dpgQA3PrU3WqJGXo/IWJ+BIXi+uizPLznWg/
 itHmCWHdGBA3VtOI+6ArH6aE5z6MEiIRv+B25+fKXldrjNoPAqkiYAwfoeQz/zfEnb
 qWXilDDuxlXmOADPJvoIkU7f9AH8GQBc+aGKKnq4st1xIjYRFlyGgolz2CTKyBaONY
 p8YokfXdZuIUg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
References: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
Message-Id: <172957517754.489113.8907734005204192905.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:02:57 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH v3 0/9] STM32 DMA3 updates for
	STM32MP25
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


On Wed, 16 Oct 2024 14:39:52 +0200, Amelie Delaunay wrote:
> The HW version of STM32 DMA3 inside STM32MP25 requires some tunings to
> meet the needs of the interconnect. This series adds the linked list
> refactoring feature to have optimal performance when addressing the
> memory, and it adds the use of two new bits in the third cell specifying
> the DMA transfer requirements:
> - bit[16] to prevent packing/unpacking mode to avoid bytes loss in case
> of interrupting an ongoing transfer (e.g. UART RX),
> - bit[17] to prevent linked-list refactoring because some peripherals
> (e.g. FMC ECC) require a one-shot transfer, they trigger the DMA only
> once.
> It also adds platform data to clamp the burst length on AXI port,
> especially when it is interconnected to AXI3 bus, such as on STM32MP25.
> Finally this series also contains STM32MP25 device tree updates, to add
> DMA support on SPI, I2C, UART and apply the tunings introduced.
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: dma: stm32-dma3: prevent packing/unpacking mode
      commit: 689f05586e7ea620c8fc1066c067809e52ffc2f3
[2/9] dmaengine: stm32-dma3: prevent pack/unpack thanks to DT configuration
      commit: 12eb621e1abff65d89aeb4c92a4f3436225971d0
[3/9] dmaengine: stm32-dma3: refactor HW linked-list to optimize memory accesses
      commit: cb467c451163bacad4cbb7540ce7d731946f13f9
[4/9] dt-bindings: dma: stm32-dma3: prevent additional transfers
      commit: e18a9830233e739ae7045700232c53b4cb2e98eb
[5/9] dmaengine: stm32-dma3: prevent LL refactoring thanks to DT configuration
      commit: 2ff0fb9474eefa7149c199fb3f79e54355a6c184
[6/9] dmaengine: stm32-dma3: clamp AXI burst using match data
      commit: e713468e7c104a0598a7ec31ab7ec0bec94a174d

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
