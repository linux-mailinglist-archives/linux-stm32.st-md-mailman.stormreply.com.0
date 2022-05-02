Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6510C517920
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 23:28:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FF57C60467;
	Mon,  2 May 2022 21:28:39 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DD28C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 21:28:37 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id r1so16288016oie.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 May 2022 14:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aWRyyqTX1zgpUL0i+w8d1Ou1tFF0ewiHqxv686F2LGk=;
 b=QZRsPeTg3j78OhXVn7H99P2E8PehdTRgU4bDfTBO1wBJeA22iYrRTXWhU9gzvzjNc7
 Hw1MbYT9bD21SyjNLgW3fIevfUielHJRsScN5F6JiQZJ4e6F27RtaL5L8h0e9TuJEBta
 Zr4FF44PNGJ/N3TI5B2pg1PHihSONk36kR08fi4UjYZTyz3z5VL/z/RxEnIn4JmYx4vD
 rpAxanDou1ThomWZhvoQmgavb2d5y967hiCmETFY/7MTx4AqgPuIGZr1Q9xalPTI50Q/
 DvBQCKFvl292Z2j656oLnGAiGYiYkvJ2UHk3H/rq/ccBHvz58qIG7Ooah5hfbckEX4sU
 Fsbg==
X-Gm-Message-State: AOAM531mby9wCNdVq5EINGGjHrw//BSlIBPTFw1UowF2vx59kdI9eTgC
 ytXajZMsbyhqbPlAmZjkyg==
X-Google-Smtp-Source: ABdhPJzuZVJjvpvlPD9utsP/MMvXGt+bpD1i+qtjarMTrHxsWFFkdFazKHKJ+54WhwWRfMXuHv14FQ==
X-Received: by 2002:a05:6808:1526:b0:323:1194:d3bf with SMTP id
 u38-20020a056808152600b003231194d3bfmr535917oiw.120.1651526916142; 
 Mon, 02 May 2022 14:28:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k3-20020a9d7dc3000000b0060603221261sm3416202otn.49.2022.05.02.14.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 14:28:35 -0700 (PDT)
Received: (nullmailer pid 1787413 invoked by uid 1000);
 Mon, 02 May 2022 21:28:34 -0000
Date: Mon, 2 May 2022 16:28:34 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YnBNAnlIvF6ujYWg@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-8-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422150952.20587-8-alexandre.torgue@foss.st.com>
Cc: etienne.carriere@st.com, devicetree@vger.kernel.org,
 Marek Vasut <marex@denx.de>, arnd@arndb.de, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 7/8] dt-bindings: arm: stm32: Add SCMI
 version of STM32 boards (DK1/DK2/ED1/EV1)
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

On Fri, 22 Apr 2022 17:09:51 +0200, Alexandre Torgue wrote:
> Add a "secure" version based on SCMI of STM32 boards. Only boards
> provided by STMicroelectronics are concerned:
> 
> -STM32MP157A-DK1
> -STM32MP157C-DK2
> -STM32MP157C-ED1
> -STM32MP157C-EV1
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
