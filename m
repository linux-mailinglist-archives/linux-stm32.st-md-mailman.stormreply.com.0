Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B64904382
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 20:28:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51ACAC712A3;
	Tue, 11 Jun 2024 18:28:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0777BC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 18:28:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F139CE1C63;
 Tue, 11 Jun 2024 18:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03089C32786;
 Tue, 11 Jun 2024 18:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718130499;
 bh=M8VvlnlUjzh3Qu8nJHCfsOa6/1J5iwG41LtzZqxWHm8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HEOECfqEBC5j/q2OiERUKWFJxR5y54QbznP3jsIBdNaNGLfkfPxJk3GwHEudo/0ot
 UlWuOi2uMdo4qlZEvgsTV7JryMg8M0ZinRe2Vrv96KyeVDlgXvNVqaQgDODtrfIPTA
 8xIE/3HfiId0owOZZT6dUa45MYdbntPtGBAVYpWBHNOv6QdgRy5Vhvx4tMsYBWIljb
 AVd10qke6TVwR5/c+DF/qBROpQwATpYw0pt8/gzpoWB0Pj5ALNLceGg+TxtwX1L6U9
 JtUoNUxfLFT87J41+4ofil1xIidaBygDlD8C36pvaOdMYCSZ4hBK4Hfuy9uCZYqcVF
 RU4eY8awZh7Dg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20240531150712.2503554-1-amelie.delaunay@foss.st.com>
References: <20240531150712.2503554-1-amelie.delaunay@foss.st.com>
Message-Id: <171813049557.475662.12255622136346083429.b4-ty@kernel.org>
Date: Tue, 11 Jun 2024 23:58:15 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v4 00/12] Introduce STM32 DMA3
	support
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


On Fri, 31 May 2024 17:07:00 +0200, Amelie Delaunay wrote:
> STM32 DMA3 is a direct memory access controller with different features
> depending on its hardware configuration. It is either called LPDMA (Low
> Power), GPDMA (General Purpose) or HPDMA (High Performance), and it can
> be found in new STM32 MCUs and MPUs.
> 
> In STM32MP25 SoC [1], 3 HPDMAs and 1 LPDMA are embedded. Only HPDMAs are
> used by Linux.
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: dma: New directory for STM32 DMA controllers bindings
        commit: 8494ae75dde4495c73b7425543138d088133f75f
[02/12] dmaengine: stm32: New directory for STM32 DMA controllers drivers
        commit: 76178a2c49a7c01ef684b0d689f3da4fd12e0154
[03/12] MAINTAINERS: Add entry for STM32 DMA controllers drivers and documentation
        commit: 81d09bb5249e5f844ee342cc1419e97fc9108cda
[04/12] dt-bindings: dma: Document STM32 DMA3 controller bindings
        commit: a204f64d9f834bdf7085c617aed229eb7500e331
[05/12] dmaengine: Add STM32 DMA3 support
        commit: f561ec8b2b33da6a07cf211e43c8eb35b2dd97a2
[06/12] dmaengine: stm32-dma3: add DMA_CYCLIC capability
        commit: 08ea31024ab9cd512c4a897bd1afd2a5820c53e6
[07/12] dmaengine: stm32-dma3: add DMA_MEMCPY capability
        commit: b3b893a937764731c41423aab4cc0c1a6821e31e
[08/12] dmaengine: stm32-dma3: add device_pause and device_resume ops
        commit: b62a13071cffad03690ee19656248077cb388a14
[09/12] dmaengine: stm32-dma3: improve residue granularity
        commit: 2088473802ab9641114681bee92ba902bccdc19b
[10/12] dmaengine: add channel device name to channel registration
        commit: 10b8e0fd3f7234a38db2c8d2c8dec0bd6eeede44
[11/12] dmaengine: stm32-dma3: defer channel registration to specify channel name
        commit: 49b1c21ff815168eca44e81ab0612b1f00759efb

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
