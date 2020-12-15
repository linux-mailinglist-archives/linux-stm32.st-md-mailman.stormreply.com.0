Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 652322DB29B
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Dec 2020 18:32:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CF90C32E90;
	Tue, 15 Dec 2020 17:32:20 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A484EC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 17:32:18 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id o11so20152273ote.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 09:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vRpREWWrDSibjIKmFfLj7IBAo/4P0w9FVJMb1Oijnck=;
 b=JnhMa3VUzuIWIjWOxyJxd6+6Im0iTxNlLYzZ0QB7Gh5lS7xH+ttwnQGTeJ3VcF3Iet
 LPNLkCIUl4rApjAn0jtjaKQ5KD0YRlaEQ8neY2GgqYDCY2kX0O72xsWT/Oh8boYaYWe8
 +tTrfOtCnnRKs454A3KCKpJTZijK4jCbulGqhQ6oQ98YhAGPCXlE6AuWDQ+1v4z2+KcC
 tJZs4zoMA2xNE/keOfIr/KS5mB+TGzjwQk8AJhGZALDz4VRQCKQU9DS/xotDkB0+L+dS
 X9Jf30AAYRBTTGUWc0IeKBcUIGTpTi3ngVBPTbFIEKeuYL/NMxzpjmz56h2qFxKY21dl
 STaw==
X-Gm-Message-State: AOAM533OPsO5HbVlBoF29vK9jsHStD8bUIC+2aAwRxSzWSggBc9iivZH
 qcUxCePN0/oHaIqgeDhRdw==
X-Google-Smtp-Source: ABdhPJz9svCsyXrZEFs5n8HwMpo8KxwFw8IcHeoxaSibrjcLEv2+XL7MNmEGZ3jylX9nYH8tDpgofw==
X-Received: by 2002:a9d:3e2:: with SMTP id f89mr18966048otf.278.1608053537462; 
 Tue, 15 Dec 2020 09:32:17 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d13sm559416oti.74.2020.12.15.09.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:32:15 -0800 (PST)
Received: (nullmailer pid 4074677 invoked by uid 1000);
 Tue, 15 Dec 2020 17:32:14 -0000
Date: Tue, 15 Dec 2020 11:32:14 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20201215173214.GA4074624@robh.at.kernel.org>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
 <20201214091616.13545-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214091616.13545-7-Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lars Persson <larper@axis.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Johan Hovold <johan@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH 06/25] dt-bindings: net: dwmac: Add Tx/Rx
	clock sources
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

On Mon, 14 Dec 2020 12:15:56 +0300, Serge Semin wrote:
> Generic DW *MAC can be connected to an external Tramit and Receive clock
> generators. Add the corresponding clocks description and clock-names to
> the generic bindings schema so new DW *MAC-based bindings wouldn't declare
> its own names of the same clocks.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml        | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
