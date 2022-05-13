Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 640FD526D61
	for <lists+linux-stm32@lfdr.de>; Sat, 14 May 2022 01:14:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0429CC03FD0;
	Fri, 13 May 2022 23:14:24 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96D3FC03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 May 2022 23:14:22 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id r11so17723115ybg.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 May 2022 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uJjCKmIV0+PUlw1yN8LzGGtdpY7JQRJT83F9A+chaFQ=;
 b=THiP8XlKeuATd+sFBtOcYrkM4vfQtgO4vnzZ0czrpsdPkpjchMTT4P/obyYS2u/Ph0
 +d4NGAg/jxClzjL8HVJs1YAUDTNGgJWRecVdDws5TTDi+gv0iwTmpz+MkqCaUpeAV5AA
 yF3lhT3KSxCLDQJ9FmJNtviqrwf/aWE8xllwdNkP73HSFcu2JxZfzQwraA3ZMJaktL2/
 OkzTNpuZEQcIWaejl7sk/YJRrshWH/IN8sd7qW08KjeWOtRqJdYH5DbIBGNlQDidczW+
 6kEBBpSeOhUtIg4JxlmhyKAglB0MmRs+oQnBntEgiBPniHirdlTfg443BTKKz6xnZr/V
 JO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uJjCKmIV0+PUlw1yN8LzGGtdpY7JQRJT83F9A+chaFQ=;
 b=CUzfq46TFaCWqB7akmKyG7GN+kq9eGMR1rukcsVVu9BRG4jG5WRTqThsap37RQWP34
 C1n1eiKY4u5TCO62CEtMCYeb4JfZA20O0H3x5wsAgjWu6MqVPVrxJzQhxIxp8+qrmSac
 b5plahRzclCT/xC24YhzZB+8HGZjNBb9OEWdOSHOe8Y7r58KiPlesDcN5JQui4REijku
 6SP32TZvqVbMvyYcAJhHhBeZAtntexRFg/j9540bUMLem4c3B+alCmHQ/j+iEfK/jgvb
 upeHw1AePjUpbc0zzPdaiaqpZ5sWSq1B2zVAzfZ6bq8N93/2cq84L6u/U3kAmApvcU3f
 v0mA==
X-Gm-Message-State: AOAM531fgOwf3k9hDpncALdOdBOJdfFxelE4tBkyuCC2nxtdfrPt2OhW
 v3MjzfpQdTMkKSXV95CdmYiFYHlCEElKJOYDFL8q3A==
X-Google-Smtp-Source: ABdhPJyqJOHYby5B4zPz7I69RNcSghbBdax44/7CJOKXFMx9IaAQOi+fUTHLPntFEHAMZ9z/gSOi5OooYyzthLTILkw=
X-Received: by 2002:a25:aa94:0:b0:648:62f2:ef4e with SMTP id
 t20-20020a25aa94000000b0064862f2ef4emr6931589ybi.626.1652483661584; Fri, 13
 May 2022 16:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220507102257.26414-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220507102257.26414-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 14 May 2022 01:14:10 +0200
Message-ID: <CACRpkdYjmAKPb9sHvC+Y0goDBmGXDthJDmgbG2CZ6VO_Y1zEmQ@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] pinctrl: stm32: Unshadow np
	variable in stm32_pctl_probe()
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

On Sat, May 7, 2022 at 12:23 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The np variable is used globally for stm32_pctl_probe() and in one of
> its code branches. cppcheck is not happy with that:
>
>   pinctrl-stm32.c:1530:23: warning: Local variable 'np' shadows outer variable [shadowVariable]
>
> Instead of simply renaming one of the variables convert some code to
> use a device pointer directly.
>
> Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_node() helper")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
