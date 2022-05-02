Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A255178F1
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 23:13:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FB77C60467;
	Mon,  2 May 2022 21:13:55 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 350F7C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 21:13:53 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 s11-20020a4ab54b000000b0035f0178dfcfso437665ooo.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 May 2022 14:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3q+qtdP+luQ33LzicXlYLTVCEnsuA+2H8mH4UxrS+O4=;
 b=Y7r2d8eEMdImIy2cRNx8Bged1nwnzSiPJHLS3cFN7m0DKpjcvwMGv04x3s58SMdfXp
 euN9i6wFBV5FzfI/cCuNkVDL4at64ChoSj9K2N/s0aEXYmxDWA75VgeOSxBqmqpN6v4d
 +tzgeRF/dWyMHpha1UbMX+z5CKStaZkfM3Kdoe2uBHKlziHunpdc2XWRiXX807esa0Ov
 a/41mtIapViHsBO9DGWnmjS5Jk/t77YEkIqELGK8p1DIlLhEcvB3I8fyOk01A71+sRu0
 t/5i4GzNTVv3mH0WuO7uWfXHKdquFi8dt9R72q7/t31jAPpaDJeMClTHscSm9dxA+suB
 j42g==
X-Gm-Message-State: AOAM530VUvIpc8L8LUbaDWOyhfSUBOfcDUsqRRPF1MllzfHKZLK0Q2qf
 pednd9vqF78TKNnvT9OKmA==
X-Google-Smtp-Source: ABdhPJzdddq7QjHdq1Gyqkm9hnLQMotisgl4Ju8ztMqS+jbqac/2Etf+2iATS8SO6UwVwY2Ix6AJGQ==
X-Received: by 2002:a4a:d40d:0:b0:33a:33be:9c1e with SMTP id
 n13-20020a4ad40d000000b0033a33be9c1emr4627230oos.96.1651526031874; 
 Mon, 02 May 2022 14:13:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o11-20020a54478b000000b00325cda1ff93sm2771256oic.18.2022.05.02.14.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 14:13:51 -0700 (PDT)
Received: (nullmailer pid 1763244 invoked by uid 1000);
 Mon, 02 May 2022 21:13:50 -0000
Date: Mon, 2 May 2022 16:13:50 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YnBJjhv6uu2USIUs@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422150952.20587-3-alexandre.torgue@foss.st.com>
Cc: etienne.carriere@st.com, Marek Vasut <marex@denx.de>, arnd@arndb.de,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/8] dt-bindings: clock: stm32mp1:
 describes clocks if "st, stm32mp1-rcc-secure"
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

On Fri, 22 Apr 2022 17:09:46 +0200, Alexandre Torgue wrote:
> In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> security support hardened), "clocks" and "clock-names" describe oscillators
> and are required.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
