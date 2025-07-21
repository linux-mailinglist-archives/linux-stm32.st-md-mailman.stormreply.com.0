Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5CB0BEFB
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 10:34:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2BBEC32E8E;
	Mon, 21 Jul 2025 08:34:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18BB8C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 08:34:04 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-313154270bbso3955190a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 01:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753086843; x=1753691643;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbtNVv68Al+8cVNVFbCAZPRp/ZwmAyAvC1F+49a5gy8=;
 b=WIeVP/i5FZicH4zQTnt2bJA4yDyDgFTw5bRWcpxXhj8JbR1wKDRJmMgLQz0a9JUADC
 a3UDS+RvUT2vyCU8vc8/SML37x+MH1ShueXRepCDTtKvvA+wOsBzOxIGgBTR/f2tP62/
 eUJuKJCqs/Fit3TAqST8dMbdXvSwrCaTX+Rk3ve3hZCLn/0yOu9oPgcUjeTFlTFzFA+/
 7XUnDX7SZr0AZYfCCtJ74ZZVX9TeUWkwhmpDtNGP98YPfqEkWx1zsmigpjeRx7PG9szL
 bcdlmFD/E3R7shJJgAW0RnejuTwFu30qJiTJUp5zdxf/R7rhD2M97jynkI5hPvpl/95g
 eN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753086843; x=1753691643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbtNVv68Al+8cVNVFbCAZPRp/ZwmAyAvC1F+49a5gy8=;
 b=XRQXoisSjSTbT4Td2/rCWGdglw/b16BdULir5qTJyS6sZVEkEPOwRQzLJgziunEoRC
 7kS/pjpH+4+QZuBdqwuYNdq9BlrYxv+IZkXWLqqCXrHZ0wNynGjH//KSlN4YbRH5ipyM
 ciNoKJBuroTHF7wE5i/EFrdLuJGOEDTUE4Ntnl62Y2bkAUoug4aUthyxI0aOJJ0pvYqX
 fxfiZx23d/UOGqClFc9jCDkyQAQ8hqiHU37pVb5vAtL5M2MYk5nUy93tWMCoHkOc9v8R
 9eF7CA3ODbBlzqaQKqkDg4bFwjEz5Fi0Vi5kzhLqGonpxeN+3t6gDIaWcftqqy69etU4
 KlbQ==
X-Gm-Message-State: AOJu0YzFrQvUHr2ChAvAwd53ekEwJfxHNiJYDACAE/eTulBp4U67BjwM
 oSwEM01cfx0ow2Y8tdr68pARVALMMcUd67NzCUbCfkxb7lhe/BZ+C07u
X-Gm-Gg: ASbGncvxUE8VrkkOiZRxOu7/coh7VMbT02MzbeYMTcZi/cNxYgMA0DfA9Qi9oqSR8Qk
 QaYINL9Ct0+4GCiF5YKAuQEFPj90oFAZSe3EMmZpvc0LUmH4QjnYv5NH5UvjLdFwuE2CB0MQgE8
 zBtVlhDVDg3ymqM1VRmXFUZnQ5brBZ6ChbFc6k06XgffV1ZVuXCbCwJkufxDfZHTkdERC07655/
 oaFSPqkC4V2l88QoYD9W62EbvcxwuXm/cSvIZBK0S9cUMLv5tl6VN0ftiNVXKbkhEwc65D7nQIO
 1qzFhwJTzu8dtn4W3TfawoVRwf/8ldUtRCb9qx2QgCH0JFR+5azAUYkJKa6N1ENzHOO8h6UuKPS
 G7SNQEUCxs+yNJYZTWNuJ3uba3juI9qKJQRYO/d7227SLwQhPXgQQhvGiA2o=
X-Google-Smtp-Source: AGHT+IGyQK7XJLz3sOROYFmqcWgOIYrK0cMqYO+1HcoFFA3G5PlGwInuETMs6mPtONWOozx+/OJv8Q==
X-Received: by 2002:a17:90b:2684:b0:311:ff18:b84b with SMTP id
 98e67ed59e1d1-31c9f47c7d7mr25319465a91.25.1753086842487; 
 Mon, 21 Jul 2025 01:34:02 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([111.201.24.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cb7742596sm7082116a91.27.2025.07.21.01.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 01:34:02 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Mon, 21 Jul 2025 16:33:43 +0800
Message-Id: <20250721083343.16482-3-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250721083343.16482-1-kerneljasonxing@gmail.com>
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net-next 2/2] igb: xsk: solve underflow of
	nb_pkts in zerocopy mode
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

From: Jason Xing <kernelxing@tencent.com>

There is no break time in the while() loop, so every time at the end of
igb_xmit_zc(), underflow of nb_pkts will occur, which renders the return
value always false. But theoretically, the result should be set after
calling xsk_tx_peek_release_desc_batch(). We can take i40e_xmit_zc() as
a good example.

Returning false means we're not done with transmission and we need one
more poll, which is exactly what igb_xmit_zc() always did before this
patch. After this patch, the return value depends on the nb_pkts value.
Two cases might happen then:
1. if (nb_pkts < budget), it means we process all the possible data, so
   return true and no more necessary poll will be triggered because of
   this.
2. if (nb_pkts == budget), it means we might have more data, so return
   false to let another poll run again.

Fixes: f8e284a02afc ("igb: Add AF_XDP zero-copy Tx support")
Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/intel/igb/igb_xsk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_xsk.c b/drivers/net/ethernet/intel/igb/igb_xsk.c
index 5cf67ba29269..243f4246fee8 100644
--- a/drivers/net/ethernet/intel/igb/igb_xsk.c
+++ b/drivers/net/ethernet/intel/igb/igb_xsk.c
@@ -482,7 +482,7 @@ bool igb_xmit_zc(struct igb_ring *tx_ring, struct xsk_buff_pool *xsk_pool)
 	if (!nb_pkts)
 		return true;
 
-	while (nb_pkts-- > 0) {
+	while (i < nb_pkts) {
 		dma = xsk_buff_raw_get_dma(xsk_pool, descs[i].addr);
 		xsk_buff_raw_dma_sync_for_device(xsk_pool, dma, descs[i].len);
 
-- 
2.41.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
