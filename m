Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKdCJN/2u2kQqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:15:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 771D02CBC2D
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:15:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27B9AC87ECE;
	Thu, 19 Mar 2026 13:15:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D208C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773846375; x=1805382375;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4mKNZGsMnx96h+U53BOOHWYmauvrjAENdqFmFNmU85o=;
 b=W3xbOwhbmKNGp0aCKk4w2xwJutAPs7hyYSC9rhNG6vj+NOgx3iOcTGxf
 SrF12qTnySVxX8gWAocSE6vEsOReOo1kaQslY5p2CQV7DwI5JSuI2+vqM
 XsPtXeSUUdZiFDJ6FbZ9vUt8QIGZ70tRiInlzDO3d9CpCWLbXvzJaaCJS
 PDpO3k9oqRsDa0iD54uq+Ksd777+9qheYzM4dVU3TYqGeuVD+jd2nvNY4
 JVFYcX/dmkf3AJYStIZYA478lVf0f+S1Q+5BAMbNWckOx2xNadQaaFjff
 V2i14iK43ZnlmFB0pcL71kgqZ14XNcaRW5Hl9ac5lpwrImc2avM7v1VOw w==;
X-CSE-ConnectionGUID: BIM8NKXHS6W/jLe6Nour3A==
X-CSE-MsgGUID: JDmimKKCSV+Y+efRSKxZ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74601744"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74601744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 08:06:08 -0700
X-CSE-ConnectionGUID: 45FZNnEETzigI3hiwWOn+w==
X-CSE-MsgGUID: 9Lplwp4OTDGMa1328tMtMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="227341270"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 08:06:04 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w2sTC-0000000031t-0fMK;
 Wed, 18 Mar 2026 15:06:02 +0000
Date: Wed, 18 Mar 2026 23:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, openbmc@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org
Message-ID: <202603182309.Rj2JxGYZ-lkp@intel.com>
References: <a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01@kylinos.cn>
X-Mailman-Approved-At: Thu, 19 Mar 2026 13:15:08 +0000
Cc: Pei Xiao <xiaopei01@kylinos.cn>, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v3 01/17] spi: axiado: Use helper function
 devm_clk_get_enabled()
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
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:xiaopei01@kylinos.cn,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:linux-rockchip@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:broonie@kernel.org,m:oe-kbuild-all@lists.linux.dev,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.858];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,intel.com:email,intel.com:mid,stormreply.com:email,stormreply.com:url,01.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 771D02CBC2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260317]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/master clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-Use-helper-function-devm_clk_get_enabled/20260318-110300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v3 01/17] spi: axiado: Use helper function devm_clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603182309.Rj2JxGYZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182309.Rj2JxGYZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182309.Rj2JxGYZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-axiado.c: In function 'ax_spi_remove':
>> drivers/spi/spi-axiado.c:865:24: warning: unused variable 'xspi' [-Wunused-variable]
     865 |         struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
         |                        ^~~~


vim +/xspi +865 drivers/spi/spi-axiado.c

e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  853  
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  854  /**
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  855   * ax_spi_remove - Remove method for the SPI driver
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  856   * @pdev:	Pointer to the platform_device structure
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  857   *
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  858   * This function is called if a device is physically removed from the system or
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  859   * if the driver module is being unloaded. It frees all resources allocated to
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  860   * the device.
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  861   */
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  862  static void ax_spi_remove(struct platform_device *pdev)
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  863  {
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  864  	struct spi_controller *ctlr = platform_get_drvdata(pdev);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07 @865  	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  866  
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  867  	spi_unregister_controller(ctlr);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  868  
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  869  	pm_runtime_set_suspended(&pdev->dev);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  870  	pm_runtime_disable(&pdev->dev);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  871  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
