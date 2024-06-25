Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3E4916E64
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 18:49:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11F3CC71287;
	Tue, 25 Jun 2024 16:49:31 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D353EC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 16:49:23 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso60445621fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719334163; x=1719938963;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=REeWtAXLQdcK06O/ssyhbDKxgCQp9yFMmFuJINFQnRo=;
 b=Op6Bm1V9Ikz3bkKkYBxcHHavmQMPoe8Mt0pu3Qo9vZ4OWSNOVs/jV+oal0h7oWKDsk
 WFf8mk5SzFu60nl0Q8ZjiJ6tJY+MeSkE1hbOzbnqTDhQAWpDE0h4gIAvqhbRKd5sDWUT
 BKKfs9oUJv9bY5Cy7/uUvhrGOR+qmL7XOF0RadJoLPMbLXgenk/mWFJw2qjLp++uL70S
 3+HV+mSz81YeljbsUkc+0uN6Q+x0bOpEXIig38bpFKV2P9BXKTucG0zrkETKVl6GqZE/
 fgIFw9Oj/TzfSsgJmGnhucWaSkZtIZ96dwoJ1KtXY2ytpAwwsj3LHWKI4Ih7X8ZDlxhk
 T3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719334163; x=1719938963;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=REeWtAXLQdcK06O/ssyhbDKxgCQp9yFMmFuJINFQnRo=;
 b=fXBIFYGsAURPc3ktOou4CU+R/AY3A2Eei8vwjnD6/Pf3tSMKKaEVfmdh43GwkBKqVU
 d2mEvC+opIJ2tv81IIytUXBjU31PGMXXoJ6bCaKzwc/qwByNteumHhUFDchPTQPx6Fpp
 OZiDlaKjAsyRxm96yi36DfkG21fRplKPLqJoqW1qph35qnV8HNOSlMvv3VMvzubjQw2I
 PiZzF/a5gu7HDpsyt7DSycTF6Sp2kjmrf/Pyk1By5FmV65QXFTWE+s1RR4VtREkN7QEa
 E1DWmdQqNBwvpX+q28XuU5I8SmhQx3fW813rlkUKxlYLb0WQ3eelO8gkgv/PUKEwD9Rj
 PdNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR9x2xCk6r4x5LwrRz8NRo1ELJtOD7uANdDHWcqxHro4Lq16QojWk3urY2UdYIcB4abpqHHnSxxdbiBjNn0u7F6xzADxNtvCxjon9kGcf1Pkqs+r/L/zaH
X-Gm-Message-State: AOJu0YysEgTtAfrgc7vCHDu8Cm1n+hYsUPosM2Npjv4H7ZH9HcEYoVme
 ZaTYKOt/c1B3ISBUnfp3vY4H06cBvxYnUMBo5fe5L/oc3EpaVSnubgVJxv5XLh4=
X-Google-Smtp-Source: AGHT+IGBuyLNjCbPQ995hC2wMffXdWuFAcAmTyiJzKbmrMEfh5HoCsgV31k/cina59eUth0JJHY0LA==
X-Received: by 2002:a05:6512:46f:b0:52c:9f9e:d8e3 with SMTP id
 2adb3069b0e04-52ce064e3d8mr5205362e87.31.1719334160965; 
 Tue, 25 Jun 2024 09:49:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49e7sm1283003e87.34.2024.06.25.09.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 09:49:20 -0700 (PDT)
Date: Tue, 25 Jun 2024 19:49:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <k2q7g6ka34o2vgoy5s64nwixqa6qjaok72fuxgircwseyn2k7z@pm56aurq42n6>
References: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
 <20240621-ucsi-rework-interface-v2-6-a399ff96bf88@linaro.org>
 <160e7af5-29c8-49a6-ae4f-dbfc3dd608c1@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160e7af5-29c8-49a6-ae4f-dbfc3dd608c1@foss.st.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 6/7] usb: typec: ucsi: extract common
 code for command handling
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

On Tue, Jun 25, 2024 at 05:24:54PM GMT, Fabrice Gasnier wrote:
> On 6/21/24 00:55, Dmitry Baryshkov wrote:
> > Extract common functions to handle command sending and to handle events
> > from UCSI. This ensures that all UCSI glue drivers handle the ACKs in
> > the same way.
> > 
> > The CCG driver used DEV_CMD_PENDING both for internal
> > firmware-related commands and for UCSI control handling. Leave the
> > former use case intact.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c           | 43 +++++++++++++++++++++++++++
> >  drivers/usb/typec/ucsi/ucsi.h           |  7 +++++
> >  drivers/usb/typec/ucsi/ucsi_acpi.c      | 46 ++---------------------------
> >  drivers/usb/typec/ucsi/ucsi_ccg.c       | 21 ++-----------
> >  drivers/usb/typec/ucsi/ucsi_glink.c     | 47 ++---------------------------
> >  drivers/usb/typec/ucsi/ucsi_stm32g0.c   | 44 ++--------------------------
> >  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 52 ++-------------------------------
> >  7 files changed, 62 insertions(+), 198 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index 4ba22323dbf9..691ee0c4ef87 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -36,6 +36,48 @@
> >   */
> >  #define UCSI_SWAP_TIMEOUT_MS	5000
> >  
> > +void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
> > +{
> > +	if (UCSI_CCI_CONNECTOR(cci))
> > +		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
> > +
> > +	if (cci & UCSI_CCI_ACK_COMPLETE &&
> > +	    test_bit(ACK_PENDING, &ucsi->flags))
> > +		complete(&ucsi->complete);
> > +
> > +	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> > +	    test_bit(COMMAND_PENDING, &ucsi->flags))
> > +		complete(&ucsi->complete);
> 
> Hi Dmitry,
> 
> I've recently faced some race with ucsi_stm32g0 driver, and have sent a
> fix for it [1], as you've noticed in the cover letter.
> 
> To fix that, I've used test_and_clear_bit() in above two cases, instead
> of test_bit().

