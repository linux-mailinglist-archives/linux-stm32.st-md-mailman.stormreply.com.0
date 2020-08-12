Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D6242F72
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Aug 2020 21:37:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EE05C36B26;
	Wed, 12 Aug 2020 19:37:30 +0000 (UTC)
Received: from the.earth.li (the.earth.li [93.93.131.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3E6DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Aug 2020 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
 s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
 :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HJVJVLdIn6uscZZTWFNIQe57B5+ja3f7KFs1Tp4MMSM=; b=PsXTMwmvNI7lIcug3RhqxVVlLt
 WMBcKEROq8WZRc63OTKT/2bz22c197pYzbazzhsOPU0yGKZNTo9heHSGia7m6rCIH8sJ/3Lfp+wUl
 VqjPhIH5qdNruG84Lo4L72xzAiN7gpkPYz0zKvDrnPQ4qvb6RymphyNo+hJXGwTcsOWe03I+L15oQ
 O5N4MWFkdRjcvvAlT8faZxpCwmOVgvDFFD29BI8OThjdw9UTh3d/rUzdsRMuVvbjcq0VXyeVoo96s
 ELtD99MccVnDk2NjfYjyDVXzcB2Owe88jo6aYOv7EaRYFkcZ0+ZMR5GpqqQpFaOdGWwGciONOKExb
 pbc1jeDw==;
Received: from noodles by the.earth.li with local (Exim 4.92)
 (envelope-from <noodles@earth.li>)
 id 1k5wYt-0002pQ-Ga; Wed, 12 Aug 2020 20:37:23 +0100
Date: Wed, 12 Aug 2020 20:37:23 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <dc3426bce09689ea2ba5b3a1937d6a77049089f1.1597260787.git.noodles@earth.li>
References: <cover.1597260787.git.noodles@earth.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597260787.git.noodles@earth.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Linux-stm32] [PATCH net 2/2] net: ethernet: stmmac: Disable
 hardware multicast filter
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

The IPQ806x does not appear to have a functional multicast ethernet
address filter. This was observed as a failure to correctly receive IPv6
packets on a LAN to the all stations address. Checking the vendor driver
shows that it does not attempt to enable the multicast filter and
instead falls back to receiving all multicast packets, internally
setting ALLMULTI.

Use the new fallback support in the dwmac1000 driver to correctly
achieve the same with the mainline IPQ806x driver. Confirmed to fix IPv6
functionality on an RB3011 router.

Cc: stable@vger.kernel.org
Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 02102c781a8c..bf3250e0e59c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -351,6 +351,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	plat_dat->has_gmac = true;
 	plat_dat->bsp_priv = gmac;
 	plat_dat->fix_mac_speed = ipq806x_gmac_fix_mac_speed;
+	plat_dat->multicast_filter_bins = 0;
 
 	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (err)
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
