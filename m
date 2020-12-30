Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9752E2E7D29
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Dec 2020 00:24:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D810C57188;
	Wed, 30 Dec 2020 23:24:43 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0316AC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Dec 2020 23:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gR78gPmwmA3kImx4p1tfZOTvAzaVPgOtdhEAk6uVEuo=; b=Ql8i79ZJySZkkEqx92KLopxutF
 nMiYp+T9LFAnRRiGu3UH5RLtJSLxptityXbUPrJLaqD7v4p6vmWO0gZovCI57dgUp5qcyPWAIm05z
 wWtBLCbngYwA8Mih1D4Q6N30Q+rv8Ohuff6VlBhSy87Co7n98XE3eRlsZZ/YGs9SaEC8swQ76CHQf
 6t/HUlwy7vsQ0m/bsxi2vbS0QGDdTht0WJGXhL8XZa3sOBrwuqPS4Nec4sYGvtkfBDriO+Au3aHOm
 4gveVMjkC9C77U3ktO0y+zpNcKKVLB4Cnxjqs5DgNOBEXGL6e24jK2vZyh8YhXPoAXDPRDUr9mJTG
 gjsoXeFg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:42538 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1kukpX-0004fK-Hz; Wed, 30 Dec 2020 18:24:35 -0500
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1608935587.git.vilhelm.gray@gmail.com>
 <fc40ab7f4a38e80d86715daa5eaf744dd645a75b.1608935587.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <2f950b79-fb83-9800-2690-ec81c6be6348@lechnology.com>
Date: Wed, 30 Dec 2020 17:24:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fc40ab7f4a38e80d86715daa5eaf744dd645a75b.1608935587.git.vilhelm.gray@gmail.com>
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
 Dan Carpenter <dan.carpenter@oracle.com>, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 1/5] counter: Internalize sysfs
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

On 12/25/20 6:15 PM, William Breathitt Gray wrote:

> diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
> index a60aee1a1a29..6c058b93dc98 100644
> --- a/drivers/counter/ti-eqep.c
> +++ b/drivers/counter/ti-eqep.c


> -static ssize_t ti_eqep_position_floor_write(struct counter_device *counter,
> -					    struct counter_count *count,
> -					    void *ext_priv, const char *buf,
> -					    size_t len)
> +static int ti_eqep_position_floor_write(struct counter_device *counter,
> +					struct counter_count *count, u64 floor)
>   {
>   	struct ti_eqep_cnt *priv = counter->priv;
> -	int err;
> -	u32 res;
>   
> -	err = kstrtouint(buf, 0, &res);
> -	if (err < 0)
> -		return err;
> +	if (floor != (u32)floor)
> +		return -ERANGE;
>   
> -	regmap_write(priv->regmap32, QPOSINIT, res);
> +	regmap_write(priv->regmap32, QPOSINIT, floor);
>   
> -	return len;
> +	return 0;
>   }

This will conflict with 2ba7b50893de "counter:ti-eqep: remove floor"
(in Jonathan's fixes-togreg branch) which removes these functions.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
