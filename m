Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D023B1054A7
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 15:38:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BAB1C36B0B;
	Thu, 21 Nov 2019 14:38:59 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B16BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 14:38:58 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id w24so3103374otk.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 06:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0blBAL3wZkz50HycghqiK2pciwvxeqAeMTt/kJRNm5g=;
 b=fTV/8wr+K6GicKy3lVW/BZCP4EDghlXk56HGMziafubicbw1MOb3VY1Eoo0BBWD+Bj
 paCJwEwW7ZDXbP5GdHJHp8jl/PP5Glbnf+mIumXvm3p1oHdjei2D+QUrSgM6VhPgY5f8
 F54zdcra3V05VwnG/eH7NiIH0msHfXDjQd0FnS7tiEcnRoKdrRp6m7E0fabEGSxX1f2w
 1rFIqpLFvrkhlN2QJ3vwPwd7Gg5bUuhLvp1bqZTZHlHBTvQthuKW5u28Tj0t8znR5VQX
 TdR0k+XPuFWl1eHTyfnkEzDr93bS6YArxpU7J7m8oODfdx7Bon2GuvO3rgxlNVVcKLkX
 LRjA==
X-Gm-Message-State: APjAAAX+sb67fdCxVVUUhXpnAix5ZUlnYkfWm4P992PwPhQ1FrRNZ7db
 lA4CNDs10k1ASNBBgnPh0Q==
X-Google-Smtp-Source: APXvYqwnaGGSvHw3eVxDSnMv1fQxO7SKEamfp9zxy8HwVAD1LSiD/kDoELucP/RnyFz5AWlq8jVXBQ==
X-Received: by 2002:a9d:7a93:: with SMTP id l19mr6448599otn.314.1574347136596; 
 Thu, 21 Nov 2019 06:38:56 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h39sm1055423oth.9.2019.11.21.06.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 06:38:56 -0800 (PST)
Date: Thu, 21 Nov 2019 08:38:55 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191121143855.GA23685@bogus>
References: <20191120194444.10540-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120194444.10540-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: spi: Convert stm32 QSPI
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

On Wed, 20 Nov 2019 20:44:44 +0100, Benjamin Gaignard wrote:
> Convert the STM32 QSPI binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in version 2:
> - fix subject
> - remove useless minItems and maxItems
>  .../devicetree/bindings/spi/spi-stm32-qspi.txt     | 47 ------------
>  .../devicetree/bindings/spi/st,stm32-qspi.yaml     | 83 ++++++++++++++++++++++
>  2 files changed, 83 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-stm32-qspi.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
