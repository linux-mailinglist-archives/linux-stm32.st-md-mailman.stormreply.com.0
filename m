Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4351791B
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 23:27:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E40D2C60467;
	Mon,  2 May 2022 21:27:07 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 213ACC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 21:27:06 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 g11-20020a9d648b000000b00605e4278793so9567120otl.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 May 2022 14:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EsdfTRzRsElhBArWgPiV5kB/wKpIPZn5Ogj7LhGJATU=;
 b=TUgGeQ5yfNTmbIocVsjhfB4PJaEbwYs1WWJRsi0Oh1czQZkl7eX9ryy2bdOs31qScJ
 +1vm2inDf1snB7QQqDqhyG+S5zSd7vUyaG0IZlErCbjvoIgTV0z8xeKu2BP+pAe/Lx/3
 SM8Fbx5ieqJ2GzoYBp3dEJdA9WtCR3rcBaV7IKv/5/d7Fum/OeD7PenNetULCPtlw8Sf
 RXnSTp7OjPUMs7UuiFuV1d/+QBQDYubiC+pV/d3DImL68YmDCUqylrTNxtMyXcGIjeFk
 Gb/+2TDvkOJNJ4tbqk8YMGPFgquLJtuDT794BUTjMPjufEOO7RvdewxkgIkSyaYm7d63
 HolA==
X-Gm-Message-State: AOAM5337gWDOdgS86ui+Ek/Q7/taUr1omifsg7nCMmjnNzPxOJ3vlKwf
 adGNw9zbQEvWrAmWdR/jnw==
X-Google-Smtp-Source: ABdhPJxkBlKrm6SvtSp+hLxpW9sfD1oaQcy4xBqkj3dJZ98/SwK51i5iypx4zzQa3BHjub2l6y5/TQ==
X-Received: by 2002:a9d:172f:0:b0:606:31ed:5d86 with SMTP id
 i47-20020a9d172f000000b0060631ed5d86mr471566ota.266.1651526824990; 
 Mon, 02 May 2022 14:27:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w5-20020a9d70c5000000b0060603221268sm3254695otj.56.2022.05.02.14.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 14:27:04 -0700 (PDT)
Received: (nullmailer pid 1784930 invoked by uid 1000);
 Mon, 02 May 2022 21:27:03 -0000
Date: Mon, 2 May 2022 16:27:03 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YnBMp27tB1774s/L@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-5-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422150952.20587-5-alexandre.torgue@foss.st.com>
Cc: etienne.carriere@st.com, devicetree@vger.kernel.org,
 Marek Vasut <marex@denx.de>, arnd@arndb.de, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/8] dt-bindings: reset: stm32mp15: rename
	RST_SCMI define
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

On Fri, 22 Apr 2022 17:09:48 +0200, Alexandre Torgue wrote:
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
