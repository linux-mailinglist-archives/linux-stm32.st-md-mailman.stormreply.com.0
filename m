Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1CC366F68
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 17:48:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6173EC58D5C;
	Wed, 21 Apr 2021 15:48:01 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81027C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 15:47:59 +0000 (UTC)
IronPort-SDR: VANY46naQ+6FYh6TFQVmNQN3gT0/vnslAdppwYMxzfRBo5pQXv7ZYCuAnD49a1ITiD6q5SmeTD
 HvbJXEWmrVaw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="257034559"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="257034559"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 08:47:56 -0700
IronPort-SDR: eHLdZFql0BmKUV9o3AAeOQH/5qTMuOjY6FBe3m2huykpG3k9I/xnPk46S9ndjcZy3e0NSusWDA
 icamdntlc9Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="455391360"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 08:47:56 -0700
Received: from linux.intel.com (unknown [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 700105808CA;
 Wed, 21 Apr 2021 08:47:53 -0700 (PDT)
Date: Wed, 21 Apr 2021 23:47:50 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20210421154750.GA20299@linux.intel.com>
References: <YIAnKtpJa/K+0efq@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIAnKtpJa/K+0efq@mwanda>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, kernel-janitors@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next] stmmac: intel: unlock on error
 path in intel_crosststamp()
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

On Wed, Apr 21, 2021 at 04:22:50PM +0300, Dan Carpenter wrote:
> We recently added some new locking to this function but one error path
> was overlooked.  We need to drop the lock before returning.
> 
> Fixes: f4da56529da6 ("net: stmmac: Add support for external trigger timestamping")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
