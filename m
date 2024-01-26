Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D290183D598
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 10:10:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99278C6B477;
	Fri, 26 Jan 2024 09:10:55 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5C87C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 09:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=+cDUpkRwZoCkGrsowLN1EeXEXa9KYx2yEQLWfgGSS0g=; b=EBsO9U80tIz2vVWWhX2O2mkFeo
 W1/pNVUwN8m3YVj860izyitoW9TWdbGmhX/sequIUI5EJG8xKexT9iLopnmTSCvVA5DrNtluIyiXd
 9lCzil/59/i6zAbwa61oL50g5l7EtILCaP2mdOzt4epvtqYCS7M21MPiZFOfejEdycryxS8RB8DIE
 /VRdBMe7vyWo0mNERPbc77P2yHwW2v5WqMtnTyi5VOq7vAnbr/KIXEdTU9eNXEYh8ifZRxCsCtnlg
 4f6ZPk/ZGc+ALAb5CUedtTS/Jig6vEH3qOKW4TPm3FqFm3DmA/SUGxsVjx4xC3+lazDNCslNYbGih
 Yn5kBbXw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1rTIEX-000Gf6-In; Fri, 26 Jan 2024 10:10:45 +0100
Received: from [87.49.42.9] (helo=localhost)
 by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <esben@geanix.com>)
 id 1rTIEW-0004KL-6V; Fri, 26 Jan 2024 10:10:44 +0100
From: Esben Haabendal <esben@geanix.com>
To: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 26 Jan 2024 10:10:40 +0100
Message-ID: <cover.1706256158.git.esben@geanix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 "Abhishek Chauhan \(ABC\)" <quic_abchauha@quicinc.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] net: stmmac: dwmac-imx: Time Based
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
It achieves this in a similar manner that it is done in dwmac-intel.c,
dwmac-mediatek.c and stmmac_pci.c.

Changes since v1:

- Simplified for loop by starting at index 1.
- Fixed problem with indentation.


Esben Haabendal (2):
  net: stmmac: do not clear TBS enable bit on link up/down
  net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 2 files changed, 7 insertions(+)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
