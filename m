Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581F6CA821
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 16:47:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18FE4C6905A;
	Mon, 27 Mar 2023 14:47:37 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93D47C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679928455; x=1711464455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gvtVaHDSj8/60CnRMhLEfiEJM9T3UCmxTI4xWFAvBB0=;
 b=MfKZZM9Q4P908NPUhDRA5tyTdayK1OJwhcUDXbl+h5Wch1CMn6cutZuU
 PBqt27lWaXLPJoZGiZMtxcfAiwp42tWKRljunHF8SfxwLvQDDzqlwNOp4
 wyhli5Z7GbwtikonZjkm+8tVLg1GBX6MwqdzfslGHYy/xaBuWHt/uehMA
 b1ao5r/vFgaFXC6JPgiiKa1UDAC4eW5hYdeEWQCrxFuzeJzcL9vO3R3jM
 IfPMYFIZBrTl7ECDK+i8nRKUjbLIhRXMtMkNMKlC+Vs4dSVBb9Yi4xp6b
 0yXD6Kd/qbJ8NLE7m0cBcajkIWM6SjKFLpYfOobdqTZwWffPY7gcbE4Ku w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320682477"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="320682477"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 07:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="1013140887"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="1013140887"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 27 Mar 2023 07:47:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pgo7u-000HmV-1D;
 Mon, 27 Mar 2023 14:47:14 +0000
Date: Mon, 27 Mar 2023 22:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhe <yuzhe@nfschina.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, angelogioacchino.delregno@collabora.com,
 agross@kernel.org, konrad.dybcio@linaro.org,
 patrice.chotard@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Message-ID: <202303272213.jOYrwBZu-lkp@intel.com>
References: <20230320061157.29660-1-yuzhe@nfschina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320061157.29660-1-yuzhe@nfschina.com>
Cc: Yu Zhe <yuzhe@nfschina.com>, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, liqiong@nfschina.com,
 linux-mediatek@lists.infradead.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] remoteproc: remove unnecessary (void*)
	conversions
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

Hi Yu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v6.3-rc3]
[also build test ERROR on linus/master]
[cannot apply to remoteproc/rproc-next next-20230327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Zhe/remoteproc-remove-unnecessary-void-conversions/20230320-141403
patch link:    https://lore.kernel.org/r/20230320061157.29660-1-yuzhe%40nfschina.com
patch subject: [PATCH v2] remoteproc: remove unnecessary (void*) conversions
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230327/202303272213.jOYrwBZu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/38335303eda6c4de037cd00e20c9065a76f82291
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yu-Zhe/remoteproc-remove-unnecessary-void-conversions/20230320-141403
        git checkout 38335303eda6c4de037cd00e20c9065a76f82291
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303272213.jOYrwBZu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/remoteproc/st_remoteproc.c:361:16: error: assigning to 'struct st_rproc_config *' from 'const void *const' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           ddata->config = match->data;
                         ^ ~~~~~~~~~~~
   1 error generated.


vim +361 drivers/remoteproc/st_remoteproc.c

   337	
   338	static int st_rproc_probe(struct platform_device *pdev)
   339	{
   340		struct device *dev = &pdev->dev;
   341		const struct of_device_id *match;
   342		struct st_rproc *ddata;
   343		struct device_node *np = dev->of_node;
   344		struct rproc *rproc;
   345		struct mbox_chan *chan;
   346		int enabled;
   347		int ret, i;
   348	
   349		match = of_match_device(st_rproc_match, dev);
   350		if (!match || !match->data) {
   351			dev_err(dev, "No device match found\n");
   352			return -ENODEV;
   353		}
   354	
   355		rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
   356		if (!rproc)
   357			return -ENOMEM;
   358	
   359		rproc->has_iommu = false;
   360		ddata = rproc->priv;
 > 361		ddata->config = match->data;
   362	
   363		platform_set_drvdata(pdev, rproc);
   364	
   365		ret = st_rproc_parse_dt(pdev);
   366		if (ret)
   367			goto free_rproc;
   368	
   369		enabled = st_rproc_state(pdev);
   370		if (enabled < 0) {
   371			ret = enabled;
   372			goto free_clk;
   373		}
   374	
   375		if (enabled) {
   376			atomic_inc(&rproc->power);
   377			rproc->state = RPROC_RUNNING;
   378		} else {
   379			clk_set_rate(ddata->clk, ddata->clk_rate);
   380		}
   381	
   382		if (of_get_property(np, "mbox-names", NULL)) {
   383			ddata->mbox_client_vq0.dev		= dev;
   384			ddata->mbox_client_vq0.tx_done		= NULL;
   385			ddata->mbox_client_vq0.tx_block	= false;
   386			ddata->mbox_client_vq0.knows_txdone	= false;
   387			ddata->mbox_client_vq0.rx_callback	= st_rproc_mbox_callback_vq0;
   388	
   389			ddata->mbox_client_vq1.dev		= dev;
   390			ddata->mbox_client_vq1.tx_done		= NULL;
   391			ddata->mbox_client_vq1.tx_block	= false;
   392			ddata->mbox_client_vq1.knows_txdone	= false;
   393			ddata->mbox_client_vq1.rx_callback	= st_rproc_mbox_callback_vq1;
   394	
   395			/*
   396			 * To control a co-processor without IPC mechanism.
   397			 * This driver can be used without mbox and rpmsg.
   398			 */
   399			chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_rx");
   400			if (IS_ERR(chan)) {
   401				dev_err(&rproc->dev, "failed to request mbox chan 0\n");
   402				ret = PTR_ERR(chan);
   403				goto free_clk;
   404			}
   405			ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_RX] = chan;
   406	
   407			chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_tx");
   408			if (IS_ERR(chan)) {
   409				dev_err(&rproc->dev, "failed to request mbox chan 0\n");
   410				ret = PTR_ERR(chan);
   411				goto free_mbox;
   412			}
   413			ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_TX] = chan;
   414	
   415			chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_rx");
   416			if (IS_ERR(chan)) {
   417				dev_err(&rproc->dev, "failed to request mbox chan 1\n");
   418				ret = PTR_ERR(chan);
   419				goto free_mbox;
   420			}
   421			ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_RX] = chan;
   422	
   423			chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_tx");
   424			if (IS_ERR(chan)) {
   425				dev_err(&rproc->dev, "failed to request mbox chan 1\n");
   426				ret = PTR_ERR(chan);
   427				goto free_mbox;
   428			}
   429			ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_TX] = chan;
   430		}
   431	
   432		ret = rproc_add(rproc);
   433		if (ret)
   434			goto free_mbox;
   435	
   436		return 0;
   437	
   438	free_mbox:
   439		for (i = 0; i < ST_RPROC_MAX_VRING * MBOX_MAX; i++)
   440			mbox_free_channel(ddata->mbox_chan[i]);
   441	free_clk:
   442		clk_unprepare(ddata->clk);
   443	free_rproc:
   444		rproc_free(rproc);
   445		return ret;
   446	}
   447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
