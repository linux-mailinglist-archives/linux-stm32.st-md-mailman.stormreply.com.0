Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6AF4310C1
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 08:43:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 148BFC5C847;
	Mon, 18 Oct 2021 06:43:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C305C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 06:43:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB27C608FE;
 Mon, 18 Oct 2021 06:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634539384;
 bh=HvA7sdtODjF605T2AShplSQpt01oLgTaIN5yUBN0Hn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/lwuF9vxQ4Pf/KlvCkqhisJ81nzGcwbB5Nng2HvyV+7ePw48c7mw2sYpUZQXKkE4
 EGHlbnXGR28vzSXt/KOQ2CpamAjI4WDXdweFqB6pSXrTIDsPStFkmb7LW4K2WDDwPF
 H/ftDwem1GQM/BxwfilDarMmlkFejJdRGUvmNzg1d5nRR1GW8wDf8aUbohDgbk94Bj
 dQMIQ+YtOIcWBKED5CqKzudlM+umDi32PLrzCBZ/c6xCW2yCCVxEev1Tz3lfVNpaBU
 E7r1BnHsD/f61lnKyyDJt0ab3JeZAic7rWoNnPGbpDKjsnDlQ5wtouJLJhqarVpfUw
 Su/dKfmzKbsRQ==
Date: Mon, 18 Oct 2021 12:13:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YW0XdFbiZztiJ8EN@matsya>
References: <20211011094259.315023-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211011094259.315023-1-amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] dmaengine: stm32-dma: some corner
	case fixes
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

On 11-10-21, 11:42, Amelie Delaunay wrote:
> This patchset brings some fixes to STM32 DMA driver.
> It fixes undefined behaviour of STM32 DMA controller when an unaligned address
> is used.
> It also prevents accidental repeated completion using dma_cookie_complete() in
> terminate_all().

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
