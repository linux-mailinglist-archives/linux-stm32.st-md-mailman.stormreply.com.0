Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0789AA48EAD
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 03:35:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A52BECFAC47;
	Fri, 28 Feb 2025 02:35:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDAACCFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 02:35:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 63AE1612E1;
 Fri, 28 Feb 2025 02:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E87C4CEDD;
 Fri, 28 Feb 2025 02:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740710147;
 bh=mPYw4QtWI6b6bDDohPnfGl05s5iuP5VCTsCxQaqOyug=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jmMjitD8MqAkQdJCrpH+yb2ZxSj8PoHtWyuVi+skqgrhC6ZsN3oeGtzNuCPWU8qav
 zEl4D/HDfuzf+Sa98HT0ZvZzBapAJt2XI0Kqxep7tI59wF4hCrT7LlJjTDr5AaN4aw
 E5ayk3NKMZfmjmREG+tHx+wqGFazG79fThpFTs4N1wdakDR+MUr/1G+A6GWdVDUbQV
 AdRBoZxSdGnIA9/FMnmbWDQEQkfBy8Wj5zOKDrTIp1kngbmor7OnZkbVsCi9n21JCU
 b5p8lEHBQ/yGgVTBkh08Zp9YGlNbDhOfVihj2w2yoNQaQ1b6Fleu1hj4yu5MEMAVJT
 EyQEwxqBVUQmw==
Date: Thu, 27 Feb 2025 18:35:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Message-ID: <20250227183545.0848dd61@kernel.org>
In-Reply-To: <20250226085208.97891-2-phasta@kernel.org>
References: <20250226085208.97891-1-phasta@kernel.org>
 <20250226085208.97891-2-phasta@kernel.org>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 Yanteng Si <si.yanteng@linux.dev>, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>, netdev@vger.kernel.org,
 Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Henry Chen <chenx97@aosc.io>,
 Qing Zhang <zhangqing@loongson.cn>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/4] stmmac: loongson: Pass
 correct arg to PCI function
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

On Wed, 26 Feb 2025 09:52:05 +0100 Philipp Stanner wrote:
> pcim_iomap_regions() should receive the driver's name as its third
> parameter, not the PCI device's name.
> 
> Define the driver name with a macro and use it at the appropriate
> places, including pcim_iomap_regions().
> 
> Cc: stable@vger.kernel.org # v5.14+
> Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")

Since you sent this as a fix (which.. yea.. I guess.. why not..)
I'll apply it to the fixes tree. But then the other patches have 
to wait and be reposted next Thu. The fixes are merged with net-next
every Thu, but since this series was tagged as net-next I missed
it in today's cross merge :(
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
