Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A311EE77
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2019 00:26:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B8F6C36B0B;
	Fri, 13 Dec 2019 23:26:39 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE52EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 23:26:36 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id a124so2042073oii.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 15:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9tBcNOCxqPdqixtTHmzQKgwSJzOr34ZtfeLXIY6339k=;
 b=bEtkRzUJhGQZnFA+B07wbHWcr/+4jcsv7nDu1IMerheDcEc9I3lqCR4970hDH21lTC
 F/H3ia+fdpAiWmi6ZEyJXVVt8/o5ZL/B9tmIkevzLcTVVu5SrAZmSIiHk5nlR1on69lC
 MV/lgU+ssmzAFAChwvlk3WLRd33Gm9+etR51xDYSTJqpeP7QWy1xCoroasASDMvZbp+p
 H1wKlqrZg5HwKxa5kaPsjTGcUQyyo3RhMeXNZu3BGkBpdnAIafGb3vZMpABD7Ek4Uob5
 E/9kbmRg4XrU3X4+PSfj58xSXt+b1lHDzflFth5+ZIX/VlTewOMscCCTEkD87lsrK7O+
 Xuyg==
X-Gm-Message-State: APjAAAVNf28Jn56ydn6deIXlyOEmmXblI9Cvh819CzuruTIHVXsZJZXM
 gKjMKKsaR7pw8m+4p34HJw==
X-Google-Smtp-Source: APXvYqwNYGgD2lL8HkWOAPYgLrNju3VL3N1vf+LrHhWb+bLnt1opXtXZP9zsrWmQ8iKm2ZyeU5xyfQ==
X-Received: by 2002:a05:6808:102:: with SMTP id
 b2mr8248272oie.127.1576279595637; 
 Fri, 13 Dec 2019 15:26:35 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l128sm3844610oif.55.2019.12.13.15.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:26:35 -0800 (PST)
Date: Fri, 13 Dec 2019 17:26:34 -0600
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@st.com
Message-ID: <20191213232634.GA21711@bogus>
References: <20191202150343.27854-1-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202150343.27854-1-gabriel.fernandez@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rcc: Convert stm32mp1 rcc
 bindings to json-schema
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

On Mon, 2 Dec 2019 16:03:43 +0100, <gabriel.fernandez@st.com> wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Convert the STM32MP1 RCC binding to DT schema format using json-schema.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  .../bindings/clock/st,stm32mp1-rcc.txt        | 60 --------------
>  .../bindings/clock/st,stm32mp1-rcc.yaml       | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
