Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8813913C6B6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 15:56:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 433CCC36B0F;
	Wed, 15 Jan 2020 14:56:50 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90536C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 14:56:49 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id i15so16351375oto.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 06:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9gnxD+G4FNn+U8wzPNZLFG38GLzn+JUvySqC1BxpFAA=;
 b=VYabW+WOBCDPe8w4jRkxXJIqGqHGYy/MS1RAyk60Bul1vp75lCaQoH/zIThOYUo3iQ
 1VJITv7Y3MGYurgdX+E0zATd+MS4y8fjQfFw2+otbZ/xk1FLif+2aU9QFNppz937x25h
 89UXX8PR3zSPVYPgaIqEZywIHtyW+Vh25OQdHmWv17o1bEjGZ63hbQ9IpzdTNnowUqHu
 6mg8MlT/lhUoCR1U4jsFPA82MZuIzbtsouJqvDkmE1Q5S5NZ6TsPk8UulKhJayBnb9bS
 SYHVVwdWz5SpmNtEwAaN2OeqgEJKGP0q+DrAQustUtTE+YhWNYhtucBXkWvvDUB7jIdc
 uaJQ==
X-Gm-Message-State: APjAAAXYs4uzDpFUo+CD+yJhrVydDwbhSfkHWZNEYXLiTziN4odQelF2
 8WfX1BE5TgDxhk8o7F4j+t57IKk=
X-Google-Smtp-Source: APXvYqxV7wI4ncRvKFHqNMXDuzy9iMfwJGa7oT8THpml3J/RSItt6WC44eQQJCox4if3pDE7IqFvyg==
X-Received: by 2002:a05:6830:1047:: with SMTP id
 b7mr3131589otp.77.1579100207781; 
 Wed, 15 Jan 2020 06:56:47 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g61sm6629825otb.53.2020.01.15.06.56.46
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 06:56:46 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 22040c
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 15 Jan 2020 08:56:45 -0600
Date: Wed, 15 Jan 2020 08:56:45 -0600
From: Rob Herring <robh@kernel.org>
To: Ludovic Barre <ludovic.barre@st.com>
Message-ID: <20200115145645.GA599@bogus>
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-6-ludovic.barre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110134823.14882-6-ludovic.barre@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/9] dt-bindings: mmc: mmci: add delay
 block base register for sdmmc
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

On Fri, Jan 10, 2020 at 02:48:19PM +0100, Ludovic Barre wrote:
> To support the sdr104 mode, the sdmmc variant has a
> hardware delay block to manage the clock phase when sampling
> data received by the card.
> 
> This patch adds a second base register (optional) for
> sdmmc delay block.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  Documentation/devicetree/bindings/mmc/mmci.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmci.txt b/Documentation/devicetree/bindings/mmc/mmci.txt
> index 6d3c626e017d..4ec921e4bf34 100644
> --- a/Documentation/devicetree/bindings/mmc/mmci.txt
> +++ b/Documentation/devicetree/bindings/mmc/mmci.txt
> @@ -28,6 +28,8 @@ specific for ux500 variant:
>  - st,sig-pin-fbclk       : feedback clock signal pin used.
>  
>  specific for sdmmc variant:
> +- reg			 : a second base register may be defined if a delay
> +                           block is present and used for tuning.

Which compatibles have a 2nd reg entry?

>  - st,sig-dir             : signal direction polarity used for cmd, dat0 dat123.
>  - st,neg-edge            : data & command phase relation, generated on
>                             sd clock falling edge.
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
