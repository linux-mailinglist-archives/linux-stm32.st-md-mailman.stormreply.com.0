Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C853A7F562A
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 02:55:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 781D0C6B476;
	Thu, 23 Nov 2023 01:55:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37196C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 01:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700704516; x=1732240516;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VHehZwpNIdPmTUBaWqya7f7B1A3v9vGc+DstRouPofo=;
 b=csI8sMzDmkLl3dQOJQVRDHAi02NonMro+FBFPIjV1Wvf+Q8QZy/ZexL9
 5/7y65eygnGYxul4YDAMXPiJ5yRKi+CH/UFCsvIHyMQMt14P3rLFL85qm
 zw8uxrahO9OsGzX4IYlRHWmaiwpX7HeR73348MF/R7r0O9OYmn4xRod7m
 8SWevykWlBepJlcYF4dwuNNiOyBuzGe1Pr9IcSpAWAu9pZSNEabVVMxB7
 dt6d00HHrmmUh6WMuo+kxamtWn+VPNCgI7Wa5kpQWUDEUCy6ecwNfHjAJ
 O1j9OBhpLPVIt2hPt52zLkqPeGvhwUm8FOvUmXn0XynHCETdDlcDJ3tEJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458674165"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="458674165"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 17:55:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884821106"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="884821106"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 17:55:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r5yvq-00016C-38;
 Thu, 23 Nov 2023 01:55:06 +0000
Date: Thu, 23 Nov 2023 09:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>
Message-ID: <202311230551.R2sCXDEC-lkp@intel.com>
References: <20231122073927.788810-4-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122073927.788810-4-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dan Scally <dan.scally@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 3/5] media: stm32-dcmipp: STM32 DCMIPP
 camera interface driver
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

Hi Alain,

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on media-tree/master linuxtv-media-stage/master linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/dt-bindings-media-add-bindings-for-stm32-dcmipp/20231122-154327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231122073927.788810-4-alain.volmat%40foss.st.com
patch subject: [PATCH v8 3/5] media: stm32-dcmipp: STM32 DCMIPP camera interface driver
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231123/202311230551.R2sCXDEC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230551.R2sCXDEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230551.R2sCXDEC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:154:8: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                        ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:154:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:236:7: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
                ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:236:5: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:256:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, 1);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:311:13: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           sink_fmt = v4l2_subdev_state_get_format(state, 0);
                      ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:311:11: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           sink_fmt = v4l2_subdev_state_get_format(state, 0);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:312:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           src_fmt = v4l2_subdev_state_get_format(state, 1);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 3 errors generated.
--
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:8: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                        ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:8: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           r = v4l2_subdev_state_get_compose(sd_state, i);
                               ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:8: note: did you mean 'v4l2_subdev_state_get_format'?
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:8: note: 'v4l2_subdev_state_get_format' declared here
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                        ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
                           r = v4l2_subdev_state_get_compose(sd_state, i);
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:177:8: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           r = v4l2_subdev_state_get_crop(sd_state, i);
                               ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:177:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
                           r = v4l2_subdev_state_get_crop(sd_state, i);
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:206:14: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
                              ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:206:12: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:230:13: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   compose = v4l2_subdev_state_get_compose(sd_state, 0);
                             ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:230:11: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
                   compose = v4l2_subdev_state_get_compose(sd_state, 0);
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:249:7: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
                ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:249:5: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:251:9: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:251:7: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:252:12: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                     ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:252:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:255:17: error: indirection requires pointer operand ('int' invalid)
                   fmt->format = *v4l2_subdev_state_get_format(sd_state, 0);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:266:3: error: indirection requires pointer operand ('int' invalid)
                   *v4l2_subdev_state_get_format(sd_state, 1) = fmt->format;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:297:13: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
                      ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:297:11: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:298:9: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:298:7: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:299:12: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                     ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:299:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:349:9: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:349:7: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:350:12: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                     ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:350:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:357:8: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   mf = v4l2_subdev_state_get_format(sd_state, 1);
                        ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:357:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, 1);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:365:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, 0);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:370:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, 1);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:406:13: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           sink_fmt = v4l2_subdev_state_get_format(state, 0);
                      ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:406:11: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           sink_fmt = v4l2_subdev_state_get_format(state, 0);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:407:12: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           compose = v4l2_subdev_state_get_compose(state, 0);
                     ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:407:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           compose = v4l2_subdev_state_get_compose(state, 0);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:408:9: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           crop = v4l2_subdev_state_get_crop(state, 1);
                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:408:7: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           crop = v4l2_subdev_state_get_crop(state, 1);


vim +/v4l2_subdev_state_get_format +154 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c

   145	
   146	static int dcmipp_par_init_cfg(struct v4l2_subdev *sd,
   147				       struct v4l2_subdev_state *sd_state)
   148	{
   149		unsigned int i;
   150	
   151		for (i = 0; i < sd->entity.num_pads; i++) {
   152			struct v4l2_mbus_framefmt *mf;
   153	
 > 154			mf = v4l2_subdev_state_get_format(sd_state, i);
   155			*mf = fmt_default;
   156		}
   157	
   158		return 0;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
