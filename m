Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19C139FEE
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 04:26:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB92DC36B0D;
	Tue, 14 Jan 2020 03:26:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 712B4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 03:26:47 +0000 (UTC)
Received: from cakuba (c-73-93-4-247.hsd1.ca.comcast.net [73.93.4.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 299BA20CC7;
 Tue, 14 Jan 2020 03:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578972406;
 bh=K6QwoHZlKmBhi1HwYzE/vZ5jsixqOCwKPUF803F9Qxs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MOw/5NOJp9s0xnIQVt2/sEGGKIeo0Cyb1YDjbXSSkAiEBe36usdVrXv9v3vNsWHdp
 Lo9S42pGO0Awd1ZGkPJB02wF0w5FsKBNHdK5lR8g6TZWLQMD5lfU9992QlV/pbCxKP
 mtIW0MgAAVFt/IeLYY26xiacHbP42MkmI5ulPG38=
Date: Mon, 13 Jan 2020 19:26:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20200113192645.6b9f51d1@cakuba>
In-Reply-To: <cover.1578932287.git.Jose.Abreu@synopsys.com>
References: <cover.1578932287.git.Jose.Abreu@synopsys.com>
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/8] net: stmmac: ETF support
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

On Mon, 13 Jan 2020 17:24:08 +0100, Jose Abreu wrote:
> This series adds the support for ETF scheduler in stmmac.
> 
> 1) Starts adding the support by implementing Enhanced Descriptors in stmmac
> main core. This is needed for ETF feature in XGMAC and QoS cores.
> 
> 2) Integrates the ETF logic into stmmac TC core.
> 
> 3) and 4) adds the HW specific support for ETF in XGMAC and QoS cores. The
> IP feature is called TBS (Time Based Scheduling).
> 
> 5) Enables ETF in GMAC5 IPK PCI entry for all Queues except Queue 0.
> 
> 6) Adds the new TBS feature and even more information into the debugFS
> HW features file.
> 
> 7) Switches the selftests mechanism to use dev_direct_xmit() so that we can
> send packets on specific Queues.
> 
> 8) Adds a new test for TBS feature.

Applied, thank you!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
