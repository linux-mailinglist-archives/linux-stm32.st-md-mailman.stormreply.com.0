Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE8360E5D
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 17:15:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3529FC57B79;
	Thu, 15 Apr 2021 15:15:43 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1DACC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:15:40 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id j7so12241361plx.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RuiLtWNxMd40+FIGD3C4gu6eExR7oO+TwAUL1WIQWJQ=;
 b=CMPu8NaC9ExpNZ0knaznfSJByoJpBOrJtdzfENSlzZRfqG3kbCaBVUqgdk2SACGwjg
 CCdcwj+XP2KaHnzx0XfSo4BnkYfN7mToSyu/4dqrMmYbp8GJ6q+WX9lPIDfOqFP1EVIW
 bPHSizmQGrP2TFSBW/+95v40fFxCWys8tzhdBfI/Ajp4MgUWEw+Tx722u4UfaviA/s2H
 Amj7/5nfJhhsn9Lq7n9zSnbYwTI5Vr9DCBT3uVTLljjez5t6bhudDSJa/7AMbK645+iE
 +Ug9EVzEYqFX+mSFlYf+ov5w2YIBMSyroseGomvZtWGs/OwYL3UrPaAJ1O0BnwJa42PF
 hkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RuiLtWNxMd40+FIGD3C4gu6eExR7oO+TwAUL1WIQWJQ=;
 b=GLknChh8cXACi4JsX8pa2kQnQ+rtdMQWCwxP3vd70/S9Wwc8vLyhS/6CZlNDZI30o2
 nNPjnEw4OHLqd24p/1+p2ekb0ADlvSYLhmuj9aKMW+JPsAeJP1R9fw77e2xZK+Xfhz14
 DQjKxRa5LGNtq/3fyqgX+jZpHyP2+ePF13RbguFymjQCBfenkPaOPruN56TON9s1/l7y
 +947UirNUJ4snPmHZZpyG1gJvI1SCY6FrLWNWyT0XrAHubpUaJuilw4Qlc/U+0Bsuljt
 cP07RqhpOuJbT/0cg3F0wM61tVL9KYO2Eyk6CtztrKDWiWJjV6osGAi3iDb/Zypc9pqO
 4xnw==
X-Gm-Message-State: AOAM5304gEo9mVKFMuzagGJNPa+Xtg2MV+HPdpyWMy2VxJmM3AHkrDkX
 CE8pxlbDDOIFepRDZfaG0Qc=
X-Google-Smtp-Source: ABdhPJwNs29RBYXQcWurs9YVnGIS/ETzTjJ4BFbp9aGhG6Ko7ult4MqFLvrwpLHUmzefnsw1es3yZA==
X-Received: by 2002:a17:902:a515:b029:eb:2723:3fde with SMTP id
 s21-20020a170902a515b02900eb27233fdemr4416016plq.56.1618499739213; 
 Thu, 15 Apr 2021 08:15:39 -0700 (PDT)
Received: from syed ([2401:4900:2eec:4193:f802:b600:e94c:55c4])
 by smtp.gmail.com with ESMTPSA id m7sm2711418pjc.54.2021.04.15.08.15.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:15:38 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:45:28 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210415151528.GC8933@syed>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <203f1b6084ed86a6696eb422bcadc0955c6427bb.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <203f1b6084ed86a6696eb422bcadc0955c6427bb.1616150619.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 05/33] counter: 104-quad-8: Annotate
 hardware config module parameter
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

On Fri, Mar 19, 2021 at 08:00:24PM +0900, William Breathitt Gray wrote:
> When the kernel is running in secure boot mode, we lock down the kernel to
> prevent userspace from modifying the running kernel image.  Whilst this
> includes prohibiting access to things like /dev/mem, it must also prevent
> access by means of configuring driver modules in such a way as to cause a
> device to access or modify the kernel image.
> 
> To this end, annotate module_param* statements that refer to hardware
> configuration and indicate for future reference what type of parameter they
> specify.  The parameter parser in the core sees this information and can
> skip such parameters with an error message if the kernel is locked down.
> The module initialisation then runs as normal, but just sees whatever the
> default values for those parameters is.
> 
> Note that we do still need to do the module initialisation because some
> drivers have viable defaults set in case parameters aren't specified and
> some drivers support automatic configuration (e.g. PNP or PCI) in addition
> to manually coded parameters.
> 
> This patch annotates the 104-QUAD-8 driver.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 233a3acc1377..0fd61cc82d30 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -21,7 +21,7 @@
>  
>  static unsigned int base[max_num_isa_dev(QUAD8_EXTENT)];
>  static unsigned int num_quad8;
> -module_param_array(base, uint, &num_quad8, 0);
> +module_param_hw_array(base, uint, ioport, &num_quad8, 0);
>  MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
>  
>  #define QUAD8_NUM_COUNTERS 8
> -- 
> 2.30.2
>

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
