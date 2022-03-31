Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 866784EE039
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Mar 2022 20:17:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 371D6C60490;
	Thu, 31 Mar 2022 18:17:18 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79967C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Mar 2022 18:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648750636; x=1680286636;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LyjlgspTz5M7nOVapvHG9O4t2fb4YR+n80TSxzPPRIw=;
 b=DwS5uvMk0hySfV3CIKpRIsE9WVPs3GEneuhcwIa/evPNIGIPcDiOdlVi
 EiqEnxHKP33EWl9Q6q3P7iUshLxaLar4usjQkMVg+IuQdRaP1ZexgV7P1
 llbcKXe9muhTlbx/+Xugd7c81RMIos8WimJh+E9Gs98Y3X1HM02gP6OUy
 vURSAYfw/MPfz8orNu29VIO8MhdC+d4PY5eXQz5cXd28mJ3sPvd3Gs0WD
 rcPP8CNC3zg3Dy84r2NRTvQV3E92jrBNwua3rBhtk36sUdgyVGNw+3Nvx
 xAJQKi+M9paNTaerUkksJHwZHT/bBPmiNKJjmWLqPubmxWWhAlmp3C6Od w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257497984"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="257497984"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="606227575"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2022 11:17:07 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZzM2-0000XQ-BO;
 Thu, 31 Mar 2022 18:17:06 +0000
Date: Fri, 1 Apr 2022 02:16:20 +0800
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
Message-ID: <202204010248.AB6ZnOyw-lkp@intel.com>
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
config: riscv-randconfig-c006-20220331 (https://download.01.org/0day-ci/archive/20220401/202204010248.AB6ZnOyw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 881350a92d821d4f8e4fa648443ed1d17e251188)
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

   In file included from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:474:50: error: no member named 'of_node' in 'struct samsung_pin_bank'; did you mean 'fwnode'?
                   bank->irq_domain = irq_domain_add_linear(bank->of_node,
                                                                  ^~~~~~~
                                                                  fwnode
   drivers/pinctrl/samsung/pinctrl-samsung.h:168:24: note: 'fwnode' declared here
           struct fwnode_handle *fwnode;
                                 ^
   drivers/pinctrl/samsung/pinctrl-s3c64xx.c:746:50: error: no member named 'of_node' in 'struct samsung_pin_bank'; did you mean 'fwnode'?
                   bank->irq_domain = irq_domain_add_linear(bank->of_node,
                                                                  ^~~~~~~
                                                                  fwnode
   drivers/pinctrl/samsung/pinctrl-samsung.h:168:24: note: 'fwnode' declared here
           struct fwnode_handle *fwnode;
                                 ^
   7 warnings and 2 errors generated.


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
