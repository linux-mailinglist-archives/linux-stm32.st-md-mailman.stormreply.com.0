Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD331556D
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 18:54:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 011B1C57B55;
	Tue,  9 Feb 2021 17:54:58 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20172C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 17:54:57 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 18so9222226oiz.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Feb 2021 09:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RQUHj+BXtANW6albug9w4Bx+rstlxLjWFqakR1XfA0o=;
 b=XTmUv5y4Mvss0fOHxrqlHhgbBjxwkSOYZTQl6V0Q+zd/ne94d/EHCzMBoBNkT3Smto
 BmjwSSUVF0SjyFn7KXBm12CarpNr779URkRYlFL0ZKU5dRleHsj/Z4zusLaMGNwX+xV1
 SBLP3huzkLZmFpby1jiq9cREJYFIju/oG62INW922IXpKOLc48mecCc9Bum8HzXphy2F
 tIpQEO0tLW03PRoXGfcpk1tJf8QZaFGZSMWV0Luk4ySivTriqnJB4K6gvdk7mRVuuaO7
 roAia+JlwzV7EVu13WiJau4bXc+0v4yBjizXncZMDlcQq0R80Rjo/3Z0Necfi/+5FpLs
 CHvg==
X-Gm-Message-State: AOAM532qO70I8IOgId/HxtrM8ksbjtAC6eM7KN6WGOa2fA7gMk1m1KuB
 OqHYxuKzNbspVftsD3yrHw==
X-Google-Smtp-Source: ABdhPJz/nOQledHdl47iQx6sITmSHInVk2gRA33JBekAqpASydJExVmQ7LdPeUIVMWimUp96wXN6mQ==
X-Received: by 2002:aca:220e:: with SMTP id b14mr3286454oic.130.1612893295896; 
 Tue, 09 Feb 2021 09:54:55 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w134sm1409488oia.56.2021.02.09.09.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 09:54:53 -0800 (PST)
Received: (nullmailer pid 4037202 invoked by uid 1000);
 Tue, 09 Feb 2021 17:54:52 -0000
Date: Tue, 9 Feb 2021 11:54:52 -0600
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@foss.st.com
Message-ID: <20210209175452.GA4037138@robh.at.kernel.org>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <20210126090120.19900-10-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126090120.19900-10-gabriel.fernandez@foss.st.com>
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Etienne Carriere <etienne.carriere@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-clk@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 09/14] dt-bindings: reset: add MCU HOLD
 BOOT ID for SCMI reset domains on stm32mp15
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

On Tue, 26 Jan 2021 10:01:15 +0100, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Add ID to SCMI0 to exposes reset controller for the MCU HOLD BOOT resource.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/reset/stm32mp1-resets.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
