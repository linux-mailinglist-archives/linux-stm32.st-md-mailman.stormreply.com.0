Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0C31C1A8D
	for <lists+linux-stm32@lfdr.de>; Fri,  1 May 2020 18:27:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80EA5C36B0F;
	Fri,  1 May 2020 16:27:10 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0A6EC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 16:27:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,340,1583190000"; d="scan'208";a="447806228"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2020 18:27:07 +0200
Date: Fri, 1 May 2020 18:27:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <alpine.DEB.2.21.2005011825030.2504@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, alexandre.belloni@bootlin.com,
 kbuild-all@lists.01.org, david@lechnology.com, felipe.balbi@linux.intel.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, gwendal@chromium.org,
 fabien.lahoudere@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/4] counter: Internalize sysfs interface
	code (fwd)
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

Hello,

Normally, the argument of kfree should not start with &.

julia

---------- Forwarded message ----------
Date: Fri, 1 May 2020 06:07:26 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@lists.01.org
Cc: lkp@intel.com, Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 1/4] counter: Internalize sysfs interface code

CC: kbuild-all@lists.01.org
In-Reply-To: <d84f0bb3258d1664e90da64d75f787829c50a9bd.1588176662.git.vilhelm.gray@gmail.com>
References: <d84f0bb3258d1664e90da64d75f787829c50a9bd.1588176662.git.vilhelm.gray@gmail.com>
TO: William Breathitt Gray <vilhelm.gray@gmail.com>
TO: jic23@kernel.org
CC: kamel.bouhara@bootlin.com
CC: gwendal@chromium.org
CC: alexandre.belloni@bootlin.com
CC: david@lechnology.com
CC: felipe.balbi@linux.intel.com
CC: fabien.lahoudere@collabora.com
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com

Hi William,

I love your patch! Perhaps something to improve:

[auto build test WARNING on stm32/stm32-next]
[cannot apply to linus/master linux/master v5.7-rc3 next-20200430]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/William-Breathitt-Gray/Introduce-the-Counter-character-device-interface/20200430-051734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/counter/counter-core.c:26:1-6: ERROR: invalid free of structure field

# https://github.com/0day-ci/linux/commit/bdd9a6aa70c61f16dacaf057f0ce70fc210b5ec9
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout bdd9a6aa70c61f16dacaf057f0ce70fc210b5ec9
vim +26 drivers/counter/counter-core.c

bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  20
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  21  static void counter_device_release(struct device *dev)
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  22  {
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  23  	struct counter_device *const counter = dev_get_drvdata(dev);
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  24
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  25  	counter_sysfs_free(counter);
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29 @26  	kfree(&counter->dev);
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  27  	ida_simple_remove(&counter_ida, counter->id);
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  28  }
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  29

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
