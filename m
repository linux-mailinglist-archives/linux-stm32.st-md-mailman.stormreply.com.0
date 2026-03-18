Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lnr+J9/2u2koqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:15:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A4E2CBC2E
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:15:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A2A0C87ED8;
	Thu, 19 Mar 2026 13:15:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE920C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 17:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773853522; x=1805389522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FRwg2E9CLljwcNk6xTVAFoV/k9oE/5jF1+naOPnV9r4=;
 b=Os0tN1fFMJEOKFu1ckHHdZ6MmDiYzijCR9rOdNykA63HTlyQ/1GXUdAu
 nXD2EFbhnErwAmOb1ihkUMoF6GQSpKEnbndqQM3ynLRbixnLt+ESR974C
 RoAb4moOntRvrWSf/s9ADN+Mdbgck1ouK/56C24rTCQ5JhQx+SccY+e45
 225P+92CWoK/V7OTdFW0Ybzxy7Sja/yJ1PrJ5tFB8MB0tRR6EnxxE5s7o
 UKFdngcFH3l4Z2Ss1nPk7uLGC3tQzDnVk+RnZztzjU0g+3Q7TDntbUxqC
 ohtUQq7HqMazJEizperFiAhJZz/Og6jUnZ69wFMeXYMyHWaFKyNv9PvJ4 g==;
X-CSE-ConnectionGUID: pOdj25kOQPOr9VCXqYDNZg==
X-CSE-MsgGUID: 9hwsQqY3RgWALnpsrzA3ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74948734"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74948734"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 10:05:20 -0700
X-CSE-ConnectionGUID: I4g4cbSVQxWMegfWb/0kZg==
X-CSE-MsgGUID: a8hhyyakQLmEVdfMWq0wMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="222740621"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 18 Mar 2026 10:05:16 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w2uKX-000000003Az-29FG;
 Wed, 18 Mar 2026 17:05:13 +0000
Date: Thu, 19 Mar 2026 01:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, openbmc@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org
Message-ID: <202603190122.1OMLjae4-lkp@intel.com>
References: <5727aa84748872059e2a39eb67f1f08c0de6206b.1773733017.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5727aa84748872059e2a39eb67f1f08c0de6206b.1773733017.git.xiaopei01@kylinos.cn>
X-Mailman-Approved-At: Thu, 19 Mar 2026 13:15:08 +0000
Cc: Pei Xiao <xiaopei01@kylinos.cn>, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v3 07/17] spi: orion: Use helper function
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
	NEURAL_HAM(-0.00)[-0.861];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,intel.com:email,intel.com:mid,stormreply.com:email,stormreply.com:url,01.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 86A4E2CBC2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260317]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/mas=
ter clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-=
Use-helper-function-devm_clk_get_enabled/20260318-110300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for=
-next
patch link:    https://lore.kernel.org/r/5727aa84748872059e2a39eb67f1f08c0d=
e6206b.1773733017.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v3 07/17] spi: orion: Use helper function devm_clk_ge=
t_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026031=
9/202603190122.1OMLjae4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260319/202603190122.1OMLjae4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190122.1OMLjae4-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-orion.c: In function 'orion_spi_remove':
>> drivers/spi/spi-orion.c:798:27: warning: unused variable 'spi' [-Wunused=
-variable]
     798 |         struct orion_spi *spi =3D spi_controller_get_devdata(hos=
t);
         |                           ^~~


vim +/spi +798 drivers/spi/spi-orion.c

60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  793  =

60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  794  =

2e0de1efb233ab drivers/spi/spi-orion.c Uwe Kleine-K=F6nig 2023-03-03  795  =
static void orion_spi_remove(struct platform_device *pdev)
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  796  {
08e6c5038fee47 drivers/spi/spi-orion.c Yang Yingliang   2023-08-18  797  	s=
truct spi_controller *host =3D platform_get_drvdata(pdev);
08e6c5038fee47 drivers/spi/spi-orion.c Yang Yingliang   2023-08-18 @798  	s=
truct orion_spi *spi =3D spi_controller_get_devdata(host);
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  799  =

5c6786945b4e04 drivers/spi/spi-orion.c Russell King     2014-06-21  800  	p=
m_runtime_get_sync(&pdev->dev);
4574b886698dfa drivers/spi/spi-orion.c Andrew Lunn      2012-04-06  801  =

08e6c5038fee47 drivers/spi/spi-orion.c Yang Yingliang   2023-08-18  802  	s=
pi_unregister_controller(host);
5c6786945b4e04 drivers/spi/spi-orion.c Russell King     2014-06-21  803  	p=
m_runtime_disable(&pdev->dev);
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  804  }
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  805  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
