Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E268C501497
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Apr 2022 17:32:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58B98C60495;
	Thu, 14 Apr 2022 15:32:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75638C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649950343; x=1681486343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GWVpvaE0Wgi4ximav1D+j4xQUb5aXMCEWIKwKCiRekw=;
 b=BI3i8S47UNN387OA57jhlqYzCMVuGHkoIMHxWDmbLcrYUlbAqUr/9Uyu
 amGiDHV2JGhlGG0NVIrK+cGHjS00QaYyTE9DTUP6Zq0cJTbtokjxpmUNi
 kXz5eIiao/SBDb8edzQ/GoRNwEZINoF3J1isBW1i+nGu7t+WrPDVDUVnX
 y3FCjEZ6cxp3RvKmDsE4klFE5tew4ttZDU/eY9yjXAE32dt4fJ7L+D3n6
 hG3uZ48rMYbotsGEaMTCTO8KFdsLkGm+3aD+keeG6Jya066YULLsQrkmb
 f3ZPwyuvF9h427MF8FyEmCl2ntIQdH6xVNyVgDMNjKoTJ2KccQiKLUjm3 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="261801340"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="261801340"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="552728132"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 14 Apr 2022 08:32:15 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nf1SA-00014v-Sw;
 Thu, 14 Apr 2022 15:32:14 +0000
Date: Thu, 14 Apr 2022 23:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <202204142333.qXgcGMI1-lkp@intel.com>
References: <20220412103114.19922-8-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412103114.19922-8-jason-jh.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, moudy.ho@mediatek.com, kbuild-all@lists.01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev, roy-cw.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 hsinyi@chromium.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v18 07/10] drm/mediatek: add mediatek-drm
 of vdosys0 support for mt8195
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

Hi "jason-jh.lin",

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on robh/for-next krzk/for-next linus/master v5.18-rc2 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/jason-jh-lin/Add-Mediatek-Soc-DRM-vdosys0-support-for-mt8195/20220412-183359
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-buildonly-randconfig-r001-20220413 (https://download.01.org/0day-ci/archive/20220414/202204142333.qXgcGMI1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7c175317aa80bbc885609a730214448147a46b47
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review jason-jh-lin/Add-Mediatek-Soc-DRM-vdosys0-support-for-mt8195/20220412-183359
        git checkout 7c175317aa80bbc885609a730214448147a46b47
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/mediatek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_drm_drv.c:707:15: warning: cast to smaller integer type 'enum mtk_ddp_comp_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   comp_type = (enum mtk_ddp_comp_type)of_id->data;
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:203:42: warning: unused variable 'mt2701_mmsys_match_data' [-Wunused-const-variable]
   static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
                                            ^
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:218:42: warning: unused variable 'mt7623_mmsys_match_data' [-Wunused-const-variable]
   static const struct mtk_mmsys_match_data mt7623_mmsys_match_data = {
                                            ^
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:234:42: warning: unused variable 'mt2712_mmsys_match_data' [-Wunused-const-variable]
   static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
                                            ^
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:246:42: warning: unused variable 'mt8167_mmsys_match_data' [-Wunused-const-variable]
   static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
                                            ^
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:260:42: warning: unused variable 'mt8173_mmsys_match_data' [-Wunused-const-variable]
   static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
                                            ^
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:274:42: warning: unused variable 'mt8183_mmsys_match_data' [-Wunused-const-variable]
   static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
                                            ^
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:288:42: warning: unused variable 'mt8192_mmsys_match_data' [-Wunused-const-variable]
   static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
                                            ^
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:305:42: warning: unused variable 'mt8195_mmsys_match_data' [-Wunused-const-variable]
   static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
                                            ^
   9 warnings generated.


vim +/mt2701_mmsys_match_data +203 drivers/gpu/drm/mediatek/mtk_drm_drv.c

   202	
 > 203	static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
   204		.num_drv_data = 1,
   205		.drv_data = {
   206			&mt2701_mmsys_driver_data,
   207		},
   208	};
   209	
   210	static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
   211		.main_path = mt7623_mtk_ddp_main,
   212		.main_len = ARRAY_SIZE(mt7623_mtk_ddp_main),
   213		.ext_path = mt7623_mtk_ddp_ext,
   214		.ext_len = ARRAY_SIZE(mt7623_mtk_ddp_ext),
   215		.shadow_register = true,
   216	};
   217	
 > 218	static const struct mtk_mmsys_match_data mt7623_mmsys_match_data = {
   219		.num_drv_data = 1,
   220		.drv_data = {
   221			&mt7623_mmsys_driver_data,
   222		},
   223	};
   224	
   225	static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
   226		.main_path = mt2712_mtk_ddp_main,
   227		.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
   228		.ext_path = mt2712_mtk_ddp_ext,
   229		.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
   230		.third_path = mt2712_mtk_ddp_third,
   231		.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
   232	};
   233	
 > 234	static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
   235		.num_drv_data = 1,
   236		.drv_data = {
   237			&mt2712_mmsys_driver_data,
   238		},
   239	};
   240	
   241	static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
   242		.main_path = mt8167_mtk_ddp_main,
   243		.main_len = ARRAY_SIZE(mt8167_mtk_ddp_main),
   244	};
   245	
 > 246	static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
   247		.num_drv_data = 1,
   248		.drv_data = {
   249			&mt8167_mmsys_driver_data,
   250		},
   251	};
   252	
   253	static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
   254		.main_path = mt8173_mtk_ddp_main,
   255		.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
   256		.ext_path = mt8173_mtk_ddp_ext,
   257		.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
   258	};
   259	
 > 260	static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
   261		.num_drv_data = 1,
   262		.drv_data = {
   263			&mt8173_mmsys_driver_data,
   264		},
   265	};
   266	
   267	static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
   268		.main_path = mt8183_mtk_ddp_main,
   269		.main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
   270		.ext_path = mt8183_mtk_ddp_ext,
   271		.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
   272	};
   273	
 > 274	static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
   275		.num_drv_data = 1,
   276		.drv_data = {
   277			&mt8183_mmsys_driver_data,
   278		},
   279	};
   280	
   281	static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
   282		.main_path = mt8192_mtk_ddp_main,
   283		.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
   284		.ext_path = mt8192_mtk_ddp_ext,
   285		.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
   286	};
   287	
 > 288	static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
   289		.num_drv_data = 1,
   290		.drv_data = {
   291			&mt8192_mmsys_driver_data,
   292		},
   293	};
   294	
   295	static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
   296		.io_start = 0x1c01a000,
   297		.main_path = mt8195_mtk_ddp_main,
   298		.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
   299	};
   300	
   301	static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
   302		.io_start = 0x1c100000,
   303	};
   304	
 > 305	static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
   306		.num_drv_data = 1,
   307		.drv_data = {
   308			&mt8195_vdosys0_driver_data,
   309			&mt8195_vdosys1_driver_data,
   310		},
   311	};
   312	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
