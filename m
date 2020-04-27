Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB31BA9D5
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 18:10:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81E3DC36B0C;
	Mon, 27 Apr 2020 16:10:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F304C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 16:10:44 +0000 (UTC)
Received: from localhost (unknown [171.76.79.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2FC8205C9;
 Mon, 27 Apr 2020 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588003842;
 bh=6y+UP73Vxjpn15HNvNYlaPBEXH1uzwIZb3nl5q1GqOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aR1yAoAqwS+RgrXbE1AAsuiTXEZV7W92AcrPzeyict0PPlEUiEHKWRkvmzMO4oKO1
 8t1vZ23bc52pz9LNTyHP2+DXUHAnnbaSQ9r7UrlG/lPkXnZN2nk3zjzIC/SsQo75Oa
 DMs/H54jSMbM7I0mxVYOer0nm3Bobcrh/qb1G+S0=
Date: Mon, 27 Apr 2020 21:40:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200427161038.GJ56386@vkoul-mobl.Dlink>
References: <20200422102904.1448-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422102904.1448-1-amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Yves Mordret <pierre-yves.mordret@st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] STM32 DMA Direct mode
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

On 22-04-20, 12:29, Amelie Delaunay wrote:
> By default, the driver compute if the FIFO must operate in direct mode or with
> FIFO threshold. Direct mode is allowed only if computed source burst and
> destination burst are disabled. But with memory source or destination, burst
> is always > 0.
> Direct mode is useful when the peripheral requires an immediate and single
> transfer to or from the memory after each DMA request.
> This patchset adds a way to force Direct mode through device tree.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
