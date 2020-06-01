Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A971E9D9C
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 07:56:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67905C36B22;
	Mon,  1 Jun 2020 05:56:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C371C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 05:56:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0515lTN1000727; Mon, 1 Jun 2020 07:56:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=jm4u4MsVV598+LB742qzZN+QkL1OoKxYIMw9eBswBXo=;
 b=XQFqfptkVoAsWGN64ok/XB/t6VmuQpg9AsBWjOxwzPObPxHYGXjpYm7gYMDIwVE+GHPk
 ZCsV3va/ZzOWG3gtgV+wkGR11XM4n+c4MRuX0OxH7Vs4EqmyCyhoG/MswcbmEV4EZBpJ
 sh1Jk5qKu7SimGKJKugWU1v+j0TdS9JrPKYBUQrcA4RDGdh0V199eiVgvnzd3cMpf2Rb
 1vEfaQw9rJNZcwmTAmpPpsTQsGGMX8eXeCEbKnY5/cY+QHepaLn5Kd2N9vVwiYIRr6SF
 K1oULjbDMd+rBxgn5QKJuaSWHqlyH5PnwreTDSRHkjvEGkAIy8tzRwqkMQyWAiKmSoMR xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31becfqhgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 07:56:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30CF310002A;
 Mon,  1 Jun 2020 07:56:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A87E2074B0;
 Mon,  1 Jun 2020 07:56:36 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 1 Jun
 2020 07:56:35 +0200
Date: Mon, 1 Jun 2020 07:56:34 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Message-ID: <20200601055634.GB17269@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Dinghao Liu <dinghao.liu@zju.edu.cn>,
 "kjlu@umn.edu" <kjlu@umn.edu>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200527013853.30252-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527013853.30252-1-dinghao.liu@zju.edu.cn>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-01_01:2020-05-28,
 2020-06-01 signatures=0
Cc: "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] [v2] i2c: stm32f7: Fix runtime PM
	imbalance on error
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

Hi,

Reviewed-by: Alain Volmat <alain.volmat@st.com>

Thanks,
Alain

On Wed, May 27, 2020 at 01:38:53AM +0000, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
> 
> Changelog:
> 
> v2: - Use pm_runtime_put_noidle() instead of
>       pm_runtime_put_autosuspend(). Fix 5 more
>       similar cases within this dirver.
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 330ffed011e0..822fd1f5b5ae 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1620,8 +1620,10 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>  	f7_msg->smbus = false;
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(i2c_dev->dev);
>  		return ret;
> +	}
>  
>  	ret = stm32f7_i2c_wait_free_bus(i2c_dev);
>  	if (ret)
> @@ -1666,8 +1668,10 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  	f7_msg->smbus = true;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(dev);
>  		return ret;
> +	}
>  
>  	ret = stm32f7_i2c_wait_free_bus(i2c_dev);
>  	if (ret)
> @@ -1767,8 +1771,10 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>  		return ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(dev);
>  		return ret;
> +	}
>  
>  	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
>  		stm32f7_i2c_enable_wakeup(i2c_dev, true);
> @@ -1837,8 +1843,10 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
>  	WARN_ON(!i2c_dev->slave[id]);
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(i2c_dev->dev);
>  		return ret;
> +	}
>  
>  	if (id == 0) {
>  		mask = STM32F7_I2C_OAR1_OA1EN;
> @@ -2182,8 +2190,10 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>  	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(i2c_dev->dev);
>  		return ret;
> +	}
>  
>  	backup_regs->cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
>  	backup_regs->cr2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR2);
> @@ -2204,8 +2214,10 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
>  	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
>  
>  	ret = pm_runtime_get_sync(i2c_dev->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(i2c_dev->dev);
>  		return ret;
> +	}
>  
>  	cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
>  	if (cr1 & STM32F7_I2C_CR1_PE)
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
