Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C59B75CC6B
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 17:49:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE2FBC6B442;
	Fri, 21 Jul 2023 15:49:00 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E15B1C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689954539; x=1721490539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R8WEdCXTW/dlJZdkuVMQaXyvnxbiy+28P+8xBmUAS78=;
 b=fDu6ng2NPFLo/iCjCfY/JpWqkC6GZ0FaNZcgyZxS9D+pmrDVKYHh4dy8
 bPxIZHyCfssMTNPPpPlhjSu7xgz37/Q6DzL39GsrXyhsBjgnUcFMBC55R
 vluUdR4ZUu1d/EGaP+2YsyI2uDu5z8zkvPgiV32J8U13Lsn0bEKriGZer
 YbmQ7I2jIANo5g1KyWFI7kaN1F/lYOpFnpygwPCDOpXXbPeqHEo7DFcVe
 2Dy97x5uzC5HjS0vkL6ZuFfWBVEr4oVM5nzheaToG2VtjpyS8sbHNtRzX
 sIY/FAEScMY9ejp/MabFF5XhhciF1K4LEK29krt0YKZ0gR4qRN4sabjcR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="364514626"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="364514626"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="728147277"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="728147277"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2023 08:48:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@intel.com>) id 1qMsN7-00B57Q-0m;
 Fri, 21 Jul 2023 18:48:49 +0300
Date: Fri, 21 Jul 2023 18:48:49 +0300
From: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
To: "Ng, Boon Khai" <boon.khai.ng@intel.com>
Message-ID: <ZLqo4SL+OAovs2In@smile.fi.intel.com>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-2-boon.khai.ng@intel.com>
 <ZLpbPxy4XHEGyU6I@smile.fi.intel.com>
 <DM8PR11MB5751E1290649A690A0B50F7AC13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5751E1290649A690A0B50F7AC13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "Swee,
 Leong Ching" <leong.ching.swee@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "G Thomas, Rohan" <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 1/2] dt-bindings: net: snps, dwmac: Add description for rx-vlan-offload
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

On Fri, Jul 21, 2023 at 06:35:44PM +0300, Ng, Boon Khai wrote:
> > From: Shevchenko, Andriy <andriy.shevchenko@intel.com>
> > Sent: Friday, July 21, 2023 6:18 PM
> > On Fri, Jul 21, 2023 at 02:26:16PM +0800, Boon@ecsmtp.png.intel.com wrote:
> > > From: Boon Khai Ng <boon.khai.ng@intel.com>

...

> > > Reviewed-by: Shevchenko Andriy <andriy.shevchenko@linux.intel.com>
> > 
> > This is wrong:
> > - I never reviewed DT bindings in all your series.
> > - My name for the patches is also wrong.
> > 
> > P.S. What I mentioned in the internal mail is that you can add my tag to
> >     the code, and not to the DT. Sorry, I probably hadn't been clear.
> 
> My bad, sorry for interpreting the meaning wrongly, I will remove all the 
> "Reviewed-by" stamp from all the DT patches on the next update.
> 
> However I copied the Reviewed-by: from the previous email, your name
> Shouldn't be wrong.

Oh, this is a bit messy. The address for the kernel work should be
Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
