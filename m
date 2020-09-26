Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166E27A79D
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Sep 2020 08:36:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32605C3FAD7;
	Mon, 28 Sep 2020 06:36:15 +0000 (UTC)
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D93FC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Sep 2020 01:01:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601082069; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=inVwG+lgLK3y69RPi+2kZXAeaXX0aKhf2C3eywTtfvc=;
 b=H8gOL2ulR0QiBMUF847Sy7tJNMX5Lf+eU1sSCNoJGGKg1wN8LMyQz0J++zxYIUiJLtK5kq78
 PmsiT6di1UdhgfEAMy+4pXa3U/64SLGUWchCpzEOme/SN6Q4vNUikZ+FocfacIHtzb+5BK++
 StZh8yvAf9njLQFTxdmhevmYmZE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1Njk0YyIsICJsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f6e92bfebb17452baed4d57 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 26 Sep 2020 01:00:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AF01DC433A1; Sat, 26 Sep 2020 01:00:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from tingweiz-gv.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tingwei)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 43463C433C8;
 Sat, 26 Sep 2020 01:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 43463C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=tingwei@codeaurora.org
From: Tingwei Zhang <tingwei@codeaurora.org>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Sat, 26 Sep 2020 08:59:59 +0800
Message-Id: <20200926010005.14689-1-tingwei@codeaurora.org>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 06:36:12 +0000
Cc: tsoni@codeaurora.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mao Jinlong <jinlmao@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/6] tracing: export event trace and
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

Ftrace has ability to export trace packets to other destination.
Currently, only function trace can be exported. This series extends the
support to event trace and trace_maker. STM is one possible destination to
export ftrace. Use separate channel for each CPU to avoid mixing up packets
from different CPUs together.

Change from v3:
Round up number of channels to power of 2. (Alex)

Change from v2:
Change flag definition to BIT(). (Steven)
Add comment in stm_ftrace_write() to clarify it's safe to use 
smp_processor_id() here since preempt is disabled. (Steven) 

Change from v1:
All changes are suggested by Steven Rostedt.
User separate flag to control function trace, event trace and trace mark.
Allocate channels according to num_possible_cpu() dynamically.
Move ftrace_exports routines up so all ftrace can use them.

Tingwei Zhang (6):
  stm class: ftrace: change dependency to TRACING
  tracing: add flag to control different traces
  tracing: add trace_export support for event trace
  tracing: add trace_export support for trace_marker
  stm class: ftrace: enable supported trace export flag
  stm class: ftrace: use different channel accroding to CPU

 drivers/hwtracing/stm/Kconfig  |   2 +-
 drivers/hwtracing/stm/ftrace.c |   7 +-
 include/linux/trace.h          |   7 +
 kernel/trace/trace.c           | 270 ++++++++++++++++++---------------
 4 files changed, 159 insertions(+), 127 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
