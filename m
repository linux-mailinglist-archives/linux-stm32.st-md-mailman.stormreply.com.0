Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0512378
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 22:37:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69868C71297
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 20:37:50 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6664FC71296
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 20:37:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id e24so1680810pfi.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lB3153gephrYxcmT3quKYHaWZwBf38K9on4i1nocN3I=;
 b=P/oDQ3iEA/WOc26RXS4X8SvBiZHJkrh3wOZtPeSx9JOaFTbHSzlx3Q4fA3Aqty4B+Z
 o8Nq5Ek5szN47A/z8rMtj8W2YG/qZ/TTNaDDgH8PNsNz8BvBnOl38+COU0QNhG1xipdK
 A1ryhanmxQqYgYhvezsfFmV8egmqmA2MVeMs/u/FNHgk3tze5GxfB1LXbd8mghd1DJnR
 hR/WTm2WxlhZ8Xo4wu/VLgJqYK/CSzomKQEq6FTVxoHJqDAINH5e8WpmpN9ZyE9LUaiy
 WsGV1DpnNlMrb+IpCsdtj3IsYIMYLIdlmWAQEi5ZwE5Y43w9dZzfWzl4rZ3X8IwyUQl8
 DpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lB3153gephrYxcmT3quKYHaWZwBf38K9on4i1nocN3I=;
 b=ZjEanhnzkvrWC73BKiFBHuE2VhuT9VZ4uZcVHoQItANEHnFsuoitAiZUAFDiF6OW99
 SHRWEmRiBYF0IU53DRRulWb87CKJwGm3GzejEu9oJl5jAvYe+wHp8MnZ8I5aMaXnPR9b
 qnf9s5HeiPfyMwew5OmiIBxonKHdVNxi9a05iNTnb1FPNzORBJtJi8FMi1aNTH6FRYB7
 PgqQXzxjrgiOon7EDS+jfo89s9h/QcVwQc++p53I5sHMMdaOnkkkSziA6UoNnfI9Bvm3
 lgn4jVbHpNMVVqNumIytgsFJpEm4ZNtfwbLCsnLaH+4JaW/ofm5Lonn5atc6L5fm75hs
 vzmQ==
X-Gm-Message-State: APjAAAVAMqBwTBP7s3dk6G8zn/uZmH9R9Em7SyFt0Xzf/N3CY95V9vhC
 UQFN6qc43K+lWjihMSfcKoY=
X-Google-Smtp-Source: APXvYqyilhmEsuIDyLQfBiy9K3iHNs3WdUCcQSY2UIJxnpVVDV+IilDatLb+uAr77L+IHncIvscboA==
X-Received: by 2002:a63:1d09:: with SMTP id d9mr6061374pgd.289.1556829468009; 
 Thu, 02 May 2019 13:37:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e23sm31531pfi.159.2019.05.02.13.37.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 13:37:47 -0700 (PDT)
Date: Thu, 2 May 2019 13:37:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ludovic Barre <ludovic.Barre@st.com>
Message-ID: <20190502203746.GB29063@roeck-us.net>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 0/3] watchdog: stm32: add dynamic
	prescaler support
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

On Thu, May 02, 2019 at 04:08:43PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch series updates stm32 watchdog driver on:
> -use devm_watchdog_register_device
> -Guenter's recommendation about return value:
> set_timeout return 0 on succes, -EINVAL for "parameter out of range"
> and -EIO for "could not write value to the watchdog".

No, sorry, that is not what I meant.

set_timeout() should set ->timeout either to the requested value
if equal to or larger than the maximum timeout supported by the
hardware, and to the actually selected timeout otherwise.

Guenter

> Set of reload and prescaler registers are stay in start function,
> because the stm32 watchdog must be enabled to write these registers.
> -adds dynamic prescaler support
> 
> Ludovic Barre (3):
>   watchdog: stm32: update to devm_watchdog_register_device
>   watchdog: stm32: update return values recommended by watchdog kernel
>     api
>   watchdog: stm32: add dynamic prescaler support
> 
>  drivers/watchdog/stm32_iwdg.c | 96 ++++++++++++++++++++++++-------------------
>  1 file changed, 54 insertions(+), 42 deletions(-)
> 
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
