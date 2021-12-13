Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5CF472376
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Dec 2021 10:05:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 506F3C5E2C6;
	Mon, 13 Dec 2021 09:05:10 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5617EC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 09:05:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0CD5B80D55;
 Mon, 13 Dec 2021 09:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B02C00446;
 Mon, 13 Dec 2021 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639386307;
 bh=p+M3T+RTwV57SMISSVPa/A0bgNo17ZpkMNetFBukon0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TT/2uFqPptvbZ9EQXca29KzXo3/v8Dcqhd/eq1R8kXPB/BkfNgVqNR6/gohyvC1hQ
 8Gf2ldpV4iX44ZjLsBOKmjlLzV/LyvU/8p+BDnS/RZtcMDt+i63D8Ja11PTHJ/9LDA
 lKbAeL9Nq9GIpcaenVIG3DZN2p26hasdsyCPx+yrVll8aU0ev8ygps/wIAdB/W50Q5
 x8kqZa4uYrVNWmOz+bvHdsmEI6JHZ1b1bF45OSuVHfBLCZvmPIEtjJ/XS198URKqiv
 uf3fJQb9SJvMSm3xSoK3hUVWFOVYsY+AumHpa8MHUOLJqiAv2nkU08YMlBUEQuxbr0
 DsTBNreOmMaMA==
Date: Mon, 13 Dec 2021 14:35:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <YbcMv4gqLoxIUohi@matsya>
References: <a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be>
 <36ceab242a594233dc7dc6f1dddb4ac32d1e846f.1637593297.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36ceab242a594233dc7dc6f1dddb4ac32d1e846f.1637593297.git.geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: Use bitfield
	helpers
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

On 22-11-21, 16:54, Geert Uytterhoeven wrote:
> Use the FIELD_{GET,PREP}() helpers, instead of defining custom macros
> implementing the same operations.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
