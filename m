Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C60251778E5
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Mar 2020 15:31:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 902F2C36B0B;
	Tue,  3 Mar 2020 14:31:02 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AFC4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2020 14:31:01 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v19so3150531oic.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Mar 2020 06:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gVhMT74m9AGYnPITOzgx6C9VacuCfRWPLl0fMDTgg3w=;
 b=E+9oNTR0lJHbOdcLuOn8qkN5268R6u3/u0Xo2zLDo8wNAqSUoIJ5/R7HF27qvm83yC
 mS+RS5lGv8tT1nZzlfLsuIKfxzMTp9pZ9wRLb1FMzJ3ipKIeK9/J7EvKmu/bX6LGtu51
 5xImz43PRigyxzN45x557dwPtIkiJhYGv4IQAPm811cPe/lZdailxEdAU1OO6hGiKZX2
 e1YQANX7WFZeOeogXArDF7EyKsukejhGIxEekNy4ShPxQXYEh/NcetmwYqfY5S3jv/vd
 kJ2ZqkZrAZWc2hKCPnm1GRJKztH4bcL9gF13aqnFIWkNEDzw93skDzBc7CpJBDwGIo4d
 m5XA==
X-Gm-Message-State: ANhLgQ3zdtvx5TGhgW67qqdXzLqmSJ1QnUs4wKqbUSOxbOQRWkHLkcqn
 1VNf1Slt9P94I8cJP3Q7ual6/Xo=
X-Google-Smtp-Source: ADFU+vsTa1mr7f4Jb2fuSW5ZCiP5PL/NVMt+eOqKxGoC62WG7mAsN6hzWEWpqexFTc2MpmI1edzopA==
X-Received: by 2002:aca:fc11:: with SMTP id a17mr2472776oii.123.1583245860210; 
 Tue, 03 Mar 2020 06:31:00 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k110sm5979048otc.59.2020.03.03.06.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:30:59 -0800 (PST)
Received: (nullmailer pid 24642 invoked by uid 1000);
 Tue, 03 Mar 2020 14:30:58 -0000
Date: Tue, 3 Mar 2020 08:30:58 -0600
From: Rob Herring <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20200303143058.GA24606@bogus>
References: <20200226143826.1146-1-a.fatoum@pengutronix.de>
 <20200226143826.1146-3-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226143826.1146-3-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] dt-bindings: arm: stm32: document lxa,
 stm32mp157c-mc1 compatible
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

On Wed, 26 Feb 2020 15:38:25 +0100, Ahmad Fatoum wrote:
> Document the STM32MP157 based Linux Automation MC-1 device tree
> compatible.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
