Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFB94ECC9E
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 20:47:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B80A2C6046A;
	Wed, 30 Mar 2022 18:47:38 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BAE0C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648666057; x=1680202057;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1gyOUmznH3pZBVK2tU7XqvNJ978LLkV6wParuR9BPcg=;
 b=OndB5kLfRBZ2QM3hkxkSokNYoyRyAe2v2Wn+T4B8PUjIOX9CVPTsJPV4
 +LP5rBRHNYXT6oroEBIqPosyNmkoNWNiu+JZtmZ87b5Ju3j5ht0ZekdwE
 81mCsi36UdzcDrFO/9WXYiV7spf36hE0XbKnJy+pNSTRnib+IySZj/257
 ER6vDIB7jHv5e6Xgvi1ToXC3nLx5Eac06aeeiZtPhnWVEWsXbXjYxXuM2
 PNAIvlO5yKupUsTobrPXkTn5NtnLnK34WkbyKJVmsbE8JcJ5zMr1UMtMi
 YSL0aW0Chr4ua0SQ75Cgqioc7Br4/Hfd3PMilfjHrhaOzOtcFweP9G+Dm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322801164"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322801164"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 11:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="788107199"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2022 11:47:27 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZdLq-0000K0-RG;
 Wed, 30 Mar 2022 18:47:26 +0000
Date: Thu, 31 Mar 2022 02:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Message-ID: <202203310240.Za1Wqczl-lkp@intel.com>
References: <20220330145030.1562-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330145030.1562-6-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrew Lunn <andrew@lunn.ch>, kbuild-all@lists.01.org,
 Tomer Maimon <tmaimon77@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>, llvm@lists.linux.dev,
 Tomasz Figa <tomasz.figa@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrick Venture <venture@google.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v3 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
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

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on a67ba3cf9551f8c92d5ec9d7eae1aadbb9127b57]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpiolib-Two-new-helpers-and-way-toward-fwnode/20220330-225341
base:   a67ba3cf9551f8c92d5ec9d7eae1aadbb9127b57
config: riscv-randconfig-r032-20220330 (https://download.01.org/0day-ci/archive/20220331/202203310240.Za1Wqczl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3539d23dd289ca77a85d66fe8721e4febfc50ea4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-Two-new-helpers-and-way-toward-fwnode/20220330-225341
        git checkout 3539d23dd289ca77a85d66fe8721e4febfc50ea4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/pinctrl/samsung/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/samsung/pinctrl-s3c24xx.c:528:50: error: no member named 'of_node' in 'struct samsung_pin_bank'; did you mean 'fwnode'?
                   bank->irq_domain = irq_domain_add_linear(bank->of_node,
                                                                  ^~~~~~~
                                                                  fwnode
   drivers/pinctrl/samsung/pinctrl-samsung.h:168:24: note: 'fwnode' declared here
           struct fwnode_handle *fwnode;
                                 ^
   1 error generated.


vim +528 drivers/pinctrl/samsung/pinctrl-s3c24xx.c

af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  457  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  458  static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  459  {
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  460  	struct device *dev = d->dev;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  461  	const struct of_device_id *match;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  462  	struct device_node *eint_np = NULL;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  463  	struct device_node *np;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  464  	struct samsung_pin_bank *bank;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  465  	struct s3c24xx_eint_data *eint_data;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  466  	const struct irq_domain_ops *ops;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  467  	unsigned int i;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  468  	bool eint0_3_parent_only;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  469  	irq_flow_handler_t *handlers;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  470  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  471  	for_each_child_of_node(dev->of_node, np) {
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  472  		match = of_match_node(s3c24xx_eint_irq_ids, np);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  473  		if (match) {
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  474  			eint_np = np;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  475  			eint0_3_parent_only = (bool)match->data;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  476  			break;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  477  		}
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  478  	}
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  479  	if (!eint_np)
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  480  		return -ENODEV;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  481  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  482  	eint_data = devm_kzalloc(dev, sizeof(*eint_data), GFP_KERNEL);
6fbbcb050802d6 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Krzysztof Kozlowski 2019-08-05  483  	if (!eint_data) {
6fbbcb050802d6 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Krzysztof Kozlowski 2019-08-05  484  		of_node_put(eint_np);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  485  		return -ENOMEM;
6fbbcb050802d6 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Krzysztof Kozlowski 2019-08-05  486  	}
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  487  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  488  	eint_data->drvdata = d;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  489  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  490  	handlers = eint0_3_parent_only ? s3c2410_eint_handlers
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  491  				       : s3c2412_eint_handlers;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  492  	for (i = 0; i < NUM_EINT_IRQ; ++i) {
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  493  		unsigned int irq;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  494  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  495  		irq = irq_of_parse_and_map(eint_np, i);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  496  		if (!irq) {
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  497  			dev_err(dev, "failed to get wakeup EINT IRQ %d\n", i);
6fbbcb050802d6 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Krzysztof Kozlowski 2019-08-05  498  			of_node_put(eint_np);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  499  			return -ENXIO;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  500  		}
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  501  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  502  		eint_data->parents[i] = irq;
0cfc45cfdf5065 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Thomas Gleixner     2015-06-21  503  		irq_set_chained_handler_and_data(irq, handlers[i], eint_data);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  504  	}
6fbbcb050802d6 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Krzysztof Kozlowski 2019-08-05  505  	of_node_put(eint_np);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  506  
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Tomasz Figa         2014-09-23  507  	bank = d->pin_banks;
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Tomasz Figa         2014-09-23  508  	for (i = 0; i < d->nr_banks; ++i, ++bank) {
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  509  		struct s3c24xx_eint_domain_data *ddata;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  510  		unsigned int mask;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  511  		unsigned int irq;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  512  		unsigned int pin;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  513  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  514  		if (bank->eint_type != EINT_TYPE_WKUP)
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  515  			continue;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  516  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  517  		ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  518  		if (!ddata)
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  519  			return -ENOMEM;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  520  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  521  		ddata->bank = bank;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  522  		ddata->eint_data = eint_data;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  523  		ddata->eint0_3_parent_only = eint0_3_parent_only;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  524  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  525  		ops = (bank->eint_offset == 0) ? &s3c24xx_gpf_irq_ops
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  526  					       : &s3c24xx_gpg_irq_ops;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  527  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21 @528  		bank->irq_domain = irq_domain_add_linear(bank->of_node,
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  529  				bank->nr_pins, ops, ddata);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  530  		if (!bank->irq_domain) {
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  531  			dev_err(dev, "wkup irq domain add failed\n");
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  532  			return -ENXIO;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  533  		}
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  534  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  535  		irq = bank->eint_offset;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  536  		mask = bank->eint_mask;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  537  		for (pin = 0; mask; ++pin, mask >>= 1) {
774e2d981f517e drivers/pinctrl/pinctrl-s3c24xx.c         Dan Carpenter       2013-08-27  538  			if (irq >= NUM_EINT)
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  539  				break;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  540  			if (!(mask & 1))
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  541  				continue;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  542  			eint_data->domains[irq] = bank->irq_domain;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  543  			++irq;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  544  		}
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  545  	}
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  546  
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  547  	return 0;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  548  }
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner      2013-05-21  549  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
