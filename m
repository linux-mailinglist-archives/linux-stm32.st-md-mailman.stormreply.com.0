Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D44403E53
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Sep 2021 19:27:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17370C597AA;
	Wed,  8 Sep 2021 17:27:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD8DEC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Sep 2021 17:27:47 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F19A60EBA;
 Wed,  8 Sep 2021 17:27:39 +0000 (UTC)
Date: Wed, 8 Sep 2021 18:31:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20210908183105.062869dd@jic23-huawei>
In-Reply-To: <ec80f7a8-5f2e-522f-6a66-ab25092618c2@foss.st.com>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
 <a111c8905c467805ca530728f88189b59430f27e.1630031207.git.vilhelm.gray@gmail.com>
 <ec80f7a8-5f2e-522f-6a66-ab25092618c2@foss.st.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 alexandre.belloni@bootlin.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com,
 William Breathitt Gray <vilhelm.gray@gmail.com>, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v16 01/14] counter: stm32-lptimer-cnt:
 Provide defines for clock polarities
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

On Tue, 31 Aug 2021 15:38:50 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 8/27/21 5:47 AM, William Breathitt Gray wrote:
> > The STM32 low-power timer permits configuration of the clock polarity
> > via the LPTIMX_CFGR register CKPOL bits. This patch provides
> > preprocessor defines for the supported clock polarities.
> > 
> > Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> >  drivers/counter/stm32-lptimer-cnt.c | 6 +++---
> >  include/linux/mfd/stm32-lptimer.h   | 5 +++++
> >  2 files changed, 8 insertions(+), 3 deletions(-)  
> 
> Hi William,
> 
> You can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Applied to the togreg branch of iio.git and push out as testing for all the normal reasons

> 
> Thanks,
> Fabrice
> 
> > 
> > diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
> > index 13656957c45f..7367f46c6f91 100644
> > --- a/drivers/counter/stm32-lptimer-cnt.c
> > +++ b/drivers/counter/stm32-lptimer-cnt.c
> > @@ -140,9 +140,9 @@ static const enum counter_function stm32_lptim_cnt_functions[] = {
> >  };
> >  
> >  enum stm32_lptim_synapse_action {
> > -	STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE,
> > -	STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE,
> > -	STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES,
> > +	STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE = STM32_LPTIM_CKPOL_RISING_EDGE,
> > +	STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE = STM32_LPTIM_CKPOL_FALLING_EDGE,
> > +	STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES = STM32_LPTIM_CKPOL_BOTH_EDGES,
> >  	STM32_LPTIM_SYNAPSE_ACTION_NONE,
> >  };
> >  
> > diff --git a/include/linux/mfd/stm32-lptimer.h b/include/linux/mfd/stm32-lptimer.h
> > index 90b20550c1c8..06d3f11dc3c9 100644
> > --- a/include/linux/mfd/stm32-lptimer.h
> > +++ b/include/linux/mfd/stm32-lptimer.h
> > @@ -45,6 +45,11 @@
> >  #define STM32_LPTIM_PRESC	GENMASK(11, 9)
> >  #define STM32_LPTIM_CKPOL	GENMASK(2, 1)
> >  
> > +/* STM32_LPTIM_CKPOL */
> > +#define STM32_LPTIM_CKPOL_RISING_EDGE	0
> > +#define STM32_LPTIM_CKPOL_FALLING_EDGE	1
> > +#define STM32_LPTIM_CKPOL_BOTH_EDGES	2
> > +
> >  /* STM32_LPTIM_ARR */
> >  #define STM32_LPTIM_MAX_ARR	0xFFFF
> >  
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
