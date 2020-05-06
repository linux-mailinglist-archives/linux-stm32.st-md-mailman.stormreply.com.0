Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E81C7AD7
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 21:59:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C41C1C32EBF;
	Wed,  6 May 2020 19:59:22 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 535CDC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 19:59:19 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id o24so2923931oic.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2020 12:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bO0DJaCUE0XKssvRg38lswObA4y7SjfSv2q1CR1u7z0=;
 b=G1U4m5RCWwJKl8kZuvHUAo9JDZcWd0FPXDa5ZJpACe0+TmySSl8qE9usxYA8Td1wpa
 tRd4PyVoyLNQSDIJdkOWDWemov95GA8tswndBwlpv4MsLYGmibdURe/NVhniyCstEWXA
 5Ewg5v13kc/S3PY86wBcYM44lhj+aGe36K2ZqRoLGOi5FbwzN8UjZq4MOyFvuUwxW3zW
 VSIXFi6OdZouHYY3FFfNpk4IRDVkwX2WoX1NB16oIstLbn+kGUXNa2UWKP1uN82X3i7/
 zlinBF+FWlJpaN6HNnPcWdOsse9OCkV+RRZihD9RHVICXDTbNkT5m/EctegCCg7IzsNA
 LfBA==
X-Gm-Message-State: AGi0Pubyaijh6ht3V4TdqWRxPmyk4sx4nuZTUF5zIO85RW4M5mOG/5+R
 uldEEb7TEKjTB76IHl7okg==
X-Google-Smtp-Source: APiQypLR5WjjYamVAcv6tfzD1IA0+5vseecA/FXkvzZpzsWL3ae3CrTRLxA9Orkli3Z7VBOdSdow2Q==
X-Received: by 2002:a54:4811:: with SMTP id j17mr3960001oij.29.1588795158503; 
 Wed, 06 May 2020 12:59:18 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e13sm767826otj.46.2020.05.06.12.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 12:59:17 -0700 (PDT)
Received: (nullmailer pid 22166 invoked by uid 1000);
 Wed, 06 May 2020 19:59:16 -0000
Date: Wed, 6 May 2020 14:59:16 -0500
From: Rob Herring <robh@kernel.org>
To: mani@kernel.org
Message-ID: <20200506195916.GA22126@bogus>
References: <20200420170204.24541-1-mani@kernel.org>
 <20200420170204.24541-2-mani@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420170204.24541-2-mani@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 andy.shevchenko@gmail.com, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: serial: Document
 CTS/RTS gpios in STM32 UART
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

On Mon, 20 Apr 2020 22:32:03 +0530, mani@kernel.org wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> Document the use of CTS/RTS gpios for flow control in STM32 UART
> controller. These properties can be used instead of 'st,hw-flow-ctrl'
> for making use of any gpio pins for flow control instead of dedicated
> pins. It should be noted that both CTS/RTS and 'st,hw-flow-ctrl'
> properties cannot co-exist in a design.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  .../devicetree/bindings/serial/st,stm32-uart.yaml  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
