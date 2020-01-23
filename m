Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30708146B8F
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 15:43:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F02DAC36B0C;
	Thu, 23 Jan 2020 14:43:30 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0C5AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 14:43:28 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l9so3096309oii.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 06:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7SayZJgIXHjCdU3TAFI8Ocs5cvmGh8wgxSjfDXiqUmU=;
 b=D9ZX/V/sSGrYmOivmeGP42spZbnxXUraaCgTKyKmyJQpVx6vwqdLW0L8ngHYw4Jz2k
 A9n3OhQ5G50ft92cgXGDpO2d7CQI5ZB0/RGJerhI7tDH5W6PJawEfKbiKtl+fwBlwXBc
 kraO3fk3+KQ0J22kDF/GBqtMDFnOIeLw45+FJN0FZjU+litc7OpBAdR9/sQM+eC4HsMw
 4i6E7vOkcR86p9R01gM0JiOzfwD8GN02WPZEGqomlQbE8WX6/6NFkTT0gOQk+nPQG2FA
 ipAVA9vFw5m6vuAFOCG0jMi6/Bpp5WLrSvdKHdJS33OVhddj1St4DPhN8PkNZWlzJ25G
 SLAg==
X-Gm-Message-State: APjAAAWzuIZBW9q0j1DTYFOhEpBZvz7HHpKmzVMvPqB+ZoLzBFO6Z5Me
 2D1l2t0S6N7s7JV4xjpIOQ==
X-Google-Smtp-Source: APXvYqzGbdY9oCHH7SiwtERsp5ylmchXaof2S8Eo3kpOm01m82P1WOVc0ecY+Jf3C0L3OyPvAH5Kzg==
X-Received: by 2002:aca:1c1a:: with SMTP id c26mr10845348oic.75.1579790607604; 
 Thu, 23 Jan 2020 06:43:27 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s6sm849207otd.72.2020.01.23.06.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 06:43:26 -0800 (PST)
Received: (nullmailer pid 12444 invoked by uid 1000);
 Thu, 23 Jan 2020 14:43:26 -0000
Date: Thu, 23 Jan 2020 08:43:26 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200123144326.GA12392@bogus>
References: <20200122095558.22553-1-benjamin.gaignard@st.com>
 <20200122095558.22553-3-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122095558.22553-3-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: serial: Convert STM32
 UART to json-schema
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

On Wed, 22 Jan 2020 10:55:58 +0100, Benjamin Gaignard wrote:
> Convert STM32 UART bindings to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/serial/st,stm32-uart.yaml  | 80 ++++++++++++++++++++++
>  .../devicetree/bindings/serial/st,stm32-usart.txt  | 57 ---------------
>  2 files changed, 80 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>  delete mode 100644 Documentation/devicetree/bindings/serial/st,stm32-usart.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
