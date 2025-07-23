Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1073B0E974
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 06:10:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93BD5C36B2E;
	Wed, 23 Jul 2025 04:10:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46EB2C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 04:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753243840; x=1784779840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=buoD5V+ZyyD7Y7yMlN5Z6j4U11ilG7IxHxBfFpfLLN4=;
 b=Qfh8CsJzJ7Zv2iXuqjVImTbi2Ct8hZlkNWIDHSudtPlkSql2qeXaSb5B
 1tlQ/A0Umn2FJvUQuLH2WjSHltqYDvpFY3tmzYCMF8XlIgvUm/tNoVwkm
 +jzXAIzZ1Uk/cwL7X6VLsmLLp+hnt0bGxbU9ja1aWe5mHapqf3PgoZ5XW
 Slt6wrBd8ZIO8HrUsrN0g5nKlXiU4qb+G/P69XPL8Se7TLt7I85eaNmtY
 JTrUyQ1qu/5FQ2bTs4DPJoNfq7PNSZ16ky3sk85L+N2iFP03S3ubREWUY
 Mf9O8mVIvMEyEcSa1tuA6mt8pIu8MfU+j9p6t0j26QKOEwfVyOrBbCWj8 A==;
X-CSE-ConnectionGUID: ZbxsJnSXTPiCyMRPcSLYMw==
X-CSE-MsgGUID: 9z8uIPswQHm8Dl5KzPFVKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55467134"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55467134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 21:10:31 -0700
X-CSE-ConnectionGUID: eyQkBivjScmxeT8iO7gHXQ==
X-CSE-MsgGUID: ShXgGVTXT4W4KQREnyq35g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163367128"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2025 21:10:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ueQoB-000Iwt-2f;
 Wed, 23 Jul 2025 04:10:23 +0000
Date: Wed, 23 Jul 2025 12:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Xing <kerneljasonxing@gmail.com>, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, bjorn@kernel.org, magnus.karlsson@intel.com,
 maciej.fijalkowski@intel.com, jonathan.lemon@gmail.com,
 sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Message-ID: <202507231150.Gbhu52dL-lkp@intel.com>
References: <20250722135057.85386-2-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250722135057.85386-2-kerneljasonxing@gmail.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jason Xing <kernelxing@tencent.com>
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH net v2 1/2] stmmac: xsk:
 fix underflow of budget in zerocopy mode
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

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/stmmac-xsk-fix-underflow-of-budget-in-zerocopy-mode/20250722-215348
base:   net/main
patch link:    https://lore.kernel.org/r/20250722135057.85386-2-kerneljasonxing%40gmail.com
patch subject: [Intel-wired-lan] [PATCH net v2 1/2] stmmac: xsk: fix underflow of budget in zerocopy mode
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250723/202507231150.Gbhu52dL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231150.Gbhu52dL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231150.Gbhu52dL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_xdp_xmit_zc':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2600:17: error: expected expression before 'struct'
    2600 |                 struct stmmac_metadata_request meta_req;
         |                 ^~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2599:9: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
    2599 |         for (; budget > 0; budget--)
         |         ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2601:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'for'
    2601 |                 struct xsk_tx_metadata *meta = NULL;
         |                 ^~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2611:25: error: break statement not within loop or switch
    2611 |                         break;
         |                         ^~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2615:25: error: break statement not within loop or switch
    2615 |                         break;
         |                         ^~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2621:25: error: continue statement not within a loop
    2621 |                         continue;
         |                         ^~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2660:17: error: 'meta_req' undeclared (first use in this function); did you mean 'net_eq'?
    2660 |                 meta_req.priv = priv;
         |                 ^~~~~~~~
         |                 net_eq
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2660:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2591:14: warning: variable 'work_done' set but not used [-Wunused-but-set-variable]
    2591 |         bool work_done = true;
         |              ^~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2586:34: warning: unused variable 'txq_stats' [-Wunused-variable]
    2586 |         struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
         |                                  ^~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: At top level:
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2685:32: error: expected declaration specifiers or '...' before '&' token
    2685 |         u64_stats_update_begin(&txq_stats->napi_syncp);
         |                                ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2686:23: error: expected declaration specifiers or '...' before '&' token
    2686 |         u64_stats_add(&txq_stats->napi.tx_set_ic_bit, tx_set_ic_bit);
         |                       ^
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2686:55: error: unknown type name 'tx_set_ic_bit'
    2686 |         u64_stats_add(&txq_stats->napi.tx_set_ic_bit, tx_set_ic_bit);
         |                                                       ^~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2687:30: error: expected declaration specifiers or '...' before '&' token
    2687 |         u64_stats_update_end(&txq_stats->napi_syncp);
         |                              ^
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2689:9: error: expected identifier or '(' before 'if'
    2689 |         if (tx_desc) {
         |         ^~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2699:9: error: expected identifier or '(' before 'return'
    2699 |         return !!budget && work_done;
         |         ^~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2700:1: error: expected identifier or '(' before '}' token
    2700 | }
         | ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_xdp_xmit_zc':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2684:9: warning: control reaches end of non-void function [-Wreturn-type]
    2684 |         }
         |         ^


