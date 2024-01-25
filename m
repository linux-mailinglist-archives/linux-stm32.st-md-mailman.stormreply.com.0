Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AACD83C296
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 13:34:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9471C6B476;
	Thu, 25 Jan 2024 12:34:39 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D553DC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=sqde1eKqHsDxcHA0c/L4ft5EXdAFyz1gweX/+ObrMwk=; b=C4uh51dX/XlieJ7zgcfHMe5mcN
 D8vNmk2uDCQERTOxpyxoTZHeumltyyRkGjjR1sqbJRFuMD1DHu1xVFiHDeS6PgmREtdVdFqR/x1VO
 NxRlLIBZSLzMBZM1e9ST8I+0fN3dQvMhKFsy7RBt3N3c6h+LuHfEZ9YqTb3Yj3okgSo4Hwnx4XzcM
 ONKCH1hwNpVm8daIJEZ9i/u75L85PdldC+dxMyKofRdn4cUQWfwZqc/gkLLBWRX/aubRFbiFnnWzJ
 BEJQejfpXwO7RTO6vJ52ilUe8WjJb4ag9PKC5sWFa/g7nU32tOWy7A3gC13/LtUohrfcQEz7IY1lF
 k4bnULJA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1rSywG-0007Pw-Hb; Thu, 25 Jan 2024 13:34:36 +0100
Received: from [185.17.218.86] (helo=localhost)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <esben@geanix.com>)
 id 1rSywF-000258-JO; Thu, 25 Jan 2024 13:34:35 +0100
From: Esben Haabendal <esben@geanix.com>
To: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Date: Thu, 25 Jan 2024 13:34:32 +0100
Message-ID: 
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] net: stmmac: dwmac-imx: Time Based
	Scheduling support
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

This small patch series allows using TBS support of the i.MX Ethernet QOS
controller for etf qdisc offload.

It is a rework of
https://lore.kernel.org/all/20240124-reptilian-icing-a95b20f123be@spud/T/

Changes since previous series:

- Changed from using a devicetree binding for configuring TBS support to enable
  it for all TX queues on supported i.MX Ethernet QOS controller. Other stmmac
  controllers with TBS support will need to be updated with similar changes.

Esben Haabendal (2):
  net: stmmac: do not clear TBS enable bit on link up/down
  net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 6 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 2 files changed, 9 insertions(+)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
