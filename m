Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B5454FE74
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jun 2022 22:38:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 022C0C5F1F9;
	Fri, 17 Jun 2022 20:38:13 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07F59C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 20:38:10 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id h5so1581480ili.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 13:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WxC8y4xgzpsGIQGT5vC3MH6pL5FDuKzI7XWPboiHFXc=;
 b=pbSDjoiIC8+o4ELf9uClKz15HJM+2RCsDLDTCBGZUA/bvpZQM/8Djy8chyFkiRaNhq
 nzYQxy05NoiC/dqWmxkbuOVy13uUhNysltkasRy2g0At9MAJd7nMUkwTJnL3tKBY0IbR
 Z1ZIXqv2UBazcKQcjQIO5QW5BRP9ZndlshtsDPCP886VHZ2OC0vuSY+EKgLEUPSJRGhT
 v/pI8cE3A6tdifvwmmAphRFN2/k93F74SbsjNaOt1gII8wlO4nUda47SLWWgOZ9wLLa+
 i+RoI+mMAUJv+Y8axw0ePD5U7a3mGrTe8aFpWkrjtsWpdMJCGUHscysq+avQ9hUZYTHB
 zF7w==
X-Gm-Message-State: AJIora+n2JFohg0SFMD8s24O16g6KUGQpZNYwH5+K9r8BJbNEUDdS7OK
 DyZZqdZkpGYVGdoMnDRfyg==
X-Google-Smtp-Source: AGRyM1tRfGyyxlHmt6DVN6C8QJwoAzdTs2WSfZKnyY/mpeCUg4tFUo332pxr0ovhLfFD051ISEv6SA==
X-Received: by 2002:a05:6e02:1188:b0:2d8:c8cb:3fd0 with SMTP id
 y8-20020a056e02118800b002d8c8cb3fd0mr6715419ili.150.1655498289906; 
 Fri, 17 Jun 2022 13:38:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 l124-20020a6bbb82000000b006694bc50b82sm2991817iof.35.2022.06.17.13.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 13:38:09 -0700 (PDT)
Received: (nullmailer pid 2402049 invoked by uid 1000);
 Fri, 17 Jun 2022 20:38:08 -0000
Date: Fri, 17 Jun 2022 14:38:08 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <20220617203808.GA2400871-robh@kernel.org>
References: <20220613093815.18334-1-alexandre.torgue@foss.st.com>
 <20220616175531.GA3716982-robh@kernel.org>
 <abf9247c-085b-05ff-a589-d9b190e88666@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abf9247c-085b-05ff-a589-d9b190e88666@foss.st.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rcc: stm32: select the
 "secure" path for stm32mp13
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

On Fri, Jun 17, 2022 at 09:21:40AM +0200, Alexandre TORGUE wrote:
> Hi Rob
> 
> On 6/16/22 19:55, Rob Herring wrote:
> > On Mon, Jun 13, 2022 at 11:38:15AM +0200, Alexandre Torgue wrote:
> > > Like for stm32mp15, when stm32 RCC node is used to interact with a secure
> > 
> > 'st,stm32mp1' is stm32mp15?
> 
> Yes "st,stm32mp1-rcc" is for the STM32MP15.
> 
> > 
> > > context (using clock SCMI protocol), a different path has to be used for
> > > yaml verification.
> > > 
> > > Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > 
> > > ---
> > > 
> > > Hi Rob, Krzysztof,
> > > 
> > > If you agree with this patch, I'll apply it directly in my STM32 tree.
> > > 
> > > Thanks
> > > Alex
> > > 
> > > diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > > index f8c474227807..242fe922b035 100644
> > > --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > > @@ -78,6 +78,7 @@ if:
> > >         contains:
> > >           enum:
> > >             - st,stm32mp1-rcc-secure
> > > +          - st,stm32mp13-rcc
> > 
> > You don't need '-secure' because it's always secure?
> 
> Yes. Compare to STM32MP15, the STM32MP13 is by default "secure". In our case
> it is "mapped" to OPTEE, using SCMI protocols.

Okay,

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
