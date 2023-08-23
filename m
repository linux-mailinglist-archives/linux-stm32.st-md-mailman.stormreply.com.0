Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C24785C46
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 17:38:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07171C6B44C;
	Wed, 23 Aug 2023 15:38:12 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B25AC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 15:38:09 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6bdc2f95f10so905478a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 08:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692805089; x=1693409889;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=b4SkKlAbqJpn3W9mREOS7xdidgwXt26+Nc2zXplGeHM=;
 b=D3j+jtASsvw3oke8XXXeyrK5llBEgvl5isUWuMzWxMymFNaa10eJZPCl/WFl5UmCmT
 ARkI86XYumfasFLi9MCQKAFd+vV2g2xPPc5Wc26RLOWIgNaXY92kiocVAoVCcFxuUypS
 5yFbM5osKf0erPayZYbXXIyLGkDQWuUkNIvhKo56/PNYIGChjZgV5WsqCCLJthl6flTB
 4IvhDDG78OvABM7jTj9CdCrczGuHelz2BtL6rpUSDn1kYBYJlAwgYPRjdIpkEOif61wF
 xclKxq1b1p94bEb1FWcPcxGC1eYCYvlT6wMXhHG5D8axEKX8bjaLvF7OT5hOrAEV2C3N
 C+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692805089; x=1693409889;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4SkKlAbqJpn3W9mREOS7xdidgwXt26+Nc2zXplGeHM=;
 b=IXXdVsNOcRlZCII3M4a9f4nKHEhQlZRLaqEi960zjbg86wyJn0DLOSh6Rl2bGZ2GFK
 vkunWDulLq+FUS2I31OuJh+r9L1JmoQ9khPVCEBTRzfqJmRLwlH7LkK/NkV+qtZ0DuOn
 QBvxnUkgc9dvfDgrerFRqxheHKLh+BlRW98NJHelHyjqU/rTAYuVoDfGjRgQDKZJuSjr
 hehqNmnjtV+DFdRZNB+9bXVBTY745A3QULsWLyXqpgn02tjpIQa95v2rX+CbeFAx1xNK
 u+05N3VNmPV3lgBNr9W70TCFbtCGNcCPof1IF39f0tlpSx6hzW5dxNsEVgDUVPAyqZ34
 I5rQ==
X-Gm-Message-State: AOJu0YxHgYEmsVoyiS99YXj++FxQaXMwAq50mZqFEnyc3aJCCHOMFhi+
 2L/W8VP3nYovgpbcdLSF91g=
X-Google-Smtp-Source: AGHT+IGDtTWQriiaiDHkSAZKWgk7OvDpXpVUuf0KtOeULPl1ptD4cv0ietjjTEiml/7ncCSA/eRZLQ==
X-Received: by 2002:a9d:6c45:0:b0:6b9:b665:7f with SMTP id
 g5-20020a9d6c45000000b006b9b665007fmr12824092otq.17.1692805088733; 
 Wed, 23 Aug 2023 08:38:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 bt18-20020a632912000000b0056b920051b3sm6267366pgb.7.2023.08.23.08.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 08:38:08 -0700 (PDT)
Date: Wed, 23 Aug 2023 08:38:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Message-ID: <970cbe44-9958-4315-b112-74f34bf97740@roeck-us.net>
References: <20230823151059.2356881-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823151059.2356881-1-robh@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [Linux-stm32] [PATCH] watchdog: stm32: Drop unnecessary
	of_match_ptr()
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

On Wed, Aug 23, 2023 at 10:10:59AM -0500, Rob Herring wrote:
> With COMPILE_TEST recently enabled, 0-day reports a warning:
> 
> drivers/watchdog/stm32_iwdg.c:215:34: warning: 'stm32_iwdg_of_match' defined but not used [-Wunused-const-variable=]
> 
> As STM32 platforms are always used with DT, drop the of_match_ptr().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308211837.4VBSUAtZ-lkp@intel.com/
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/stm32_iwdg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 570a71509d2a..9a554a3db4e2 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -288,7 +288,7 @@ static struct platform_driver stm32_iwdg_driver = {
>  	.probe		= stm32_iwdg_probe,
>  	.driver = {
>  		.name	= "iwdg",
> -		.of_match_table = of_match_ptr(stm32_iwdg_of_match),
> +		.of_match_table = stm32_iwdg_of_match,
>  	},
>  };
>  module_platform_driver(stm32_iwdg_driver);
> -- 
> 2.40.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
