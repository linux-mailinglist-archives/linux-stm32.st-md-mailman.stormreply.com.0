Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E679B0365
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 15:08:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BD6CC6DD9D;
	Fri, 25 Oct 2024 13:08:33 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35CA4C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 13:08:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27C0FA42EEA;
 Fri, 25 Oct 2024 13:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABB4C4CEC3;
 Fri, 25 Oct 2024 13:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729861704;
 bh=MNxUl9WMfTQw3iIJsYXFRVHGk0K9abiM55dYNFiK5e0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PLuVuWRItR+u7EjCXA0r2R1yl+hrN7eOVg2JORS94Y04yKk+Ixm+Vqh096eL8VhvJ
 fP81fSfZTeqaQKaJEqTCl/5xxvCTN1wGqura+LhwxR+o1TJMH9P2DO7iqEGgYwfWFD
 kWvsXEHLQg9axqXHm9GLXlHi/1hwmAbte+wpH7UQNzxu6tkchcpWJPivy3PdyFoeda
 k8NnKNuPvOclEXju8nDiTV2ZqpL/qRrvj/+pv3hWZy1jtziKnLgZwsMttvRy9rc/xO
 3VujCfFxoOy+tC/rwSEjJw7sg52VASkFvNdGwGyMwQrq9aqRzR8HkXDTdfiTS9NWjQ
 tF9ocPkWMKh/w==
Date: Fri, 25 Oct 2024 14:08:17 +0100
From: Simon Horman <horms@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20241025130817.GU1202098@kernel.org>
References: <20241025011000.244350-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025011000.244350-1-inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] riscv: sophgo: Add ethernet
	support for SG2044
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

On Fri, Oct 25, 2024 at 09:09:56AM +0800, Inochi Amaoto wrote:
> The ethernet controller of SG2044 is Synopsys DesignWare IP with
> custom clock. Add glue layer for it.
> 
> Since v2, these patch depends on that following patch that provides
> helper function to compute rgmii clock:
> https://lore.kernel.org/netdev/20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com/

For future reference: patchsets for Networking, which have
not-yet-in-tree dependancies should be marked as an RFC.
Our CI doesn't know how to handle these and we don't have
a mechanism to re-run it once the dependencies are present:
the patchset needs to be sent again.

Also, I'm assuming this patch-set is targeted at net-next.
If so, that should be included in the subject like this:

  [PATCH net-next vX] ...

I would wait for review before posting any updated patchset.

Thanks!

...

-- 
pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
