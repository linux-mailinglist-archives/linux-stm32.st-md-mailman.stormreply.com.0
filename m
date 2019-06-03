Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E5C57E83
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE6FBC57B6D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:48 +0000 (UTC)
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45DB6CB36D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 11:45:32 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.252.75])
 by smtp-cloud9.xs4all.net with ESMTPA
 id XlP5hL7kAsDWyXlP8hsryq; Mon, 03 Jun 2019 13:45:31 +0200
To: Fabien Dessenne <fabien.dessenne@st.com>,
 Hugues Fruchet <hugues.fruchet@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Pavel Machek <pavel@denx.de>,
 linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <46944972-1f88-ef3b-fef9-8e37753c0ffe@xs4all.nl>
Date: Mon, 3 Jun 2019 13:45:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCN0MWjkjUyGzp6RpvMIZ2ZANeW2kYEP03Lpq3iqxfDwME2NkMqcJ+4u8wJA/QHfTb1eUz+uisc7OqX0O7kndwdR0ZVW6uYMPcB/P15b1VaJn538Lf+x
 NpoGEuGPiPtkBx9DsS6X0tLYlnRiI7z09uP0CoCsy8Xjtn42bpslVuei6PSli3eMoap5saASbpiDX6XpET+OFtD9B3RPXBwVdY8s8ZorQPRjKWBS+iFs5tU5
 JcyHlEgjEwFC3lQWFrLx7IKttSJSdQhzLTcFNI4C/GGkE2trkxzNun+9+Ruulo+8qY9ak+/SmKIQ+kgTg7xKgQBhwcWRnLRBWT55TpNhtogX6wNgZDrHA6R+
 DP8O8sDZLy5bkdDBxfik+WTTyrM7PXg/048e9w11h0IqIIlGhif1381FUXcLSGcLziyMd6bFNfwfgVfEUgK16hHn9FgCB4acy5ykhFHypGJ47adWQgK/dE6G
 9TJhkrGyPEBntvMjPZ9BgUNRVSNLdIIqLJzmuyPjIYgbtaRxjKOprgUXnCZ2Mg+Lh4zk3jdL6wiFvQH6IqSYwOZc/HHUQ3Mu+pq0ncGcj1p4oBZbHedZLcz6
 1ZXK7+Aa9y7T7q16w8DCGy61
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: fix irq = 0 case
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

On 5/31/19 11:18 AM, Fabien Dessenne wrote:
> Manage the irq = 0 case, where we shall return an error.
> 
> Fixes: b5b5a27bee58 ("media: stm32-dcmi: return appropriate error codes during probe")
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b9dad0a..d855e9c 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1702,7 +1702,7 @@ static int dcmi_probe(struct platform_device *pdev)
>  	if (irq <= 0) {

Shouldn't this be 'irq < 0' instead of '<=' ?

AFAICT irq == 0 can be a valid irq and isn't an error.

Regards,

	Hans

>  		if (irq != -EPROBE_DEFER)
>  			dev_err(&pdev->dev, "Could not get irq\n");
> -		return irq;
> +		return irq ? irq : -ENXIO;
>  	}
>  
>  	dcmi->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
