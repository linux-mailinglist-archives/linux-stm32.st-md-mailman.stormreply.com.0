Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 573703C28BA
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jul 2021 19:49:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E70A4C57B5F;
	Fri,  9 Jul 2021 17:49:29 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31C14C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 17:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EviZU2uuP6xbI7sca67ngz6XryNmMZnSS/BzYRMUQF0=; b=ZL8cgvESyqHLAjkuZooo9B8p3J
 FlYQFDmVKAJyWJvWmQDjM2Gh0h+8+lMK8GDKQcehof8S+lcZtmMKE8D6qWnA1ozqDCg8x/LyZOEQ5
 K/C2eh3FAiESsj/Wfik8Tz/Q6zuG7nuqPzExDkG0CkQ2M20uGxMP3xjpUxu2rymSu4k5lGxfmxwqv
 pZmmoBdgGV+m648zqPamKa3vvlnwZa61l7xJyMtUeFdicP6oOAnuT8lIrHtDXD2KtKJt9dbfV9rOK
 Dhh5jFsAbPNPLZZc9PBh3Cs2X9pHO67Fw7+0YkuU+mvKS6LLbi+pK3meOGJMLeJHtwzaxW+eTLDJk
 wLWnfcpA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52110 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1m1uch-00BIVL-G5; Fri, 09 Jul 2021 13:49:24 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <4223302f61b77b82b3927bd3280d0df791418d76.1625471640.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <caba5d29-0820-0821-50ba-260933a2ee5a@lechnology.com>
Date: Fri, 9 Jul 2021 12:49:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4223302f61b77b82b3927bd3280d0df791418d76.1625471640.git.vilhelm.gray@gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 07/17] counter: Update counter.h
 comments to reflect sysfs internalization
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 7/5/21 3:18 AM, William Breathitt Gray wrote:
> The Counter subsystem architecture and driver implementations have
> changed in order to handle Counter sysfs interactions in a more
> consistent way. This patch updates the Generic Counter interface
> header file comments to reflect the changes.
> 
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>   drivers/counter/counter-core.c |  3 +++
>   include/linux/counter.h        | 43 ++++++++++++++++------------------
>   2 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/counter/counter-core.c b/drivers/counter/counter-core.c
> index 15f735ef296e..9442e3b91468 100644
> --- a/drivers/counter/counter-core.c
> +++ b/drivers/counter/counter-core.c
> @@ -41,6 +41,9 @@ static struct bus_type counter_bus_type = {
>    * This function registers a Counter to the system. A sysfs "counter" directory
>    * will be created and populated with sysfs attributes correlating with the
>    * Counter Signals, Synapses, and Counts respectively.
> + *
> + * RETURNS:
> + * 0 on success, negative error number on failure.
>    */
>   int counter_register(struct counter_device *const counter)
>   {
> diff --git a/include/linux/counter.h b/include/linux/counter.h
> index b69277f5c4c5..e7fd6d81a929 100644
> --- a/include/linux/counter.h
> +++ b/include/linux/counter.h
> @@ -188,11 +188,10 @@ struct counter_comp {
>   
>   /**
>    * struct counter_signal - Counter Signal node
> - * @id:		unique ID used to identify signal
> - * @name:	device-specific Signal name; ideally, this should match the name
> - *		as it appears in the datasheet documentation
> - * @ext:	optional array of Counter Signal extensions
> - * @num_ext:	number of Counter Signal extensions specified in @ext
> + * @id:		unique ID used to identify the Signal
> + * @name:	device-specific Signal name
> + * @ext:	optional array of Signal extensions
> + * @num_ext:	number of Signal extensions specified in @ext
>    */
>   struct counter_signal {
>   	int id;
> @@ -206,7 +205,7 @@ struct counter_signal {
>    * struct counter_synapse - Counter Synapse node
>    * @actions_list:	array of available action modes
>    * @num_actions:	number of action modes specified in @actions_list
> - * @signal:		pointer to associated signal
> + * @signal:		pointer to the associated Signal
>    */
>   struct counter_synapse {
>   	const enum counter_synapse_action *actions_list;
> @@ -217,15 +216,14 @@ struct counter_synapse {
>   
>   /**
>    * struct counter_count - Counter Count node
> - * @id:			unique ID used to identify Count
> - * @name:		device-specific Count name; ideally, this should match
> - *			the name as it appears in the datasheet documentation
> - * @functions_list:	array available function modes
> + * @id:			unique ID used to identify the Count
> + * @name:		device-specific Count name
> + * @functions_list:	array of available function modes
>    * @num_functions:	number of function modes specified in @functions_list
> - * @synapses:		array of synapses for initialization
> - * @num_synapses:	number of synapses specified in @synapses
> - * @ext:		optional array of Counter Count extensions
> - * @num_ext:		number of Counter Count extensions specified in @ext
> + * @synapses:		array of Synapses for initialization
> + * @num_synapses:	number of Synapses specified in @synapses
> + * @ext:		optional array of Count extensions
> + * @num_ext:		number of Count extensions specified in @ext
>    */
>   struct counter_count {
>   	int id;
> @@ -243,15 +241,14 @@ struct counter_count {
>   
>   /**
>    * struct counter_ops - Callbacks from driver
> - * @signal_read:	optional read callback for Signal attribute. The read
> - *			level of the respective Signal should be passed back via
> - *			the level parameter.
> - * @count_read:		optional read callback for Count attribute. The read
> - *			value of the respective Count should be passed back via
> - *			the val parameter.

Are these no longer optional? If they really are optional, it would be nice to
keep that information in the description.

> - * @count_write:	optional write callback for Count attribute. The write
> - *			value for the respective Count is passed in via the val
> + * @signal_read:	read callback for Signals. The read level of the
> + *			respective Signal should be passed back via the level
> + *			parameter.
> + * @count_read:		read callback for Counts. The read value of the
> + *			respective Count should be passed back via the value
>    *			parameter.
> + * @count_write:	write callback for Counts. The write value for the
> + *			respective Count is passed in via the value parameter.
>    * @function_read:	read callback the Count function modes. The read
>    *			function mode of the respective Count should be passed
>    *			back via the function parameter.
> @@ -291,7 +288,7 @@ struct counter_ops {
>   
>   /**
>    * struct counter_device - Counter data structure
> - * @name:		name of the device as it appears in the datasheet
> + * @name:		name of the device

Is there a recommended naming convention if using the datasheet is no longer
recommended?

>    * @parent:		optional parent device providing the counters
>    * @ops:		callbacks from driver
>    * @signals:		array of Signals
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
