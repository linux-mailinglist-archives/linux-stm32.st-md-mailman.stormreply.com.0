Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3131242F6C
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Aug 2020 21:37:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 603D7C36B26;
	Wed, 12 Aug 2020 19:37:02 +0000 (UTC)
Received: from the.earth.li (the.earth.li [93.93.131.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D0BDC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
 s=the; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XqxBkx0fhTjErNZmjOmJ0k+Zy+sZA4pBOuNGrWDz6iI=; b=FMeEhwrV6De794yhR10herc21E
 qdQvLTi+Nv2G9VZkkbfSUyNa3hH/0pMw7ZcvxmIanCTJR/cygmyBgGNaGMG7O9ymJm4SBlC9RnefP
 8tXAq4QSkoI21sA2RFEMRQsyXdSRnpOUr4akPKkWNfzmCgNLP/zXN7M3DsWyRl6nErD+1O/IVKjap
 EJAMRIxdFe+I40ckS63WCjDzAwaSBqS7ImhQ4FAsKqK763DYrN1c2ZzKWxcHhKU8lM0a7t4g6gS00
 8t+GqPAoXn7pTPSQ7mFFT5QzAnUlBYUVlutQLETWTK4+2m//BBwBi9yQ+16e3ZfOIrRjeLTopfBk9
 drVXFmRw==;
Received: from noodles by the.earth.li with local (Exim 4.92)
 (envelope-from <noodles@earth.li>)
 id 1k5wYQ-0002nP-Bl; Wed, 12 Aug 2020 20:36:54 +0100
Date: Wed, 12 Aug 2020 20:36:54 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <cover.1597260787.git.noodles@earth.li>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Linux-stm32] [PATCH net 0/2] net: stmmac: Fix multicast filter on
	IPQ806x
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

This pair of patches are the result of discovering a failure to
correctly receive IPv6 multicast packets on such a device (in particular
DHCPv6 requests and RA solicitations). Putting the device into
promiscuous mode, or allmulti, both resulted in such packets correctly
being received. Examination of the vendor driver (nss-gmac from the
qsdk) shows that it does not enable the multicast filter and instead
falls back to allmulti.

Extend the base dwmac1000 driver to fall back when there's no suitable
hardware filter, and update the ipq806x platform to request this.

Jonathan McDowell (2):
  net: stmmac: dwmac1000: provide multicast filter fallback
  net: ethernet: stmmac: Disable hardware multicast filter

 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c  | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
