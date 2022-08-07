Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF2058BBDD
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Aug 2022 18:42:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9635DC04001;
	Sun,  7 Aug 2022 16:42:47 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08EA7C03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Aug 2022 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659890566; x=1691426566;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m7UDkbcSJofd2FzwIFR35QKztaXGo8SNOzvGgY8tgg4=;
 b=FNinD3NJE0TUeF5nranrvgEYbaG0HFlY7Y7dr2VCN2+z+HFsv37RWJga
 VGi/R5kIBbEjswr0B9Fe4i85c+2HDOCdIBcy/NpgfXiISDzsVWqcywXly
 uXf2CqYnNqErX14kc4zqApWXqrpP43FKAmC/DOOF1wcgSL+8YuWLkGMQc
 ENdmWlbpN8vmCSurWRBsbpMZ0QjKddx1knyVhFYBrWLEX4SRSoMd17AZA
 l7V1hY03py9ZLXLtcPeQxsZPhuU9fwkrkLg6dMnC8m0h37U7gudyinY6s
 Itwb9mwGSjPUmkWbJRu63e6BmloFRGFqbxJDoB2d6cLazp4fplaUJRdT3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="316353524"
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; d="scan'208";a="316353524"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2022 09:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; d="scan'208";a="707165521"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 07 Aug 2022 09:42:42 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oKjMP-000LTg-2a;
 Sun, 07 Aug 2022 16:42:41 +0000
Date: Mon, 8 Aug 2022 00:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>
Message-ID: <202208080002.oJGJBzP5-lkp@intel.com>
References: <20220807145247.46107-27-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220807145247.46107-27-paul@crapouillou.net>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 26/28] mfd: stmpe: Remove #ifdef guards
 for PM related functions
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

Hi Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v5.19]
[cannot apply to lee-mfd/for-mfd-next linus/master next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/mfd-Remove-ifdef-guards-for-PM-functions/20220807-225947
base:    3d7cb6b04c3f3115719235cc6866b10326de34cd
config: openrisc-randconfig-r015-20220807 (https://download.01.org/0day-ci/archive/20220808/202208080002.oJGJBzP5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e94df3ff809e588320625b95a2ef6485965ddc02
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Cercueil/mfd-Remove-ifdef-guards-for-PM-functions/20220807-225947
        git checkout e94df3ff809e588320625b95a2ef6485965ddc02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mfd/stmpe.c:1531:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    1531 | const EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmpe_dev_pm_ops,
         | ^~~~~


vim +/static +1531 drivers/mfd/stmpe.c

  1530	
> 1531	const EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmpe_dev_pm_ops,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
