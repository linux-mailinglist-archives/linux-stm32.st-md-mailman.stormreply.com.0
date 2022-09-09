Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 352D95B430B
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Sep 2022 01:26:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC715C64114;
	Fri,  9 Sep 2022 23:26:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC44DC6410D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 23:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662765987; x=1694301987;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g4hwGH0pU6mpaM2OsQ0RAEaOxEzoLrvVkvHORBX2fMc=;
 b=FwuZabLV1YY9T+yoQpWvQb/mLvQO6fE0dqEyrsw5hu/2lxK1Ygx6bpWa
 oRlgijBUCf7RQMTjddcmYIkLeNBY45vKcq2RY34TJ+47RE4/KbYv26vgx
 bvi0hh/czq2LFdTqqdknCwPROlaEwXika8qZsaozirgRKlwUZK1QmtwAQ
 pSaaBvvWopl+2I64g7/Z2NOciUp9no7bcLf+uOkHiN0ghYASWy3YgP3FC
 ROPVj4xC08FoHi5lDe+OZSxl+pXK1JiBlRTUT/RI1m91hdnrB3aj9lPAl
 AHvS3+Mb24nymUTFc+bwiakgLXhK7cmjE4WAlZPS4V12m5ZMfxmoJDiAB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="295172518"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="295172518"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 16:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="683808816"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2022 16:26:14 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oWnO1-0001rD-1N;
 Fri, 09 Sep 2022 23:26:13 +0000
Date: Sat, 10 Sep 2022 07:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>
Message-ID: <202209100741.2q2uPfCJ-lkp@intel.com>
References: <20220909165959.5899-4-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220909165959.5899-4-hugues.fruchet@foss.st.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/5] media: stm32-dcmipp: STM32 DCMIPP
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

Hi Hugues,

I love your patch! Yet something to improve:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on media-tree/master sailus-media-tree/streams linus/master v6.0-rc4 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hugues-Fruchet/Add-support-for-DCMIPP-camera-interface-of-STMicroelectronics-STM32-SoC-series/20220910-010413
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220910/202209100741.2q2uPfCJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/27ecbfe1ec56d46466cf305ba5f44de8e5a676f0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hugues-Fruchet/Add-support-for-DCMIPP-camera-interface-of-STMicroelectronics-STM32-SoC-series/20220910-010413
        git checkout 27ecbfe1ec56d46466cf305ba5f44de8e5a676f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/platform/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:27:
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:120:41: error: field 'bus' has incomplete type
     120 |         struct v4l2_fwnode_bus_parallel bus;
         |                                         ^~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c: In function 'dcmipp_comp_unbind':
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:225:9: error: implicit declaration of function 'v4l2_async_notifier_unregister'; did you mean 'v4l2_async_nf_unregister'? [-Werror=implicit-function-declaration]
     225 |         v4l2_async_notifier_unregister(&dcmipp->notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_async_nf_unregister
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:226:9: error: implicit declaration of function 'v4l2_async_notifier_cleanup'; did you mean 'v4l2_async_nf_cleanup'? [-Werror=implicit-function-declaration]
     226 |         v4l2_async_notifier_cleanup(&dcmipp->notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_async_nf_cleanup
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c: In function 'dcmipp_graph_init':
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:465:9: error: implicit declaration of function 'v4l2_async_notifier_init'; did you mean 'v4l2_async_nf_init'? [-Werror=implicit-function-declaration]
     465 |         v4l2_async_notifier_init(&dcmipp->notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_async_nf_init
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:467:15: error: implicit declaration of function 'v4l2_async_notifier_add_fwnode_remote_subdev'; did you mean 'v4l2_async_nf_add_fwnode_remote'? [-Werror=implicit-function-declaration]
     467 |         asd = v4l2_async_notifier_add_fwnode_remote_subdev
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_async_nf_add_fwnode_remote
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:469:18: error: expected expression before 'struct'
     469 |                  struct v4l2_async_subdev);
         |                  ^~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:480:15: error: implicit declaration of function 'v4l2_async_notifier_register'; did you mean 'v4l2_async_nf_register'? [-Werror=implicit-function-declaration]
     480 |         ret = v4l2_async_notifier_register(&dcmipp->v4l2_dev, &dcmipp->notifier);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_async_nf_register
   cc1: some warnings being treated as errors
--
   In file included from drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c:14:
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:120:41: error: field 'bus' has incomplete type
     120 |         struct v4l2_fwnode_bus_parallel bus;
         |                                         ^~~
--
   In file included from drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c:24:
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:120:41: error: field 'bus' has incomplete type
     120 |         struct v4l2_fwnode_bus_parallel bus;
         |                                         ^~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c: In function 'dcmipp_pipeline_s_stream':
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c:460:23: error: implicit declaration of function 'media_entity_remote_pad'; did you mean 'media_entity_remove_links'? [-Werror=implicit-function-declaration]
     460 |                 pad = media_entity_remote_pad(pad);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
         |                       media_entity_remove_links
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c:460:21: warning: assignment to 'struct media_pad *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     460 |                 pad = media_entity_remote_pad(pad);
         |                     ^
   cc1: some warnings being treated as errors


vim +/bus +120 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h

    92	
    93	/**
    94	 * struct dcmipp_ent_device - core struct that represents a node in the topology
    95	 *
    96	 * @ent:		the pointer to struct media_entity for the node
    97	 * @pads:		the list of pads of the node
    98	 * @process_frame:	callback send a frame to that node
    99	 * @vdev_get_format:	callback that returns the current format a pad, used
   100	 *			only when is_media_entity_v4l2_video_device(ent) returns
   101	 *			true
   102	 *
   103	 * Each node of the topology must create a dcmipp_ent_device struct. Depending on
   104	 * the node it will be of an instance of v4l2_subdev or video_device struct
   105	 * where both contains a struct media_entity.
   106	 * Those structures should embedded the dcmipp_ent_device struct through
   107	 * v4l2_set_subdevdata() and video_set_drvdata() respectivaly, allowing the
   108	 * dcmipp_ent_device struct to be retrieved from the corresponding struct
   109	 * media_entity
   110	 */
   111	struct dcmipp_ent_device {
   112		struct media_entity *ent;
   113		struct media_pad *pads;
   114		void * (*process_frame)(struct dcmipp_ent_device *ved,
   115					const void *frame);
   116		void (*vdev_get_format)(struct dcmipp_ent_device *ved,
   117					struct v4l2_pix_format *fmt);
   118	
   119		/* Parallel input device */
 > 120		struct v4l2_fwnode_bus_parallel	bus;
   121		enum v4l2_mbus_type		bus_type;
   122		irq_handler_t handler;
   123		irqreturn_t handler_ret;
   124		irq_handler_t thread_fn;
   125	};
   126	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
