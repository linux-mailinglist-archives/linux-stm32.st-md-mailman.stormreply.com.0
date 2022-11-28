Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A901663AA4B
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Nov 2022 15:01:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56C86C65E5E;
	Mon, 28 Nov 2022 14:01:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F0A5C65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 13:51:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso8384016wms.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 05:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=A4qIw9CSlOm6ggm9ciNJN1TeZJOcMp5IoO7x7apMWbY=;
 b=PUheZR1NpZnwy4KRhNf7nnLwIkGHB+FvPg3d4NllsEb6kJdBq7yONBrs3hMeyWlnn1
 zq7ZDz79pngmWJGbOOpg7tjdv722XGMIA04Jsft2i512lr13vEq85Gy8pUH0PKhRieln
 XQS+nVeEIzJPmfy5m7XTKjGQ6VRITUaWFNyBu5tcAumfrmGV5H5nWfrykIKNxDbwpvTB
 8hgO296977TfbN+W61Ok9Fi/tYwiQfR/1wUcsq3pyTu5Pn6o+ohkdoHtkmUZPSdSZ+qq
 Sv+9WnU8J0Vs/sWd7h/Pqtpe60IPEmIyYYHgzk8Y67wIP/PY01VQyNFEVT2hCPxE01im
 /Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A4qIw9CSlOm6ggm9ciNJN1TeZJOcMp5IoO7x7apMWbY=;
 b=qHGArcUNjxdAtfmYEereJ+75XtXknsjwOcd/f7fh8N8eMhFDTdjsNwM1Hm/b+K8m4k
 DtYD90oPnQn2W6Ey/D72LcW45wy3BaNW8gxsivPxna1e20bxOrcahNxn5H72Iz/B1t4T
 NrNmzYmFOP5q/MleoDfpKnbNum900VFTz/ppizRSq3XpekVcJzxBzUWK9Syc5f2mJ9aP
 6N4wIN2RhY13xWyxwtUEMArvl295FzCYS0e5ogwejbnN/oeVmKPLO7STi+E8R/wcj7zZ
 250Oa4O78VrjqdZr7HdAuWUBtCepVIIInSVIeMXMcJCY/2lA/6hH4qk8CWsEJVyUAC8l
 Z9xA==
X-Gm-Message-State: ANoB5pmcCENxqAX5XtnkxkZOJP/t2BIM8WpkyIQnVZvRhjUP/zTxqw/n
 wb6BPotmHJ9glewdJRU2jbuy6A==
X-Google-Smtp-Source: AA0mqf6nkBPng31LSUbczvahgKFmzQ1kx1CywnM+9hcT4gIL7Y/Lh2Y4uDKbcBxCZeQ9OdymBWy/Ug==
X-Received: by 2002:a1c:f606:0:b0:3b4:bf6d:f9ba with SMTP id
 w6-20020a1cf606000000b003b4bf6df9bamr37179147wmc.133.1669643471076; 
 Mon, 28 Nov 2022 05:51:11 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b00241d2df4960sm10884840wrv.17.2022.11.28.05.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 05:51:10 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>, linux-input@vger.kernel.org
In-Reply-To: <20221117142753.2477-1-linmengbo0689@protonmail.com>
References: <20221117142753.2477-1-linmengbo0689@protonmail.com>
Date: Mon, 28 Nov 2022 14:51:09 +0100
Message-ID: <87wn7frxv6.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Nov 2022 14:01:07 +0000
Cc: Nikita Travkin <nikita@trvn.ru>, Corey Minyard <cminyard@mvista.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Zheng Yongjun <zhengyongjun3@huawei.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Input: stmfts - retry commands after
	timeout
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

On Thu, Nov 17, 2022 at 14:28, "Lin, Meng-Bo" <linmengbo0689@protonmail.com> wrote:

> Add #define STMFTS_RETRY_COUNT 3 to retry stmfts_command() 3 times.
> Without it, STMFTS_SYSTEM_RESET or STMFTS_SLEEP_OUT may return -110 to
> failed attempt due to no event received for completion.
>
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/touchscreen/stmfts.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index d5bd170808fb..22de34966373 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -68,6 +68,7 @@
>  #define STMFTS_DATA_MAX_SIZE	(STMFTS_EVENT_SIZE * STMFTS_STACK_DEPTH)
>  #define STMFTS_MAX_FINGERS	10
>  #define STMFTS_DEV_NAME		"stmfts"
> +#define STMFTS_RETRY_COUNT	3
>  
>  enum stmfts_regulators {
>  	STMFTS_REGULATOR_VDD,
> @@ -317,19 +318,20 @@ static irqreturn_t stmfts_irq_handler(int irq, void *dev)
>  
>  static int stmfts_command(struct stmfts_data *sdata, const u8 cmd)
>  {
> -	int err;
> +	int err, retry;
>  
>  	reinit_completion(&sdata->cmd_done);
>  
> -	err = i2c_smbus_write_byte(sdata->client, cmd);
> -	if (err)
> -		return err;
> -
> -	if (!wait_for_completion_timeout(&sdata->cmd_done,
> -					 msecs_to_jiffies(1000)))
> -		return -ETIMEDOUT;
> +	for (retry = 0; retry < STMFTS_RETRY_COUNT; retry++) {
> +		err = i2c_smbus_write_byte(sdata->client, cmd);
> +		if (err)
> +			return err;
>  
> -	return 0;
> +		if (wait_for_completion_timeout(&sdata->cmd_done,
> +						msecs_to_jiffies(1000)))
> +			return 0;
> +	}
> +	return -ETIMEDOUT;
>  }
>  
>  static int stmfts_input_open(struct input_dev *dev)
> -- 
> 2.30.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
