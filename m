Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7307CB9D5
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Oct 2023 06:52:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0249CC6B452;
	Tue, 17 Oct 2023 04:52:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44D80C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 04:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697518376; x=1729054376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a7+zbXGEIsTGyV49l/0A/kQQ8/C1zGHxhbMLWfHnmV0=;
 b=UYVAsIUtOYk3YECc+5cEgg5TaRzf4p1si4WsVKkxWIT7lGapeLeVy8X4
 uFq6fKEahQLnWc7j+nDgHW3yT1gv2G/23ThWPB099lQXxs5FacMVqafwA
 Ig0vUtzhf39KPzJzDsd1JbrOdkFC9MuXX93pfxJAnXCmqkQw19/aCgqcS
 P+eWruLREHHlbIZ5Auv14uPyHn9yiI0OyNHCVmLqWz12cKdXxBtz23Jqt
 L2QyUN7jxDmWcmpPq4GcfubJp4Tt1rGgPQLdMqLLavygtJ02w4642Mrjc
 lrxHwr+EtOljLkQxXkCGDJ4jpeyaEtF2ChxoNgaTUx204PDry4Yv1pNaK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="376066168"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="376066168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 21:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="3926568"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2023 21:52:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qsc4U-00091r-27;
 Tue, 17 Oct 2023 04:52:46 +0000
