Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD97A763C8
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Mar 2025 12:04:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A7EC78F90;
	Mon, 31 Mar 2025 10:04:50 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A925C78F8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Mar 2025 10:04:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8C252A43087;
 Mon, 31 Mar 2025 09:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED166C4CEEB;
 Mon, 31 Mar 2025 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743415487;
 bh=WtzLinbXy3Fwr2WfhYAFy3MIbifKzfAyDAq6yh8KZdw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Olha6VKyprn8Do63e/IQcMQFClU+a0DaReCkz9AyuzufuKRxPX/XlV0R23urfP6ji
 Pianwfz0YKZZU+KTYJVu5kOsN9SigaIdrZ5Bbuz3aEZeDzlMXUVYOLQsN830Ix9lID
 gEUVA6Be8aoSc4lANtxO2GHEExT9rv8XQklTka5d2N5b+S+tFyOnVVeiCadpC8YyzQ
 S7nRhp3HgJh05BOoKlM5tTw7VeTlB287biI7sRrX08HbTp5SjQqc54hwuxGshgvzlm
 Kkr8HFivsF8XVLd4gzSjnKyeJppAW+JgBnvjmyX7+V1w0sxVPDXGuSGCI1My1Qslwg
 5UWTxxVwJKoLw==
Date: Mon, 31 Mar 2025 11:04:35 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250331110435.26157ebe@jic23-huawei>
In-Reply-To: <30d13179-66fc-4856-ac70-af051ec5fe8f@foss.st.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-4-fabrice.gasnier@foss.st.com>
 <20250315125615.065a2e74@jic23-huawei>
 <30d13179-66fc-4856-ac70-af051ec5fe8f@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ukleinek@kernel.org, krzk+dt@kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 3/8] iio: trigger: stm32-lptimer: add
 support for stm32mp25
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

On Thu, 27 Mar 2025 17:36:00 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 3/15/25 13:56, Jonathan Cameron wrote:
> > On Fri, 14 Mar 2025 18:14:46 +0100
> > Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:
> >   
> >> From: Olivier Moysan <olivier.moysan@foss.st.com>
> >>
> >> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> >> this new HW variant. Add new trigger definitions that can be used by the
> >> stm32 analog-to-digital converter. Use compatible data to identify them.
> >>
> >> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>  
> > 
> > How do you want this to merge?   If it's going through mfd because
> > of dependencies, then
> > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > I haven't checked if there are any dependencies so shout if I should
> > pick this up directly for next cycle.  
> 
> Hi Jonathan, Lee,
> 
> There's no build dependency, but the dt-bindings that adds the
> compatible string.
> 
> Perhaps Lee can pick it up along with the mfd bindings and driver ?
> 
> I'm not sure what the most suitable option is.
We don't normally worry if bindings and driver end up going through different
trees.  Applied this patch to the testing branch of iio.git. I'll rebase
on rc1 once available and push out as normal togreg branch.

Thanks,

