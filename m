Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1C3D8893
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jul 2021 09:10:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F69EC597AB;
	Wed, 28 Jul 2021 07:10:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4FB6CFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jul 2021 07:10:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F6A860F01;
 Wed, 28 Jul 2021 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627456203;
 bh=spLJJp0kWz4iiYPQWcebOS6VyUZYt/YL7QyUP4C3ddM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0laffxtaI1HhSySNQxdxufyAYMnAPLjZQZV49FZYIXIvj3UbgqWcdon+/gFdqQ1d
 pX5PaZzNCUHW+LCm3rUShTuC03O61V6p6ipvirO1n/mZvCUwVfCLZEJTyQU8yWYFwx
 Dw+3czxSk9Q6v6chLBuzyOhVJoKTXsgBjYLGpG9M6l3AZNcxKuLoCWcLFR7jYNi8v1
 C20765URrLmDb/mFtAlq6NbLYkEELeCG1ip8XyxAzd90AG7zKHJiDdhgLqGVVbksCc
 eF50NtP4Eb7iwcnEswfGKkctd1jM0Q56vSP8NNjWB2cd2ORu65yX7S0WaTzra02rg4
 Ey9/++NCxMelA==
Date: Wed, 28 Jul 2021 12:39:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YQECxSZqa9aHw6CB@matsya>
References: <20210624093959.142265-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624093959.142265-1-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] STM32 DMA alternative REQ/ACK
	protocol support
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

On 24-06-21, 11:39, Amelie Delaunay wrote:
> Default REQ/ACK protocol consists in maintaining ACK signal up to the
> removal of REQuest and the transfer completion.
> In case of alternative REQ/ACK protocol, ACK de-assertion does not wait the
> removal of the REQuest, but only the transfer completion.
> Due to a possible DMA stream lock when transferring data to/from STM32
> USART/UART, add support to select alternative REQ/ACK protocol.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
