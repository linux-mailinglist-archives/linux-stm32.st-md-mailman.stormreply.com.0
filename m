Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4BA1B13BE
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 19:58:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A894AC36B0C;
	Mon, 20 Apr 2020 17:58:57 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0767C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 17:58:55 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 8so9602557oiy.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 10:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/5W/lQ34ReMbXEDzAwXh6BEJq3UIgkv6eyC5gc3Bzrc=;
 b=tv/64HbgO6MnF4ajmJznt+SbQFQy2xupyUjSgy95sJH+myr4ZocfAFQDfG08z827Qa
 xkQz7OiR52/10fdp+bHJyws2E9x+2eE/5wsSZrQE45xqAI74IqiqhRDhDR05YDoGmiYu
 oA/JUywcpd6ywzgSMdpM9a6VmJfe/6m5B9z0GJ+5QzDq2d1RZYTDdLilJ3ZlTMpd0TFe
 9fj7/6O0YXK4SK2Yo7sC7ag3O08Ibzhl2/169lN6Ixr9p0vYk6FIUuOKGWRBf3f+vst0
 FTdjLRr/TcdvNVhLqNS+wXFIryyh30FPyUu1GEplvj3XcidHx4p5EQb5NZmkgMxLzI3T
 KcQw==
X-Gm-Message-State: AGi0PuYgjoR910ZzLrA+y7ABGavuGLsYKYyWT5vvxy0eCuyef/uLRh4O
 PahavP8GQcJzNqYt1EIBqg==
X-Google-Smtp-Source: APiQypJG2laHDj1gFHJr/T8u1/7WLO1L1HK3oDn1rmL0PRluF7lKVfIH0ZzkLa/bWiGt+rj/5P4Hsg==
X-Received: by 2002:aca:c68b:: with SMTP id w133mr422169oif.175.1587405534277; 
 Mon, 20 Apr 2020 10:58:54 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w18sm33636oos.13.2020.04.20.10.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 10:58:53 -0700 (PDT)
Received: (nullmailer pid 5416 invoked by uid 1000);
 Mon, 20 Apr 2020 17:58:52 -0000
Date: Mon, 20 Apr 2020 12:58:52 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200420175852.GA5063@bogus>
References: <20200420134800.31604-1-benjamin.gaignard@st.com>
 <20200420134800.31604-4-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420134800.31604-4-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/5] dt-bindings: bus: Add STM32 ETZPC
	firewall controller
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

On Mon, 20 Apr 2020 15:47:58 +0200, Benjamin Gaignard wrote:
> Document STM32 ETZPC firewall controller bindings
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/bus/stm32/st,stm32-etzpc.yaml         | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.example.dts:17.5-24.11: Warning (unit_address_vs_reg): /example-0/soc: node has a reg or ranges property, but no unit name

See https://patchwork.ozlabs.org/patch/1273431

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
