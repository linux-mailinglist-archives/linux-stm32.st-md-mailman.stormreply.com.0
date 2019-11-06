Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8563F0DA8
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 05:16:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5DEBC36B0B;
	Wed,  6 Nov 2019 04:16:13 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E8B2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 04:16:11 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k2so19735318oij.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2019 20:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YyIz8f1e9UfiTAitqdpO0gSzcZ8qqT+hCle9bN35WzI=;
 b=JbNh3pg3CXyi7wTzQn4mZUbjhd+Yta3XPd+O9TsE/BgcyTMNLIw3zP7Sammbt3ZDuX
 F48wWF0+b7OIWv77kZWHIsUb7ixv1voYsbNKeAi3UscwzaeGdZh7u4ivtByIEl7w0hjU
 3mJQbnq3WDrwVf1Ih0FOdqtUerpzNG2VtM5tbtHk9LT14XqN2OR4fMEkyfvQ621YJumC
 gG5BCp7JIldVgokVrae343+Ar0YAcszTTvRo0mLmbRfjZo2Wvt1bM7gHSF+iASEW0jwI
 gC9YN05fj7qOEFm5C2OHkQAfdLRT1n62MexL9p8rZi+0TRi9jtfjFh8zmTgMj0qHOrEQ
 5s+g==
X-Gm-Message-State: APjAAAUYazzSpLLMdQZSQpO81+uuAh1RnqAtJhroGgrjwVuNz6mKXaGb
 poQkz6LpxIyMb4cWYY4rdw==
X-Google-Smtp-Source: APXvYqx3I4HQVzBQc3zq/SLJYwhrOMbaEj1Kj7im68FUhkqovz+Jg6Aj3wFPbiVOYEEOavsrH0Th0A==
X-Received: by 2002:aca:6207:: with SMTP id w7mr407049oib.87.1573013770143;
 Tue, 05 Nov 2019 20:16:10 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 103sm3515081otn.63.2019.11.05.20.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 20:16:09 -0800 (PST)
Date: Tue, 5 Nov 2019 22:16:08 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191106041608.GA24747@bogus>
References: <20191031123040.26316-1-benjamin.gaignard@st.com>
 <20191031123040.26316-2-benjamin.gaignard@st.com>
 <20191106041023.GB5294@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106041023.GB5294@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, fabrice.gasnier@st.com,
 lee.jones@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: counter: Convert stm32
 counter bindings to json-schema
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

On Tue, Nov 05, 2019 at 10:10:23PM -0600, Rob Herring wrote:
> On Thu, Oct 31, 2019 at 01:30:37PM +0100, Benjamin Gaignard wrote:
> > Convert the STM32 counter binding to DT schema format using json-schema
> 
> Probably this should all be 1 file instead.

Also, checkpatch reports trailing whitespace in several of your patches.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
