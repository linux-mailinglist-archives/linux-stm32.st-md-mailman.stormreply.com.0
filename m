Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C54828EA47
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Oct 2020 03:38:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF672C424AF;
	Thu, 15 Oct 2020 01:38:49 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 633AEC32E91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 01:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gp9MgJ2x0h6hvVzIBbZuzEuotuQRfMr9VA1l8XSMkK0=; b=qQrq345ZOK8Aff+jHXcAfMtzE8
 a7tu/sNjPjlU4toQVoA9SRMyRUOke2bm6M9BUy5cjWSIaU+C2gOqw48Ci7tsmf4smQMBZN3KhyoaW
 A83NcZVVWodBBsvqfTGwOlpTBsQWqt2dVwwauHgWTBcMKJX3SjK0FyjSTjCaloJ6PVFQwobtJXR5S
 G3eCRiqBclN4S3ZKXC4dxjJIryzrZwJKvd3YeO56NheG/pz/ITDtMaZGgQqR2BwGvSfYLCgz/tMki
 lzyzqXEdMgzQXx4+FH6Q9lp4tx2D9nyOyROt8sCuu73z11JCUBP7/iqKPLYtwWDCheoOufjRRZ0+c
 SMYvIXXQ==;
Received: from [2600:1700:4830:165f::19e] (port=54538)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1kSsE6-0004Vi-DK; Wed, 14 Oct 2020 21:38:42 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <e38f6dc3a08bf2510034334262776a6ed1df8b89.1601170670.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <17c22445-d523-07f8-d1ff-59e8dbc73cc8@lechnology.com>
Date: Wed, 14 Oct 2020 20:38:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e38f6dc3a08bf2510034334262776a6ed1df8b89.1601170670.git.vilhelm.gray@gmail.com>
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
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/5] counter: Internalize sysfs
	interface code
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

On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> +static ssize_t counter_comp_u8_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t len)
> +{
> +	const struct counter_attribute *const a = to_counter_attribute(attr);
> +	struct counter_device *const counter = dev_get_drvdata(dev);
> +	struct counter_count *const count = a->parent;
> +	struct counter_synapse *const synapse = a->comp.priv;
> +	const struct counter_available *const avail = a->comp.priv;
> +	int err;
> +	bool bool_data;
> +	u8 data;
> +
> +	switch (a->comp.type) {
> +	case COUNTER_COMP_BOOL:
> +		err = kstrtobool(buf, &bool_data);
> +		data = bool_data;
> +		break;
> +	case COUNTER_COMP_FUNCTION:
> +		err = find_in_string_array(&data, count->functions_list,
> +					   count->num_functions, buf,
> +					   counter_function_str);
> +		break;
> +	case COUNTER_COMP_SYNAPSE_ACTION:
> +		err = find_in_string_array(&data, synapse->actions_list,
> +					   synapse->num_actions, buf,
> +					   counter_synapse_action_str);
> +		break;
> +	case COUNTER_COMP_ENUM:
> +		err = __sysfs_match_string(avail->strs, avail->num_items, buf);
> +		data = err;
> +		break;
> +	case COUNTER_COMP_COUNT_MODE:
> +		err = find_in_string_array(&data, avail->enums,
> +					   avail->num_items, buf,
> +					   counter_count_mode_str);
> +		break;
> +	default:
> +		err = kstrtou8(buf, 0, &data);
> +		break;
> +	}

In this function, return values are not always errors. So it would make
sense to call the err variable ret instead and check for ret < 0 below.

Setting enums to a value with index > 0 fails currently because of this.

> +	if (err)
> +		return err;
> +
> +	switch (a->scope) {
> +	case COUNTER_SCOPE_DEVICE:
> +		err = a->comp.device_u8_write(counter, data);
> +		break;
> +	case COUNTER_SCOPE_SIGNAL:
> +		err = a->comp.signal_u8_write(counter, a->parent, data);
> +		break;
> +	case COUNTER_SCOPE_COUNT:
> +		if (a->comp.type == COUNTER_COMP_SYNAPSE_ACTION)
> +			err = a->comp.action_write(counter, count, synapse,
> +						   data);
> +		else
> +			err = a->comp.count_u8_write(counter, count, data);
> +		break;
> +	}
> +	if (err)
> +		return err;
> +
> +	return len;
> +}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
