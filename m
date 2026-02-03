Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO2tFdA7g2ngjwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 13:30:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F183DE5CE4
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 13:30:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88DCFC87ECA;
	Wed,  4 Feb 2026 12:30:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E03DC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 22:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770159361; x=1801695361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EpGvoxDrKuv7hIK1fCK6uHMFVNI2vX0KggMpEgCxAwY=;
 b=StHePfAj0EdsFm4VkLjLEEuzLhlvI7fT4SnJV/n6dK1nqRyxlmGa2fTd
 RIFCDctBGMo8uYPPY0I3lb8RxzTC/uWZ5rk9N9Gm8hu7QPdRez9ryWtaG
 Cv5V/6TshtlBZ3TTXWIONpDrvSN57AoBQbyAhZ1KswGUq3dE/QFW/zM3O
 6r37z+Ux4RYlcRUOyQf6UY8LCwd64/7bvyRW8lEsSFT5amvhe4x+zueC3
 NFOD+1oO+IlCuLZ0Ce1cAy1FRNPiokv4nJfkagoSQhUcXGdp4ZNihWkoI
 B3dCxaeOBh3syEZsZWdkolbOHSXJlRPn5Rd/RzIam5Lkdg6hXX44mpa4d A==;
X-CSE-ConnectionGUID: 50/2bMTeQoOnT1vmpx/8VA==
X-CSE-MsgGUID: +XDuOD8hTjC4OdwUzx1Apg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71402296"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71402296"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 14:55:59 -0800
X-CSE-ConnectionGUID: GQiDoYA+Qam4UgwOSktzIQ==
X-CSE-MsgGUID: C6nqfGIRQr21qCll8mjDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="214138905"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 03 Feb 2026 14:55:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vnPJJ-00000000hFi-1tvB;
 Tue, 03 Feb 2026 22:55:53 +0000
Date: Wed, 4 Feb 2026 06:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202602040608.vLI553iq-lkp@intel.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014@foss.st.com>
X-Mailman-Approved-At: Wed, 04 Feb 2026 12:30:06 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 08/13] media: stm32: dcmipp: add pixel
 pipes helper functions
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
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:hugues.fruchet@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,01.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,intel.com:mid,intel.com:email]
X-Rspamd-Queue-Id: F183DE5CE4
X-Rspamd-Action: no action

Hi Alain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eb4ee870747c3a77a9c3c84d84efb64bd481013a]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/media-stm32-dcmipp-share-struct-dcmipp_device-among-subdevs/20260202-220852
base:   eb4ee870747c3a77a9c3c84d84efb64bd481013a
patch link:    https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014%40foss.st.com
patch subject: [PATCH 08/13] media: stm32: dcmipp: add pixel pipes helper functions
config: riscv-randconfig-r122-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040608.vLI553iq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040608.vLI553iq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040608.vLI553iq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c:41:1: sparse: sparse: symbol 'dcmipp_pixel_formats_list' was not declared. Should it be static?

vim +/dcmipp_pixel_formats_list +41 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c

    17	
    18	#define DCMIPP_ENT(id, pad) (1 << (2 * (id) + (pad)))
    19	#define DCMIPP_ISP_SINK			(DCMIPP_ENT(DCMIPP_ISP, 0))
    20	#define DCMIPP_ISP_SRC			(DCMIPP_ENT(DCMIPP_ISP, 1))
    21	#define DCMIPP_ISP_INOUT		(DCMIPP_ISP_SINK | DCMIPP_ISP_SRC)
    22	#define DCMIPP_MAIN_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_MAIN, 0))
    23	#define DCMIPP_MAIN_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_MAIN, 1))
    24	#define DCMIPP_MAIN_POSTPROC_INOUT					\
    25		(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_MAIN_POSTPROC_SRC)
    26	#define DCMIPP_AUX_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_AUX, 0))
    27	#define DCMIPP_AUX_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_AUX, 1))
    28	#define DCMIPP_AUX_POSTPROC_INOUT					\
    29		(DCMIPP_AUX_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SRC)
    30	#define DCMIPP_ALL_POSTPROC_SINK					\
    31		(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SINK)
    32	#define DCMIPP_ALL_POSTPROC_INOUT					\
    33		(DCMIPP_MAIN_POSTPROC_INOUT | DCMIPP_AUX_POSTPROC_INOUT)
    34	
    35	#define PIXMAP_MBUS(mbus, applicable_pipes)		\
    36		{						\
    37			.code = MEDIA_BUS_FMT_##mbus,		\
    38			.pipes = applicable_pipes,		\
    39		}
    40	const struct dcmipp_pixelpipe_pix_map
  > 41	dcmipp_pixel_formats_list[] = {
    42		/* RGB formats */
    43		/* RGB565 / RGB888 */
    44		PIXMAP_MBUS(RGB565_2X8_LE, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    45		PIXMAP_MBUS(RGB565_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    46		PIXMAP_MBUS(RGB888_3X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    47		PIXMAP_MBUS(RGB888_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_INOUT),
    48		/* YUV formats */
    49		PIXMAP_MBUS(YUYV8_2X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    50		PIXMAP_MBUS(UYVY8_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    51		PIXMAP_MBUS(YUV8_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_SRC),
    52		/* GREY */
    53		PIXMAP_MBUS(Y8_1X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    54		PIXMAP_MBUS(Y10_1X10, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    55		PIXMAP_MBUS(Y12_1X12, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    56		PIXMAP_MBUS(Y14_1X14, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    57		/* Raw Bayer */
    58		/* Raw 8 */
    59		PIXMAP_MBUS(SBGGR8_1X8, DCMIPP_ISP_SINK),
    60		PIXMAP_MBUS(SGBRG8_1X8, DCMIPP_ISP_SINK),
    61		PIXMAP_MBUS(SGRBG8_1X8, DCMIPP_ISP_SINK),
    62		PIXMAP_MBUS(SRGGB8_1X8, DCMIPP_ISP_SINK),
    63		/* Raw 10 */
    64		PIXMAP_MBUS(SBGGR10_1X10, DCMIPP_ISP_SINK),
    65		PIXMAP_MBUS(SGBRG10_1X10, DCMIPP_ISP_SINK),
    66		PIXMAP_MBUS(SGRBG10_1X10, DCMIPP_ISP_SINK),
    67		PIXMAP_MBUS(SRGGB10_1X10, DCMIPP_ISP_SINK),
    68		/* Raw 12 */
    69		PIXMAP_MBUS(SBGGR12_1X12, DCMIPP_ISP_SINK),
    70		PIXMAP_MBUS(SGBRG12_1X12, DCMIPP_ISP_SINK),
    71		PIXMAP_MBUS(SGRBG12_1X12, DCMIPP_ISP_SINK),
    72		PIXMAP_MBUS(SRGGB12_1X12, DCMIPP_ISP_SINK),
    73		/* Raw 14 */
    74		PIXMAP_MBUS(SBGGR14_1X14, DCMIPP_ISP_SINK),
    75		PIXMAP_MBUS(SGBRG14_1X14, DCMIPP_ISP_SINK),
    76		PIXMAP_MBUS(SGRBG14_1X14, DCMIPP_ISP_SINK),
    77		PIXMAP_MBUS(SRGGB14_1X14, DCMIPP_ISP_SINK),
    78	};
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
