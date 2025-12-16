Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B77BFCCAE1F
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 09:29:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75D53C597BF;
	Thu, 18 Dec 2025 08:29:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFF69C01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 16:59:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E3744445E;
 Tue, 16 Dec 2025 16:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271B2C113D0;
 Tue, 16 Dec 2025 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765904378;
 bh=gd+LVa87L/5nacGvsTeXMVlyPGvTYEgI4GD5mnHFym4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SawhsF5Z8Opq5ci/eYR4Rhimoaj2sOV6bMBRWp2yZc1kDiZ9XZ6x2Dg55b5hHWmKp
 J8aRJW9t1r7z9v5KmsFRmWeK9ptRwCY/QWR3TmJUxP9QWBnUJMyLa/16b4uiEj6Kkv
 TWir+yna+KjIfypWOZZ3N+3v1qZHYz9oEX8ZtZjMCqjdUu6mO+zRjWUhckx7zE5bqx
 gzRH2HXt/coLotsD6wCyqX7Dupzu7CNSgPccI6PW2Rtm8/7kNekoXxlr2wEq+DGrDz
 YEwCFlgINAufvzeFR23L4DrHp9v4/i89z/MfhXx/L9AQEU4fn5KHXkgSdWL8/Kp0uC
 /JMnV472mBsEQ==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20251121-dma3_improv-v2-0-76a207b13ea6@foss.st.com>
References: <20251121-dma3_improv-v2-0-76a207b13ea6@foss.st.com>
Message-Id: <176590437579.430148.12860558109000484739.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 22:29:35 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Mailman-Approved-At: Thu, 18 Dec 2025 08:29:28 +0000
Cc: dmaengine@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] dmaengine: stm32-dma3:
 improvements and helper functions
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


On Fri, 21 Nov 2025 14:36:55 +0100, Amelie Delaunay wrote:
> This series introduces improvements and helper functions for channel
> and driver management.
> 
> It enables proper unloading of the stm32_dma3 module, replacing the
> previous subsys_initcall() mechanism with module_plaform_driver().
> 
> It introduces helper functions to take and release the channel semaphore,
> and restores the semaphore state on resume, considering the possible
> reset of CxSEMCR register during suspend.
> 
> [...]

Applied, thanks!

[1/4] dmaengine: stm32-dma3: use module_platform_driver
      commit: 0d41ed4ea496fabbb4dc21171e32d9a924c2a661
[2/4] dmaengine: stm32-dma3: introduce channel semaphore helpers
      commit: d26eb4a75a4a2bbf27305e62ad82cedf5f8c577c
[3/4] dmaengine: stm32-dma3: restore channel semaphore status after suspend
      commit: dea737e31c2c62df5a45871bfb4ceb90a112dbd8
[4/4] dmaengine: stm32-dma3: introduce ddata2dev helper
      commit: 8be4f3cbe263d22053d7afea4efee2e7178eee21

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
