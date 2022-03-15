Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 066174DA5A7
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Mar 2022 23:48:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF56AC5F1F1;
	Tue, 15 Mar 2022 22:48:21 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56267C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647384500; x=1678920500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P9qMja6/fAMvM2ugsrl1pMMJHX9GWLFIsNE39aB8ACc=;
 b=bI2BiBFwTISfaZra9Nns85+ZHxWg4EE3YnCANSyPFqipSfrZP0iJ5xwN
 gzNHC9f89aJVcCh9QqKGDx41hd+LPyZaSdVa38x+Tud2Jd000nTMmW70n
 CvJIOC/leAMCW3K4o3BNdVrICeuUBlKw1tQPnFJRR8vYSCZNK7w9qTwaV
 KoTd6Fb4lwlBSceDeCJmjTO0v19DAmi+sszfkXntHYvbPCmNXdAQ6Wa0L
 ZPNNc4Mu4juTkweRHTZDEZFIuxKU1c2ksl7YyCoPXYyEugb9H1IW1CIYO
 AAt3ifQrjgXnV72Y6RMh7Ghqvcg1vGJf/thdXz2NxaWfJ0vhKB+UmFmFE Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="243890686"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="243890686"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 15:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="516072862"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 15 Mar 2022 15:48:16 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUFxf-000Bag-Nu; Tue, 15 Mar 2022 22:48:15 +0000
Date: Wed, 16 Mar 2022 06:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <202203160614.sjUMuSy8-lkp@intel.com>
References: <20220315153856.3117676-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315153856.3117676-1-arnaud.pouliquen@foss.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-remoteproc@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rpmsg: virtio: set dst address on first
	message received
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

[auto build test WARNING on remoteproc/rpmsg-next]
[also build test WARNING on v5.17-rc8 next-20220315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/rpmsg-virtio-set-dst-address-on-first-message-received/20220315-234049
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
config: s390-randconfig-s031-20220313 (https://download.01.org/0day-ci/archive/20220316/202203160614.sjUMuSy8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/ef182a34773917f6bf876b37485031962393a1cd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arnaud-Pouliquen/rpmsg-virtio-set-dst-address-on-first-message-received/20220315-234049
        git checkout ef182a34773917f6bf876b37485031962393a1cd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/rpmsg/virtio_rpmsg_bus.c:756:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dst @@     got restricted __rpmsg32 [usertype] src @@
   drivers/rpmsg/virtio_rpmsg_bus.c:756:36: sparse:     expected unsigned int [usertype] dst
   drivers/rpmsg/virtio_rpmsg_bus.c:756:36: sparse:     got restricted __rpmsg32 [usertype] src

vim +756 drivers/rpmsg/virtio_rpmsg_bus.c

   727	
   728		/*
   729		 * We currently use fixed-sized buffers, so trivially sanitize
   730		 * the reported payload length.
   731		 */
   732		if (len > vrp->buf_size ||
   733		    msg_len > (len - sizeof(struct rpmsg_hdr))) {
   734			dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
   735			return -EINVAL;
   736		}
   737	
   738		/* use the dst addr to fetch the callback of the appropriate user */
   739		mutex_lock(&vrp->endpoints_lock);
   740	
   741		ept = idr_find(&vrp->endpoints, __rpmsg32_to_cpu(little_endian, msg->dst));
   742	
   743		/* let's make sure no one deallocates ept while we use it */
   744		if (ept)
   745			kref_get(&ept->refcount);
   746	
   747		mutex_unlock(&vrp->endpoints_lock);
   748	
   749		if (ept) {
   750			rpdev = ept->rpdev;
   751			if (rpdev->ept == ept && rpdev->dst == RPMSG_ADDR_ANY) {
   752				/*
   753				 * First message received from the remote side on the default endpoint,
   754				 * update channel destination address.
   755				 */
 > 756				rpdev->dst = msg->src;
   757			}
   758	
   759			/* make sure ept->cb doesn't go away while we use it */
   760			mutex_lock(&ept->cb_lock);
   761	
   762			if (ept->cb)
   763				ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
   764					__rpmsg32_to_cpu(little_endian, msg->src));
   765	
   766			mutex_unlock(&ept->cb_lock);
   767	
   768			/* farewell, ept, we don't need you anymore */
   769			kref_put(&ept->refcount, __ept_release);
   770		} else
   771			dev_warn_ratelimited(dev, "msg received with no recipient\n");
   772	
   773		/* publish the real size of the buffer */
   774		rpmsg_sg_init(&sg, msg, vrp->buf_size);
   775	
   776		/* add the buffer back to the remote processor's virtqueue */
   777		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
   778		if (err < 0) {
   779			dev_err(dev, "failed to add a virtqueue buffer: %d\n", err);
   780			return err;
   781		}
   782	
   783		return 0;
   784	}
   785	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