Jonathan
> 
> Best Regards,
> Fabrice
> > 
> > Thanks,
> > 
> > Jonathan
> > 
> >   
> >> ---
> >> Changes in v4:
> >> - Jonathan's comment: simplify infrastructure by keeping
> >>   devm_iio_trigger_register. Don't need to cast compatible data.
> >> ---
> >>  drivers/iio/trigger/stm32-lptimer-trigger.c   | 75 ++++++++++++++-----
> >>  include/linux/iio/timer/stm32-lptim-trigger.h |  9 +++
> >>  2 files changed, 67 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
> >> index f1e18913236a..3dcc8d2fe093 100644
> >> --- a/drivers/iio/trigger/stm32-lptimer-trigger.c
> >> +++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
> >> @@ -16,16 +16,43 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/property.h>
> >>  
> >> -/* List Low-Power Timer triggers */
> >> -static const char * const stm32_lptim_triggers[] = {
> >> -	LPTIM1_OUT,
> >> -	LPTIM2_OUT,
> >> -	LPTIM3_OUT,
> >> +/* Maximum triggers + one trailing null entry to indicate the end of array */
> >> +#define MAX_TRIGGERS 3
> >> +
> >> +struct stm32_lptim_cfg {
> >> +	const char * const (*triggers)[MAX_TRIGGERS];
> >> +	unsigned int nb_triggers;
> >> +};
> >> +
> >> +/* List Low-Power Timer triggers for H7, MP13, MP15 */
> >> +static const char * const stm32_lptim_triggers[][MAX_TRIGGERS] = {
> >> +	{ LPTIM1_OUT,},
> >> +	{ LPTIM2_OUT,},
> >> +	{ LPTIM3_OUT,},
> >> +};
> >> +
> >> +/* List Low-Power Timer triggers for STM32MP25 */
> >> +static const char * const stm32mp25_lptim_triggers[][MAX_TRIGGERS] = {
> >> +	{ LPTIM1_CH1, LPTIM1_CH2, },
> >> +	{ LPTIM2_CH1, LPTIM2_CH2, },
> >> +	{ LPTIM3_CH1,},
> >> +	{ LPTIM4_CH1,},
> >> +	{ LPTIM5_OUT,},
> >> +};
> >> +
> >> +static const struct stm32_lptim_cfg stm32mp15_lptim_cfg = {
> >> +	.triggers = stm32_lptim_triggers,
> >> +	.nb_triggers = ARRAY_SIZE(stm32_lptim_triggers),
> >> +};
> >> +
> >> +static const struct stm32_lptim_cfg stm32mp25_lptim_cfg = {
> >> +	.triggers = stm32mp25_lptim_triggers,
> >> +	.nb_triggers = ARRAY_SIZE(stm32mp25_lptim_triggers),
> >>  };
> >>  
> >>  struct stm32_lptim_trigger {
> >>  	struct device *dev;
> >> -	const char *trg;
> >> +	const char * const *triggers;
> >>  };
> >>  
> >>  static int stm32_lptim_validate_device(struct iio_trigger *trig,
> >> @@ -56,22 +83,33 @@ EXPORT_SYMBOL(is_stm32_lptim_trigger);
> >>  
> >>  static int stm32_lptim_setup_trig(struct stm32_lptim_trigger *priv)
> >>  {
> >> -	struct iio_trigger *trig;
> >> +	const char * const *cur = priv->triggers;
> >> +	int ret;
> >>  
> >> -	trig = devm_iio_trigger_alloc(priv->dev, "%s", priv->trg);
> >> -	if  (!trig)
> >> -		return -ENOMEM;
> >> +	while (cur && *cur) {
> >> +		struct iio_trigger *trig;
> >>  
> >> -	trig->dev.parent = priv->dev->parent;
> >> -	trig->ops = &stm32_lptim_trigger_ops;
> >> -	iio_trigger_set_drvdata(trig, priv);
> >> +		trig = devm_iio_trigger_alloc(priv->dev, "%s", *cur);
> >> +		if  (!trig)
> >> +			return -ENOMEM;
> >>  
> >> -	return devm_iio_trigger_register(priv->dev, trig);
> >> +		trig->dev.parent = priv->dev->parent;
> >> +		trig->ops = &stm32_lptim_trigger_ops;
> >> +		iio_trigger_set_drvdata(trig, priv);
> >> +
> >> +		ret = devm_iio_trigger_register(priv->dev, trig);
> >> +		if (ret)
> >> +			return ret;
> >> +		cur++;
> >> +	}
> >> +
> >> +	return 0;
> >>  }
> >>  
> >>  static int stm32_lptim_trigger_probe(struct platform_device *pdev)
> >>  {
> >>  	struct stm32_lptim_trigger *priv;
> >> +	struct stm32_lptim_cfg const *lptim_cfg;
> >>  	u32 index;
> >>  
> >>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >> @@ -81,17 +119,20 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
> >>  	if (device_property_read_u32(&pdev->dev, "reg", &index))
> >>  		return -EINVAL;
> >>  
> >> -	if (index >= ARRAY_SIZE(stm32_lptim_triggers))
> >> +	lptim_cfg = device_get_match_data(&pdev->dev);
> >> +
> >> +	if (index >= lptim_cfg->nb_triggers)
> >>  		return -EINVAL;
> >>  
> >>  	priv->dev = &pdev->dev;
> >> -	priv->trg = stm32_lptim_triggers[index];
> >> +	priv->triggers = lptim_cfg->triggers[index];
> >>  
> >>  	return stm32_lptim_setup_trig(priv);
> >>  }
> >>  
> >>  static const struct of_device_id stm32_lptim_trig_of_match[] = {
> >> -	{ .compatible = "st,stm32-lptimer-trigger", },
> >> +	{ .compatible = "st,stm32-lptimer-trigger", .data = &stm32mp15_lptim_cfg },
> >> +	{ .compatible = "st,stm32mp25-lptimer-trigger", .data = &stm32mp25_lptim_cfg},
> >>  	{},
> >>  };
> >>  MODULE_DEVICE_TABLE(of, stm32_lptim_trig_of_match);
> >> diff --git a/include/linux/iio/timer/stm32-lptim-trigger.h b/include/linux/iio/timer/stm32-lptim-trigger.h
> >> index a34dcf6a6001..ce3cf0addb2e 100644
> >> --- a/include/linux/iio/timer/stm32-lptim-trigger.h
> >> +++ b/include/linux/iio/timer/stm32-lptim-trigger.h
> >> @@ -14,6 +14,15 @@
> >>  #define LPTIM1_OUT	"lptim1_out"
> >>  #define LPTIM2_OUT	"lptim2_out"
> >>  #define LPTIM3_OUT	"lptim3_out"
> >> +#define LPTIM4_OUT	"lptim4_out"
> >> +#define LPTIM5_OUT	"lptim5_out"
> >> +
> >> +#define LPTIM1_CH1	"lptim1_ch1"
> >> +#define LPTIM1_CH2	"lptim1_ch2"
> >> +#define LPTIM2_CH1	"lptim2_ch1"
> >> +#define LPTIM2_CH2	"lptim2_ch2"
> >> +#define LPTIM3_CH1	"lptim3_ch1"
> >> +#define LPTIM4_CH1	"lptim4_ch1"
> >>  
> >>  #if IS_REACHABLE(CONFIG_IIO_STM32_LPTIMER_TRIGGER)
> >>  bool is_stm32_lptim_trigger(struct iio_trigger *trig);  
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
