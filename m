Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FE9339E27
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Mar 2021 14:18:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08B20C57195;
	Sat, 13 Mar 2021 13:18:36 +0000 (UTC)
Received: from the.earth.li (the.earth.li [93.93.131.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80C00C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Mar 2021 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
 s=the; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QOTdjy1PdYeDQ1fUENDrh0RtMG0coACWNQ4YsZbgl5w=; b=DeTr+9knNkPOvtIi2OlW73HS3t
 slxWRqQmC/Qd+tyDE8Lnj4oD+NFf5isDoaYYYhiPQ8iT/IOWEUz6DODzLTEBHd1WG9KYfSqzwFT70
 7pdoIUdBZOPtb0r/1WZqZHRog4L3uDDlSBHRkO6SaLFE0zu6nunAVePrw4XLLmC9bJGsxaEmVvJ4N
 zAgW5ejJ2lWOVgTIKSiBHTnLvkLbkSUT3inboIq/iEhEMGyBD8Zio1md1EU+8pQugFxwTmI5hqZ8M
 RBYRHIUBaaivkhOJptSZm3vns90mjlM/uDY69gA+jRAsvt2mhWRHSwLv8PJUZ5sB0SenvC1WcPH1S
 zAB6oEag==;
Received: from noodles by the.earth.li with local (Exim 4.92)
 (envelope-from <noodles@earth.li>)
 id 1lL49y-0004kB-SB; Sat, 13 Mar 2021 13:18:26 +0000
Date: Sat, 13 Mar 2021 13:18:26 +0000
From: Jonathan McDowell <noodles@earth.li>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <20210313131826.GA17553@earth.li>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: Set FIFO sizes for
	ipq806x
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

Commit eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
started using the TX FIFO size to verify what counts as a valid MTU
request for the stmmac driver.  This is unset for the ipq806x variant.
Looking at older patches for this it seems the RX + TXs buffers can be
up to 8k, so set appropriately.

(I sent this as an RFC patch in June last year, but received no replies.
I've been running with this on my hardware (a MikroTik RB3011) since
then with larger MTUs to support both the internal qca8k switch and
VLANs with no problems. Without the patch it's impossible to set the
larger MTU required to support this.)

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index bf3250e0e59c..749585fe6fc9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -352,6 +352,8 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = gmac;
 	plat_dat->fix_mac_speed = ipq806x_gmac_fix_mac_speed;
 	plat_dat->multicast_filter_bins = 0;
+	plat_dat->tx_fifo_size = 8192;
+	plat_dat->rx_fifo_size = 8192;
 
 	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (err)
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
