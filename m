Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1995293BC6
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 14:36:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91387C424B9;
	Tue, 20 Oct 2020 12:36:21 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64666C424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 12:36:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t9so1916134wrq.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 05:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9E0XaHJUUaHIVQQLhbSv3W1m5lGWB1Z81RRGTj8SQgM=;
 b=Nr//LILXBEY19Zp2ZwAgRZuzETQ/4WP2b6EY766p8SApXde5FU7AuLDV5z9jUVQi+K
 DHCru4ebsS02Cmfs8bwaTuWrN1QzIoXI1w3LF7PNInM1Un6GgaibauWfqrd0gAF6+BPs
 AjaOWh/zwH+06MqB+zCpJtdjKXg+WTlXlxn4HCOvERHHzvjxKwOsVMsm12jS6mbZdmVL
 54SDUGyu7OOkuXH/sXnF4v2jAWH4vBCIzjfHj0VA6vDDGaQ2yfNVzV9v1SEGE9ITs1IS
 pQfkVPoFpXi1Rlz/r+57VCegOM92nrVLocY+kB+JdBvLn09wsTmKGKdwELy+FKIdlbFc
 p1Xg==
X-Gm-Message-State: AOAM531hwyeSENn82wrs09wJ417DNqNPdEZGPI9YSeygVr1JYzQ16xy3
 yVnZ3jigy8Gp9Wxy8X+LUT8=
X-Google-Smtp-Source: ABdhPJySQ2bYIDKMxXNWGonvrg3VtWnutiZTJnpOXBv/JS//TqwJoxFk96jUN1VTZB5rWPOp0nDu/Q==
X-Received: by 2002:adf:9282:: with SMTP id 2mr3198032wrn.43.1603197379879;
 Tue, 20 Oct 2020 05:36:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
 by smtp.googlemail.com with ESMTPSA id u133sm1037094wmb.6.2020.10.20.05.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 05:36:18 -0700 (PDT)
Date: Tue, 20 Oct 2020 14:36:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20201020123616.GF127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-9-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-9-Sergey.Semin@baikalelectronics.ru>
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/29] arm: dts: stm32: Harmonize
	EHCI/OHCI DT nodes name
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

On Tue, Oct 20, 2020 at 02:59:38PM +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
