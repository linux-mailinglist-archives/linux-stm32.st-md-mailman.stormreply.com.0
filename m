Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA6EOoPjF2oyUggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 08:41:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 802055ED56C
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 08:41:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87712C8F287;
	Thu, 28 May 2026 06:41:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3EB4C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2026 06:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779950465; x=1811486465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SioP6jDgWCwXbGQVSvOG90A2ONx8D8JxSS4hvLLdlx8=;
 b=NGG6EX04UsMEKG/cthGnyxO5Lf8beWWpHoxKhh11TiOiOT/v/Xtcmrkx
 v4L6wNOHCxUS/lxFGJRKemOWxpGr6V4X1/US26Y0vS1TaAQp52927TtB6
 l/tB+KkJkoxfwS+18IGrn+SqbUVo/S8d/O2dVm6f3IRSJKbbx9L0wlHQS
 4mO+0R8kES7dP6fmSMl/sMMpGV5Q864ItWrk4Opc5f2kIVSzx91YMPK5X
 oJXmu7a4m63BMcYYtBLhOYWqTPj9g7uGXDcS0iXjyjYHhcROhcPFuH3zp
 0AhWivTmYLN+5WIyJc61fKEENzxoi2B35CAjQVDn1zXjtBHMOXE8/SiO2 A==;
X-CSE-ConnectionGUID: ZSP9lRoYREGWigNPmFEeiA==
X-CSE-MsgGUID: MbWo4pNEQyunzVXADaeLhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92263274"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="92263274"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 23:41:03 -0700
X-CSE-ConnectionGUID: AD0JX70CQtC2uKqoWuRP1w==
X-CSE-MsgGUID: xnwTCWx8SKiOK0BVLFC32w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239892506"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 27 May 2026 23:40:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wSUQJ-000000005dK-33pH;
 Thu, 28 May 2026 06:40:55 +0000
Date: Thu, 28 May 2026 14:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>, Jyoti Bhayana <jbhayana@google.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Message-ID: <202605281432.a64fe4iY-lkp@intel.com>
References: <20260525014654.2399354-1-dlechner@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525014654.2399354-1-dlechner@baylibre.com>
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: pressure: cros_ec_baro: simplify
 timestamp channel definition
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
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:jbhayana@google.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[baylibre.com,google.com,kernel.org,analog.com,microchip.com,bootlin.com,tuxon.dev,gmail.com,foss.st.com,chromium.org];
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
	NEURAL_HAM(-0.00)[-0.911];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,git-scm.com:url]
X-Rspamd-Queue-Id: 802055ED56C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v7.1-rc5 next-20260527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/iio-pressure-cros_ec_baro-simplify-timestamp-channel-definition/20260525-134550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260525014654.2399354-1-dlechner%40baylibre.com
patch subject: [PATCH] iio: pressure: cros_ec_baro: simplify timestamp channel definition
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260528/202605281432.a64fe4iY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281432.a64fe4iY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281432.a64fe4iY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/iio/buffer.h:10,
                    from drivers/iio/pressure/cros_ec_baro.c:9:
   drivers/iio/pressure/cros_ec_baro.c: In function 'cros_ec_baro_probe':
>> include/linux/iio/iio.h:356:38: error: expected expression before '{' token
     356 | #define IIO_CHAN_SOFT_TIMESTAMP(_si) {                                  \
         |                                      ^
   drivers/iio/pressure/cros_ec_baro.c:174:20: note: in expansion of macro 'IIO_CHAN_SOFT_TIMESTAMP'
     174 |         *channel = IIO_CHAN_SOFT_TIMESTAMP(1);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +356 include/linux/iio/iio.h

00c5f80c2fad53 include/linux/iio/iio.h   Peter Rosin      2016-11-08  355  
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12 @356  #define IIO_CHAN_SOFT_TIMESTAMP(_si) {					\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  357  	.type = IIO_TIMESTAMP,						\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  358  	.channel = -1,							\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  359  	.scan_index = _si,						\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  360  	.scan_type = {							\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  361  		.sign = 's',						\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  362  		.realbits = 64,					\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  363  		.storagebits = 64,					\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  364  		},							\
07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  365  }
1d892719e70e47 drivers/staging/iio/iio.h Jonathan Cameron 2011-05-18  366  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
