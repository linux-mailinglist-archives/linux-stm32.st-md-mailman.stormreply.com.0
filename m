Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D65BD617029
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Nov 2022 23:02:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78515C04003;
	Wed,  2 Nov 2022 22:02:49 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 946BBC03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 22:02:47 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id gw22so4581806pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Nov 2022 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tDdQ76HTuetM+x0U50OZVmoiEGjK/pNJ2DGCTRImjr8=;
 b=KQiJkZtePhI2flEsUJPvJWcVFKJ+OroKKLIqrw7gi+MX+q2049MD3JdT/HnYDFu9WR
 zLFsSCKGQMStyQIn1lzgksLz8eM0HdHrRUXnS3XiBPbgf+cvVwhSqUXkg1CPQQjS8peH
 VqixHIIJaqwe+pLijCFPO7sKai856yU/ibvqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDdQ76HTuetM+x0U50OZVmoiEGjK/pNJ2DGCTRImjr8=;
 b=YqR8Fmtd2b8uTHKpTsfktxPNru5Wxx1e+VmTwaUd8INZaIXP7nahPhV6a2+JGugVTb
 DYityg/AKzb6Fp2rrdKRua2Zd6q/E3DQLVw0SE7InJFQ4VoBeru9QaR9B9m0EC2KRIP0
 dIiVqS+AUNWpMgBCl+PnzFqhT31FhTgU7SfBoEwgy0Vewsvtwtv7iRP0huki67Dcwjzb
 x8CULPBmppu+7ZRFDsY5PyBcim2oc4vB1nP5xfqgIuJCt05K5JmY8djPIjVjtdqh5ETL
 e9RkOYDkjb2ctuoEV4o0nlMyT09hhvVrF7dowsK69+L5Dy4Pk0JU+R18SoeEaivwctrs
 HwKg==
X-Gm-Message-State: ACrzQf3wtLWnCPK3Twf8RAgWBoX5l+YZWtE480nOZb0amI9T99suxyHv
 JlvrVJiO+O7+AG8H/AIikJMAoQ==
X-Google-Smtp-Source: AMsMyM4WkfzMykXnG15VA0dkbaFs2pJjZSHDWxSbgybvMUsbX2OvhgJaXXTBVFr7hoOw8Zjy6TVn2g==
X-Received: by 2002:a17:90b:1095:b0:213:ee6a:f268 with SMTP id
 gj21-20020a17090b109500b00213ee6af268mr16266724pjb.213.1667426566071; 
 Wed, 02 Nov 2022 15:02:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a621a14000000b0056c6e59fb69sm8926019pfa.83.2022.11.02.15.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 15:02:45 -0700 (PDT)
Date: Wed, 2 Nov 2022 15:02:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Message-ID: <202211021501.88D8147@keescook>
References: <20221102172217.2860740-1-nathan@kernel.org>
 <202211021216.FF49E84C69@keescook>
 <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
Cc: linux-omap@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>,
 William Breathitt Gray <william.gray@linaro.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Julien Panis <jpanis@baylibre.com>, David Lechner <david@lechnology.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] counter: Adjust final parameter type
 in function and signal callbacks
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

On Wed, Nov 02, 2022 at 01:23:51PM -0700, Nathan Chancellor wrote:
> Right, I am not the biggest fan of this change myself and it is entirely
> possible that I am misreading the warnings from the commit message but I
> do not see how
> 
>         comp_node.comp.signal_u32_read = counter->ops->signal_read;
> 
> and
> 
>         comp_node.comp.count_u32_read = counter->ops->function_read;
> 
> in counter_add_watch(),
> 
>         comp.signal_u32_read = counter->ops->signal_read;
> 
> in counter_signal_attrs_create(), and
> 
>         comp.count_u32_read = counter->ops->function_read;
>         comp.count_u32_write = counter->ops->function_write;
> 
> in counter_count_attrs_create() are currently safe under kCFI, since the
> final parameter type of the prototypes in 'struct counter_ops' does not
> match the final parameter type of the prototypes in 'struct
> counter_comp'. I would expect the indirect calls in counter_get_data()
> and counter_comp_u32_show() to fail currently.

Ah! Thank you -- those were the places I couldn't find.

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
