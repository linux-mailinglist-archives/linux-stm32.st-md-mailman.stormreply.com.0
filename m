Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEC7360E94
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 17:18:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AF57C57B79;
	Thu, 15 Apr 2021 15:18:29 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05D35C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:18:27 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so14619272pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SELYhFsoJ14huwJ/81lZrO7K/RlYVZsAtlNmnDERCiA=;
 b=ZI671EdEu1bon8uIgOvGwowDhQ13B2JIDEO/kD8JYyATC14G92a5kP5sHVv6wbZwDx
 0PfOrtoNeOE/QaNnyI1Of4OO3RVD7Jr2vhsTh9WZojTIsVfBaTsATTm0aFM2U00Qc5A+
 R1LR1t7izz1GC7ra79nP7uC/trxTlWYJtUkAZ4zkvnhYOAbvGWKqoePvIW0ZRneXIyX2
 ZVK5itundPzYMqHM91lhdISmGXf2tw3t+y6W0kh45ch8euiECEIN3brid1AQp9Y4YHLu
 Gxk5sbNimGuXXtx07i8eFBt+aT4clvmHpgcxF+lZjd21Ls5r28WTb+pVL58QsiedF/pu
 WdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SELYhFsoJ14huwJ/81lZrO7K/RlYVZsAtlNmnDERCiA=;
 b=REJkPz/bu9iA7bN4CXz16NOYAktQVNcYILndGKkg74qyI2rysrhubfbjt2s/5pQxJ1
 jKkIDF4qqEFaR0K+RGXjjCKhEBPsEoCFlCnKaXsOEiw2PPVP5mNS+Jw2KWq+OYpvCSbB
 N3eVPLB+NVshGyJAa9RX+8kLTkyLCC+qIyTmxEqD6zIkkr+5s9Vnwfv8gHV5GQcphHxJ
 Q3sYdNjhydLahMASk8fmwUNMkj3NTDzAFLgpBr5LWv9njOdgFyv7dIO+JCJGht7+CfSW
 Cg7NYPYjxUdWCVKy7kL8ZGzHm3PKBOnarSMa4k1ZwWmD3TfxKB23s/yE9wCJs4f0ELXQ
 6f0Q==
X-Gm-Message-State: AOAM533iOK+KnDfNpygfGdbeHfSBBncsSFFozrRC1JBPqx8O9BLch64+
 fun5v0AQGJw00RyGp6cXZa4=
X-Google-Smtp-Source: ABdhPJwDaxWbyUYsT+6Y0TgJvYm+wGJXs4Tq4yCoVzPQ2K3KmNAugBIF77jk66vaujtfhsW8k4s80Q==
X-Received: by 2002:a17:90a:c781:: with SMTP id
 gn1mr4525666pjb.205.1618499906610; 
 Thu, 15 Apr 2021 08:18:26 -0700 (PDT)
Received: from syed ([2401:4900:2eec:4193:f802:b600:e94c:55c4])
 by smtp.gmail.com with ESMTPSA id f18sm606961pfk.144.2021.04.15.08.18.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:18:26 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:48:13 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210415151813.GF8933@syed>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <92caedb694b4c66d9a5e9190f8c4545ae28dd418.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92caedb694b4c66d9a5e9190f8c4545ae28dd418.1616150619.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 12/33] counter: 104-quad-8: Add const
 qualifier for actions_list array
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

On Fri, Mar 19, 2021 at 08:00:31PM +0900, William Breathitt Gray wrote:
> The struct counter_synapse actions_list member expects a const enum
> counter_synapse_action array. This patch adds the const qualifier to the
> quad8_index_actions_list and quad8_synapse_actions_list to match
> actions_list.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index ae89ad7a91c6..09d779544969 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -305,12 +305,12 @@ enum quad8_synapse_action {
>  	QUAD8_SYNAPSE_ACTION_BOTH_EDGES
>  };
>  
> -static enum counter_synapse_action quad8_index_actions_list[] = {
> +static const enum counter_synapse_action quad8_index_actions_list[] = {
>  	[QUAD8_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
>  	[QUAD8_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE
>  };
>  
> -static enum counter_synapse_action quad8_synapse_actions_list[] = {
> +static const enum counter_synapse_action quad8_synapse_actions_list[] = {
>  	[QUAD8_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
>  	[QUAD8_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE,
>  	[QUAD8_SYNAPSE_ACTION_FALLING_EDGE] = COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
> -- 
> 2.30.2
>

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
