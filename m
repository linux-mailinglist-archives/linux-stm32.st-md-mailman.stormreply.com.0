Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BC31711B
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Feb 2021 21:19:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D410C57B53;
	Wed, 10 Feb 2021 20:19:20 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A53ADC5718A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 20:19:19 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id j20so263330oor.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 12:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=noYHEwVngp0MCW7P3WaZktPMzdf19liz0sKGmntgNy0=;
 b=Rsrq+R+0T6itgiI+cXC0Rl4rOm+EmO+BFfa4UMTdw598SWrYS8PTQNdMEOTMb291W7
 6eGYPEZPyQpVURo9/AIRxKCaYhuf5NBZq1z4+vHq9ZUnMXlko3L+TA1vMuu2wN6cupbd
 qGEfcaSj9lKyK2Q82XRGAh0bEKv95cSSZcla4GCazY4gU6ZZSlnpLCPpWNmgf4ioZgh8
 vK98qmddaaLANmC+LWwejgDkyyb3qdRnEauoNtlYfjGLJMN9q4sKb3xIPJk2vP0cPGer
 1CUa98dHSNjLJHoc9jYTBR8yWCMPqSSlczTLs4nLzh86nYO2nXeW6VXxhAfg+R9iqwOF
 sqeg==
X-Gm-Message-State: AOAM533IPoN+8KHH5Lq4k7HtP2SlwzMxOURTSYWDUeB7lSRh3bclhLOV
 CQ4cd3ex5JFzVC2eNYUJkw==
X-Google-Smtp-Source: ABdhPJy8wefpU5pDQ9Fp79GZwiz6/pTPGaxuaccPU03yNTblR5fx4HkuOdEx1FI8cQ2sBeqrA2kysA==
X-Received: by 2002:a4a:d10c:: with SMTP id k12mr3365088oor.74.1612988358484; 
 Wed, 10 Feb 2021 12:19:18 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t71sm669600oih.45.2021.02.10.12.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 12:19:17 -0800 (PST)
Received: (nullmailer pid 2690943 invoked by uid 1000);
 Wed, 10 Feb 2021 20:19:16 -0000
Date: Wed, 10 Feb 2021 14:19:16 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20210210201916.GA2690885@robh.at.kernel.org>
References: <20210208114659.15269-1-amelie.delaunay@foss.st.com>
 <20210208114659.15269-2-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208114659.15269-2-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: phy:
 phy-stm32-usbphyc: add #clock-cells property
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

On Mon, 08 Feb 2021 12:46:58 +0100, Amelie Delaunay wrote:
> usbphyc provides a unique clock called ck_usbo_48m.
> STM32 USB OTG needs a 48Mhz clock (utmifs_clk48) for Full-Speed operation.
> ck_usbo_48m is a possible parent clock for USB OTG 48Mhz clock.
> 
> ck_usbo_48m is available as soon as the PLL is enabled.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> Changes in v3:
> - remove #clock-cells from required properties
> ---
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
