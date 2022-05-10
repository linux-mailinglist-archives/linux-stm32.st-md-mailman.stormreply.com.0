Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 908305223D4
	for <lists+linux-stm32@lfdr.de>; Tue, 10 May 2022 20:23:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 585DAC03FC0;
	Tue, 10 May 2022 18:23:23 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19802C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 18:23:22 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-deb9295679so19294390fac.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 11:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j6VUj9Lojhw3KHnOTn3bbGkCrGpPROOfMwN16uub3uA=;
 b=PIW6moPLk1UT0FZUGb/rr2Tyq555GToqvuxsfXYZvThHX4PjGzPIX/y9JSJ3f3oVJQ
 XAqEjhhsUQdu8awAc1wNK8uIfJcB8zHUzUdWK2p8E6I8v8VLN+y6Y1chFRUXGfaTvq5d
 glnK0l3ZdFM1BqY4QUH3LITxTxMBY5u3+V0U7fF4Od3q42DMtEMYYZGNfmZwJPgAvd9m
 Jd1XW2rgWBqKXPuWZQtRgu7gmCbecUsdH1qHX1IY9hkX7iQVxz5VfOlZjtXXQINGDLBm
 W53wUjZcLIgbHS79L6c1CK4E/PIxn1V8maZRAQYsS8P59aBPPy5xhPGzJzTh7kk7iL04
 BUTg==
X-Gm-Message-State: AOAM530qxqpp8oMsbikP1P3at4/Pi3H+zL27PLucUKEk8YvQmXLKHcmq
 WmIy+EG8Br110WG9b19B6g==
X-Google-Smtp-Source: ABdhPJwI6HZZicgtT7n4tnN+YTEXRTNNsEMQBJKkWbmNeJZz/g6ItcbzCpRTBS5ZEPqb8fgrNUKVSw==
X-Received: by 2002:a05:6871:887:b0:ed:4b3b:2bc4 with SMTP id
 r7-20020a056871088700b000ed4b3b2bc4mr790934oaq.278.1652207001018; 
 Tue, 10 May 2022 11:23:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m13-20020a9d400d000000b006060322126bsm5874079ote.59.2022.05.10.11.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 11:23:20 -0700 (PDT)
Received: (nullmailer pid 2333804 invoked by uid 1000);
 Tue, 10 May 2022 18:23:19 -0000
Date: Tue, 10 May 2022 13:23:19 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <YnqtlwXwKgrvngGf@robh.at.kernel.org>
References: <20220509134658.16267-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220509134658.16267-1-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: clock: stm32mp1: adapt
 example for "st, stm32mp1-rcc-secure"
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

On Mon, May 09, 2022 at 03:46:58PM +0200, Alexandre Torgue wrote:
> For "st,stm32mp1-rcc-secure" schema, clocks and clock-names entries are now
> required properties.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Assuming this works in arm-soc tree,

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
