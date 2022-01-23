Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27905497282
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jan 2022 16:29:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF326C5EC76;
	Sun, 23 Jan 2022 15:29:07 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D1DAC5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 15:29:06 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 z25-20020a0568301db900b005946f536d85so18769834oti.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 07:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/c1j0fg99uD/B38L/tInQcHANZpluiK4u1HRJlmQQGI=;
 b=MO//7ziETx3//E4BBH/jZukj3cUG9gq2W1Jfv7jZfWUThwXrrghqINPnsy7YM8NZNW
 XpSIdSBf2wnn3ZcYMyE5cR/2O4TQpcpkLAHXFZ8A1nVW9NnEaBE0b1XTAFEu3IKvQTb4
 w22WuuTt2bwubYQvW7UCn15gLvc7XJvVvebGu0xHgoTi9aKjmKD9qWkPjXni4+vCliab
 mvL5FcXlf4Wx+WQvqdPQm7kLdAV7h4x0ONL8u2DvAY8sAidoMnM60s2jeXyBcQRm69Lf
 pketpP0wv+CBgnb3eR7f6jfINEBPE3TSh+eI0P3kfFnXrxZSKw2gRFeQLh9CWIrf0ZkX
 GubA==
X-Gm-Message-State: AOAM531UZiyv3Qn4LL9S+xIl0XaldxidXwIV4zhfzX8G4+DabaiLg8F5
 R+EwjRdLFnnu1yQEUEDLQA==
X-Google-Smtp-Source: ABdhPJyjAPiiDh0sizp/c/0tSKvBUcIXWHz3iWLop//vFxT98EGZPiwyxU4l4guTFOeyotiEWfaTIQ==
X-Received: by 2002:a9d:7388:: with SMTP id j8mr3340251otk.180.1642951744989; 
 Sun, 23 Jan 2022 07:29:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g2sm3709240oic.40.2022.01.23.07.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 07:29:04 -0800 (PST)
Received: (nullmailer pid 1428763 invoked by uid 1000);
 Sun, 23 Jan 2022 15:29:03 -0000
Date: Sun, 23 Jan 2022 09:29:03 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <Ye10P+FlVPzsB7jR@robh.at.kernel.org>
References: <20220119174407.3810088-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119174407.3810088-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: stm32-i2c: Move st,
 syscfg-fmp definition to top level
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

On Wed, 19 Jan 2022 11:44:07 -0600, Rob Herring wrote:
> It is preferred to define all properties in the main schema and leave
> if/then/else schemas to just be further constraints on properties.
> 
> Rework the schema to use be more specific for each cell. Previously,
> multiple entries of 3 cells each was allowed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 24 ++++++++++---------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
