Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C47517917
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 23:26:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3E02C60467;
	Mon,  2 May 2022 21:26:55 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 588BFC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 21:26:54 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-e93ff05b23so15512831fac.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 May 2022 14:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jUXadxcBM2wGghQUZGspLXPv1H+K2sEgrmrW9LXrYH4=;
 b=zxW+GxbhkIKCs3GJep/dxYE4/VGayEQJx0YkY5qvfTZhT/9vyHWBEs01bnwba51mIR
 dDFJf5qSsBwm5qEyXhwSRm6UeovxSwa6hGmWzJzQmkvwQXo5jCmv36VSbY3O4J/4snow
 FUkn/tN/RVh+woZo6ad7MYz49KWBzTHLa4PROXCPEngFp7oNfe+nEpabFg6LJSkYQm1I
 xsGdDZti947jKxgAJSN6Pi9hy042uGAZ2SgH7nkMDC/tgts2rYsfVaurbrLXnunNoyhu
 BywXW4w8rO4bSEkK8aW223mvzfuSD0aaJuxzxB359/e43pRAMPEHi94xt6hY/B5Gp4RM
 wwPQ==
X-Gm-Message-State: AOAM533TLIvPnVen5lQUdfVjuaWJQCD8Zas/4jviBlsQuB/L54G1WLGH
 94Hf8edtC9qxkO0MkVVgQg==
X-Google-Smtp-Source: ABdhPJy5aexT9fpRtVRW+BykQHq+euRFdmPRG6US0k26rcVqaqzGKoPFTWQt8OnGoRceqsXjqE4Vzg==
X-Received: by 2002:a05:6870:969e:b0:ed:9e77:8eba with SMTP id
 o30-20020a056870969e00b000ed9e778ebamr516885oaq.269.1651526813128; 
 Mon, 02 May 2022 14:26:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n44-20020a056870822c00b000e686d13894sm6244497oae.46.2022.05.02.14.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 14:26:52 -0700 (PDT)
Received: (nullmailer pid 1784491 invoked by uid 1000);
 Mon, 02 May 2022 21:26:51 -0000
Date: Mon, 2 May 2022 16:26:51 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YnBMm7wE5/Jz6N3l@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-4-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422150952.20587-4-alexandre.torgue@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 etienne.carriere@st.com, arnd@arndb.de, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/8] dt-bindings: clock: stm32mp15: rename
	CK_SCMI define
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

On Fri, 22 Apr 2022 17:09:47 +0200, Alexandre Torgue wrote:
> As we only have one SCMI instance, it's not necessary to add an index to
> the name.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
