Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cs3HYUuuGm1aAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A7729D4A2
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7BCBC8F28E;
	Mon, 16 Mar 2026 16:23:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1021C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 19:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773431421; x=1804967421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2yBCYa2goQHEMmE1k4SHkPwXDkUt+BCmZISdg4ehhOU=;
 b=P7PJaub5qnqe2u7f73Y08IurcD0A/4OQVv7wBkEKZB8zkA1ClEe7FIYw
 pQKYbe5GqPdbYM9uu/d/LvW5kJIoOoPCb+6evZHGqpgoQ2xCGEP6zGcWQ
 AUWjAmdFgTxYZtomF0CFcKrzVmeCi0QYzI59NpyCpleRf3serpdmCLM4C
 oVp6xDdM//XkayJA6S6XxPcMY8FsDGbOdNNM1bJ88YuNF9Wme4VvYZ3jF
 b8MU0RA1SXrio9TVazMnWiTbxGJdRrTpC9Ew9aGR7Nwg7o6nCDc6JC5eb
 azlo2jZvFQQS+H0DKi1qFQI/uEkZRiCtssKPUKbHjV8n2GAxiRKN8BD2W w==;
X-CSE-ConnectionGUID: GnKwEg3HRDKtGVPu4R/Fhw==
X-CSE-MsgGUID: REu07lByTo+z9fG7dPLVBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74660085"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74660085"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 12:50:19 -0700
X-CSE-ConnectionGUID: TtppXxqqSbe/6BojyOSYlA==
X-CSE-MsgGUID: kyiZqeEoSI+5J4z8lD5Edg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="251775876"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2)
 ([10.211.93.152])
 by orviesa002.jf.intel.com with ESMTP; 13 Mar 2026 12:50:15 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w18WT-000000003hV-0A89;
 Fri, 13 Mar 2026 19:50:13 +0000
Date: Fri, 13 Mar 2026 20:50:05 +0100
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <202603132053.N3kL3UZZ-lkp@intel.com>
References: <E1w0czK-0000000CzH7-19Fb@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1w0czK-0000000CzH7-19Fb@rmk-PC.armlinux.org.uk>
X-Mailman-Approved-At: Mon, 16 Mar 2026 16:23:30 +0000
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 llvm@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@fomichev.me>,
 oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 13/15] net: stmmac: add helper
 to set transmit tail pointer
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[68];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:hawk@kernel.org,m:daniel@iogearbox.net,m:netdev@vger.kernel.org,m:llvm@lists.linux.dev,m:ast@kernel.org,m:edumazet@google.com,m:sdf@fomichev.me,m:oe-kbuild-all@lists.linux.dev,m:kuba@kernel.org,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.427];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 21A7729D4A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-rearrange-stmmac_tx_info-members-to-pack-better/20260313-225823
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1w0czK-0000000CzH7-19Fb%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next v2 13/15] net: stmmac: add helper to set transmit tail pointer
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260313/202603132053.N3kL3UZZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603132053.N3kL3UZZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603132053.N3kL3UZZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:430:26: error: call to undeclared function 'dma_desc_to_edesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     430 |                 struct dma_edesc *ep = dma_desc_to_edesc(head);
         |                                        ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:430:21: error: incompatible integer to pointer conversion initializing 'struct dma_edesc *' with an expression of type 'int' [-Wint-conversion]
     430 |                 struct dma_edesc *ep = dma_desc_to_edesc(head);
         |                                   ^    ~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/dma_desc_to_edesc +430 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c

   396	
   397	static void dwmac4_display_ring(void *head, unsigned int size, bool rx,
   398					dma_addr_t dma_rx_phy, unsigned int desc_size)
   399	{
   400		dma_addr_t dma_addr;
   401		int i;
   402	
   403		pr_info("%s descriptor ring:\n", rx ? "RX" : "TX");
   404	
   405		if (desc_size == sizeof(struct dma_desc)) {
   406			struct dma_desc *p = (struct dma_desc *)head;
   407	
   408			for (i = 0; i < size; i++) {
   409				dma_addr = dma_rx_phy + i * sizeof(*p);
   410				pr_info("%03d [%pad]: 0x%x 0x%x 0x%x 0x%x\n",
   411					i, &dma_addr,
   412					le32_to_cpu(p->des0), le32_to_cpu(p->des1),
   413					le32_to_cpu(p->des2), le32_to_cpu(p->des3));
   414				p++;
   415			}
   416		} else if (desc_size == sizeof(struct dma_extended_desc)) {
   417			struct dma_extended_desc *extp = (struct dma_extended_desc *)head;
   418	
   419			for (i = 0; i < size; i++) {
   420				dma_addr = dma_rx_phy + i * sizeof(*extp);
   421				pr_info("%03d [%pad]: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
   422					i, &dma_addr,
   423					le32_to_cpu(extp->basic.des0), le32_to_cpu(extp->basic.des1),
   424					le32_to_cpu(extp->basic.des2), le32_to_cpu(extp->basic.des3),
   425					le32_to_cpu(extp->des4), le32_to_cpu(extp->des5),
   426					le32_to_cpu(extp->des6), le32_to_cpu(extp->des7));
   427				extp++;
   428			}
   429		} else if (desc_size == sizeof(struct dma_edesc)) {
 > 430			struct dma_edesc *ep = dma_desc_to_edesc(head);
   431	
   432			for (i = 0; i < size; i++) {
   433				dma_addr = dma_rx_phy + i * sizeof(*ep);
   434				pr_info("%03d [%pad]: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
   435					i, &dma_addr,
   436					le32_to_cpu(ep->des4), le32_to_cpu(ep->des5),
   437					le32_to_cpu(ep->des6), le32_to_cpu(ep->des7),
   438					le32_to_cpu(ep->basic.des0), le32_to_cpu(ep->basic.des1),
   439					le32_to_cpu(ep->basic.des2), le32_to_cpu(ep->basic.des3));
   440				ep++;
   441			}
   442		} else {
   443			pr_err("unsupported descriptor!");
   444		}
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
