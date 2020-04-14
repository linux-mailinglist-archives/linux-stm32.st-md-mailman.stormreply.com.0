Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E858C1A887C
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2020 20:05:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3A95C36B0C;
	Tue, 14 Apr 2020 18:05:14 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFC1FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 18:05:12 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z17so602383oto.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 11:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zyyunDAx2uwMbONH8a30TAmLrXMLmxuwK8FL24ovkME=;
 b=IgW6Klw5YVeziBsAf+eQOwP745NMcDk9a63O03/delGppL1X71Yx+hsnBWpFHbxraJ
 h2GH68cnleV2XC/jzZDsckTl9GrzyrXrKg3wuPK0Lua62b0olqlT0ggfrUQaaPpbkTgR
 C6iN8IAiGFfqYOo9+7xAXE5iwosOfHcG4e9oLPeMMgOLf8tfY1/wdy9m7Gxl3uBBdFMH
 XTHtZ4LQ3NV78p9eBI657T6O48eBdxJ6gzdyNM4UKMIcxfwsXkrMhIVDxQD5ecux8JEF
 BMJaCObDSimVJiKQh/AkIRVHi6zg7yzGt39+RJq3lGQaRXhyvtQj9U3jevcBLza89sVh
 i99g==
X-Gm-Message-State: AGi0PubaXzb0jniFW0h1nnkEo1jJPtMnTbMKcnzxwFaWkq/DpzGznZtD
 daK4NYkJ1bnHKnFXklRDaA==
X-Google-Smtp-Source: APiQypLDJoJx7Di661s5byWD9ZVHoJghminhZPKnbjGm47MDfVVSc1w/i75wcXKy25C30Z1LkclSBg==
X-Received: by 2002:a9d:b8c:: with SMTP id 12mr19626038oth.205.1586887511542; 
 Tue, 14 Apr 2020 11:05:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e21sm6180403ooh.31.2020.04.14.11.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:05:11 -0700 (PDT)
Received: (nullmailer pid 22106 invoked by uid 1000);
 Tue, 14 Apr 2020 18:05:10 -0000
Date: Tue, 14 Apr 2020 13:05:09 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@st.com>
Message-ID: <20200414180509.GA21967@bogus>
References: <20200403140415.29641-1-christophe.roullier@st.com>
 <20200403140415.29641-3-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403140415.29641-3-christophe.roullier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandru.ardelean@analog.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 2/2] dt-bindings: net: dwmac: Convert
 stm32 dwmac to DT schema
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

On Fri, 3 Apr 2020 16:04:15 +0200, Christophe Roullier wrote:
> Convert stm32 dwmac to DT schema.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  .../devicetree/bindings/net/stm32-dwmac.txt   |  44 -----
>  .../devicetree/bindings/net/stm32-dwmac.yaml  | 150 ++++++++++++++++++
>  2 files changed, 150 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/stm32-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
