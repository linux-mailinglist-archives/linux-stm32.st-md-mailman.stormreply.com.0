Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8BC360E87
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 17:16:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4904C57B79;
	Thu, 15 Apr 2021 15:16:42 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CE07C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:16:40 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id u7so10429453plr.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lr7yrzY+nk0m4HxiHE2dv7ykdCcOOQqJTWXcZt1WofE=;
 b=BynvbTh7cWAIV3l1bLcy9XsS6kzSwDQgySlTMzPvNADW3hjmi2PUh5Jo+DzlnOxI5c
 8NAgCaR1/2CToDoUS3yA1ELLe7zWL1kRv2O0zalghfKH3bF7961SM1dNDjQNY7gjrD9W
 aXNopHC1Txedyjc/sZs7/l9hEJhSiVQ50M3rEelZsBehJvYguAoBh7z72A53ZcMJdSpM
 sbmOP+0PCAANJHOi1r59OVINKtNHetDIx9Xyjayit1TLikg2+78xQ5VN8kIDhAFYzu/e
 ggBjknvH0QKrnvgr0D3+neQO88fqPjL/6iILuHtKK0REfJ4uWQio/Y2ABimrLmOTAFxn
 6VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lr7yrzY+nk0m4HxiHE2dv7ykdCcOOQqJTWXcZt1WofE=;
 b=fTSn3/+w1kV6S6EWLKFWoS8i1DGe6FENYci8WENFIxYIH/CmrfNiSkxI/dUWf9h8Ql
 8eVbByigfwoxXgqK4xN/3rvFd8xwB7IfLgtes+MaxQtPckUyTzKx+qq2U/SKyyDgG9DQ
 e17wI/WgCuIjxGmBwPr/p3M9ouV8hlqBfcwUi7UyIudMBxJsULNhFROCeZyWy4Ql/lJs
 jxKDcvw+tfhvXEma5JEchbOnZSAmIl5n7/t+jGK3ShlBoO6WeisypPXCzdW5f4yWClpr
 OeV0vwXr4cWGki0D6P7nXzCFso+ZVzwjmiQuPke+Saq9S86rZ8RPIWScJmE238SGemjv
 Q2+w==
X-Gm-Message-State: AOAM5311thjkMB7V8rgBEs099p955FI7/WKr17V58gbo7gO+VD7K8qUT
 06YZP/OTILgkm1896cfICAE=
X-Google-Smtp-Source: ABdhPJyJJppaqi4uKuIVw8D2RITj+pIvSst8bI5s51uwBYjYsXVSsz9lqzc37KC4puLzydWbhV9Ktg==
X-Received: by 2002:a17:90a:ba09:: with SMTP id
 s9mr4429648pjr.133.1618499799099; 
 Thu, 15 Apr 2021 08:16:39 -0700 (PDT)
Received: from syed ([2401:4900:2eec:4193:f802:b600:e94c:55c4])
 by smtp.gmail.com with ESMTPSA id c21sm2730490pgl.71.2021.04.15.08.16.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:16:38 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:46:29 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210415151629.GD8933@syed>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <4a227eea6fa6aa1648fb0ccba6e924b6f95b2752.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a227eea6fa6aa1648fb0ccba6e924b6f95b2752.1616150619.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 06/33] counter: 104-quad-8: Add const
 qualifiers for quad8_preset_register_set
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

On Fri, Mar 19, 2021 at 08:00:25PM +0900, William Breathitt Gray wrote:
> Add some safety by qualifying the quad8_preset_register_set() function
> parameters as const.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 0fd61cc82d30..51fba8cf9c2a 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -632,8 +632,8 @@ static ssize_t quad8_count_preset_read(struct counter_device *counter,
>  	return sprintf(buf, "%u\n", priv->preset[count->id]);
>  }
>  
> -static void quad8_preset_register_set(struct quad8 *priv, int id,
> -				      unsigned int preset)
> +static void quad8_preset_register_set(struct quad8 *const priv, const int id,
> +				      const unsigned int preset)
>  {
>  	const unsigned int base_offset = priv->base + 2 * id;
>  	int i;
> -- 
> 2.30.2
>

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
