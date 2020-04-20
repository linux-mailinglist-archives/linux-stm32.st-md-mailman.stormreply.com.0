Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4D1B13DB
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 20:04:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 520DDC36B0C;
	Mon, 20 Apr 2020 18:04:54 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1140C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 18:04:51 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id e20so8962457otl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 11:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R9R3P8AxTY42i8eZbd/K2FLLSk3SQ9So4jiLRS8yUHA=;
 b=NmENnbhhqD7QzfnSESzht9yEp+Gcl/8YaBfePtQmdduNUhSwdnTJY99ztD3QW1LZsj
 xgilVquiLKkq4ilvVUEswEfElzCVxvFayxg9hunBoA3fl9DvfIXSn6nQuE43idunaPHS
 eDrnJoYujWu/DxhC7+OsEC4uIJV6RDDgPeMVHt2ljwUGIg6OD1iqz/+Xjjuf3hJY7flO
 N4w9bqwCUcvjrQ5B2fi8mcl9asYjPyFFpYppjm6ZUlQyd7uIKhT0XtIfCIx6+Y9Zez3D
 rVPuaARSp1D6bB5V6jE69AuYSeJ3pM6GZedYcNHnU2RhNvxPt+nGCiJ9E6fvCb8pJFbl
 sBAQ==
X-Gm-Message-State: AGi0PuY8TF9kgyvKoPgeDDCNrF9kaak3q5g9vITWa2aVbIFK6p5TZRSZ
 VF0dvDeW+f6cyWqgOqFcHw==
X-Google-Smtp-Source: APiQypIcphhGbEDkzBJSApE45bLtbLIzGEcM5dFbdISmqJoJZVgTVbNbQyDPIrlbVc68ecDTsveOkA==
X-Received: by 2002:a9d:6a98:: with SMTP id l24mr10210869otq.133.1587405890294; 
 Mon, 20 Apr 2020 11:04:50 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r205sm17563oih.47.2020.04.20.11.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 11:04:49 -0700 (PDT)
Received: (nullmailer pid 22581 invoked by uid 1000);
 Mon, 20 Apr 2020 18:04:48 -0000
Date: Mon, 20 Apr 2020 13:04:48 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200420180448.GA20546@bogus>
References: <20200420121620.2099-1-benjamin.gaignard@st.com>
 <20200420121620.2099-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420121620.2099-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, tglx@linutronix.de,
 fabrice.gasnier@st.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 1/6] dt-bindings: mfd: Document STM32
 low power timer bindings
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

On Mon, Apr 20, 2020 at 02:16:15PM +0200, Benjamin Gaignard wrote:
> Add a subnode to STM low power timer bindings to support timer driver
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
