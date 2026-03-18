Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMspKd/2u2kQqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:15:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB92CBC2F
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:15:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D27CC8F262;
	Thu, 19 Mar 2026 13:15:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 283EDC87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 19:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773860556; x=1805396556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XIwaunvaQN5MSz2DPfNECpeDO+PYa3DzRiYLu9KKQpA=;
 b=BKL+48dUvt6yljlRjrpDPiIFz0c3GaWACbxmh41xqwQO/2HhMdRwfOp4
 VD9iRMejZ/Qa0zqK8z9nngFtxdvkUOM/SDqHOOPPUu3+QvEN2/VRW02cf
 0h+Rl7vCx1rUc2zLeVudxm/0EPRSfhz+HIZE/92O9abaIJUSTW7Yg7+Cn
 iyBFET1M0sUHfBMWdC7TEcMbwkkk/Fh6cJMfDDSdsz2D0q4cKi0DUEfIo
 UJXb6+WSYdztxJJoQf6oQDeR88yO5QW4jUlWl4hbtqSJPORNcp2hl9Jkz
 OMM3PKNDPustN7Bhd7ZgrjaM3OMvFJyNqsvZndrC9oeFlsZgx1j1UoMpv g==;
X-CSE-ConnectionGUID: UWkZLDRlRe+Xtu4RsjzBSg==
X-CSE-MsgGUID: UoCYZL3JRiCCZxCb3Oup2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74839286"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74839286"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 12:02:34 -0700
X-CSE-ConnectionGUID: r+qX+cIKSd+zOG1mKDXMNQ==
X-CSE-MsgGUID: rqrMMi0WQPux3KNMprNQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="247147805"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 12:02:31 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w2wA0-000000003Hh-2Dvy;
 Wed, 18 Mar 2026 19:02:28 +0000
Date: Thu, 19 Mar 2026 03:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, openbmc@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org
Message-ID: <202603190255.yJJehgKm-lkp@intel.com>
References: <96c8fbf6840c71f29ebcf37d7ffc68f297601c8a.1773733017.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96c8fbf6840c71f29ebcf37d7ffc68f297601c8a.1773733017.git.xiaopei01@kylinos.cn>
X-Mailman-Approved-At: Thu, 19 Mar 2026 13:15:08 +0000
Cc: Pei Xiao <xiaopei01@kylinos.cn>, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v3 11/17] spi: st: Use helper function
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo,intel.com:email,intel.com:mid,git-scm.com:url,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: A8BB92CBC2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260318]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/mas=
ter clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-=
Use-helper-function-devm_clk_get_enabled/20260318-110300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for=
-next
patch link:    https://lore.kernel.org/r/96c8fbf6840c71f29ebcf37d7ffc68f297=
601c8a.1773733017.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v3 11/17] spi: st: Use helper function devm_clk_get_e=
nabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026031=
9/202603190255.yJJehgKm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260319/202603190255.yJJehgKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190255.yJJehgKm-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-st-ssc4.c: In function 'spi_st_remove':
>> drivers/spi/spi-st-ssc4.c:366:24: warning: unused variable 'spi_st' [-Wu=
nused-variable]
     366 |         struct spi_st *spi_st =3D spi_controller_get_devdata(hos=
t);
         |                        ^~~~~~


vim +/spi_st +366 drivers/spi/spi-st-ssc4.c

9e862375c5420a Lee Jones        2014-12-09  362  =

2dd42da0b479ff Uwe Kleine-K=F6nig 2023-03-03  363  static void spi_st_remov=
e(struct platform_device *pdev)
9e862375c5420a Lee Jones        2014-12-09  364  {
e6b7e64cb11966 Yang Yingliang   2023-11-28  365  	struct spi_controller *ho=
st =3D platform_get_drvdata(pdev);
e6b7e64cb11966 Yang Yingliang   2023-11-28 @366  	struct spi_st *spi_st =3D=
 spi_controller_get_devdata(host);
9e862375c5420a Lee Jones        2014-12-09  367  =

cd050abeba2a95 Chuhong Yuan     2019-11-18  368  	pm_runtime_disable(&pdev-=
>dev);
cd050abeba2a95 Chuhong Yuan     2019-11-18  369  =

9e862375c5420a Lee Jones        2014-12-09  370  	pinctrl_pm_select_sleep_s=
tate(&pdev->dev);
9e862375c5420a Lee Jones        2014-12-09  371  }
9e862375c5420a Lee Jones        2014-12-09  372  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
