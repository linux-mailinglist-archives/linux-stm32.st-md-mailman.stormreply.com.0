Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4035D26F
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 23:19:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC9E3C57B79;
	Mon, 12 Apr 2021 21:19:24 +0000 (UTC)
Received: from mail.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFFC1C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 21:19:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id BE3754D259C01;
 Mon, 12 Apr 2021 14:19:20 -0700 (PDT)
Date: Mon, 12 Apr 2021 14:19:16 -0700 (PDT)
Message-Id: <20210412.141916.1569200948681549246.davem@davemloft.net>
To: boon.leong.ong@intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20210412154130.20742-7-boon.leong.ong@intel.com>
References: <20210412154130.20742-1-boon.leong.ong@intel.com>
 <20210412154130.20742-7-boon.leong.ong@intel.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Mon, 12 Apr 2021 14:19:21 -0700 (PDT)
Cc: songliubraving@fb.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@st.com, daniel@iogearbox.net, yhs@fb.com,
 linux-stm32@st-md-mailman.stormreply.com, bpf@vger.kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, andrii@kernel.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 kpsingh@kernel.org, peppe.cavallaro@st.com, netdev@vger.kernel.org,
 kafai@fb.com, linux-arm-kernel@lists.infradead.org, hawk@kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 6/7] net: stmmac: Enable RX via
 AF_XDP zero-copy
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

+	/* synchronize_rcu() needed for pending XDP buffers to drain */
+	for (queue = 0; queue < rx_queues_cnt; queue++) {
+		rx_q = &priv->rx_queue[queue];
+		if (rx_q->xsk_pool) {
+			synchronize_rcu();

Are you sure this is safe here, especially via the ->ndo_setup_tc() code path?

Thank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
