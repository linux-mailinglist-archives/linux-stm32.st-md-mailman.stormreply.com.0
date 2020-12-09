Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF7F2D43DF
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Dec 2020 15:06:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8D29C3FADB;
	Wed,  9 Dec 2020 14:06:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 742ECC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 14:06:08 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=geraet)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kn06X-0004af-FX; Wed, 09 Dec 2020 15:06:05 +0100
Message-ID: <5856fd28a803a36b36bdb201f2690b837d8b19c2.camel@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
Date: Wed, 09 Dec 2020 15:06:01 +0100
In-Reply-To: <20201209131214.2382-1-arnaud.pouliquen@foss.st.com>
References: <20201209131214.2382-1-arnaud.pouliquen@foss.st.com>
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Etienne Carriere <etienne.carriere@st.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: don't print an error
 on probe deferral
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

Hello Arnaud,

On Wed, 2020-12-09 at 14:12 +0100, Arnaud Pouliquen wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Change stm32 remoteproc driver to not generate an error message
> when device probe operation is deferred for the reset controller.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index a180aeae9675..25c916782991 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -614,7 +614,9 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev,
>  
>  	ddata->rst = devm_reset_control_get_by_index(dev, 0);
>  	if (IS_ERR(ddata->rst)) {
> -		dev_err(dev, "failed to get mcu reset\n");
> +		if (PTR_ERR(ddata->rst) != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get mcu reset\n");
> +

There is dev_err_probe() now that could be used here instead.
It has the added benefit that it records the reason for the
deferred probe.

>  		return PTR_ERR(ddata->rst);
>  	}
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
