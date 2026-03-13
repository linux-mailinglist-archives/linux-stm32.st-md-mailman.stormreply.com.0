Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CBAHYUuuGm3aAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD8D29D4A3
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC17FC8F291;
	Mon, 16 Mar 2026 16:23:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3432C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 20:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773432688; x=1804968688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SMPmzclyOIKQEi+ShtklVqvxCpyJHokDbfVTltDu+3M=;
 b=PYxHq7f1bmdI2+rcPsNHxSWR6CLPLghRvQnW114/karcbdm0Y5SHCUys
 dA3LZVeWYr+F89BeDVxR3zdwNTYp8yytACOJs4OSmOvmhbAes1e9YOQsY
 vJeDtL04Z/A7KGD2ifW55nhspFiM2uZqhe4S70P/TV0ptcHwVr3BYvEG3
 P3OjD/h8yZhSCdo6Dc3vm183x4gqmIFxkNm0mgvjeJBKtI1wC5U1o9RBB
 glhaDXJgBGT1gA238TUbQYyLe/tl5uQj5dBoEKpa+sk9fFlQmPqBdIXSy
 rDEzHzetUUA7KN7C+aD2ztT7F/0b9yiMSjQ0T1odDdA/qEaLJEkzwScCx A==;
X-CSE-ConnectionGUID: b5b0MxlPSfC+6M7CpEMhSg==
X-CSE-MsgGUID: SsvKd8f2QXSYHBEpIVxlzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74517781"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74517781"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 13:11:22 -0700
X-CSE-ConnectionGUID: 2kUbeFEFSaKhLs70W7WvSQ==
X-CSE-MsgGUID: ev3j7rCVSJW5exQ6b/MdoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="246403671"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2)
 ([10.211.93.152])
 by fmviesa001.fm.intel.com with ESMTP; 13 Mar 2026 13:11:16 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w18qn-000000003hZ-0QxX;
 Fri, 13 Mar 2026 20:11:13 +0000
Date: Fri, 13 Mar 2026 21:10:41 +0100
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <202603132104.OVIsnpBk-lkp@intel.com>
References: <E1w0czK-0000000CzH7-19Fb@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1w0czK-0000000CzH7-19Fb@rmk-PC.armlinux.org.uk>
X-Mailman-Approved-At: Mon, 16 Mar 2026 16:23:30 +0000
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:hawk@kernel.org,m:daniel@iogearbox.net,m:netdev@vger.kernel.org,m:ast@kernel.org,m:edumazet@google.com,m:sdf@fomichev.me,m:oe-kbuild-all@lists.linux.dev,m:kuba@kernel.org,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.396];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,st-md-mailman.stormreply.com:rdns,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 3CD8D29D4A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-rearrange-stmmac_tx_info-members-to-pack-better/20260313-225823
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1w0czK-0000000CzH7-19Fb%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next v2 13/15] net: stmmac: add helper to set transmit tail pointer
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260313/202603132104.OVIsnpBk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603132104.OVIsnpBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603132104.OVIsnpBk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c: In function 'dwmac4_display_ring':
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:430:40: error: implicit declaration of function 'dma_desc_to_edesc' [-Wimplicit-function-declaration]
     430 |                 struct dma_edesc *ep = dma_desc_to_edesc(head);
         |                                        ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:430:40: error: initialization of 'struct dma_edesc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]


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
