Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F186D8D37
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 04:04:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1B29C6A616;
	Thu,  6 Apr 2023 02:04:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38A67C6A612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 02:04:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 073B762BE7;
 Thu,  6 Apr 2023 02:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9081FC433EF;
 Thu,  6 Apr 2023 02:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680746671;
 bh=OWM5Ic08/5NmNu4rDAFXtBjTzY74EnIlq8Hi/M/ZYic=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vc90SRI2/ojalG9Je7bD5EXyHKPENJVUsI0rtT5KKGA8wIKFLtrelVW73ISQkDyCp
 Uet5tOVeYMYnctEWX0w8dJ4UungplvvahNx1oAjtrz1KlmSk2HfqqvjfSsmx2PMxb6
 9q4XriG8yFTAzd0UC28ipfU0AZpBRygRvf7zQ8EPSqSHlXIc6MWcGV7zPdsjrfH6im
 P/73CRK1wcUEMepOfrjntzhMWGDe3ZOxFZgr3nfBKicBnj5zD3/E8Bti9276s0OHnU
 Rum6usFt+2rZeVbI6yNyOH1pfnL6xzxzcXJlAac29mzN/PT8x6glp1Ip8ZCOtKvEqb
 P5axvM37A2XWQ==
Date: Wed, 5 Apr 2023 19:04:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Message-ID: <20230405190429.5db41f58@kernel.org>
In-Reply-To: <20230406014004.3726672-1-yoong.siang.song@intel.com>
References: <20230406014004.3726672-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Alexander Duyck <alexanderduyck@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, stable@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Christian Marangi <ansuelsmth@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S
 . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: Add queue reset
 into stmmac_xdp_open() function
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

On Thu,  6 Apr 2023 09:40:04 +0800 Song Yoong Siang wrote:
> v2: Add reviewed-by tag

You don't have to repost to add tags, maintainers will collect 
the tags sent to the list when applying the patch. I'm taking v1.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
