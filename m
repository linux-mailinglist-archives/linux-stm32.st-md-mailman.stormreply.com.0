Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEE382BCA
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 14:08:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0636C58D7F;
	Mon, 17 May 2021 12:08:32 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EA60C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 18:40:37 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id a25so11612335edr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 11:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y4MTLt5TFZRdEBttrmfCcK1QF/TJDQ6Lo2hOuLadKIY=;
 b=qt9nkmfSVPjTcppCsiyYxyUoUybfOGx66iRVOEmSgnZIvizra7zSi9h/9QEUgdB+cv
 t8uz+k896GG9XsYzz3AHg3hJLBfUzpFh651ougaqsrFaQUhHMb6QfDXbrF73oPLMSOxb
 OSjdnHrs5cqEA0txV8NJghTDsjB6B+4ej63zINIlFH5U38TsberRPZJ72oViZfsqpSNC
 tMrmfKeaS1U/rKrzKOPLe/eGeWBRjPxBL00vOZs4GSPslS24NqDAI+rlyiCl8C2wa5Hn
 smDNwiqnLedkAJjXaoaejTLKC5F6gK86dZOJ2ohJvAfBWbsf9fD7FtRRMLlo/q8ZAe+r
 z2Lw==
X-Gm-Message-State: AOAM5300V/xHn/UQJ4EydOzGdxs0+Z6lSzyUPvwZM4AKuo7BH+fAB84N
 hViRHII8PV3K7xTmxT46GhU=
X-Google-Smtp-Source: ABdhPJztVPeeFds+ovfXgi5hiN0AM5Kzib6Wesqh/ef775Q8o65ykbVOOjTXi8FRmrOvM5b3sV8Pyw==
X-Received: by 2002:aa7:de99:: with SMTP id j25mr36955284edv.91.1621017637149; 
 Fri, 14 May 2021 11:40:37 -0700 (PDT)
Received: from turbo.teknoraver.net (net-5-94-253-60.cust.vodafonedsl.it.
 [5.94.253.60])
 by smtp.gmail.com with ESMTPSA id dj17sm5081505edb.7.2021.05.14.11.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:40:36 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Fri, 14 May 2021 20:39:52 +0200
Message-Id: <20210514183954.7129-2-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514183954.7129-1-mcroce@linux.microsoft.com>
References: <20210514183954.7129-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 May 2021 12:08:29 +0000
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 1/3] stmmac: use XDP helpers
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 345b4c6d1fd4..bf9fe25fed69 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5167,12 +5167,9 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
 
-			xdp.data = page_address(buf->page) + buf->page_offset;
-			xdp.data_end = xdp.data + buf1_len;
-			xdp.data_hard_start = page_address(buf->page);
-			xdp_set_data_meta_invalid(&xdp);
-			xdp.frame_sz = buf_sz;
-			xdp.rxq = &rx_q->xdp_rxq;
+			xdp_init_buff(&xdp, buf_sz, &rx_q->xdp_rxq);
+			xdp_prepare_buff(&xdp, page_address(buf->page),
+					 buf->page_offset, buf1_len, false);
 
 			pre_len = xdp.data_end - xdp.data_hard_start -
 				  buf->page_offset;
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
