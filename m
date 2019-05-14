Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C05101D057
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 22:14:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E262C35E05
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 20:14:50 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 462ECC35E04
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 20:14:49 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id j49so46630otc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 13:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qDSk0SZEl2UvCN7TKGAHqgBAUsr16i+lq3jnqkJH6gc=;
 b=BjngQ+ZCW1oYBekW10tt8dkpPHNW7CkzPXPVWEOIGjRkAoJdj0kJH1fLU9mX8ZeCtb
 cTrj3aqdkfoqJdbhMcBOW0qIxtcw+EchVw49uCswtlBPnwSwD1uDoorR2L3zeityS1Hg
 nQkaqj22qNU8fgbC6L+zV2Z6E2IwupaYe7vJvwCCHbHRDpIckDibp8K5jmHrPCeHA9Ph
 LZdZCvXCOlKTxWj6/oi/mmYLk4ohN/wowUB0+oMSKOKyGPj1jiSi+LV3VNx2RJEKcj8V
 ShHb5Q261cbDZUp6DNa2jSGj5mpzf2pU3l29uQ1lr+X2Q0r98rUha7FwR/L8dOfB8p8D
 2Xnw==
X-Gm-Message-State: APjAAAXgnJJtfWkSiBlEHugWc0T2WN/6wCResCv7W/B/aawA2ST0Resm
 fnQHnCtW5ydh6yuIE3+yyA==
X-Google-Smtp-Source: APXvYqy0DmBg5AVm6UGSATsuf2eDa6AOsOSDM7QYNZcyDwYTVR4/PoV6LpYTKAOotzxVzhxgYi5seA==
X-Received: by 2002:a9d:77c9:: with SMTP id w9mr13586344otl.253.1557864887960; 
 Tue, 14 May 2019 13:14:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r205sm4984401oig.0.2019.05.14.13.14.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 13:14:47 -0700 (PDT)
Date: Tue, 14 May 2019 15:14:46 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20190514201446.GA29557@bogus>
References: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: pinctrl: Convert stm32
 pinctrl bindings to json-schema
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

On Fri, 10 May 2019 17:45:26 +0200, Alexandre Torgue wrote:
> Convert the STM32 pinctrl binding to DT schema format using json-schema.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> ---
> 
> Hi,
> 
> First pacth to convert DT bindings file (here pinctrl STM32) to json-schema
> in order to take advantage of devicetree validation tool for STM32.
> 
> Changes since v1:
>  - Fix errors reported by Rob.
> 
> 
> regards
> Alex
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
