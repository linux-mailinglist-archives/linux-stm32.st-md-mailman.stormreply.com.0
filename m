Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B01EB892
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jun 2020 11:31:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C11F5C36B21;
	Tue,  2 Jun 2020 09:31:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65539C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2020 09:31:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45ACC55D;
 Tue,  2 Jun 2020 02:31:28 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A47393F305;
 Tue,  2 Jun 2020 02:31:26 -0700 (PDT)
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From: Valentin Schneider <valentin.schneider@arm.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
In-reply-to: <20200527151613.16083-1-benjamin.gaignard@st.com>
Date: Tue, 02 Jun 2020 10:31:21 +0100
Message-ID: <jhjpnahizkm.mognet@arm.com>
MIME-Version: 1.0
Cc: vincent.guittot@linaro.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: Set minimum cpufreq
	requirement
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


Hi Benjamin,

On 27/05/20 16:16, Benjamin Gaignard wrote:
> Before start streaming set cpufreq minimum frequency requirement.
> The cpufreq governor will adapt the frequencies and we will have
> no latency for handling interrupts.
>

Few comments below from someone oblivious to your platform, they may not
be all that relevant but I figured I'd pitch in anyway.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b8931490b83b..97c342351569 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -13,6 +13,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
> +#include <linux/cpufreq.h>
>  #include <linux/delay.h>
>  #include <linux/dmaengine.h>
>  #include <linux/init.h>
> @@ -99,6 +100,8 @@ enum state {
>
>  #define OVERRUN_ERROR_THRESHOLD	3
>
> +#define DCMI_MIN_FREQ	650000 /* in KHz */
> +

This assumes the handling part is guaranteed to always run on the same CPU
with the same performance profile (regardless of the platform). If that's
not guaranteed, it feels like you'd want this to be configurable in some
way.

>  struct dcmi_graph_entity {
>       struct v4l2_async_subdev asd;
>
[...]
> @@ -2020,6 +2042,8 @@ static int dcmi_probe(struct platform_device *pdev)
>               goto err_cleanup;
>       }
>
> +	dcmi->policy = cpufreq_cpu_get(0);
> +

Ideally you'd want to fetch the policy of the CPU your IRQ (and handling
thread) is affined to; The only compatible DTS I found describes a single
A7, which is somewhat limited in the affinity area...

>       dev_info(&pdev->dev, "Probe done\n");
>
>       platform_set_drvdata(pdev, dcmi);
> @@ -2049,6 +2073,9 @@ static int dcmi_remove(struct platform_device *pdev)
>
>       pm_runtime_disable(&pdev->dev);
>
> +	if (dcmi->policy)
> +		cpufreq_cpu_put(dcmi->policy);
> +
>       v4l2_async_notifier_unregister(&dcmi->notifier);
>       v4l2_async_notifier_cleanup(&dcmi->notifier);
>       media_entity_cleanup(&dcmi->vdev->entity);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
