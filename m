Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIMWDBEIvWkO5gIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 09:40:49 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B77FC2D74F6
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 09:40:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 639B1C87EBD;
	Fri, 20 Mar 2026 08:40:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C419EC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773996047; x=1805532047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pRoVm1uSlvFJ1DUaEsZAHIMkqpeZSr5DbQgK9V4VP1I=;
 b=ZR1N2bnNW5U7aQ8TV1exITvDxVDjW7LEK/D6KbfJuJQ2bwd+j9ZLdbVK
 yXtA9wsmJWYTwoqIvw1H6gjcGhJ5/soCR8H2IslTnTC/h9K3XnK7+koH5
 4v4Ql63jHWTi2mp4b5Ayo2pAuFEYc4kzvmeTbVZqW1v3EVSRlUec2kIxh
 ugSgx9W4ONVu3NsK4PcUujRF6fyveUGYkSdlEiM9BXpY8k5RXKR+3ds24
 ugjYJ703w/ER5yZ79OKHFnYS08OqREkrabd5hT84mIzyzKO9/H8oeJ+P9
 nn5SRwrgE6cIplK6hSKiC6yNSoLUO8s0E3ZPHId3BLqGtDKWZ1zoR0uLx Q==;
X-CSE-ConnectionGUID: ik7qCoYJTHKgmZ+nW4WP6A==
X-CSE-MsgGUID: Tr9iOdt2SpiZTiFfHXwtUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75043700"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75043700"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 01:40:45 -0700
X-CSE-ConnectionGUID: UMl4ekA+SP2qinyxdLsYdQ==
X-CSE-MsgGUID: oy8/u9TvR3Kup4Vvs0GRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223210435"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 20 Mar 2026 01:40:41 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w3VOw-0000000029V-0Dxy;
 Fri, 20 Mar 2026 08:40:19 +0000
Date: Fri, 20 Mar 2026 16:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, openbmc@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org,
 Frank.Li@nxp.com, amelie.delaunay@foss.st.com
Message-ID: <202603201638.tsz5xX5N-lkp@intel.com>
References: <383814750ad46181fd4199b3c6cec4767d480075.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <383814750ad46181fd4199b3c6cec4767d480075.1773885292.git.xiaopei01@kylinos.cn>
Cc: Pei Xiao <xiaopei01@kylinos.cn>, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v5 11/17] spi: st: Simplify clock handling
 with devm_clk_get_enabled()
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:xiaopei01@kylinos.cn,m:linux-spi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:linux-rockchip@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:amelie.delaunay@foss.st.com,m:oe-kbuild-all@lists.linux.dev,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.841];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,01.org:url,git-scm.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: B77FC2D74F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260319]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/mas=
ter clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-=
Simplify-clock-management-with-devm_clk_get_enabled/20260320-025630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for=
-next
patch link:    https://lore.kernel.org/r/383814750ad46181fd4199b3c6cec4767d=
480075.1773885292.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v5 11/17] spi: st: Simplify clock handling with devm_=
clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026032=
0/202603201638.tsz5xX5N-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260320/202603201638.tsz5xX5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201638.tsz5xX5N-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-st-ssc4.c: In function 'spi_st_remove':
>> drivers/spi/spi-st-ssc4.c:365:32: warning: unused variable 'host' [-Wunu=
sed-variable]
     365 |         struct spi_controller *host =3D platform_get_drvdata(pde=
v);
         |                                ^~~~


vim +/host +365 drivers/spi/spi-st-ssc4.c

9e862375c5420a Lee Jones        2014-12-09  362  =

2dd42da0b479ff Uwe Kleine-K=F6nig 2023-03-03  363  static void spi_st_remov=
e(struct platform_device *pdev)
9e862375c5420a Lee Jones        2014-12-09  364  {
e6b7e64cb11966 Yang Yingliang   2023-11-28 @365  	struct spi_controller *ho=
st =3D platform_get_drvdata(pdev);
9e862375c5420a Lee Jones        2014-12-09  366  =

cd050abeba2a95 Chuhong Yuan     2019-11-18  367  	pm_runtime_disable(&pdev-=
>dev);
cd050abeba2a95 Chuhong Yuan     2019-11-18  368  =

9e862375c5420a Lee Jones        2014-12-09  369  	pinctrl_pm_select_sleep_s=
tate(&pdev->dev);
9e862375c5420a Lee Jones        2014-12-09  370  }
9e862375c5420a Lee Jones        2014-12-09  371  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
