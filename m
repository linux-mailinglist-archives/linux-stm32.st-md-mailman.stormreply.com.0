Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL4MEhDpiWlnEAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 15:02:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B60010FFFB
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 15:02:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 950A3C36B3E;
	Mon,  9 Feb 2026 13:55:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DE14C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770645358; x=1802181358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8gsKrKfHzg5IhU75x8V2XqMYKKTj3V+aC4HJxoeX8nw=;
 b=PJm5Z4sfOrdelT+95OTxKGG31bTQT9RzepZsXbCp9lhHcHyNOg/W566X
 j7Ht2Yc4J14gIehX0/wK6iMkhBuZUYCiUC3XSJYhUk+k0SKEJ1RcadH4z
 imdSgTrY/D2Dqk8ipzhsnAndzZWarIINgF/ks/oJfFAfalu0d+ImITd+T
 ghIiixoR7gjiYhcxrgkuDTBoMtNZh4zH5KrtzOOeqgmB4+JiAC4zqCI4+
 wY1T6pTlxNjD4g8lFIhz88TgDQT8ZFznBs7mwdRNomc4LG/SJPgbDay9p
 l0Z8DzXDl9oCO8tShwpzHCVrkKO43xROEQVW5jBTCPzLKgtoF/zQrkOv1 A==;
X-CSE-ConnectionGUID: OityK+R2Sw25b6Zo0AsdoA==
X-CSE-MsgGUID: ArDZJqZZRPmFfCOa68d7Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71937714"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71937714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 05:55:56 -0800
X-CSE-ConnectionGUID: YCgsTqlTQdW9ogsWCrm0+A==
X-CSE-MsgGUID: gvgRjmM0S8GJaxmUZrRvGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211417610"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123)
 ([10.211.93.152])
 by orviesa009.jf.intel.com with ESMTP; 09 Feb 2026 05:55:52 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vpRjx-000000000FV-1Wc1;
 Mon, 09 Feb 2026 13:55:49 +0000
Date: Mon, 9 Feb 2026 14:55:33 +0100
From: kernel test robot <lkp@intel.com>
To: Jie Zhang <jzhang918@gmail.com>, netdev@vger.kernel.org
Message-ID: <202602091406.tg5t31a5-lkp@intel.com>
References: <20260206195643.11333-1-jie.zhang@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206195643.11333-1-jie.zhang@analog.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, jzhang918@gmail.com, jie.zhang@analog.com,
 horms@kernel.org, oe-kbuild-all@lists.linux.dev,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: fix oops when split
	header is enabled
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jzhang918@gmail.com,m:netdev@vger.kernel.org,m:Jose.Abreu@synopsys.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:vladimir.oltean@nxp.com,m:edumazet@google.com,m:andrew+netdev@lunn.ch,m:jie.zhang@analog.com,m:horms@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:jacob.e.keller@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,nxp.com,google.com,lunn.ch,analog.com,kernel.org,lists.linux.dev,intel.com,redhat.com,armlinux.org.uk,st-md-mailman.stormreply.com,lists.infradead.org];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,intel.com:mid,intel.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5B60010FFFB
X-Rspamd-Action: no action

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Zhang/net-stmmac-fix-oops-when-split-header-is-enabled/20260207-035916
base:   net/main
patch link:    https://lore.kernel.org/r/20260206195643.11333-1-jie.zhang%40analog.com
patch subject: [PATCH net v2] net: stmmac: fix oops when split header is enabled
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260209/202602091406.tg5t31a5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091406.tg5t31a5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602091406.tg5t31a5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_rx_buf2_len':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5041:24: error: 'struct plat_stmmacenet_data' has no member named 'has_gmac4'
    5041 |         if (!priv->plat->has_gmac4 && (status & rx_not_ls))
         |                        ^~


vim +5041 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  5014	
  5015	static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
  5016					       struct dma_desc *p,
  5017					       int status, unsigned int len)
  5018	{
  5019		int coe = priv->hw->rx_csum;
  5020		unsigned int plen = 0;
  5021	
  5022		/* Not split header, buffer is not available */
  5023		if (!priv->sph_active)
  5024			return 0;
  5025	
  5026		/* For GMAC4, when split header is enabled, in some rare cases, the
  5027		 * hardware does not fill buf2 of the first descriptor with payload.
  5028		 * Thus we cannot assume buf2 is always fully filled if it is not
  5029		 * the last descriptor. Otherwise, the length of buf2 of the second
  5030		 * descriptor will be calculated wrong and cause an oops.
  5031		 *
  5032		 * If this is the last descriptor, 'plen' is the length of the
  5033		 * received packet that was transferred to system memory.
  5034		 * Otherwise, it is the accumulated number of bytes that have been
  5035		 * transferred for the current packet.
  5036		 *
  5037		 * Thus 'plen - len' always gives the correct length of buf2.
  5038		 */
  5039	
  5040		/* Not GMAC4 and not last descriptor */
> 5041		if (!priv->plat->has_gmac4 && (status & rx_not_ls))
  5042			return priv->dma_conf.dma_buf_sz;
  5043	
  5044		/* GMAC4 or last descriptor */
  5045		plen = stmmac_get_rx_frame_len(priv, p, coe);
  5046	
  5047		return plen - len;
  5048	}
  5049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
