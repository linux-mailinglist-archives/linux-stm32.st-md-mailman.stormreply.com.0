Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F5992859
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D583EC7128A;
	Mon,  7 Oct 2024 09:42:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E408C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2024 02:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726626464; x=1758162464;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uS2YFxRvMGKdY4hVYbzDLw3B0Hjyf+pk1jbICas5hRA=;
 b=feo7L9cy8FPd7VyQ1oprHtlh4ysfPFXmQixVwCKYl6/pfJRly/d3uipA
 hsowUeie+EvwLEuSIzf9uwJbz5w/OjJpSwsxnBbMdU9VH0SinT1g2zQbU
 dX4+GGXqqJWGKbgoXFZ8ND9JGOXf/TYQyruttSZ4XSqhPcPYoUW4oGQBo
 K+Ky8Id5SVQJxLVM3j8x4bA46CZbiSIrmi+JmQfd/ZgFdmSwhXA/ZfLVh
 6rfqF8VzVRAn51vjSWWCP0ALi8c0ig//CJX6EYYqwf3eEKe7Pujlot7Vj
 YaLpz2Z9LyTB1Ag1vBlchL1LkDKFwDNYVBgUcWqj3XjF6xJrGwDaeO0kp A==;
X-CSE-ConnectionGUID: +FdfisG1ToeZ2Ao1TlFeNg==
X-CSE-MsgGUID: hfKJbu18QUSOAuu+Kh37JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="48029183"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="48029183"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 19:27:36 -0700
X-CSE-ConnectionGUID: YftceeTmRu+lZhiPv3An2g==
X-CSE-MsgGUID: JqmCe4dtQyCA8IDnL3KVMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="74221109"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 19:27:35 -0700
Received: from [10.208.96.32] (unknown [10.208.96.32])
 by linux.intel.com (Postfix) with ESMTP id B0B2320CFEE5;
 Tue, 17 Sep 2024 19:27:31 -0700 (PDT)
Message-ID: <7b6283e8-9a8d-4daf-9e99-f32dd55bcea5@linux.intel.com>
Date: Wed, 18 Sep 2024 10:27:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Horman <horms@kernel.org>
References: <20240912015541.363600-1-khai.wen.tan@linux.intel.com>
 <20240912153730.GN572255@kernel.org> <20240912153913.GO572255@kernel.org>
Content-Language: en-US
From: "Tan, Khai Wen" <khai.wen.tan@linux.intel.com>
In-Reply-To: <20240912153913.GO572255@kernel.org>
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Khai Wen <khai.wen.tan@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix zero-division
 error when disabling tc cbs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/9/2024 11:39 pm, Simon Horman wrote:
> On Thu, Sep 12, 2024 at 04:37:30PM +0100, Simon Horman wrote:
>> On Thu, Sep 12, 2024 at 09:55:41AM +0800, KhaiWenTan wrote:
>>> The commit b8c43360f6e4 ("net: stmmac: No need to calculate speed divider
>>> when offload is disabled") allows the "port_transmit_rate_kbps" to be
>>> set to a value of 0, which is then passed to the "div_s64" function when
>>> tc-cbs is disabled. This leads to a zero-division error.
>>>
>>> When tc-cbs is disabled, the idleslope, sendslope, and credit values the
>>> credit values are not required to be configured. Therefore, adding a return
>>> statement after setting the txQ mode to DCB when tc-cbs is disabled would
>>> prevent a zero-division error.
>>>
>>> Fixes: b8c43360f6e4 ("net: stmmac: No need to calculate speed divider when offload is disabled")
>>> Cc: <stable@vger.kernel.org>
>>> Co-developed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>>> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
> ...
>
> One more thing, if you do post an updated patch, please
> be sure to wait until 24h after the original patch was posted.
>
> https://docs.kernel.org/process/maintainer-netdev.html

Hi Simon,

Thanks for the clarification. Will be updating a version 2 for this patch.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
