Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 081872DB246
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Dec 2020 18:15:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4A6CC3FAD5;
	Tue, 15 Dec 2020 17:14:59 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA1C7C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 17:14:58 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l207so24152368oib.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 09:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WDL2cS7hdWKtIpZ/KjKtPA2ntVpYBO+MI/yCzfxd848=;
 b=Pxjbf3pGX9JBSS5WMfRcjqXjZCuA/EYRINLPrh7Jdr2txBmfWp004T1nan7v/O2ga1
 uPFajSzzFyMNoInu248NXoO+jdtTJXpnFoLL4/zP9PmOeZFEFWb44YdBJ7bDt/cd4x/U
 2MS9Kvftp+3Q1inHscQynxdO++dNApcmz63sV/nlJ3sSrfLZfWRaafysKC2kdZfvFmBc
 Tg00fsVxZ7iFAtFh4in71bpMxExTc8pIr2eWmCwNG3lHA6jVEY1G6jvkPNs9KsuBEECo
 celmOF/aDcerMDi9ek819QewnE57EFbxMEP1I3iyuQZSLSB2S7LMHvSIjdPm/sAQKQIF
 oOdg==
X-Gm-Message-State: AOAM532lDGUvWW0HzdUMYp2R3C2szEPs2eQDXcCEI2eGJHgwdvWTfj/L
 h9Qj5n7m8Cpf1OhBB4le2w==
X-Google-Smtp-Source: ABdhPJy5ALCdnBZecNdmijYEkMRQkwEv45r5BSaNA3d1OUSxcKJf8YTYoZjuJnrGo+aUm6BW1kfecQ==
X-Received: by 2002:aca:48c4:: with SMTP id v187mr13808805oia.37.1608052497495; 
 Tue, 15 Dec 2020 09:14:57 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c204sm4755034oob.44.2020.12.15.09.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:14:56 -0800 (PST)
Received: (nullmailer pid 4047644 invoked by uid 1000);
 Tue, 15 Dec 2020 17:14:55 -0000
Date: Tue, 15 Dec 2020 11:14:55 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20201215171455.GA4047592@robh.at.kernel.org>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
 <20201214091616.13545-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214091616.13545-3-Sergey.Semin@baikalelectronics.ru>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Lars Persson <larper@axis.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Johan Hovold <johan@kernel.org>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/25] dt-bindings: net: dwmac: Extend
 number of PBL values
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

On Mon, 14 Dec 2020 12:15:52 +0300, Serge Semin wrote:
> In accordance with [1] the permitted PBL values can be set as one of
> [1, 2, 4, 8, 16, 32]. The rest of the values results in undefined
> behavior. At the same time some of the permitted values can be also
> invalid depending on the controller FIFOs size and the data bus width.
> Seeing due to having too many variables all the possible PBL property
> constraints can't be implemented in the bindings schema, let's extend
> the set of permitted PBL values to be as much as the configuration
> register supports leaving the undefined behaviour cases for developers
> to handle.
> 
> [1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
>     October 2013, p. 380.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