vim +/struct +2600 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

1347b419318d6a Song Yoong Siang  2023-11-27  2581  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2582  static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
132c32ee5bc09b Ong Boon Leong    2021-04-13  2583  {
132c32ee5bc09b Ong Boon Leong    2021-04-13  2584  	struct netdev_queue *nq = netdev_get_tx_queue(priv->dev, queue);
8531c80800c10e Christian Marangi 2022-07-23  2585  	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
8070274b472e2e Jisheng Zhang     2023-09-18 @2586  	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
132c32ee5bc09b Ong Boon Leong    2021-04-13  2587  	struct xsk_buff_pool *pool = tx_q->xsk_pool;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2588  	unsigned int entry = tx_q->cur_tx;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2589  	struct dma_desc *tx_desc = NULL;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2590  	struct xdp_desc xdp_desc;
132c32ee5bc09b Ong Boon Leong    2021-04-13 @2591  	bool work_done = true;
133466c3bbe171 Jisheng Zhang     2023-07-18  2592  	u32 tx_set_ic_bit = 0;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2593  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2594  	/* Avoids TX time-out as we are sharing with slow path */
e92af33e472cf3 Alexander Lobakin 2021-11-17  2595  	txq_trans_cond_update(nq);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2596  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2597  	budget = min(budget, stmmac_tx_avail(priv, queue));
132c32ee5bc09b Ong Boon Leong    2021-04-13  2598  
9074ec4e205d86 Jason Xing        2025-07-22 @2599  	for (; budget > 0; budget--)
1347b419318d6a Song Yoong Siang  2023-11-27 @2600  		struct stmmac_metadata_request meta_req;
1347b419318d6a Song Yoong Siang  2023-11-27  2601  		struct xsk_tx_metadata *meta = NULL;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2602  		dma_addr_t dma_addr;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2603  		bool set_ic;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2604  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2605  		/* We are sharing with slow path and stop XSK TX desc submission when
132c32ee5bc09b Ong Boon Leong    2021-04-13  2606  		 * available TX ring is less than threshold.
132c32ee5bc09b Ong Boon Leong    2021-04-13  2607  		 */
132c32ee5bc09b Ong Boon Leong    2021-04-13  2608  		if (unlikely(stmmac_tx_avail(priv, queue) < STMMAC_TX_XSK_AVAIL) ||
132c32ee5bc09b Ong Boon Leong    2021-04-13  2609  		    !netif_carrier_ok(priv->dev)) {
132c32ee5bc09b Ong Boon Leong    2021-04-13  2610  			work_done = false;
132c32ee5bc09b Ong Boon Leong    2021-04-13 @2611  			break;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2612  		}
132c32ee5bc09b Ong Boon Leong    2021-04-13  2613  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2614  		if (!xsk_tx_peek_desc(pool, &xdp_desc))
132c32ee5bc09b Ong Boon Leong    2021-04-13  2615  			break;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2616  
bd17382ac36ed9 Xiaolei Wang      2024-05-13  2617  		if (priv->est && priv->est->enable &&
bd17382ac36ed9 Xiaolei Wang      2024-05-13  2618  		    priv->est->max_sdu[queue] &&
bd17382ac36ed9 Xiaolei Wang      2024-05-13  2619  		    xdp_desc.len > priv->est->max_sdu[queue]) {
c5c3e1bfc9e0ee Rohan G Thomas    2024-01-27  2620  			priv->xstats.max_sdu_txq_drop[queue]++;
c5c3e1bfc9e0ee Rohan G Thomas    2024-01-27 @2621  			continue;
c5c3e1bfc9e0ee Rohan G Thomas    2024-01-27  2622  		}
c5c3e1bfc9e0ee Rohan G Thomas    2024-01-27  2623  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2624  		if (likely(priv->extend_desc))
132c32ee5bc09b Ong Boon Leong    2021-04-13  2625  			tx_desc = (struct dma_desc *)(tx_q->dma_etx + entry);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2626  		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
132c32ee5bc09b Ong Boon Leong    2021-04-13  2627  			tx_desc = &tx_q->dma_entx[entry].basic;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2628  		else
132c32ee5bc09b Ong Boon Leong    2021-04-13  2629  			tx_desc = tx_q->dma_tx + entry;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2630  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2631  		dma_addr = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
1347b419318d6a Song Yoong Siang  2023-11-27  2632  		meta = xsk_buff_get_metadata(pool, xdp_desc.addr);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2633  		xsk_buff_raw_dma_sync_for_device(pool, dma_addr, xdp_desc.len);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2634  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2635  		tx_q->tx_skbuff_dma[entry].buf_type = STMMAC_TXBUF_T_XSK_TX;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2636  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2637  		/* To return XDP buffer to XSK pool, we simple call
132c32ee5bc09b Ong Boon Leong    2021-04-13  2638  		 * xsk_tx_completed(), so we don't need to fill up
132c32ee5bc09b Ong Boon Leong    2021-04-13  2639  		 * 'buf' and 'xdpf'.
132c32ee5bc09b Ong Boon Leong    2021-04-13  2640  		 */
132c32ee5bc09b Ong Boon Leong    2021-04-13  2641  		tx_q->tx_skbuff_dma[entry].buf = 0;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2642  		tx_q->xdpf[entry] = NULL;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2643  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2644  		tx_q->tx_skbuff_dma[entry].map_as_page = false;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2645  		tx_q->tx_skbuff_dma[entry].len = xdp_desc.len;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2646  		tx_q->tx_skbuff_dma[entry].last_segment = true;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2647  		tx_q->tx_skbuff_dma[entry].is_jumbo = false;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2648  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2649  		stmmac_set_desc_addr(priv, tx_desc, dma_addr);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2650  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2651  		tx_q->tx_count_frames++;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2652  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2653  		if (!priv->tx_coal_frames[queue])
132c32ee5bc09b Ong Boon Leong    2021-04-13  2654  			set_ic = false;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2655  		else if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
132c32ee5bc09b Ong Boon Leong    2021-04-13  2656  			set_ic = true;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2657  		else
132c32ee5bc09b Ong Boon Leong    2021-04-13  2658  			set_ic = false;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2659  
1347b419318d6a Song Yoong Siang  2023-11-27 @2660  		meta_req.priv = priv;
1347b419318d6a Song Yoong Siang  2023-11-27  2661  		meta_req.tx_desc = tx_desc;
1347b419318d6a Song Yoong Siang  2023-11-27  2662  		meta_req.set_ic = &set_ic;
04f64dea13640f Song Yoong Siang  2025-02-16  2663  		meta_req.tbs = tx_q->tbs;
04f64dea13640f Song Yoong Siang  2025-02-16  2664  		meta_req.edesc = &tx_q->dma_entx[entry];
1347b419318d6a Song Yoong Siang  2023-11-27  2665  		xsk_tx_metadata_request(meta, &stmmac_xsk_tx_metadata_ops,
1347b419318d6a Song Yoong Siang  2023-11-27  2666  					&meta_req);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2667  		if (set_ic) {
132c32ee5bc09b Ong Boon Leong    2021-04-13  2668  			tx_q->tx_count_frames = 0;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2669  			stmmac_set_tx_ic(priv, tx_desc);
133466c3bbe171 Jisheng Zhang     2023-07-18  2670  			tx_set_ic_bit++;
132c32ee5bc09b Ong Boon Leong    2021-04-13  2671  		}
132c32ee5bc09b Ong Boon Leong    2021-04-13  2672  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2673  		stmmac_prepare_tx_desc(priv, tx_desc, 1, xdp_desc.len,
132c32ee5bc09b Ong Boon Leong    2021-04-13  2674  				       true, priv->mode, true, true,
132c32ee5bc09b Ong Boon Leong    2021-04-13  2675  				       xdp_desc.len);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2676  
ad72f783de0682 Yanteng Si        2024-08-07  2677  		stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2678  
1347b419318d6a Song Yoong Siang  2023-11-27  2679  		xsk_tx_metadata_to_compl(meta,
1347b419318d6a Song Yoong Siang  2023-11-27  2680  					 &tx_q->tx_skbuff_dma[entry].xsk_meta);
1347b419318d6a Song Yoong Siang  2023-11-27  2681  
8531c80800c10e Christian Marangi 2022-07-23  2682  		tx_q->cur_tx = STMMAC_GET_ENTRY(tx_q->cur_tx, priv->dma_conf.dma_tx_size);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2683  		entry = tx_q->cur_tx;
132c32ee5bc09b Ong Boon Leong    2021-04-13 @2684  	}
38cc3c6dcc09dc Petr Tesarik      2024-02-03 @2685  	u64_stats_update_begin(&txq_stats->napi_syncp);
38cc3c6dcc09dc Petr Tesarik      2024-02-03 @2686  	u64_stats_add(&txq_stats->napi.tx_set_ic_bit, tx_set_ic_bit);
38cc3c6dcc09dc Petr Tesarik      2024-02-03  2687  	u64_stats_update_end(&txq_stats->napi_syncp);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2688  
132c32ee5bc09b Ong Boon Leong    2021-04-13 @2689  	if (tx_desc) {
132c32ee5bc09b Ong Boon Leong    2021-04-13  2690  		stmmac_flush_tx_descriptors(priv, queue);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2691  		xsk_tx_release(pool);
132c32ee5bc09b Ong Boon Leong    2021-04-13  2692  	}
132c32ee5bc09b Ong Boon Leong    2021-04-13  2693  
132c32ee5bc09b Ong Boon Leong    2021-04-13  2694  	/* Return true if all of the 3 conditions are met
132c32ee5bc09b Ong Boon Leong    2021-04-13  2695  	 *  a) TX Budget is still available
132c32ee5bc09b Ong Boon Leong    2021-04-13  2696  	 *  b) work_done = true when XSK TX desc peek is empty (no more
132c32ee5bc09b Ong Boon Leong    2021-04-13  2697  	 *     pending XSK TX for transmission)
132c32ee5bc09b Ong Boon Leong    2021-04-13  2698  	 */
132c32ee5bc09b Ong Boon Leong    2021-04-13 @2699  	return !!budget && work_done;
132c32ee5bc09b Ong Boon Leong    2021-04-13 @2700  }
132c32ee5bc09b Ong Boon Leong    2021-04-13  2701  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
