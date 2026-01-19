Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FFFD3A771
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 12:53:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22567C87ED3;
	Mon, 19 Jan 2026 11:53:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47187C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 11:53:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C383E1517;
 Mon, 19 Jan 2026 03:53:39 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com
 [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 670523F632;
 Mon, 19 Jan 2026 03:53:44 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <quic_tingwei@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Kim Phillips <kim.phillips@arm.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, coresight@lists.linaro.org,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Antonio Borneo <antonio.borneo@foss.st.com>
Date: Mon, 19 Jan 2026 11:53:30 +0000
Message-ID: <176882354697.1800388.2817378483525119566.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108152427.357379-1-antonio.borneo@foss.st.com>
References: <20260108152427.357379-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [Linux-stm32] [PATCH] coresight: etm3x: Fix cpulocked warning
	on cpuhp
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


On Thu, 08 Jan 2026 16:24:27 +0100, Antonio Borneo wrote:
> When changes [1] and [2] have been applied to the driver etm4x, the
> same modifications have been also collapsed in [3] and applied in
> one shot to the driver etm3x.
> While doing this, the driver etm3x has not been aligned to etm4x on
> the use of non cpuslocked version of cpuhp callback setup APIs.
> 
> The current code triggers two run-time warnings when the kernel is
> compiled with CONFIG_PROVE_LOCKING=y.
> 
> [...]

Applied, thanks!

[1/1] coresight: etm3x: Fix cpulocked warning on cpuhp
      https://git.kernel.org/coresight/c/1feb0377b9b8

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
