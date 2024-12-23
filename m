Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 909809FB3F4
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Dec 2024 19:23:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DEE0C78F65;
	Mon, 23 Dec 2024 18:23:09 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5A95C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 18:23:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8E9D9A40219;
 Mon, 23 Dec 2024 18:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B66C4CED4;
 Mon, 23 Dec 2024 18:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734978181;
 bh=dvic7CQvdaQvsQq9bVY/SP52KhgXeQuTCZCa+4u5Vno=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wq9mThRr+RpHKMktF0pHzR6SYDmsCgmKrcgnkf8IFOgc/SVMR4M1ilhnyRQoSA1BW
 v78XhBo9UWIaqW5pnr3UX4zrH5im99okLeoC7dXhimup5ad8YDgIjepvBN3mvv1j+P
 wLiSOlDv99IXYJnSkFbXGp/GtuwNWp3D6UjfdHhZ1DKVmcWJgLeRC+Q1L8xFISoBsD
 XYlTAwaLPyzV6wIbQGZJyOUF+09BNRgwOUv2iAsarWpy4XvX7zIzHHx+Tmio/NCMAA
 aa4bBEJrJe9R0421kkKF+3mcd53NW7iqpBibS++Fhog9LqvAMl1A30xraux7oBEQjc
 7HFEbAcYsseTA==
Date: Mon, 23 Dec 2024 10:22:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20241223102259.06661253@kernel.org>
In-Reply-To: <20241223005843.483805-1-inochiama@gmail.com>
References: <20241223005843.483805-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jose Abreu <joabreu@synopsys.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Inochi Amaoto <inochiama@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/3] riscv: sophgo: Add
 ethernet support for SG2044
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

On Mon, 23 Dec 2024 08:58:36 +0800 Inochi Amaoto wrote:
> The ethernet controller of SG2044 is Synopsys DesignWare IP with
> custom clock. Add glue layer for it.
> 
> Since v2, these patch depends on that following patch that provides
> helper function to compute rgmii clock, As for now, this patch is merged
> in net/for-next
> https://lore.kernel.org/netdev/173380743727.355055.17303486442146316315.git-patchwork-notify@kernel.org/

## Form letter - winter break

Networking development is suspended for winter holidays, until Jan 2nd.
We are currently accepting bug fixes only, see the announcements at:

https://lore.kernel.org/20241211164022.6a075d3a@kernel.org
https://lore.kernel.org/20241220182851.7acb6416@kernel.org

RFC patches sent for review only are welcome at any time.
-- 
pw-bot: defer
pv-bot: closed
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
