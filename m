Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE126FFC4
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Sep 2020 16:26:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8965C3FAD4;
	Fri, 18 Sep 2020 14:26:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF612C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Sep 2020 14:26:47 +0000 (UTC)
IronPort-SDR: 4m4sd6qEBFcfpwM2rJOM/BFqDKtuXIzyQum93bfhv3x3x2nb1LFnHekeCDLQOqQeH4fi570PyC
 q88evDQviKiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160864842"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="160864842"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 07:26:45 -0700
IronPort-SDR: zShKMULoi/s7nQSYOLpqL1AeJf5DgQmiQwEm6cdJbcL75exOQh3mGdJtAHMAmSyCz5G1EQXOJl
 3iZCzmw+JVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="508894939"
Received: from um.fi.intel.com (HELO um) ([10.237.72.57])
 by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2020 07:26:39 -0700
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Tingwei Zhang <tingweiz@codeaurora.org>,
 Tingwei Zhang <tingwei@codeaurora.org>
In-Reply-To: <20200914232729.GB20431@codeaurora.org>
References: <20200903001706.28147-1-tingwei@codeaurora.org>
 <20200914232729.GB20431@codeaurora.org>
Date: Fri, 18 Sep 2020 17:26:38 +0300
Message-ID: <87wo0rw481.fsf@ashishki-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: tsoni@codeaurora.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, alexander.shishkin@linux.intel.com,
 Mao Jinlong <jinlmao@codeaurora.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/6] tracing: export event trace and
	trace_marker
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

Tingwei Zhang <tingweiz@codeaurora.org> writes:

> Hi Alexander, Maxime, Aleandre,
>
> May I know your comments for this patch set?

Everything except the last patch is

Reviewed-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

After that one is resolved either I can pick it up or Stephen. Either
way is fine with me.

Regards,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
