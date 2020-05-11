Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A04BF1CD3DE
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2020 10:28:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68E05C36B21;
	Mon, 11 May 2020 08:28:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E5B9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 08:28:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04B8S0Bg010988; Mon, 11 May 2020 10:28:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ARKtW82Ju4foRRG5jzp6GKL8UxrRXVO/KxZ4yej17EA=;
 b=YFyWS89NgLXHX4OBgXe4bdHZ0ZrWu3Se8fTc63Y7Y7DZ1QCCq3Hd6g+I9JYmYYTEmEcY
 oMDyhNRAzcGcsj4jrNNcl5qEQy/W4P0iBT84tCCw894FoqHhLIHhDIRgoeCOLz/jMwOa
 xdIXW8pRnV/jgNccj3k6tzeSOlvLjCCn3FDmVpcu6DYota4vSFCdOHMfZVviRLnYONC9
 uXwtKcj+BW8RSD/0e733l81RcgUU1B4R8EuolGkDqpLbsJZ8yjTXzHcWfGaaoQ0LW2hC
 mn/9z3mAQ86o5V+xQgSZmyAFm/nNwJXG6aJ7ygfyA3RrRhk7tZNSYmxOcAwFJAC9DWsU jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj01sa7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 10:28:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D58A10002A;
 Mon, 11 May 2020 10:28:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B1482B27B5;
 Mon, 11 May 2020 10:28:06 +0200 (CEST)
Received: from [10.131.226.156] (10.75.127.47) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 10:28:04 +0200
To: Alain Volmat <alain.volmat@st.com>, <wsa@kernel.org>, <robh+dt@kernel.org>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-3-git-send-email-alain.volmat@st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <a68f47ca-47e1-a293-f4ad-a5104c9ee620@st.com>
Date: Mon, 11 May 2020 10:28:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1588657871-14747-3-git-send-email-alain.volmat@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_03:2020-05-11,
 2020-05-11 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] i2c: addition of client reg/unreg
	callbacks
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

Hi all,

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 5/5/20 7:51 AM, Alain Volmat wrote:
> Addition of two callbacks reg_client and unreg_client that can be
> implemented by adapter drivers in order to take action whenever a
> client is being registered to it.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/i2c-core-base.c | 11 +++++++++++
>  include/linux/i2c.h         |  6 ++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 2e4560671183..4c84c6264314 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -319,6 +319,12 @@ static int i2c_device_probe(struct device *dev)
>  	if (!client)
>  		return 0;
>  
> +	if (client->adapter->algo->reg_client) {
> +		status = client->adapter->algo->reg_client(client);
> +		if (status)
> +			return status;
> +	}
> +
>  	driver = to_i2c_driver(dev->driver);
>  
>  	client->irq = client->init_irq;
> @@ -417,6 +423,8 @@ static int i2c_device_probe(struct device *dev)
>  put_sync_adapter:
>  	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
>  		pm_runtime_put_sync(&client->adapter->dev);
> +	if (client->adapter->algo->reg_client)
> +		client->adapter->algo->unreg_client(client);
>  
>  	return status;
>  }
> @@ -445,6 +453,9 @@ static int i2c_device_remove(struct device *dev)
>  	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
>  		pm_runtime_put(&client->adapter->dev);
>  
> +	if (client->adapter->algo->unreg_client)
> +		client->adapter->algo->unreg_client(client);
> +
>  	return status;
>  }
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 45d36ba4826b..61b838caf454 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -509,6 +509,8 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
>   *   so e.g. PMICs can be accessed very late before shutdown. Optional.
>   * @functionality: Return the flags that this algorithm/adapter pair supports
>   *   from the ``I2C_FUNC_*`` flags.
> + * @reg_client: Callback informing that a new client is being registered
> + * @unreg_client: Callback informing that a client is being removed
>   * @reg_slave: Register given client to I2C slave mode of this adapter
>   * @unreg_slave: Unregister given client from I2C slave mode of this adapter
>   *
> @@ -545,6 +547,10 @@ struct i2c_algorithm {
>  	/* To determine what the adapter supports */
>  	u32 (*functionality)(struct i2c_adapter *adap);
>  
> +	/* To inform the adapter of the probe/remove of a client */
> +	int (*reg_client)(struct i2c_client *client);
> +	void (*unreg_client)(struct i2c_client *client);
> +
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  	int (*reg_slave)(struct i2c_client *client);
>  	int (*unreg_slave)(struct i2c_client *client);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
