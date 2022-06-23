Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F465570C6
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 04:00:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB731C57B6C;
	Thu, 23 Jun 2022 02:00:13 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60800C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jun 2022 02:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655949611; x=1687485611;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KbeXCVtz+edFvopo5p5QoDn9huAgw0qHkMWWoFBLhXA=;
 b=K4kdcK7tmv8yFX/iIaqarcIT6CwPf/oxpAj+grArdKEqpFy2ZcSQ9did
 oqZ2xXHxsg7VaaEFyrmDaOw0KMdqonTayRX5PksTtQvscVosqSs7+Mr47
 G4qU+JPvrooqDk52Hi/6nhkJRshaLfPD42dn3RmO7Q0ntmZyUtosQFq4D
 V8lkO9QBgrCcrecdWqupsJWLZ3kI62vd9bXcAVb9quUYi09Wc3dw9yIxf
 SfzU30lBdNALut4U/9iGnjsz31iG33GFjUtwaU8I8N02XqGwZVrlwNY/4
 6ryOUA8tgbFFCUs5TGcaTSh5s0DPuimxrMgdLWWpyAFl+2vhxB6Lvh18c g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="279365138"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="279365138"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 19:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="615398908"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 22 Jun 2022 19:00:02 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o4C8X-0000LT-BJ;
 Thu, 23 Jun 2022 02:00:01 +0000
Date: Thu, 23 Jun 2022 09:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Message-ID: <202206230910.wUXKFP3z-lkp@intel.com>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, nicolas.ferre@microchip.com,
 srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 kbuild-all@lists.01.org, lgirdwood@gmail.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, daniel@ffwll.ch, shawnguo@kernel.org,
 daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH 27/96] ASoC: au1x: Migrate to new style
 legacy DAI naming flag
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

Hi Charles,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tegra/for-next sunxi/sunxi/for-next linus/master v5.19-rc3 next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/Refactor-non_legacy_dai_naming-flag/20220616-224300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20220623/202206230910.wUXKFP3z-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/794205d61285d0921e564e722daf9b20df82ed57
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Charles-Keepax/Refactor-non_legacy_dai_naming-flag/20220616-224300
        git checkout 794205d61285d0921e564e722daf9b20df82ed57
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/soc/au1x/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> sound/soc/au1x/ac97c.c:227:10: error: 'const struct snd_soc_component_driver' has no member named 'legacy_dai_name'; did you mean 'legacy_dai_naming'?
     227 |         .legacy_dai_name        = 1,
         |          ^~~~~~~~~~~~~~~
         |          legacy_dai_naming
>> sound/soc/au1x/ac97c.c:227:35: warning: initialization of 'const struct snd_kcontrol_new *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     227 |         .legacy_dai_name        = 1,
         |                                   ^
   sound/soc/au1x/ac97c.c:227:35: note: (near initialization for 'au1xac97c_component.controls')


vim +227 sound/soc/au1x/ac97c.c

   224	
   225	static const struct snd_soc_component_driver au1xac97c_component = {
   226		.name			= "au1xac97c",
 > 227		.legacy_dai_name	= 1,
   228	};
   229	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
