Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE09A3C2
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2019 01:23:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51A52C35E01;
	Thu, 22 Aug 2019 23:23:44 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54F42C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2019 23:23:43 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id DF6051539DF80;
 Thu, 22 Aug 2019 16:23:39 -0700 (PDT)
Date: Thu, 22 Aug 2019 16:23:39 -0700 (PDT)
Message-Id: <20190822.162339.831735149510227752.davem@davemloft.net>
To: Markus.Elfring@web.de
From: David Miller <davem@davemloft.net>
In-Reply-To: <af1ae1cf-4a01-5e3a-edc2-058668487137@web.de>
References: <af1ae1cf-4a01-5e3a-edc2-058668487137@web.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 22 Aug 2019 16:23:41 -0700 (PDT)
Cc: kstewart@linuxfoundation.org, michael.heimpold@i2se.com,
 kernel-janitors@vger.kernel.org, wsa+renesas@sang-engineering.com,
 weiyongjun1@huawei.com, opensource@jilayne.com,
 linux-stm32@st-md-mailman.stormreply.com, stefan.wahren@i2se.com,
 opendmb@gmail.com, yuehaibing@huawei.com, joabreu@synopsys.com,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, ynezz@true.cz,
 bryan.whitehead@microchip.com, jeffrey.t.kirsher@intel.com,
 jonathan.lemon@gmail.com, yang.wei9@zte.com.cn, alexios.zavras@intel.com,
 claudiu.manoil@nxp.com, f.fainelli@gmail.com, swinslow@gmail.com,
 shannon.nelson@oracle.com, peppe.cavallaro@st.com, tglx@linutronix.de,
 zhongjiang@huawei.com, allison@lohutok.net, nico@fluxnic.net,
 gregkh@linuxfoundation.org, dougmill@linux.ibm.com,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, mcgrof@kernel.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org
Subject: Re: [Linux-stm32] =?iso-2022-jp?b?W1BBVENIXSBldGhlcm5ldDogRGVsZXRl?=
 =?iso-2022-jp?b?IHVubmVjZXNzYXJ5IGNoZWNrcyBiZWZvcmUgdGhlIG1hY3JvIGNhbGwg?=
 =?iso-2022-jp?b?GyRCIUgbKEJkZXZfa2ZyZWVfc2tiGyRCIUkbKEI=?=
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

From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 22 Aug 2019 20:30:15 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 22 Aug 2019 20:02:56 +0200
> 
> The dev_kfree_skb() function performs also input parameter validation.
> Thus the test around the shown calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
