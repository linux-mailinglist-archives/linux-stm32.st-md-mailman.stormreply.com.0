Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD956C1138
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 12:52:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DA52C6A5EF;
	Mon, 20 Mar 2023 11:52:50 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD7E4C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679313168; x=1710849168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qaX/W4NW8LL69k/iCe59nSe6R3T+aQljmr/TjYHn54c=;
 b=KUUFurZ5uYRf7uj3732AJ02sIJeMvU868rh4iKFJkn0V6NqeF5km7h0N
 7xi9cDuR540b74XGHl2EVp+9vB4Z1WY67CO612yAKfPi0LPcRxcL0PV9p
 AOBgCzwszwlMC/8XcfA3nKW30qjwaHAXsTYewvW5wyz6GTdGJUOObGOMc
 nWmVoQKJfd83Y6h3iyMirT4TIOgJUfbH3sa7hrI4QLcOMej/kC/EhkJob
 LWI9dWK8W7G3UVisur2GK8K1pQCE9CiuCMQ3KROFeAlAbwlj3yJyPjZ5i
 Y4OLTyGtnwOAHXLoXSDyrk3lDjdvGn67m8P75ThgRk4oLWZn7a1hrq06u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="319040812"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="319040812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 04:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="631096984"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="631096984"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 04:52:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1peE49-000B1J-0x;
 Mon, 20 Mar 2023 11:52:41 +0000
Date: Mon, 20 Mar 2023 19:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhe <yuzhe@nfschina.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, angelogioacchino.delregno@collabora.com,
 agross@kernel.org, konrad.dybcio@linaro.org,
 patrice.chotard@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Message-ID: <202303201947.sffcGruP-lkp@intel.com>
References: <20230320061157.29660-1-yuzhe@nfschina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320061157.29660-1-yuzhe@nfschina.com>
Cc: Yu Zhe <yuzhe@nfschina.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 liqiong@nfschina.com, linux-mediatek@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v6.3-rc3]
[also build test WARNING on linus/master]
[cannot apply to remoteproc/rproc-next next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Zhe/remoteproc-remove-unnecessary-void-conversions/20230320-141403
patch link:    https://lore.kernel.org/r/20230320061157.29660-1-yuzhe%40nfschina.com
patch subject: [PATCH v2] remoteproc: remove unnecessary (void*) conversions
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230320/202303201947.sffcGruP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/38335303eda6c4de037cd00e20c9065a76f82291
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yu-Zhe/remoteproc-remove-unnecessary-void-conversions/20230320-141403
        git checkout 38335303eda6c4de037cd00e20c9065a76f82291
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303201947.sffcGruP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/st_remoteproc.c: In function 'st_rproc_probe':
>> drivers/remoteproc/st_remoteproc.c:361:23: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     361 |         ddata->config = match->data;
         |                       ^


vim +/const +361 drivers/remoteproc/st_remoteproc.c

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
