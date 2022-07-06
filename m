Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA718569591
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Jul 2022 01:01:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73912C5F1ED;
	Wed,  6 Jul 2022 23:01:24 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01A8EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jul 2022 23:01:22 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 73-20020a9d084f000000b00616b04c7656so12841477oty.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Jul 2022 16:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rpwT695sri6PiwsIkplM0soIt4K0mTDGGLf39HX2spg=;
 b=uKjdq0V5eouKVnrAAYAbsAu3IBu4GWoTr43gC/txIyOiyoDdYSq4NSWMfHNr16VW5I
 qhG3M6Pph86HRsSdxnaqAuW6Jtl9vnvqR2zOFam2ThLCyeuxpchA2I5V97ahx0ndaKrF
 5OCJEwvjUIjvQfGVrfMp24EuX1385IaBQcnEiyeR7PRsUr+C/OO6LUaJoD5/94Jr01XU
 lZ7NZWsMQR104HBk32qEm18kyhQr+UXMpbSo5ukAOG15/tAE0hD1A4jbbhIE2S4ZfviC
 TieI/v5ReU8cJBDi1L/0SnzhQixKeH+DKdM6KCzCpfi8cfsBJmFBoe5lALy3CCo+31In
 Nizg==
X-Gm-Message-State: AJIora8x9dup1S/X5N8b4JFifs2BR4TmXXEhMLa80wZJzdqLXHtuIKhY
 M4ByBtSPwCNOibYm11Rzsw==
X-Google-Smtp-Source: AGRyM1sZ6SEM/+/Qq2SjdTe5pzaMC4OLV2H6/yij1GibQKAOaL4bQj6xoE8l6Oe89u5hgaHGcDS/tQ==
X-Received: by 2002:a9d:7646:0:b0:616:c17c:7d26 with SMTP id
 o6-20020a9d7646000000b00616c17c7d26mr19384810otl.83.1657148481842; 
 Wed, 06 Jul 2022 16:01:21 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:5fe0:199f:283a:d3be:fc5c:70cd])
 by smtp.gmail.com with ESMTPSA id
 v39-20020a05687070a700b0010c3b371098sm25324oae.27.2022.07.06.16.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 16:01:21 -0700 (PDT)
Received: (nullmailer pid 673503 invoked by uid 1000);
 Wed, 06 Jul 2022 22:46:13 -0000
Date: Wed, 6 Jul 2022 16:46:13 -0600
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
 mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, fabrice.gasnier@foss.st.com,
 amelie.delaunay@foss.st.com
Message-ID: <20220706224613.GD572635-robh@kernel.org>
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
 <20220620105405.145959-2-alain.volmat@foss.st.com>
 <20220628134115.GA345270-robh@kernel.org>
 <YryrpbBKsAKcL865@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YryrpbBKsAKcL865@shikoro>
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: i2c: st,
 stm32-i2c: don't mandate a reset line
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

On Wed, Jun 29, 2022 at 09:44:37PM +0200, Wolfram Sang wrote:
> On Tue, Jun 28, 2022 at 07:41:15AM -0600, Rob Herring wrote:
> > On Mon, Jun 20, 2022 at 12:54:02PM +0200, Alain Volmat wrote:
> > > Update the dt-bindings of the i2c-stm32 drivers to avoid the
> > > needs for a reset property in the device-tree.
> > 
> > That is clear from the diff, but why. Some chips don't have a reset? 
> > If so, this should be combined with patch 2 as part of changes needed 
> > for a new version.
> 
> What do you mean? Patches 1+2 should be squashed together? I can do this
> when applying. Or do you mean something else?

Sorry, I meant combined with patch 3. If the new chip added in patch 3 
doesn't have a reset, then 1 and 3 should be 1 patch. IOW, all the 
changes needed for a new chip in 1 patch.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
