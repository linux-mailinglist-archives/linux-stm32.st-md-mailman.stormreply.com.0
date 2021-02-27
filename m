Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DDC326DBC
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Feb 2021 17:11:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2624C57B59;
	Sat, 27 Feb 2021 16:11:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7B14C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Feb 2021 16:11:24 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE30A64E4D;
 Sat, 27 Feb 2021 16:11:21 +0000 (UTC)
Date: Sat, 27 Feb 2021 16:11:15 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20210227161115.28fdda76@archlinux>
In-Reply-To: <d6ae294d-5d49-bb3f-6456-a485a247323c@foss.st.com>
References: <20210226012931.161429-1-vilhelm.gray@gmail.com>
 <d6ae294d-5d49-bb3f-6456-a485a247323c@foss.st.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alexandre.torgue@st.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 benjamin.gaignard@st.com
Subject: Re: [Linux-stm32] [PATCH v2] counter: stm32-timer-cnt: Report count
 function when SLAVE_MODE_DISABLED
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

On Fri, 26 Feb 2021 16:24:32 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 2/26/21 2:29 AM, William Breathitt Gray wrote:
> > When in SLAVE_MODE_DISABLED mode, the count still increases if the
> > counter is enabled because an internal clock is used. This patch fixes
> > the stm32_count_function_get() and stm32_count_function_set() functions
> > to properly handle this behavior.
> > 
> > Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
> > Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Alexandre Torgue <alexandre.torgue@st.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> > Changes in v2:
> >  - Support an explicit 0 case for function_get()/function_set()
> > 
> >  drivers/counter/stm32-timer-cnt.c | 39 ++++++++++++++++++++-----------
> >  1 file changed, 25 insertions(+), 14 deletions(-)  
> 
> Hi William,
> 
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Applied to the fixes-togreg branch of iio.git

Thanks,

Jonathan

> 
> Many thanks for this fix.
> Best Regards,
> Fabrice
> 
> 
> > 
> > diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> > index ef2a974a2f10..cd50dc12bd02 100644
> > --- a/drivers/counter/stm32-timer-cnt.c
> > +++ b/drivers/counter/stm32-timer-cnt.c
> > @@ -44,13 +44,14 @@ struct stm32_timer_cnt {
> >   * @STM32_COUNT_ENCODER_MODE_3: counts on both TI1FP1 and TI2FP2 edges
> >   */
> >  enum stm32_count_function {
> > -	STM32_COUNT_SLAVE_MODE_DISABLED = -1,
> > +	STM32_COUNT_SLAVE_MODE_DISABLED,
> >  	STM32_COUNT_ENCODER_MODE_1,
> >  	STM32_COUNT_ENCODER_MODE_2,
> >  	STM32_COUNT_ENCODER_MODE_3,
> >  };
> >  
> >  static enum counter_count_function stm32_count_functions[] = {
> > +	[STM32_COUNT_SLAVE_MODE_DISABLED] = COUNTER_COUNT_FUNCTION_INCREASE,
> >  	[STM32_COUNT_ENCODER_MODE_1] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_A,
> >  	[STM32_COUNT_ENCODER_MODE_2] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_B,
> >  	[STM32_COUNT_ENCODER_MODE_3] = COUNTER_COUNT_FUNCTION_QUADRATURE_X4,
> > @@ -90,6 +91,9 @@ static int stm32_count_function_get(struct counter_device *counter,
> >  	regmap_read(priv->regmap, TIM_SMCR, &smcr);
> >  
> >  	switch (smcr & TIM_SMCR_SMS) {
> > +	case 0:
> > +		*function = STM32_COUNT_SLAVE_MODE_DISABLED;
> > +		return 0;
> >  	case 1:
> >  		*function = STM32_COUNT_ENCODER_MODE_1;
> >  		return 0;
> > @@ -99,9 +103,9 @@ static int stm32_count_function_get(struct counter_device *counter,
> >  	case 3:
> >  		*function = STM32_COUNT_ENCODER_MODE_3;
> >  		return 0;
> > +	default:
> > +		return -EINVAL;
> >  	}
> > -
> > -	return -EINVAL;
> >  }
> >  
> >  static int stm32_count_function_set(struct counter_device *counter,
> > @@ -112,6 +116,9 @@ static int stm32_count_function_set(struct counter_device *counter,
> >  	u32 cr1, sms;
> >  
> >  	switch (function) {
> > +	case STM32_COUNT_SLAVE_MODE_DISABLED:
> > +		sms = 0;
> > +		break;
> >  	case STM32_COUNT_ENCODER_MODE_1:
> >  		sms = 1;
> >  		break;
> > @@ -122,8 +129,7 @@ static int stm32_count_function_set(struct counter_device *counter,
> >  		sms = 3;
> >  		break;
> >  	default:
> > -		sms = 0;
> > -		break;
> > +		return -EINVAL;
> >  	}
> >  
> >  	/* Store enable status */
> > @@ -274,31 +280,36 @@ static int stm32_action_get(struct counter_device *counter,
> >  	size_t function;
> >  	int err;
> >  
> > -	/* Default action mode (e.g. STM32_COUNT_SLAVE_MODE_DISABLED) */
> > -	*action = STM32_SYNAPSE_ACTION_NONE;
> > -
> >  	err = stm32_count_function_get(counter, count, &function);
> >  	if (err)
> > -		return 0;
> > +		return err;
> >  
> >  	switch (function) {
> > +	case STM32_COUNT_SLAVE_MODE_DISABLED:
> > +		/* counts on internal clock when CEN=1 */
> > +		*action = STM32_SYNAPSE_ACTION_NONE;
> > +		return 0;
> >  	case STM32_COUNT_ENCODER_MODE_1:
> >  		/* counts up/down on TI1FP1 edge depending on TI2FP2 level */
> >  		if (synapse->signal->id == count->synapses[0].signal->id)
> >  			*action = STM32_SYNAPSE_ACTION_BOTH_EDGES;
> > -		break;
> > +		else
> > +			*action = STM32_SYNAPSE_ACTION_NONE;
> > +		return 0;
> >  	case STM32_COUNT_ENCODER_MODE_2:
> >  		/* counts up/down on TI2FP2 edge depending on TI1FP1 level */
> >  		if (synapse->signal->id == count->synapses[1].signal->id)
> >  			*action = STM32_SYNAPSE_ACTION_BOTH_EDGES;
> > -		break;
> > +		else
> > +			*action = STM32_SYNAPSE_ACTION_NONE;
> > +		return 0;
> >  	case STM32_COUNT_ENCODER_MODE_3:
> >  		/* counts up/down on both TI1FP1 and TI2FP2 edges */
> >  		*action = STM32_SYNAPSE_ACTION_BOTH_EDGES;
> > -		break;
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> >  	}
> > -
> > -	return 0;
> >  }
> >  
> >  static const struct counter_ops stm32_timer_cnt_ops = {
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
