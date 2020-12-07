Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D535D2D1DBC
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Dec 2020 23:50:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8165EC3FADC;
	Mon,  7 Dec 2020 22:50:29 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFD91C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Dec 2020 22:50:26 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id s75so14269855oih.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Dec 2020 14:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OOjXvzmUiGjPiWQnDBF3fUFBdTIAN342UXa8biTDBZY=;
 b=W29qkID8+QXAhpQ+mFU4oVV1dHscqCcfUZPL4MdHLjIP2Xh28LHtxPS7qEbIJE+XCr
 YXx8Hewzxep459CBNNf69ko/CVTeZFGnBiQuk9L9AFyAQ253V3PJW3bUgqmXfky4Z6Ti
 oCOSlRww0SZfawha/iNh7UhWet+PfMMD2LTyrQswaY1N3IRbwvCFJDwSKU9T1SNN1Uv7
 BYsXJUL0R/5HPSW4rgSVYqCGv16Ywnc7knkljKTDJ66fOG3RLNEqesEbC8bLGTT5zbOE
 vhEI1lfoYivGgu5YdQ8qgBcFqppMRiMn99qvmSVa1unPvu+rmtl4zNMCdAKx5M0bk8+l
 BRSA==
X-Gm-Message-State: AOAM530dwJ9Io9xSZENz/MHgCIHJVD6Hg27Br9NuhE162WN4vXYfTACP
 6rffiyXO8rktQdb4EcLYcg==
X-Google-Smtp-Source: ABdhPJxjmuWPyB2q7LBKu3uvUIWs2vkBHsFks2mtNMtTNthmYmCU6ILC/3dqCqhbfOBYUbHUIugK/Q==
X-Received: by 2002:aca:6103:: with SMTP id v3mr806928oib.64.1607381425377;
 Mon, 07 Dec 2020 14:50:25 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h8sm2834490oom.41.2020.12.07.14.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:50:24 -0800 (PST)
Received: (nullmailer pid 990371 invoked by uid 1000);
 Mon, 07 Dec 2020 22:50:23 -0000
Date: Mon, 7 Dec 2020 16:50:23 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201207225023.GA990319@robh.at.kernel.org>
References: <20201123170132.17859-1-amelie.delaunay@st.com>
 <20201123170132.17859-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123170132.17859-2-amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: phy: phy-stm32-usbphyc:
 move PLL supplies to parent node
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

On Mon, 23 Nov 2020 18:01:27 +0100, Amelie Delaunay wrote:
> PLL block requires to be powered with 1v1 and 1v8 supplies to catch ENABLE
> signal.
> Currently, supplies are managed through phy_ops .power_on/off, and PLL
> activation/deactivation is managed through phy_ops .init/exit.
> The sequence of phy_ops .power_on/.phy_init, .power_off/.exit is USB
> drivers dependent.
> To ensure a good behavior of the PLL, supplies have to be managed at PLL
> activation/deactivation. That means the supplies need to be put in usbphyc
> parent node and not in phy children nodes.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
> Note that even with bindings change, it doesn't break the backward
> compatibility: old device trees are still compatible, USB is still
> functional. Device trees will be updated with this new bindings
> when approved.
> ---
>  .../bindings/phy/phy-stm32-usbphyc.yaml       | 22 +++++++++----------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
