Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C8C382BCB
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 14:08:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04FFAC5978F;
	Mon, 17 May 2021 12:08:33 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2654BC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 18:41:00 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id b17so35764719ede.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 11:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1j2CjgQxW57TkMOuAnVDHfqnEQcNfSuPJZQGVnmFSJA=;
 b=D4I3SeAiSLVFkEsd780WKd5sgldEwrPmFt1ve4FSpwAUf521FR3BNiQDkFTpCT0pfy
 4rrroOYi4SxzDXmbyhZpMHkw4V9hYhKqN7NuCZcwJOlDYP7XysrcVtSi7pBpEhCTp0oj
 e8awbrpUmkohPdBkAinMB3mGnLOrH3vMVijv/IzlOCIsIe/PWhkg+nHbu9ib12euZMmy
 hSprGS6wDEDZ1b2+9Miy4GoTY6Dhsl8u3iOOTgd5nNygB2fHQZtXWl/etoMA3BbbHuPK
 kgqYoy7bgBkG/TAVf8YNAAr55Urx1pgDeFbxTYOws04dsD7Tv97kqCFqUB5sHq3e7Jh2
 n1iw==
X-Gm-Message-State: AOAM530IbBTOBVUWb4F7C4t7t2HOLzG0doinQxLwt1GKb5DloNZM1Y5B
 lvcm5hVxU2cYpUDSaf39qo4=
X-Google-Smtp-Source: ABdhPJyxTNKn6+GyJPbWrzuE82v4D4fgdRH1Pr1QrTsEjU4XnM0G1aa5z5Rgrt8LmwOzr3dkOMs5Pw==
X-Received: by 2002:a50:9f6b:: with SMTP id b98mr6260005edf.318.1621017659634; 
 Fri, 14 May 2021 11:40:59 -0700 (PDT)
Received: from turbo.teknoraver.net (net-5-94-253-60.cust.vodafonedsl.it.
 [5.94.253.60])
 by smtp.gmail.com with ESMTPSA id dj17sm5081505edb.7.2021.05.14.11.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:40:59 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Fri, 14 May 2021 20:39:53 +0200
Message-Id: <20210514183954.7129-3-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514183954.7129-1-mcroce@linux.microsoft.com>
References: <20210514183954.7129-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 May 2021 12:08:30 +0000
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 2/3] igc: use XDP helpers
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

From: Matteo Croce <mcroce@microsoft.com>

Make use of the xdp_{init,prepare}_buff() helpers instead of
an open-coded version.

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 069471b7ffb0..92c0701e2a36 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -2151,12 +2151,9 @@ static int igc_clean_rx_irq(struct igc_q_vector *q_vector, const int budget)
 		}
 
 		if (!skb) {
-			xdp.data = pktbuf + pkt_offset;
-			xdp.data_end = xdp.data + size;
-			xdp.data_hard_start = pktbuf - igc_rx_offset(rx_ring);
-			xdp_set_data_meta_invalid(&xdp);
-			xdp.frame_sz = truesize;
-			xdp.rxq = &rx_ring->xdp_rxq;
+			xdp_init_buff(&xdp, truesize, &rx_ring->xdp_rxq);
+			xdp_prepare_buff(&xdp, pktbuf - igc_rx_offset(rx_ring),
+					 igc_rx_offset(rx_ring) + pkt_offset, size, false);
 
 			skb = igc_xdp_run_prog(adapter, &xdp);
 		}
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
