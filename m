Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F35B5223D1
	for <lists+linux-stm32@lfdr.de>; Tue, 10 May 2022 20:22:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 417CAC03FC2;
	Tue, 10 May 2022 18:22:25 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1D3CC03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 18:22:23 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-ee1e7362caso15177847fac.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 11:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5eaxIUkfRDs5zSochol4WtIm5357tYweJMGDFI2u4pU=;
 b=WgCJKEMWxA64tlvMQKfxP6HLmEgXIYrZLUtfnkmVs/KO+w+zAQka399rLt+rh/OgJ1
 poTti+h896cvvTZIdHPb0YzWFwXSYwZgoKxmVeUB2sWVybAyMxnagQW98Ps9whAAsc+3
 oQgol7sRRhAybWhMTE1180oIrsF/njbpZEEuYr8j3BynQeWDxlmLgXzlQn5uirtXyFc+
 bOtqGT2gJPQg/fNiah5/Y25rIhN6HB/jB91e9aRSa17fJox3ul2TmRW+oTEWCkEzgTc1
 VmhNY8POdI2KKT/gTG6UVQnL+QxICiT+WumOj4xxEZ0q1gx+UHtdS2Vix0Sfg86q749w
 wrvQ==
X-Gm-Message-State: AOAM531L2G1ktd2Q1CfomAxcmfwE7D7HwvovB8c3lLTPxAftusGFwvd4
 zDc31vBpantAK2Gsc6SCqg==
X-Google-Smtp-Source: ABdhPJzS4rbTDp32QJIoRssqYEpMJ/7t5ksogGydtS0hdk3+FTzqaG5lGb+rFO7ig2cCi/AXJcUl8Q==
X-Received: by 2002:a05:6870:e613:b0:ec:6564:c7c9 with SMTP id
 q19-20020a056870e61300b000ec6564c7c9mr787852oag.230.1652206942446; 
 Tue, 10 May 2022 11:22:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k2-20020a056870570200b000edae17a8cesm5974143oap.3.2022.05.10.11.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 11:22:21 -0700 (PDT)
Received: (nullmailer pid 2332088 invoked by uid 1000);
 Tue, 10 May 2022 18:22:21 -0000
Date: Tue, 10 May 2022 13:22:21 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <YnqtXa+NhVUH0oyi@robh.at.kernel.org>
References: <20220509134658.16267-1-alexandre.torgue@foss.st.com>
 <1652123805.754133.27398.nullmailer@robh.at.kernel.org>
 <ddd5d5b2-32a5-6464-80a6-0054c376dd96@foss.st.com>
 <Ynp9Pu+ZqjaBu8ne@robh.at.kernel.org>
 <b64e6662-5fd2-5223-1e25-15217d75d06a@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b64e6662-5fd2-5223-1e25-15217d75d06a@foss.st.com>
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

On Tue, May 10, 2022 at 06:44:19PM +0200, Alexandre TORGUE wrote:
> Hi Rob
> 
> On 5/10/22 16:57, Rob Herring wrote:
> > On Tue, May 10, 2022 at 09:47:05AM +0200, Alexandre TORGUE wrote:
> > > Hi Rob
> > > 
> > > On 5/9/22 21:16, Rob Herring wrote:
> > > > On Mon, 09 May 2022 15:46:58 +0200, Alexandre Torgue wrote:
> > > > > For "st,stm32mp1-rcc-secure" schema, clocks and clock-names entries are now
> > > > > required properties.
> > > > > 
> > > > > Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > > > 
> > > > 
> > > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > > 
> > > > yamllint warnings/errors:
> > > > 
> > > > dtschema/dtc warnings/errors:
> > > > Error: Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dts:27.33-34 syntax error
> > > > FATAL ERROR: Unable to parse input tree
> > > > make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dtb] Error 1
> > > > make[1]: *** Waiting for unfinished jobs....
> > > > make: *** [Makefile:1401: dt_binding_check] Error 2
> > > > 
> > > > doc reference errors (make refcheckdocs):
> > > > 
> > > > See https://patchwork.ozlabs.org/patch/
> > > > 
> > > > This check can fail if there are any dependencies. The base for a patch
> > > > series is generally the most recent rc1.
> > > > 
> > > > If you already ran 'make dt_binding_check' and didn't see the above
> > > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > > date:
> > > > 
> > > > pip3 install dtschema --upgrade
> > > > 
> > > > Please check and re-submit.
> > > > 
> > > 
> > > I just updated dtschema and yamllint seems to be well installed. I don't see
> > > the see above. I wrote this patch on top of my stm32-next tree. Do I have to
> > > send it directly to arm-soc in order to be merged on top of my latest
> > > pull-request ?
> > 
> > That appears to be header related AFAICT. Maybe you have header changes
> > in your tree. The issue this is fixing is in your tree, so it should be
> > applied there.
> 
> Ah yes! CK_SCMIxxx have changed in my tree (merged in arm-soc tree) and this
> patch is done on top of this change. So has to be applied in arm-soc.
> So I just have to send it directly to Arnd and arm-soc ?

If you don't have a fixes branch for them (or one that will be pulled 
soonish), then yes.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
