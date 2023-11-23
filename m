Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C71727F56F5
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 04:17:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71256C6B476;
	Thu, 23 Nov 2023 03:17:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79247C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 03:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700709442; x=1732245442;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7ehTNtyUZhQFTHzTWUvmGh28De2Y35+pTZbKu0dEQwY=;
 b=nQ4AmkpVwKN3EiKfNRQB+tQGGEYAoSK0nM7eqQX/dR6CPXxwJAO43tGt
 2fcm6KzVX3PQyxkfmTEvscpbWJ+QwW3yQr0QA0cuSgK9Mq5MX6aGRJA2Q
 kfYZqr+DNvuNh/0vg5TBVDU4rQl04fDHumExaEtKL8cUjfHXvFAaa8iLA
 cEHqY2VXRqpMgcZ/c0w5vGlVWVA4GZdNd8cMUvtTRNtC/Ce5QIune5RJ8
 xZERpQyBgmvMCH+e7dNVF9fu6ycm23Oa2e5TQaQNyOkdmnzTE3qPlSnpD
 HR24ajOcHuUgJDttpIChQ4X90kI5W1k/s9tW1pZQK2of/K4DTWsWenr79 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5380220"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="5380220"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 19:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767083294"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="767083294"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 22 Nov 2023 19:17:14 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r60DI-0001Az-11;
 Thu, 23 Nov 2023 03:17:12 +0000
Date: Thu, 23 Nov 2023 11:16:49 +0800
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
Message-ID: <202311231015.CDjoMVIV-lkp@intel.com>
References: <20231122073927.788810-4-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122073927.788810-4-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Scally <dan.scally@ideasonboard.com>,
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231123/202311231015.CDjoMVIV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311231015.CDjoMVIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311231015.CDjoMVIV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c: In function 'dcmipp_par_init_cfg':
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:154:22: error: implicit declaration of function 'v4l2_subdev_state_get_format'; did you mean 'v4l2_subdev_state_get_stream_format'? [-Werror=implicit-function-declaration]
     154 |                 mf = v4l2_subdev_state_get_format(sd_state, i);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      v4l2_subdev_state_get_stream_format
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:154:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |                 mf = v4l2_subdev_state_get_format(sd_state, i);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c: In function 'dcmipp_par_set_fmt':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:236:12: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     236 |         mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
         |            ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:256:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     256 |                 mf = v4l2_subdev_state_get_format(sd_state, 1);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c: In function 'dcmipp_par_configure':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:311:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     311 |         sink_fmt = v4l2_subdev_state_get_format(state, 0);
         |                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:312:17: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     312 |         src_fmt = v4l2_subdev_state_get_format(state, 1);
         |                 ^
   cc1: some warnings being treated as errors
--
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_init_cfg':
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:22: error: implicit declaration of function 'v4l2_subdev_state_get_format'; did you mean 'v4l2_subdev_state_get_stream_format'? [-Werror=implicit-function-declaration]
     171 |                 mf = v4l2_subdev_state_get_format(sd_state, i);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      v4l2_subdev_state_get_stream_format
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     171 |                 mf = v4l2_subdev_state_get_format(sd_state, i);
         |                    ^
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:29: error: implicit declaration of function 'v4l2_subdev_state_get_compose'; did you mean 'v4l2_subdev_state_get_stream_compose'? [-Werror=implicit-function-declaration]
     175 |                         r = v4l2_subdev_state_get_compose(sd_state, i);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             v4l2_subdev_state_get_stream_compose
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:27: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     175 |                         r = v4l2_subdev_state_get_compose(sd_state, i);
         |                           ^
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:177:29: error: implicit declaration of function 'v4l2_subdev_state_get_crop'; did you mean 'v4l2_subdev_state_get_stream_crop'? [-Werror=implicit-function-declaration]
     177 |                         r = v4l2_subdev_state_get_crop(sd_state, i);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             v4l2_subdev_state_get_stream_crop
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:177:27: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     177 |                         r = v4l2_subdev_state_get_crop(sd_state, i);
         |                           ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_enum_mbus_code':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:206:26: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     206 |                 sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
         |                          ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_enum_frame_size':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:230:25: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     230 |                 compose = v4l2_subdev_state_get_compose(sd_state, 0);
         |                         ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_set_fmt':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:249:12: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     249 |         mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
         |            ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:251:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     251 |         crop = v4l2_subdev_state_get_crop(sd_state, 1);
         |              ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:252:17: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     252 |         compose = v4l2_subdev_state_get_compose(sd_state, 0);
         |                 ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:255:31: error: invalid type argument of unary '*' (have 'int')
     255 |                 fmt->format = *v4l2_subdev_state_get_format(sd_state, 0);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:266:17: error: invalid type argument of unary '*' (have 'int')
     266 |                 *v4l2_subdev_state_get_format(sd_state, 1) = fmt->format;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_get_selection':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:297:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     297 |         sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
         |                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:298:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     298 |         crop = v4l2_subdev_state_get_crop(sd_state, 1);
         |              ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:299:17: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     299 |         compose = v4l2_subdev_state_get_compose(sd_state, 0);
         |                 ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_set_selection':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:349:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     349 |         crop = v4l2_subdev_state_get_crop(sd_state, 1);
         |              ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:350:17: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     350 |         compose = v4l2_subdev_state_get_compose(sd_state, 0);
         |                 ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:357:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     357 |                 mf = v4l2_subdev_state_get_format(sd_state, 1);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:365:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     365 |                 mf = v4l2_subdev_state_get_format(sd_state, 0);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:370:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     370 |                 mf = v4l2_subdev_state_get_format(sd_state, 1);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_configure_scale_crop':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:406:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     406 |         sink_fmt = v4l2_subdev_state_get_format(state, 0);
         |                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:407:17: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     407 |         compose = v4l2_subdev_state_get_compose(state, 0);
         |                 ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:408:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     408 |         crop = v4l2_subdev_state_get_crop(state, 1);
         |              ^
   cc1: some warnings being treated as errors


vim +154 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c

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
