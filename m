Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D236F513
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Apr 2021 06:29:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91E79C58D59;
	Fri, 30 Apr 2021 04:29:54 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7D71CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 04:29:52 +0000 (UTC)
IronPort-SDR: X6k+AKjhTRswBIdvSslHIqGKqOX6PJmHFFZjxT0QPVbx7dgO/jVU6p1kS0cppDRytpxZmeUoLs
 qeUR7VNrf2YA==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="195087143"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="195087143"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 21:29:50 -0700
IronPort-SDR: r5kBLHUL3Iu39C7dc3kM5eVDixAXaqGfwZ13+A0O0LtenkAS7J7fKqvNRIG3Gusvq1+KyiB9yP
 OIWP3S79MbWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="605540583"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 29 Apr 2021 21:29:49 -0700
Received: from linux.intel.com (unknown [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 16A58580569;
 Thu, 29 Apr 2021 21:29:46 -0700 (PDT)
Date: Fri, 30 Apr 2021 12:29:44 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Message-ID: <20210430042944.GA5444@linux.intel.com>
References: <20210430031047.34888-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430031047.34888-1-wanjiabing@vivo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, kael_w@yeah.net,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Remove duplicate declaration
	of stmmac_priv
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

On Fri, Apr 30, 2021 at 11:10:47AM +0800, Wan Jiabing wrote:
> In commit f4da56529da60 ("net: stmmac: Add support for external
> trigger timestamping"), struct stmmac_priv was declared at line 507
> which caused duplicate struct declarations.
> Remove later duplicate declaration here.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
