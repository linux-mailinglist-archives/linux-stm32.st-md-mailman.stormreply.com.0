Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B10B3463BB4
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 17:25:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6832FC5A4D4;
	Tue, 30 Nov 2021 16:25:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17CA7C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 16:25:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AUG6McP011313;
 Tue, 30 Nov 2021 17:25:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=WqVGUGJynlkXTaAagbwpsyKojsFqZfR97E4SdDcxrFw=;
 b=lSX61Nq3ZMXvio35Xvj2UzR+0TL3Adgw3VFp2L9Qm24BkRZYK9prRbEe2OmL1nVZqCUJ
 +vbmRLHSzeISgceFyDa+RhW7EOQ2qyO89shnRcOYDafPLpDV+CIwXQuNk+xjHJ45+s5C
 0hMyBnl+OqRDaP0cfFHS88iHB9Ay6Sby1sF2mjkb+1vxNjQ7kVK807/tRoaD1PTYesVD
 O9lfEEB94O8FN+QcC2zjMh2/LwOi+g236H1dfhG47lv7dvLEBv/RWJbU5yC95JUzQkDe
 8eqyuxQq6iYwf1D5nffsTprJZ4jaSFZJu7MLW211N4mlRrWX2ARDO9ygI6a6iEUL2Min 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cnq6dr358-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 17:25:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CCA710002A;
 Tue, 30 Nov 2021 17:25:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63C6C231DFE;
 Tue, 30 Nov 2021 17:25:40 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov
 2021 17:25:39 +0100
Date: Tue, 30 Nov 2021 17:25:34 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Wolfram Sang <wsa@kernel.org>
Message-ID: <20211130162534.GA813993@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 pierre-yves.mordret@foss.st.com
References: <20211130093816.12789-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211130093816.12789-1-wsa@kernel.org>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_09,2021-11-28_01,2020-04-07_01
Cc: linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: remove noisy and imprecise
	log messages
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

Hi Wolfram,

On Tue, Nov 30, 2021 at 10:38:16AM +0100, Wolfram Sang wrote:
> The log messages talk about 'bus recovery' while it is not a bus
> recovery with 9 pulses but merely a controller reset. Controller resets
> are not worth log messages. The 'bus busy' message should be emitted by
> upper layers, a busy bus may be expectected in some cases.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
> 
> Alain, do you agree? Only compile tested.

Yes I fully agree with that, thanks for doing that.
2 minor points:
- s/expectected/expected, within the commit log
- looking at this area of code again, it appears that the function stm32f7_i2c_release_bus
is ALWAYS returning 0. So it should actually be a void function.  I thus
propose, if you agree with that, that I propose, and apply a patch PRIOR to your/this patch
to change that and remove the error checking of the stm32f7_i2c_release_bus function since it is useless.
Is that fine for you ?

Alain

> 
>  drivers/i2c/busses/i2c-stm32f7.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index b9b19a2a2ffa..e0e7d0001cbc 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -832,8 +832,6 @@ static int stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
>  
> -	dev_info(i2c_dev->dev, "Trying to recover bus\n");
> -
>  	stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
>  			     STM32F7_I2C_CR1_PE);
>  
> @@ -854,13 +852,9 @@ static int stm32f7_i2c_wait_free_bus(struct stm32f7_i2c_dev *i2c_dev)
>  	if (!ret)
>  		return 0;
>  
> -	dev_info(i2c_dev->dev, "bus busy\n");
> -
>  	ret = stm32f7_i2c_release_bus(&i2c_dev->adap);
> -	if (ret) {
> -		dev_err(i2c_dev->dev, "Failed to recover the bus (%d)\n", ret);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	return -EBUSY;
>  }
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
