Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA73521D43
	for <lists+linux-stm32@lfdr.de>; Tue, 10 May 2022 16:57:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B546C03FC0;
	Tue, 10 May 2022 14:57:06 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81B1EC035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 14:57:04 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id r1so18780994oie.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ap6ylfqMwi8yDjngmCG5tOOg9ip9yvHb2ovQ9serW2k=;
 b=rCejzNHWrd893azeSH5GIuWbwEPXa50x0Ajng770W+8L0u3Wi5aPyh1QuZH68LEKkr
 QTFRx3Ae7doQL/9K5wJXjDcn8VSOCWafZOe7aHl0WIibJBhWItYbE2tth/Ceitshu4Xl
 liC08Yui01onlcwEOaI0sc+lGRjNtu7tLLWuyp5/3xbBBcelfwa4xePjQA8+ral3kDdX
 RqtRwop7i+kqB99B3vmclmHWDmYawK5EoRfVvfa2uqav6vqAsBZ+YQPHPlersZYaT/FV
 j2lpFdijn1ezvNzeWMi9w8grmRqL6yKzgfzUxhu7BGff/NXfSP4xwyjcRQLO0XYDXhdY
 ce8Q==
X-Gm-Message-State: AOAM531vBZLcWJUyOhU+DFioWIdxMYgz78ddz4V+gW6t+X4RAe17YbCE
 y4th/JPt/9fbMnLx+NGxUA==
X-Google-Smtp-Source: ABdhPJyNR1Dzo0YBqlKSswmacA759cXut1FMrzx83tJFzR+WrBQuB/xMR6Bvv+0cKGWRDkahD6/RYw==
X-Received: by 2002:a05:6808:d54:b0:326:d355:69c0 with SMTP id
 w20-20020a0568080d5400b00326d35569c0mr227188oik.121.1652194623263; 
 Tue, 10 May 2022 07:57:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k22-20020a4a8516000000b0035eb4e5a6b0sm2711967ooh.6.2022.05.10.07.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 07:57:02 -0700 (PDT)
Received: (nullmailer pid 1994439 invoked by uid 1000);
 Tue, 10 May 2022 14:57:02 -0000
Date: Tue, 10 May 2022 09:57:02 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <Ynp9Pu+ZqjaBu8ne@robh.at.kernel.org>
References: <20220509134658.16267-1-alexandre.torgue@foss.st.com>
 <1652123805.754133.27398.nullmailer@robh.at.kernel.org>
 <ddd5d5b2-32a5-6464-80a6-0054c376dd96@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddd5d5b2-32a5-6464-80a6-0054c376dd96@foss.st.com>
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

On Tue, May 10, 2022 at 09:47:05AM +0200, Alexandre TORGUE wrote:
> Hi Rob
> 
> On 5/9/22 21:16, Rob Herring wrote:
> > On Mon, 09 May 2022 15:46:58 +0200, Alexandre Torgue wrote:
> > > For "st,stm32mp1-rcc-secure" schema, clocks and clock-names entries are now
> > > required properties.
> > > 
> > > Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dts:27.33-34 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dtb] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1401: dt_binding_check] Error 2
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/patch/
> > 
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit.
> > 
> 
> I just updated dtschema and yamllint seems to be well installed. I don't see
> the see above. I wrote this patch on top of my stm32-next tree. Do I have to
> send it directly to arm-soc in order to be merged on top of my latest
> pull-request ?

That appears to be header related AFAICT. Maybe you have header changes 
in your tree. The issue this is fixing is in your tree, so it should be 
applied there.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
