Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593723BB9E
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Aug 2020 16:04:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC406C36B3A;
	Tue,  4 Aug 2020 14:04:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E0AFC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 14:04:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 074E2fQ5012620; Tue, 4 Aug 2020 16:03:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=g1q2H5ysWZ/cXh6WfPm4E7PqZip4LMdzOc7r6xjdZSM=;
 b=Qm5g9VHzkCDj/E2I+yHWyl7ZJHtljlBmJ+uwrcJ04ePIKtmyxRjcHCwPFfenGhsaNmzF
 Pq4k4Skii6cXgwgJsdD+6dtFmBfLOvHjDF23zn+WzwWRTLqmkGtHNxsDkhEhs1tJuZJ5
 WQPELmgy/oDgOpMo79wsuXLkMQxg1AKLCEaK0XnXzhDGrc/oTyirqF4eJkEBpMrFk2hA
 +D+85nli4GJjqpyyug/w2LNPumQEP5BKwvytyK0aFfAbqx13E5MuOYG3vCQWGGanpGjX
 mkHtIw8UlYkmbZ+B7H7skP6CldWT3+9M2GuVBGpdneph9KVnDEnQVzWxIplLm0tAudia wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32n6sb3dju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 16:03:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 54FBC100034;
 Tue,  4 Aug 2020 16:03:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FA6F2BC7A0;
 Tue,  4 Aug 2020 16:03:56 +0200 (CEST)
Received: from lmecxl1060.lme.st.com (10.75.127.44) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Aug
 2020 16:03:55 +0200
To: Alain Volmat <alain.volmat@st.com>, <wsa@kernel.org>
References: <1596431876-24115-1-git-send-email-alain.volmat@st.com>
 <1596431876-24115-2-git-send-email-alain.volmat@st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <46f8ab6e-e53d-dadc-1031-425757fb9a4f@st.com>
Date: Tue, 4 Aug 2020 16:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596431876-24115-2-git-send-email-alain.volmat@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_04:2020-08-03,
 2020-08-04 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] i2c: smbus: add core function
 handling SMBus host-notify
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

Hi Alain

Look good for me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Best Regards

On 8/3/20 7:17 AM, Alain Volmat wrote:
> SMBus Host-Notify protocol, from the adapter point of view
> consist of receiving a message from a client, including the
> client address and some other data.
> 
> It can be simply handled by creating a new slave device
> and registering a callback performing the parsing of the
> message received from the client.
> 
> This commit introduces two new core functions
>   * i2c_new_slave_host_notify_device
>   * i2c_free_slave_host_notify_device
> that take care of registration of the new slave device and
> callback and will call i2c_handle_smbus_host_notify once a
> Host-Notify event is received.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  v3: move smbus host-notify slave code into i2c-smbus.c file
>      rework slave callback index handling
>      add sanity check in slave free function
>  v2: identical to v1
>  drivers/i2c/i2c-smbus.c   | 107 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/i2c-smbus.h |  12 ++++++
>  2 files changed, 119 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index dc0108287ccf..d3d06e3b4f3b 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -197,6 +197,113 @@ EXPORT_SYMBOL_GPL(i2c_handle_smbus_alert);
>  
>  module_i2c_driver(smbalert_driver);
>  
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +#define SMBUS_HOST_NOTIFY_LEN	3
> +struct i2c_slave_host_notify_status {
> +	u8 index;
> +	u8 addr;
> +};
> +
> +static int i2c_slave_host_notify_cb(struct i2c_client *client,
> +				    enum i2c_slave_event event, u8 *val)
> +{
> +	struct i2c_slave_host_notify_status *status = client->dev.platform_data;
> +
> +	switch (event) {
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		/* We only retrieve the first byte received (addr)
> +		 * since there is currently no support to retrieve the data
> +		 * parameter from the client.
> +		 */
> +		if (status->index == 0)
> +			status->addr = *val;
> +		if (status->index < U8_MAX)
> +			status->index++;
> +		break;
> +	case I2C_SLAVE_STOP:
> +		if (status->index == SMBUS_HOST_NOTIFY_LEN)
> +			i2c_handle_smbus_host_notify(client->adapter,
> +						     status->addr);
> +		fallthrough;
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		status->index = 0;
> +		break;
> +	case I2C_SLAVE_READ_REQUESTED:
> +	case I2C_SLAVE_READ_PROCESSED:
> +		*val = 0xff;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * i2c_new_slave_host_notify_device - get a client for SMBus host-notify support
> + * @adapter: the target adapter
> + * Context: can sleep
> + *
> + * Setup handling of the SMBus host-notify protocol on a given I2C bus segment.
> + *
> + * Handling is done by creating a device and its callback and handling data
> + * received via the SMBus host-notify address (0x8)
> + *
> + * This returns the client, which should be ultimately freed using
> + * i2c_free_slave_host_notify_device(); or an ERRPTR to indicate an error.
> + */
> +struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter)
> +{
> +	struct i2c_board_info host_notify_board_info = {
> +		I2C_BOARD_INFO("smbus_host_notify", 0x08),
> +		.flags  = I2C_CLIENT_SLAVE,
> +	};
> +	struct i2c_slave_host_notify_status *status;
> +	struct i2c_client *client;
> +	int ret;
> +
> +	status = kzalloc(sizeof(struct i2c_slave_host_notify_status),
> +			 GFP_KERNEL);
> +	if (!status)
> +		return ERR_PTR(-ENOMEM);
> +
> +	host_notify_board_info.platform_data = status;
> +
> +	client = i2c_new_client_device(adapter, &host_notify_board_info);
> +	if (IS_ERR(client)) {
> +		kfree(status);
> +		return client;
> +	}
> +
> +	ret = i2c_slave_register(client, i2c_slave_host_notify_cb);
> +	if (ret) {
> +		i2c_unregister_device(client);
> +		kfree(status);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return client;
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_slave_host_notify_device);
> +
> +/**
> + * i2c_free_slave_host_notify_device - free the client for SMBus host-notify
> + * support
> + * @client: the client to free
> + * Context: can sleep
> + *
> + * Free the i2c_client allocated via i2c_new_slave_host_notify_device
> + */
> +void i2c_free_slave_host_notify_device(struct i2c_client *client)
> +{
> +	if (IS_ERR_OR_NULL(client))
> +		return;
> +
> +	i2c_slave_unregister(client);
> +	kfree(client->dev.platform_data);
> +	i2c_unregister_device(client);
> +}
> +EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
> +#endif
> +
>  /*
>   * SPD is not part of SMBus but we include it here for convenience as the
>   * target systems are the same.
> diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
> index 1e4e0de4ef8b..1ef421818d3a 100644
> --- a/include/linux/i2c-smbus.h
> +++ b/include/linux/i2c-smbus.h
> @@ -38,6 +38,18 @@ static inline int of_i2c_setup_smbus_alert(struct i2c_adapter *adap)
>  	return 0;
>  }
>  #endif
> +#if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_I2C_SLAVE)
> +struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter);
> +void i2c_free_slave_host_notify_device(struct i2c_client *client);
> +#else
> +static inline struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +static inline void i2c_free_slave_host_notify_device(struct i2c_client *client)
> +{
> +}
> +#endif
>  
>  #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
>  void i2c_register_spd(struct i2c_adapter *adap);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
