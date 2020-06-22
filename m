Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 786622049DD
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2020 08:27:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D895C36B0C;
	Tue, 23 Jun 2020 06:27:05 +0000 (UTC)
Received: from the.earth.li (the.earth.li [93.93.131.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A107DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
 s=the; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CHDPQRCF8RcUn1ZfKaD8qjSY2WQnALFRzpAXrVpnKI0=; b=izC/D2DnG2aP9tepJ2H+BFC2Ug
 JmxyKdCL6mkil1f9KdbZtEzf5zpYswLlpRJdw6bFUlydhcq9hcCKGr58lrKn99BiLzNLAxb4V8TGi
 rEvMoKFqE0s/Q0GTDTx7WpJkwBjtQjlh6R3qwswx2zaL73Ds6QhadbawwNTxdbZ9dpfSeOIi/oOT8
 mBIQOfrjgxfsU44yloKOvNlwGRqYQtp+u4Zwrbpl8ZvjRxg/uC0oXKgcWsdEXdD/yUdeiiCg0YH96
 WHR7QVCiY9J5wGPv2B06iVP4ArqXPlyUFtxocDOubenxs7phzDiTanRq7cN7Zz1XZ8kOFNEV6ZGCW
 6CYixE6Q==;
Received: from noodles by the.earth.li with local (Exim 4.92)
 (envelope-from <noodles@earth.li>)
 id 1jnRCO-00020W-KS; Mon, 22 Jun 2020 19:29:40 +0100
Date: Mon, 22 Jun 2020 19:29:40 +0100
From: Jonathan McDowell <noodles@earth.li>
To: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mathieu Olivari <mathieu@codeaurora.org>
Message-ID: <20200622182940.GA6991@earth.li>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 23 Jun 2020 06:27:04 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH] net: stmmac: Set FIFO sizes for ipq806x
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

(This is an RFC in the hope someone with better knowledge of the
Qualcomm IPQ806x hardware can confirm 8k is the correct FIFO depth. I've
plucked that value from the MikroTik kernel patch, and it works for me,
and 0 definitely isn't the right value.)

Commit eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
started using the TX FIFO size to verify what counts as a valid MTU
request for the stmmac driver.  This is unset for the ipq806x variant.
Looking at older patches for this it seems the RX + TX buffers can be
up to 8k, so set appropriately.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 02102c781a8c..546b37ebd3b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -351,6 +351,8 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	plat_dat->has_gmac = true;
 	plat_dat->bsp_priv = gmac;
 	plat_dat->fix_mac_speed = ipq806x_gmac_fix_mac_speed;
+	plat_dat->tx_fifo_size = 8192;
+	plat_dat->rx_fifo_size = 8192;
 
 	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (err)
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