Date: Tue, 17 Oct 2023 12:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Simon Horman <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jiri Pirko <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org
Message-ID: <202310171222.UN3fzVpz-lkp@intel.com>
References: <20231012100459.6158-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012100459.6158-4-ansuelsmth@gmail.com>
Cc: netdev@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [net-next PATCH v2 3/4] net: stmmac: move TX
 timer arm after DMA enable
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-introduce-napi_is_scheduled-helper/20231017-104641
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231012100459.6158-4-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v2 3/4] net: stmmac: move TX timer arm after DMA enable
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310171222.UN3fzVpz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171222.UN3fzVpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171222.UN3fzVpz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2549:28: error: expected ';', ',' or ')' before 'bool'
    2549 |                            bool *pending_packets)
         |                            ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_napi_poll_tx':
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5586:21: error: implicit declaration of function 'stmmac_tx_clean'; did you mean 'stmmac_rx_vlan'? [-Werror=implicit-function-declaration]
    5586 |         work_done = stmmac_tx_clean(priv, budget, chan, &pending_packets);
         |                     ^~~~~~~~~~~~~~~
         |                     stmmac_rx_vlan
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: At top level:
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2425:13: warning: 'stmmac_xdp_xmit_zc' defined but not used [-Wunused-function]
    2425 | static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:536:13: warning: 'stmmac_get_tx_hwtstamp' defined but not used [-Wunused-function]
     536 | static void stmmac_get_tx_hwtstamp(struct stmmac_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/stmmac_xdp_xmit_zc +2425 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe Cavallaro 2009-10-14  2424  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13 @2425  static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2426  {
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2427  	struct netdev_queue *nq = netdev_get_tx_queue(priv->dev, queue);
8531c80800c10e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Christian Marangi  2022-07-23  2428  	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
8070274b472e2e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jisheng Zhang      2023-09-18  2429  	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2430  	struct xsk_buff_pool *pool = tx_q->xsk_pool;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2431  	unsigned int entry = tx_q->cur_tx;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2432  	struct dma_desc *tx_desc = NULL;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2433  	struct xdp_desc xdp_desc;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2434  	bool work_done = true;
133466c3bbe171 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jisheng Zhang      2023-07-18  2435  	u32 tx_set_ic_bit = 0;
133466c3bbe171 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jisheng Zhang      2023-07-18  2436  	unsigned long flags;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2437  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2438  	/* Avoids TX time-out as we are sharing with slow path */
e92af33e472cf3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Alexander Lobakin  2021-11-17  2439  	txq_trans_cond_update(nq);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2440  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2441  	budget = min(budget, stmmac_tx_avail(priv, queue));
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2442  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2443  	while (budget-- > 0) {
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2444  		dma_addr_t dma_addr;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2445  		bool set_ic;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2446  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2447  		/* We are sharing with slow path and stop XSK TX desc submission when
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2448  		 * available TX ring is less than threshold.
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2449  		 */
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2450  		if (unlikely(stmmac_tx_avail(priv, queue) < STMMAC_TX_XSK_AVAIL) ||
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2451  		    !netif_carrier_ok(priv->dev)) {
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2452  			work_done = false;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2453  			break;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2454  		}
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2455  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2456  		if (!xsk_tx_peek_desc(pool, &xdp_desc))
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2457  			break;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2458  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2459  		if (likely(priv->extend_desc))
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2460  			tx_desc = (struct dma_desc *)(tx_q->dma_etx + entry);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2461  		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2462  			tx_desc = &tx_q->dma_entx[entry].basic;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2463  		else
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2464  			tx_desc = tx_q->dma_tx + entry;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2465  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2466  		dma_addr = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2467  		xsk_buff_raw_dma_sync_for_device(pool, dma_addr, xdp_desc.len);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2468  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2469  		tx_q->tx_skbuff_dma[entry].buf_type = STMMAC_TXBUF_T_XSK_TX;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2470  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2471  		/* To return XDP buffer to XSK pool, we simple call
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2472  		 * xsk_tx_completed(), so we don't need to fill up
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2473  		 * 'buf' and 'xdpf'.
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2474  		 */
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2475  		tx_q->tx_skbuff_dma[entry].buf = 0;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2476  		tx_q->xdpf[entry] = NULL;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2477  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2478  		tx_q->tx_skbuff_dma[entry].map_as_page = false;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2479  		tx_q->tx_skbuff_dma[entry].len = xdp_desc.len;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2480  		tx_q->tx_skbuff_dma[entry].last_segment = true;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2481  		tx_q->tx_skbuff_dma[entry].is_jumbo = false;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2482  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2483  		stmmac_set_desc_addr(priv, tx_desc, dma_addr);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2484  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2485  		tx_q->tx_count_frames++;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2486  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2487  		if (!priv->tx_coal_frames[queue])
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2488  			set_ic = false;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2489  		else if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2490  			set_ic = true;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2491  		else
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2492  			set_ic = false;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2493  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2494  		if (set_ic) {
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2495  			tx_q->tx_count_frames = 0;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2496  			stmmac_set_tx_ic(priv, tx_desc);
133466c3bbe171 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jisheng Zhang      2023-07-18  2497  			tx_set_ic_bit++;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2498  		}
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2499  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2500  		stmmac_prepare_tx_desc(priv, tx_desc, 1, xdp_desc.len,
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2501  				       true, priv->mode, true, true,
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2502  				       xdp_desc.len);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2503  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2504  		stmmac_enable_dma_transmission(priv, priv->ioaddr);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2505  
8531c80800c10e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Christian Marangi  2022-07-23  2506  		tx_q->cur_tx = STMMAC_GET_ENTRY(tx_q->cur_tx, priv->dma_conf.dma_tx_size);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2507  		entry = tx_q->cur_tx;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2508  	}
8070274b472e2e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jisheng Zhang      2023-09-18  2509  	flags = u64_stats_update_begin_irqsave(&txq_stats->syncp);
8070274b472e2e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jisheng Zhang      2023-09-18  2510  	txq_stats->tx_set_ic_bit += tx_set_ic_bit;
8070274b472e2e drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jisheng Zhang      2023-09-18  2511  	u64_stats_update_end_irqrestore(&txq_stats->syncp, flags);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2512  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2513  	if (tx_desc) {
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2514  		stmmac_flush_tx_descriptors(priv, queue);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2515  		xsk_tx_release(pool);
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2516  	}
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2517  
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2518  	/* Return true if all of the 3 conditions are met
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2519  	 *  a) TX Budget is still available
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2520  	 *  b) work_done = true when XSK TX desc peek is empty (no more
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2521  	 *     pending XSK TX for transmission)
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2522  	 */
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2523  	return !!budget && work_done;
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2524  }
132c32ee5bc09b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon Leong     2021-04-13  2525  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
