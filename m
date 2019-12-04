Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABCA113761
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 23:01:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF27DC36B0B;
	Wed,  4 Dec 2019 22:01:10 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82728C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 22:01:08 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l136so789719oig.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2019 14:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oVB+SJrxK3RMm51aDtljP2ankvSuypjIzEocNKn6UpM=;
 b=rtIp+hxkR2+7ixaijN+e1j5+ty07QASmO0xS6ZCZ1DQ5xMQAtPONazuR/tVYctnRPv
 jDXa1Ks0AQPp2XHkrZtPl771yjI+KeSVM5LTNebi5aUNo+5Pw9hBkNaL0yavVap8SOSs
 aG+SbBkycOLj7Qr6xCE/c1y7p9qWoq3NSSVgTHzowNZgEl4XGJfd3nQeARW8Wu4nH8Kx
 rIXTpJtjxLh8gABYkfoTIAAJM1zcOEd5yfedi+x8HMwboj4cs1flB3uOLcXTJDk/JdEA
 WJOsuFrVktRRP4R5F5eazlSm1LXB42plhvcVyDAG47HOWjcycaGsOrEx/dvx7TZV9qc4
 2dxw==
X-Gm-Message-State: APjAAAWB/DLNE+tQ4KrEjhKVau8/3zH4n0ZPjcSabiZmPfXcUfR0XUKx
 bKzx7M/iH/V8t7/7sDYNAA==
X-Google-Smtp-Source: APXvYqy5PaRTvaNg7atPKSB0FWnrDYidmZNc445kfj9NxtzhCF6A5nZanw5rMCLux8b7qY6RI8v+sw==
X-Received: by 2002:a05:6808:8e:: with SMTP id
 s14mr4219438oic.160.1575496867234; 
 Wed, 04 Dec 2019 14:01:07 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r24sm2644286ota.61.2019.12.04.14.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 14:01:06 -0800 (PST)
Date: Wed, 4 Dec 2019 16:01:05 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191204220105.GA25020@bogus>
References: <20191122104536.20283-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122104536.20283-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: regulator: Convert stm32
 booster bindings to json-schema
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

On Fri, 22 Nov 2019 11:45:35 +0100, Benjamin Gaignard wrote:
> Convert the STM32 regulator booster binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> CC: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  .../bindings/regulator/st,stm32-booster.txt        | 18 ---------
>  .../bindings/regulator/st,stm32-booster.yaml       | 46 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-booster.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-booster.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
