Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB8C26FCD6
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Sep 2020 14:46:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D4BDC32EA9;
	Fri, 18 Sep 2020 12:46:03 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98BBEC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Sep 2020 12:45:59 +0000 (UTC)
IronPort-SDR: ZD6sD4XZBRTpab8D1DdSCoRowp4j+4T/BYciPgCQpbFxoZWYMxgHsIr48X59t1Kd7coDUHw1vm
 ROFzoatBohFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147667013"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="147667013"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 05:45:57 -0700
IronPort-SDR: g8txEcJO0ulTSqG4U6y6lFjZr6I732JoqmIF3ujvyzswstXN00cJme4NYMxtnUgUWBa5X9TZtz
 nX66g3jf6GSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="332595129"
Received: from um.fi.intel.com (HELO um) ([10.237.72.57])
 by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2020 05:45:53 -0700
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Tingwei Zhang <tingwei@codeaurora.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
In-Reply-To: <20200903001706.28147-7-tingwei@codeaurora.org>
References: <20200903001706.28147-1-tingwei@codeaurora.org>
 <20200903001706.28147-7-tingwei@codeaurora.org>
Date: Fri, 18 Sep 2020 15:45:52 +0300
Message-ID: <87zh5nw8vz.fsf@ashishki-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: tsoni@codeaurora.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, alexander.shishkin@linux.intel.com,
 Mao Jinlong <jinlmao@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 6/6] stm class: ftrace: use different
	channel accroding to CPU
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

Tingwei Zhang <tingwei@codeaurora.org> writes:

> @@ -63,6 +65,7 @@ static int __init stm_ftrace_init(void)
>  {
>  	int ret;
>  
> +	stm_ftrace.data.nr_chans = num_possible_cpus();

Not a problem with this patch necesarily, but this made me realize that
.nr_chans may be larger than:

 (1) what the policy permits,
 (2) what the stm device can handle.

While (1) the user can fix in the policy, they won't be able to fix (2),
in which case they won't be able to use stm_ftrace at all. I'm thinking
if a link-time callback would be good enough.

Another thing is that .nr_chans needs to be a power of 2 at the moment.

Regards,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