Could you possible describe, why do you need test_and_clear_bit()
instead of just test_bit()? The bits are cleared at the end of the
.sync_write(), also there can be no other command (or ACK_CC) submission
before this one is fully processed.

> 
> https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/
> 
> > +}
> > +EXPORT_SYMBOL_GPL(ucsi_notify_common);
> > +
> > +int ucsi_sync_control_common(struct ucsi *ucsi, u64 command)
> > +{
> > +	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
> > +	int ret;
> > +
> > +	if (ack)
> > +		set_bit(ACK_PENDING, &ucsi->flags);
> > +	else
> > +		set_bit(COMMAND_PENDING, &ucsi->flags);
> > +
> > +	ret = ucsi->ops->async_control(ucsi, command);
> > +	if (ret)
> > +		goto out_clear_bit;
> > +
> > +	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
> > +		ret = -ETIMEDOUT;
> 
> With test_and_clear_bit(), could return 0, in case of success here.

Oh, I see. So your code returns earlier. I have a feeling that this
approach is less logical and slightly harder to follow.

Maybe it's easier if it is implemented as:

if (wait_for_completion_timeout(...))
	return 0;

if (ack)
	clear_bit(ACK_PENDING)
else
	clear_bit(COMMAND_PENDING)

return -ETIMEDOUT;


OR

if (!wait_for_completion_timeout(...)) {
	if (ack)
		clear_bit(ACK_PENDING)
	else
		clear_bit(COMMAND_PENDING)

	return -ETIMEDOUT;
}

return 0;

But really, unless there is an actual issue with the current code, I'd
prefer to keep it. It makes it clear that the bits are set and then are
cleared properly.

> I'd suggest to use similar approach here, unless you see some drawback?
> 
> Best Regards,
> Fabrice
> 
> > +
> > +out_clear_bit:
> > +	if (ack)
> > +		clear_bit(ACK_PENDING, &ucsi->flags);
> > +	else
> > +		clear_bit(COMMAND_PENDING, &ucsi->flags);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(ucsi_sync_control_common);
> > +
> >  static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
> >  {
> >  	u64 ctrl;
> > @@ -1883,6 +1925,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
> >  	INIT_WORK(&ucsi->resume_work, ucsi_resume_work);
> >  	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
> >  	mutex_init(&ucsi->ppm_lock);
> > +	init_completion(&ucsi->complete);
> >  	ucsi->dev = dev;
> >  	ucsi->ops = ops;
> 
> [snip]
> 
> >  	ucsi->ucsi = ucsi_create(dev, &pmic_glink_ucsi_ops);
> > diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> > index 14737ca3724c..d948c3f579e1 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> > @@ -61,11 +61,7 @@ struct ucsi_stm32g0 {
> 
> [snip]
> 
> > -
> > -	ret = ucsi_stm32g0_async_control(ucsi, command);
> > -	if (ret)
> > -		goto out_clear_bit;
> > -
> > -	if (!wait_for_completion_timeout(&g0->complete, msecs_to_jiffies(5000)))
> > -		ret = -ETIMEDOUT;
> > -	else
> > -		return 0;
> > -
> > -out_clear_bit:
> > -	if (ack)
> > -		clear_bit(ACK_PENDING, &g0->flags);
> > -	else
> > -		clear_bit(COMMAND_PENDING, &g0->flags);
> > -
> > -	return ret;
> > -}
> > -
> >  static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
> >  {
> >  	struct ucsi_stm32g0 *g0 = data;
> > @@ -449,13 +416,7 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
> >  	if (ret)
> >  		return IRQ_NONE;
> >  
> > -	if (UCSI_CCI_CONNECTOR(cci))
> > -		ucsi_connector_change(g0->ucsi, UCSI_CCI_CONNECTOR(cci));
> > -
> > -	if (cci & UCSI_CCI_ACK_COMPLETE && test_and_clear_bit(ACK_PENDING, &g0->flags))
> > -		complete(&g0->complete);
> > -	if (cci & UCSI_CCI_COMMAND_COMPLETE && test_and_clear_bit(COMMAND_PENDING, &g0->flags))
> > -		complete(&g0->complete);
> > +	ucsi_notify_common(g0->ucsi, cci);
> 
> I can see the fix "test_and_clear_bit()" sent earlier is removed from here.
> 
> I'd suggest to use similar approach as here, unless you see some drawback?
> 
> Please advise,
> Best Regards,
> Fabrice

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
