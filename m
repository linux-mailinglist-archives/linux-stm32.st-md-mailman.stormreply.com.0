Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F52D7997
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Dec 2020 16:43:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2CE9C3FADC;
	Fri, 11 Dec 2020 15:43:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD679C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Dec 2020 15:43:22 +0000 (UTC)
Date: Fri, 11 Dec 2020 21:13:16 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607701401;
 bh=FRBMjCg3FCwVVASnJpRiHWLuuSl0y2YodCYJbNsoGdU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=L0DrGVs/u68kbw5sOCkD0vCmo/IVJESNaporahpgBslAFXbA6t2u3Ra+pYUAHqbq2
 P10xkJrsBev1j4A760lWxp6j96Lfz98k75rIu28Nz7U38MJDeEfOQ0qL8gtdHvtm67
 chAwtqoNhfYBPmc/JcN++wDybvNy8scRamNAeur1TSOINFn+F74MC3DT1HWeImkYDM
 1gt7taHHbwszM1bk6pKsmyb/ad03pwugBgXXrCzyd8FrA7mtGiHSwdSUNUhqLnku8n
 G01np4tE1lEx03JuNQra94FixpWAnoCHd+GDZg4fUKDQysXOI4vhoTUgaAijU7nJBg
 Dd2ChKc5Q7u4g==
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201211154316.GY8403@vkoul-mobl>
References: <20201120143320.30367-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120143320.30367-1-amelie.delaunay@st.com>
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] Bunch of improvements for STM32 DMA
	controllers
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

On 20-11-20, 15:33, Amelie Delaunay wrote:
> This series brings 3 patches for STM32 DMA and 1 for STM32 MDMA.
> They increase the reliability and the efficiency of the transfers.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
