Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 963AFA28CA
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2019 23:21:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED47EC35E01;
	Thu, 29 Aug 2019 21:21:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA5F9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2019 21:21:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 14:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; d="scan'208";a="175398465"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 29 Aug 2019 14:21:35 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1i3RrK-000DXD-Ot; Fri, 30 Aug 2019 05:21:34 +0800
Date: Fri, 30 Aug 2019 05:21:27 +0800
From: kbuild test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <201908300408.EJgy8luZ%lkp@intel.com>
References: <1567005566-10986-3-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567005566-10986-3-git-send-email-arnaud.pouliquen@st.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 xiang xiao <xiaoxiang781216@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, kbuild-all@01.org,
 Jiri Slaby <jslaby@suse.com>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 2/2] tty: add rpmsg driver
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

[auto build test WARNING on linus/master]
[cannot apply to v5.3-rc6 next-20190829]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Arnaud-Pouliquen/rpmsg-core-add-API-to-get-message-length/20190829-222443
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   include/linux/sched.h:609:43: sparse: sparse: bad integer constant expression
   include/linux/sched.h:609:73: sparse: sparse: invalid named zero-width bitfield `value'
   include/linux/sched.h:610:43: sparse: sparse: bad integer constant expression
   include/linux/sched.h:610:67: sparse: sparse: invalid named zero-width bitfield `bucket_id'
>> drivers/tty/rpmsg_tty.c:152:20: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/tty/rpmsg_tty.c:152:20: sparse:    int *
>> drivers/tty/rpmsg_tty.c:152:20: sparse:    long *

vim +152 drivers/tty/rpmsg_tty.c

   132	
   133	static int rpmsg_tty_write(struct tty_struct *tty, const u8 *buf, int len)
   134	{
   135		struct rpmsg_tty_port *cport = tty->driver_data;
   136		struct rpmsg_device *rpdev;
   137		ssize_t msg_max_size, msg_size;
   138		int ret;
   139		u8 *tmpbuf;
   140	
   141		/* If cts not set, the message is not sent*/
   142		if (!cport->cts)
   143			return 0;
   144	
   145		rpdev = cport->rpdev;
   146	
   147		dev_dbg(&rpdev->dev, "%s: send msg from tty->index = %d, len = %d\n",
   148			__func__, tty->index, len);
   149	
   150		msg_max_size = rpmsg_get_mtu(rpdev->ept);
   151	
 > 152		msg_size = min(len, msg_max_size);
   153		tmpbuf = kzalloc(msg_size, GFP_KERNEL);
   154		if (!tmpbuf)
   155			return -ENOMEM;
   156	
   157		memcpy(tmpbuf, buf, msg_size);
   158	
   159		/*
   160		 * Try to send the message to remote processor, if failed return 0 as
   161		 * no data sent
   162		 */
   163		ret = rpmsg_trysendto(cport->d_ept, tmpbuf, msg_size, cport->data_dst);
   164		kfree(tmpbuf);
   165		if (ret) {
   166			dev_dbg(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
   167			return 0;
   168		}
   169	
   170		return msg_size;
   171	}
   172	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
