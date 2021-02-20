Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E96DF320628
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Feb 2021 17:30:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1E1DC5719D;
	Sat, 20 Feb 2021 16:30:10 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08199C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Feb 2021 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ihzSQU1VPZbn2yYTLCpMZ8Md74uPTutyPKGtlry1dT0=; b=ky9BSwkWUReOIoFkYNxbbgO7DJ
 3hvp2upv75H/ZJRaXJfC4p9uwtgTp8z2FeAr7FizSQDN7gMk0MyFpwVqUdgMjScoJV19A+XApqTVt
 9Qiu0LPSJvZt5RjT1OHvw5kW295q+R/rltjdw8ag06P8RCdvf9NTg93nQfxBhaQYAXWVCWnDlA2+H
 cOcAq8O818XQ11i/NdqgpgDj53Czyd3Z+q7t1YFsOeRM1V+/+LqjzaEG0bWSecffXYXHjCnEpydkp
 mr/X0ToEJ5XfMxvNzcQHeC6BITZT7mB8zgJmhjCx/cFdSeCm0zTSAfddtrSeqjmdEE8y+zphEM190
 YaFUrMuA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:57396 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1lDV8u-00072X-Go; Sat, 20 Feb 2021 11:30:04 -0500
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <2be0c071e7730ea16b8faa1efcd3d0d908e7f9db.1613131238.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <8e7daaad-e824-a823-1465-327cbc90ab23@lechnology.com>
Date: Sat, 20 Feb 2021 10:30:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2be0c071e7730ea16b8faa1efcd3d0d908e7f9db.1613131238.git.vilhelm.gray@gmail.com>
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
 o.rempel@pengutronix.de, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 03/22] counter: 104-quad-8: Return
 error when invalid mode during ceiling_write
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

On 2/12/21 6:13 AM, William Breathitt Gray wrote:
> The 104-QUAD-8 only has two count modes where a ceiling value makes
> sense: Range Limit and Modulo-N. Outside of these two modes, setting a
> ceiling value is an invalid operation -- so let's report it as such by
> returning -EINVAL.
> 
> Fixes: fc069262261c ("counter: 104-quad-8: Add lock guards - generic interface")
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>   drivers/counter/104-quad-8.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 9691f8612be8..f0608b21196a 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -714,13 +714,14 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
>   	switch (priv->count_mode[count->id]) {
>   	case 1:
>   	case 3:
> +		mutex_unlock(&priv->lock);
>   		quad8_preset_register_set(priv, count->id, ceiling);
> -		break;
> +		return len;
>   	}
>   
>   	mutex_unlock(&priv->lock);
>   
> -	return len;
> +	return -EINVAL;
>   }
>   
>   static ssize_t quad8_count_preset_enable_read(struct counter_device *counter,
> 

What happens if the register is written to when in the wrong mode?

If it doesn't hurt anything, I would suggest always writing the register
instead so that users don't have to know worry about the fact that the mode
has to be set first.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
