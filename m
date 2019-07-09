Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D1663809
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 16:38:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F3AAC930D4
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 14:38:42 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 745F3C930D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2019 14:38:41 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k20so43596080ios.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2019 07:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+prWP/l+NiaYOcrIk/R8mV2BTVhCl2S22LwiNWpEL0Q=;
 b=JlphTAhHo4EoI8w4eMjKTZWVDjA1Ed5iqf3XYIDc0pV8BLXvMkCVjf8wvqQ7B5j8b9
 HWB+96fS/oEVk7VS/6/SNsIK/VVT5W27L8Fs+hS3JabvbaB4fGddfItKsB1jxv1Vwh9j
 tibCfMnwb5miED/lCE20QPW5EtW8O0W3Hz80VfD2eND8hag1lHjx5wdNv2Nm4tyhRc+w
 zXLFQcttcDX4/sFvApcXADHdMdzd3JJDnJwOnoqpcJpFe/ufk+G/wC6H6m1gzAPbuuYa
 uBYZK+GKp3b4aHYJu2jARQnnJi1V5cFhXQc5ZhfzMFFiY8DU1Lsx51u8l2gw8voIkl78
 CuWA==
X-Gm-Message-State: APjAAAWXqRR/yHAXgqNuaxp9cQNn2SjtKixKHSyia/CfRIR+T0NQEka+
 fN7Qqsyosper/ZLrKMmYFQ==
X-Google-Smtp-Source: APXvYqySHhAtm9GlvHKsUPEMTbTk1st1sP64SKKq5dl6tEvxnFV5wYea+XzPa0VvC7nIO5Guff5xRg==
X-Received: by 2002:a6b:6d07:: with SMTP id a7mr556026iod.254.1562683120146;
 Tue, 09 Jul 2019 07:38:40 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id j1sm17618610iop.14.2019.07.09.07.38.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 07:38:39 -0700 (PDT)
Date: Tue, 9 Jul 2019 08:38:38 -0600
From: Rob Herring <robh@kernel.org>
To: Erwan Le Ray <erwan.leray@st.com>
Message-ID: <20190709143838.GA5665@bogus>
References: <1560433800-12255-1-git-send-email-erwan.leray@st.com>
 <1560433800-12255-3-git-send-email-erwan.leray@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560433800-12255-3-git-send-email-erwan.leray@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 02/10] dt-bindings: serial: add
	optional pinctrl states
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

On Thu, Jun 13, 2019 at 03:49:52PM +0200, Erwan Le Ray wrote:
> From: Bich Hemon <bich.hemon@st.com>
> 
> Add options for pinctrl states:
> - "sleep" for low power
> - "idle" for low power and wakeup capabilities enabled
> - "no_console_suspend" for enabling console messages in low power
> 
> Signed-off-by: Bich Hemon <bich.hemon@st.com>
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> 
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-usart.txt b/Documentation/devicetree/bindings/serial/st,stm32-usart.txt
> index 5ec80c1..64a5ea9 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-usart.txt
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-usart.txt
> @@ -13,7 +13,14 @@ Required properties:
>  - clocks: The input clock of the USART instance
>  
>  Optional properties:
> -- pinctrl: The reference on the pins configuration
> +- pinctrl-names: Set to "default". An additional "sleep" state can be defined
> +  to set pins in sleep state when in low power. In case the device is used as
> +  a wakeup source, "idle" state is defined in order to keep RX pin active.
> +  For a console device, an optional state "no_console_suspend" can be defined
> +  to enable console messages during suspend. Typically, "no_console_suspend" and
> +  "default" states can refer to the same pin configuration.

no_console_suspend is a linux thing and doesn't belong in DT.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
