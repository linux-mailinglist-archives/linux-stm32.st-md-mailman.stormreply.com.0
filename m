Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 943D623C89A
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 11:05:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F461C36B3A;
	Wed,  5 Aug 2020 09:05:51 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD01EC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 09:05:47 +0000 (UTC)
IronPort-SDR: AJeHcu/Pjh4a3ATaWx7Pw0Oa1TUBO9pYPNkCZH45K/eXEE7Ux7Fn2DZGcf3BUxkzKwbIDnxbB4
 SNfumbQhrxNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="151719724"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="151719724"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 02:05:45 -0700
IronPort-SDR: Kzwp82pBLdFei3BWT/qCXlnI2d16e8soJ/QDqEDH8PGdUAwjfsKX3fjmNg5UxuFHcEaQeG5Puh
 ECqM+C4QRzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="306638133"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 05 Aug 2020 02:05:42 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3FMk-0000gz-5w; Wed, 05 Aug 2020 09:05:42 +0000
Date: Wed, 5 Aug 2020 17:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <202008051645.ApSUqqOG%lkp@intel.com>
References: <20200731114732.12815-6-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731114732.12815-6-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-remoteproc@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 5/9] rpmsg: introduce reserved rpmsg
 driver for ns announcement
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

Hi Arnaud,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20200730]
[also build test WARNING on v5.8]
[cannot apply to linux/master linus/master rpmsg/for-next v5.8-rc7 v5.8-rc6 v5.8-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/introduce-name-service-announcement-rpmsg-driver/20200731-195014
base:    7b287a5c6ac518c415a258f2aa7b1ebb25c263d2
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/rpmsg/rpmsg_ns.c:68:34: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
      msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
                                    ^

vim +68 drivers/rpmsg/rpmsg_ns.c

    54	
    55		if (len != sizeof(*msg)) {
    56			dev_err(dev, "malformed ns msg (%d)\n", len);
    57			return -EINVAL;
    58		}
    59	
    60		/* don't trust the remote processor for null terminating the name */
    61		msg->name[RPMSG_NAME_SIZE - 1] = '\0';
    62	
    63		strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
    64		chinfo.src = RPMSG_ADDR_ANY;
    65		chinfo.dst = msg->addr;
    66	
    67		dev_info(dev, "%sing channel %s addr 0x%x\n",
  > 68			 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
    69			 msg->name, msg->addr);
    70	
    71		if (msg->flags & RPMSG_NS_DESTROY) {
    72			ret = rpmsg_release_channel(rpdev, &chinfo);
    73			if (ret)
    74				dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
    75		} else {
    76			newch = rpmsg_create_channel(rpdev, &chinfo);
    77			if (!newch)
    78				dev_err(dev, "rpmsg_create_channel failed\n");
    79		}
    80	
    81		return 0;
    82	}
    83	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
