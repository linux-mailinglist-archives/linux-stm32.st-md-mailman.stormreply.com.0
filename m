Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AB5FB455
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 16:13:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD611C640F2;
	Tue, 11 Oct 2022 14:13:16 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76AF8C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 14:13:14 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id q1so4571771pgl.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=czRWuspWIHlagJO4TEuyucASTDboV9sDSZyO/JWLXqc=;
 b=Ce+BVV5v8U7whmYd/FcwKuyV+liXHdnCihvE4vxDmi/zFRXHgG5BsKzJlkvJm3ymzp
 i0kk+obd9ehg5kvdXpvifSYQKkIBJbAwLGSIa8MzHAOItPx5O2ghaGpv98wheUqfKMtx
 xYK29jqCSGAVqjF4MPQoXzVWPbY3qWyTm0lvTcEBlWPddeF6YcST3WGeI8+5CF6qMkzB
 /lDnL0m98oNEh6bOyWy8Twswwetn33Cy9kGtv+34nK50zqhZaf/wZPS7BxRAs1neYTBy
 /bZWo8ysVbEXrzMM/+HfoBHs8qu8Q0eGt0b+IXToEUouhHiAP9GLUrTwNKB7EENxNPMI
 wO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czRWuspWIHlagJO4TEuyucASTDboV9sDSZyO/JWLXqc=;
 b=hshQklAjfK4GArKa6GAEruoLQOwtc0+7WZWU2XVV36mbZ5tAccLxzDuO662+tNy96c
 rVm4RMI0/SCPWx9rh48Q7RpUUydaRIPBrdZ1aL5CiUbSptH0N7Dw/VZ6ufNTfQn8C1TR
 NaqFeiauFeTMe2BuvW6SwJ5wqvmu6bEnyxTadcRlSDfuL6pnr0EhQ0LOMOmitof6CcNJ
 bf0xO9AMDnAq0X/EBckkgQbXNNQ8bz0P3BFrlxrOZe+fUQhTngWflWoCZ7cWgd32LWkA
 JrFMRRIDBHdnxJLcEnE/9kiFKK5NlthdPsFxnWXezpcap9UBojLPVKDo38kKHz2LoaW6
 pgqA==
X-Gm-Message-State: ACrzQf3bQ19XRsaLC5FT+Cdby/q70/q5Sg/89XgJXerLKor6qAG8JAMh
 JTAf39wm4FkoaRCjOLW51+c=
X-Google-Smtp-Source: AMsMyM6A7bmN99+8aFFd/V9x8yL+08obUJvhZG8B8wKWgbvIl/Bh1jOgBftu0u99farGA2SFP/OdqQ==
X-Received: by 2002:a63:8643:0:b0:462:9b02:a0c1 with SMTP id
 x64-20020a638643000000b004629b02a0c1mr8758435pgd.536.1665497593024; 
 Tue, 11 Oct 2022 07:13:13 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
 by smtp.gmail.com with ESMTPSA id
 q17-20020aa79831000000b00563ce1905f4sm1492741pfl.5.2022.10.11.07.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 07:13:12 -0700 (PDT)
Date: Tue, 11 Oct 2022 22:13:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <Y0V57gI75ik4ki3A@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 02/36] gpiolib: cdev: Add missed
	header(s)
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

On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > -#include <linux/gpio.h>
> > > >  #include <linux/gpio/driver.h>
> > > > +#include <linux/gpio.h>
> > > > +#include <linux/hte.h>
> > >
> > > Ok with the hte re-order.
> > >
> > > But moving the gpio subsystem header after the gpio/driver is not
> > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > to me the way it was.
> > 
> > I see, I guess this is vim sort vs shell sort. Strange, they should
> > follow the locale settings...
> 
> I have checked, the shell and vim sort gave the same result as in this patch.
> 

The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
and that still returns the same result.  That matches what I would
expect to see given the content of the text.

And for me vim also gives the original order.

Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?

Cheers,
Kent.



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
