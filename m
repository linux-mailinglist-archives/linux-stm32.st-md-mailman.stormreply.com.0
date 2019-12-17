Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AA123AEE
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 00:35:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D2C2C36B0C;
	Tue, 17 Dec 2019 23:35:25 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4625C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 23:35:23 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id d62so78317oia.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 15:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BI73ZBRjjqR0+V9ow7XsG6Zpq8G1O7yVR3mkt4nqq1I=;
 b=Ddp/fzW/MzjxkphNjRWudP5ySJ1kWticDrmA6QAYYYQ9sTRwuWkB2cN6kfs3Ghr/eB
 vqQCbVydWRO0S85OyaZMpkWJK+NzFbtMunM+G09l7UUvBaekpr/CxZHwM9nqbbzYutOb
 qTaQD1Xbo8dYrHepBNBAVqAr4Z9a9E17JNfpnCoafD6WkZNEvfPW4FtrIaXoyRuJac4J
 gD+Oo5WIIkmmRjijCTbY3yn7/s5QwUrAl6nRqwAHF/wd+jTDOh0gW7cZWNw6YaMXG7yk
 nD2a88M1qXdo2owk0JYh9Jrbpe6CoWmAesrhjNMh/NkThhWMW17rsp5LIcJ93j9bM6wd
 hdWg==
X-Gm-Message-State: APjAAAX3WnbBPls9Bm4o48G26oVViGgMuOY56HLuxzWti7TOyTy7v+H3
 o9jtaSVJNVuaQ5O/5QkXww==
X-Google-Smtp-Source: APXvYqyRMza5p9FcM6gHlmpJkzd8vwIoG+HS9nMq49ZnmHNRYgI1aLev14QmXW//C7ZTMozv5ATcsw==
X-Received: by 2002:a05:6808:3ca:: with SMTP id
 o10mr3165499oie.14.1576625722498; 
 Tue, 17 Dec 2019 15:35:22 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o16sm17262oic.7.2019.12.17.15.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 15:35:21 -0800 (PST)
Date: Tue, 17 Dec 2019 17:35:20 -0600
From: Rob Herring <robh@kernel.org>
To: Pascal Paillet <p.paillet@st.com>
Message-ID: <20191217233520.GA31425@bogus>
References: <20191205161359.20755-1-p.paillet@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205161359.20755-1-p.paillet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, p.paillet@st.com,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] regulator: Convert stm32-pwr regulator
	to json-schema
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

On Thu, 5 Dec 2019 17:13:59 +0100, Pascal Paillet wrote:
> Convert the stm32-pwr regulator binding to DT schema format using
> json-schema.
> 
> Signed-off-by: Pascal Paillet <p.paillet@st.com>
> ---
> Changes since v2:
> remove /schemas/types.yaml#/definitions/phandle-array for supply
> 
>  .../regulator/st,stm32mp1-pwr-reg.txt         | 43 -------------
>  .../regulator/st,stm32mp1-pwr-reg.yaml        | 64 +++++++++++++++++++
>  2 files changed, 64 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
