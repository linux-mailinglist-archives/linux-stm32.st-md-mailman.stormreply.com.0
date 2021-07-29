Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61A3DADAC
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jul 2021 22:34:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3B1CC57B6F;
	Thu, 29 Jul 2021 20:34:25 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66BFFC57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 20:34:24 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id l18so8737712ioh.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 13:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K5V012xL88GFPg0nzzWvkyZK/M/tg+yzd7/vSuHbGEc=;
 b=av7D5cjhUYrNBkbHkJx9XLnTxg/IDQPnHNsaJplQqEVv4bImjBAnLy4zUzIe4zSRw+
 uB2sGgfi0MZughypGMBvTaS5u7FLE72ASqkekZVTSHkotUum0pYx/bKG4TFWY2gsPgG1
 4RIzEwF9aNO8p3WvFrsX7v/qqGuzU8H6GF/EYRUODHOWxjfm0g25cS/veLwoebYEBY35
 Tb7Qjkymqzu9HZ/tNvJUmPLpgy2gkcAaOi39geztT1sCEhfxDA7Y6XCM5CH+uMN7MD12
 J4dnYsJIC9RHcXv9Ag4ixZpKTz84Pnyx09bq0E4C5Hn95aCRwvgV5RAkkHzQIQigyRhj
 rZSw==
X-Gm-Message-State: AOAM530VNHNEFYc6kg33i3w+Z7VWfaU7GEHGo2ar0m6hKMH079/q6D1J
 Ygmui0Dmq/nnv+iyaHAqLw==
X-Google-Smtp-Source: ABdhPJxJzuYy/bh76WKd2gMGYVNi5fvug8TBfrecWZaqizyLUG0jPn7EJS6HVwIjJFWa5EBPGa6TRg==
X-Received: by 2002:a6b:7a04:: with SMTP id h4mr5563850iom.149.1627590863357; 
 Thu, 29 Jul 2021 13:34:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id t15sm2476727iln.36.2021.07.29.13.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:34:22 -0700 (PDT)
Received: (nullmailer pid 839820 invoked by uid 1000);
 Thu, 29 Jul 2021 20:34:20 -0000
Date: Thu, 29 Jul 2021 14:34:20 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YQMQzFXeEJ8FT9dF@robh.at.kernel.org>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <20210723132810.25728-2-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723132810.25728-2-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, linux-gpio@vger.kernel.org,
 robh+dt@kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olof Johansson <olof@lixom.net>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: pinctrl: stm32: add new
 compatible for STM32MP135 SoC
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

On Fri, 23 Jul 2021 15:28:04 +0200, Alexandre Torgue wrote:
> New compatible to manage ball out and pin muxing of STM32MP135 SoC.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
