Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eELvNyUOjmmS+wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 18:30:13 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB712FED1
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 18:30:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD0DDC87ED3;
	Thu, 12 Feb 2026 17:30:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EB85C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Feb 2026 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770917411; x=1802453411;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XBOcgJBc1RSlYmqobhoDkxo7B2GCI8X28c2EJGVXf2M=;
 b=HFZ0UwO2s3DufT3dmoaH8c5MdCTK+TLfVObL5IkjioQ25CtO2Lpd0vh9
 U0BeJmNrbLMbxkPDlc8hP2eGIUXe9Gi7HZic4sAhZS6ed2VkZgsd9GCJS
 ckN66rCqwpsCp0HOuSu3zXbIcZxP5gfNUn11AYW9Hgc/YS8igwe8uRQe1
 u8IApne72ONQMGZRCvbBmLVSxuHnt56L1W999hneSoQIezXcJMFWuVvI+
 Oi/HrFTANep8BowGDBb7PE/BoJ2WxGADpAfCfqDZXJxxRX2PVPhlYheLI
 QljO+4s/mO8XS3gA6aUiKQwYAnpUKYwAKDUqUYH6Y8iNcivSPQpu6IWLh w==;
X-CSE-ConnectionGUID: eV6BANQlT26KikD3ifYYRg==
X-CSE-MsgGUID: 4+ZLn9zrQ/6AUGWz11ci1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71124773"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="71124773"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:30:09 -0800
X-CSE-ConnectionGUID: vokpPQzjS12/nvQhQb0tIA==
X-CSE-MsgGUID: xGkuYLYkQLemyQ69LEKpyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="243258862"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 12 Feb 2026 09:30:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vqaVv-00000000rwq-1LsJ;
 Thu, 12 Feb 2026 17:30:03 +0000
Date: Fri, 13 Feb 2026 01:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Message-ID: <202602130151.3v3igg2M-lkp@intel.com>
References: <20260212-stm32_risab-v2-3-02ef2859b596@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260212-stm32_risab-v2-3-02ef2859b596@foss.st.com>
Cc: devicetree@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/9] bus: rifsc: use new
 CONFIG_STM32_FIREWALL_DEBUG switch
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:robh@kernel.org,m:krzk@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:devicetree@vger.kernel.org,m:llvm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 7DEB712FED1
X-Rspamd-Action: no action

Hi Gatien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/dt-bindings-bus-document-the-RISAB-firewall-peripheral/20260212-182006
base:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
patch link:    https://lore.kernel.org/r/20260212-stm32_risab-v2-3-02ef2859b596%40foss.st.com
patch subject: [PATCH v2 3/9] bus: rifsc: use new CONFIG_STM32_FIREWALL_DEBUG switch
config: loongarch-randconfig-002-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130151.3v3igg2M-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130151.3v3igg2M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130151.3v3igg2M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/stm32_rifsc.c:436:21: warning: attribute declaration must precede definition [-Wignored-attributes]
     436 | static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp21_res_names = {
         |                     ^
   include/linux/compiler_attributes.h:343:56: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   drivers/bus/stm32_rifsc.c:424:8: note: previous definition is here
     424 | struct stm32_rifsc_resources_names {
         |        ^
   drivers/bus/stm32_rifsc.c:441:21: warning: attribute declaration must precede definition [-Wignored-attributes]
     441 | static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp25_res_names = {
         |                     ^
   include/linux/compiler_attributes.h:343:56: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   drivers/bus/stm32_rifsc.c:424:8: note: previous definition is here
     424 | struct stm32_rifsc_resources_names {
         |        ^
   2 warnings generated.


vim +436 drivers/bus/stm32_rifsc.c

   435	
 > 436	static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp21_res_names = {
   437		.device_names = stm32mp21_rifsc_risup_names,
   438		.initiator_names = stm32mp21_rifsc_rimu_names,
   439	};
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
