Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE6726A0DA
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Sep 2020 10:29:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E876C3FADF;
	Tue, 15 Sep 2020 08:29:02 +0000 (UTC)
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0FE8C32EB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Sep 2020 23:27:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600126080; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=JcwD/uxtsoKa4SSZpuOrTon7fbX8C8oGUwA3IhAUSfg=;
 b=JP7pYdE/SD3DbdEOo82z+DSr5oY6YH/UhfZG9cNcOdlXatO05Ecg3PbjClZFFFIifFOoS5Tq
 2CG7/ntSCo+lZP6JQkE9R5ORp5U/5VVwEnoZpkO4Krt0vLWybik0Irj+ICMXG/+7TQw8WqRF
 nYCazqMdiwMS5cZ5XEe4ZjVEhc8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1Njk0YyIsICJsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f5ffc69be06707b34f24044 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 23:27:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 269EAC43391; Mon, 14 Sep 2020 23:27:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tingwei)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 688E7C433CA;
 Mon, 14 Sep 2020 23:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 688E7C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=tingweiz@codeaurora.org
Date: Tue, 15 Sep 2020 07:27:29 +0800
From: Tingwei Zhang <tingweiz@codeaurora.org>
To: Tingwei Zhang <tingwei@codeaurora.org>
Message-ID: <20200914232729.GB20431@codeaurora.org>
References: <20200903001706.28147-1-tingwei@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903001706.28147-1-tingwei@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 15 Sep 2020 08:29:00 +0000
Cc: tsoni@codeaurora.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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

Hi Alexander, Maxime, Aleandre,

May I know your comments for this patch set?

Thanks,
Tingwei

On Thu, Sep 03, 2020 at 08:17:00AM +0800, Tingwei Zhang wrote:
> Ftrace has ability to export trace packets to other destination.
> Currently, only function trace can be exported. This series extends the
> support to event trace and trace_maker. STM is one possible destination to
> export ftrace. Use separate channel for each CPU to avoid mixing up
> packets
> from different CPUs together.
> 
> Change from v2:
> Change flag definition to BIT(). (Steven)
> Add comment in stm_ftrace_write() to clarify it's safe to use 
> smp_processor_id() here since preempt is disabled. (Steven) 
> 
> Change from v1:
> All changes are suggested by Steven Rostedt.
> User separate flag to control function trace, event trace and trace mark.
> Allocate channels according to num_possible_cpu() dynamically.
> Move ftrace_exports routines up so all ftrace can use them.
> 
> Tingwei Zhang (6):
>   stm class: ftrace: change dependency to TRACING
>   tracing: add flag to control different traces
>   tracing: add trace_export support for event trace
>   tracing: add trace_export support for trace_marker
>   stm class: ftrace: enable supported trace export flag
>   stm class: ftrace: use different channel accroding to CPU
> 
>  drivers/hwtracing/stm/Kconfig  |   2 +-
>  drivers/hwtracing/stm/ftrace.c |   7 +-
>  include/linux/trace.h          |   7 +
>  kernel/trace/trace.c           | 270 ++++++++++++++++++---------------
>  4 files changed, 159 insertions(+), 127 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
