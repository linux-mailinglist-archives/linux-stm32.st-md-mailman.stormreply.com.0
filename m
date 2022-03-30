Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90A4ECA93
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 19:25:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A553C6046A;
	Wed, 30 Mar 2022 17:25:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7AABC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648661134; x=1680197134;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2wbT9qjviMFXOJP9BA2NPmRzRlvFL8bjYWi5aL+brNc=;
 b=UK7G16WRqEwkpXv2Mqg7fC1/IbNDBG1/jqPv7nlZtUxkYujv1kKkhwRs
 1TZ0bh6zLJ51Mp8JlZTLdZ+r/OPCzAnmyOEXxX0GDV34HO/yvzq+Bb5Nt
 W9O0KL7TiQYI9ifPu+eW1WKrwIMetYcP1Pl0KK13kbx3kl3tk0xP88Qja
 wq2o6bNUxgPl+seSs9ebJojTWY1OIGU/k88MDv25Ye8Gf/AOiYXAyjNHU
 gwWJAykZerA/khk/NGaT8ld8/nbPU3AWluhZbhSwJqYw86Q1onEr3QDGd
 PEnn9bpBrz9QIbVGo1dYD9ioYlnV5UkUaXljRFFY6CU63eX1hdW4WdGe4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="240195692"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="240195692"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="618607535"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2022 10:25:23 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZc4Q-0000EO-UL;
 Wed, 30 Mar 2022 17:25:22 +0000
Date: Thu, 31 Mar 2022 01:25:07 +0800
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
Message-ID: <202203310151.Iu2JvLIF-lkp@intel.com>
References: <20220330145030.1562-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330145030.1562-6-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrew Lunn <andrew@lunn.ch>, kbuild-all@lists.01.org,
 Tomer Maimon <tmaimon77@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
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
config: riscv-buildonly-randconfig-r006-20220330 (https://download.01.org/0day-ci/archive/20220331/202203310151.Iu2JvLIF-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3539d23dd289ca77a85d66fe8721e4febfc50ea4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-Two-new-helpers-and-way-toward-fwnode/20220330-225341
        git checkout 3539d23dd289ca77a85d66fe8721e4febfc50ea4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function 's3c64xx_eint_gpio_init':
>> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:474:64: error: 'struct samsung_pin_bank' has no member named 'of_node'; did you mean 'fwnode'?
     474 |                 bank->irq_domain = irq_domain_add_linear(bank->of_node,
         |                                                                ^~~~~~~
         |                                                                fwnode
   drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function 's3c64xx_eint_eint0_init':
   drivers/pinctrl/samsung/pinctrl-s3c64xx.c:746:64: error: 'struct samsung_pin_bank' has no member named 'of_node'; did you mean 'fwnode'?
     746 |                 bank->irq_domain = irq_domain_add_linear(bank->of_node,
         |                                                                ^~~~~~~
         |                                                                fwnode


vim +474 drivers/pinctrl/samsung/pinctrl-s3c64xx.c

61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  444  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  445  /**
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  446   * s3c64xx_eint_gpio_init() - setup handling of external gpio interrupts.
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  447   * @d: driver data of samsung pinctrl driver.
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  448   */
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  449  static int s3c64xx_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  450  {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  451  	struct s3c64xx_eint_gpio_data *data;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  452  	struct samsung_pin_bank *bank;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  453  	struct device *dev = d->dev;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  454  	unsigned int nr_domains;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  455  	unsigned int i;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  456  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  457  	if (!d->irq) {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  458  		dev_err(dev, "irq number not available\n");
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  459  		return -EINVAL;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  460  	}
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  461  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  462  	nr_domains = 0;
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Tomasz Figa      2014-09-23  463  	bank = d->pin_banks;
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Tomasz Figa      2014-09-23  464  	for (i = 0; i < d->nr_banks; ++i, ++bank) {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  465  		unsigned int nr_eints;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  466  		unsigned int mask;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  467  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  468  		if (bank->eint_type != EINT_TYPE_GPIO)
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  469  			continue;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  470  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  471  		mask = bank->eint_mask;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  472  		nr_eints = fls(mask);
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  473  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18 @474  		bank->irq_domain = irq_domain_add_linear(bank->of_node,
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  475  					nr_eints, &s3c64xx_gpio_irqd_ops, bank);
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  476  		if (!bank->irq_domain) {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  477  			dev_err(dev, "gpio irq domain add failed\n");
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  478  			return -ENXIO;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  479  		}
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  480  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  481  		++nr_domains;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  482  	}
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  483  
0ed2dd03b94b7b drivers/pinctrl/samsung/pinctrl-s3c64xx.c Kees Cook        2018-05-08  484  	data = devm_kzalloc(dev, struct_size(data, domains, nr_domains),
0ed2dd03b94b7b drivers/pinctrl/samsung/pinctrl-s3c64xx.c Kees Cook        2018-05-08  485  			    GFP_KERNEL);
fa5c0f46e2b9a1 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Marek Szyprowski 2017-01-19  486  	if (!data)
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  487  		return -ENOMEM;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  488  	data->drvdata = d;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  489  
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Tomasz Figa      2014-09-23  490  	bank = d->pin_banks;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  491  	nr_domains = 0;
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Tomasz Figa      2014-09-23  492  	for (i = 0; i < d->nr_banks; ++i, ++bank) {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  493  		if (bank->eint_type != EINT_TYPE_GPIO)
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  494  			continue;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  495  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  496  		data->domains[nr_domains++] = bank->irq_domain;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  497  	}
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  498  
623a650ebc886f drivers/pinctrl/samsung/pinctrl-s3c64xx.c Thomas Gleixner  2015-06-21  499  	irq_set_chained_handler_and_data(d->irq, s3c64xx_eint_gpio_irq, data);
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  500  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  501  	return 0;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  502  }
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  503  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
