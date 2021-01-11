Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8494A2F0FAB
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jan 2021 11:06:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 422A0C5719B;
	Mon, 11 Jan 2021 10:06:41 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3099C424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 09:59:43 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id lt17so23883367ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 01:59:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T8T/O0ZlTJGLCjZbDX0PD9JZEkqddMeqh2KTM2iKu8k=;
 b=jeis8GMyMK6wsnXaRwSXYuM7NG5wE0yy69/F+YAhXZxXHrwbPPNQndHbayFOdkEVhC
 K9aTHRmB55z3qwxLt1pXp7+vSZOdN0Jib/pauOm0lYV2dO4MsjgEcAZL18zLagpxEZmc
 yd7sUdFNjV0M5ZttNTyj9il3Tio3gNYn8UL1Qwm+0NViIMF+qa9NYMG+tLpPHZR0OcwF
 CPnSF16g5ofFVH4dsmHa3rv4pK6Hd9O/Ap6aA6zwVIaPLzEBZFF+HaJcFyc6PNIfE8pv
 MZArvbwfZZ0MQOG70inrv3f9ZQcwf9Y1V5yeQrdZcVY1kO446rI7STfeT6ldYaL72VuV
 cvIg==
X-Gm-Message-State: AOAM531SicbBo+FJiBrL1RcRouLfrU7oVzyXAqWJl71Kn5q6wb5nSZbT
 7rGDzG8F0acK8CzoiAtr56Y=
X-Google-Smtp-Source: ABdhPJznV8Dt+uZrNWIQOGNosnX8IcpJUXUdaTHl1pHDy/ueH99EE7egorYvLE83L8+vlNI0OoPEEQ==
X-Received: by 2002:a17:906:4c55:: with SMTP id
 d21mr10257637ejw.116.1610359183463; 
 Mon, 11 Jan 2021 01:59:43 -0800 (PST)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id a6sm7483946edv.74.2021.01.11.01.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:59:42 -0800 (PST)
To: Erwan Le Ray <erwan.leray@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20210106162203.28854-1-erwan.leray@foss.st.com>
 <20210106162203.28854-5-erwan.leray@foss.st.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <e1d17cb6-a057-f427-dc77-6be139d39624@kernel.org>
Date: Mon, 11 Jan 2021 10:59:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106162203.28854-5-erwan.leray@foss.st.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 11 Jan 2021 10:06:38 +0000
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/8] serial: stm32: add author
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

On 06. 01. 21, 17:21, Erwan Le Ray wrote:
> Update email address add new author in authors list.

Parsing error :).

> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index 717a97759928..938d2c4aeaed 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -3,7 +3,8 @@
>    * Copyright (C) Maxime Coquelin 2015
>    * Copyright (C) STMicroelectronics SA 2017
>    * Authors:  Maxime Coquelin <mcoquelin.stm32@gmail.com>
> - *	     Gerald Baeza <gerald.baeza@st.com>
> + *	     Gerald Baeza <gerald.baeza@foss.st.com>
> + *	     Erwan Le Ray <erwan.leray@foss.st.com>
>    *
>    * Inspired by st-asc.c from STMicroelectronics (c)
>    */
> 


-- 
js
suse labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
