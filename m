Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB971C0F5E
	for <lists+linux-stm32@lfdr.de>; Fri,  1 May 2020 10:21:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2310C36B0F;
	Fri,  1 May 2020 08:21:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6721C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 08:21:21 +0000 (UTC)
IronPort-SDR: nZVUK6VyWzG26hyYZ6hkruOKmiuTgSDiziVciHX63qTE/wWfb6ENSVPFAyA51it1AYo82XDGNU
 MRZcTVJczmaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 01:21:19 -0700
IronPort-SDR: h77IynNGJak8oRRpCu0/PkUFI8Q4PTPXFuZ2UUgOQ7BD+jdUT2aXj3GtymILU6WoX7nDj2vxcZ
 9fitF+xCkE5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; d="scan'208";a="247445165"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 01 May 2020 01:21:11 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jUQv0-0008Y7-W1; Fri, 01 May 2020 16:21:10 +0800
Date: Fri, 1 May 2020 16:20:57 +0800
From: kbuild test robot <lkp@intel.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
Message-ID: <202005011619.Tn2f4rMl%lkp@intel.com>
References: <d84f0bb3258d1664e90da64d75f787829c50a9bd.1588176662.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d84f0bb3258d1664e90da64d75f787829c50a9bd.1588176662.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, kbuild-all@lists.01.org,
 david@lechnology.com, felipe.balbi@linux.intel.com, linux-iio@vger.kernel.org,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 fabien.lahoudere@collabora.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/4] counter: Internalize sysfs interface
	code
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

Hi William,

I love your patch! Perhaps something to improve:

[auto build test WARNING on stm32/stm32-next]
[cannot apply to linus/master linux/master v5.7-rc3 next-20200430]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/William-Breathitt-Gray/Introduce-the-Counter-character-device-interface/20200430-051734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/counter/104-quad-8.c:700:56: sparse: sparse: mixing different enum types:
>> drivers/counter/104-quad-8.c:700:56: sparse:    unsigned int enum counter_count_function
>> drivers/counter/104-quad-8.c:700:56: sparse:    unsigned int enum quad8_count_function
--
>> drivers/counter/stm32-lptimer-cnt.c:573:24: sparse: sparse: mixing different enum types:
>> drivers/counter/stm32-lptimer-cnt.c:573:24: sparse:    unsigned int enum counter_count_function
>> drivers/counter/stm32-lptimer-cnt.c:573:24: sparse:    unsigned int enum stm32_lptim_cnt_function

vim +700 drivers/counter/104-quad-8.c

   693	
   694	static int quad8_function_write(struct counter_device *counter,
   695					struct counter_count *count,
   696					enum counter_count_function function)
   697	{
   698		struct quad8_iio *const priv = counter->priv;
   699		const int id = count->id;
 > 700		const enum quad8_count_function cnt_function = function;
   701		unsigned int *const quadrature_mode = priv->quadrature_mode + id;
   702		unsigned int *const scale = priv->quadrature_scale + id;
   703		unsigned int mode_cfg = priv->count_mode[id] << 1;
   704		unsigned int *const synchronous_mode = priv->synchronous_mode + id;
   705		const unsigned int idr_cfg = priv->index_polarity[id] << 1;
   706		const int base_offset = priv->base + 2 * id + 1;
   707	
   708		if (cnt_function == QUAD8_COUNT_FUNCTION_PULSE_DIRECTION) {
   709			*quadrature_mode = 0;
   710	
   711			/* Quadrature scaling only available in quadrature mode */
   712			*scale = 0;
   713	
   714			/* Synchronous function not supported in non-quadrature mode */
   715			if (*synchronous_mode) {
   716				*synchronous_mode = 0;
   717				/* Disable synchronous function mode */
   718				outb(QUAD8_CTR_IDR | idr_cfg, base_offset);
   719			}
   720		} else {
   721			*quadrature_mode = 1;
   722	
   723			switch (cnt_function) {
   724			case QUAD8_COUNT_FUNCTION_QUADRATURE_X1:
   725				*scale = 0;
   726				mode_cfg |= QUAD8_CMR_QUADRATURE_X1;
   727				break;
   728			case QUAD8_COUNT_FUNCTION_QUADRATURE_X2:
   729				*scale = 1;
   730				mode_cfg |= QUAD8_CMR_QUADRATURE_X2;
   731				break;
   732			case QUAD8_COUNT_FUNCTION_QUADRATURE_X4:
   733				*scale = 2;
   734				mode_cfg |= QUAD8_CMR_QUADRATURE_X4;
   735				break;
   736			default: return -EINVAL;
   737			}
   738		}
   739	
   740		/* Load mode configuration to Counter Mode Register */
   741		outb(QUAD8_CTR_CMR | mode_cfg, base_offset);
   742	
   743		return 0;
   744	}
   745	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
