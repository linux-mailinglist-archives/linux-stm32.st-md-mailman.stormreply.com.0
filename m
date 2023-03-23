Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 523646C6BF3
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 16:11:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED693C6A602;
	Thu, 23 Mar 2023 15:11:35 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80855C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 15:11:32 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id c29so10722918lfv.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679584291;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=09gF+ci4EZ7xKNHFBN4nQXrjScsnzrqt/YgXpgBpcd0=;
 b=Mu76RFZOyAfrq9LEOuqynAliFMXq6UNacOyT2uAPTpnq5G3H+re0Cx4K/gGwiBMVIi
 c/cB37JF5RoQfM4k+LLFb0flTYpNLJD1E9OqFxtJc9XNGb0f6Chyw3Ax/hYXAsgNQEmM
 hPkLk/8WJgpOVjkfW2By4WK6f18UAW+IynBO9hIT17PcpBC79JaazKDFsOnZr2I104Mh
 VSB05qI7RSyU3URsvUBR8qornl8zwj0iyQgPOIpbCqaq0vqoPbaClmMYGGUOgLuevuOT
 kWOtDMygByiviB7puF3lgqpj2y4ovP3fvmPiV2jzjaRFe43U7jLJwRdZycaz7ztObeHH
 B6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679584291;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09gF+ci4EZ7xKNHFBN4nQXrjScsnzrqt/YgXpgBpcd0=;
 b=zVWUKCQEExpuFT9KgL++je19Ofz9z9UykacajXMyePnDiwdWiDqTzKtCOlGMKAdoDn
 j09g2IyJZ8X+geymIFgt2vKQNNC0QsYLyiROff6CSY2xixTvLQIswAF0nJxuMhB3yVGl
 ELzW04cOxPHFlXsDmmszAtHL/ouY4svcqIJvkkR5/q0dcehk7O5sDanWpY9JBewp1cjW
 x2gYCiLhYcWNCuBGRHRZttSC5cjEWPr5H0TRYkqPgooWMgcYFYwZY2cGwcXQVHvbHPC9
 nDNJw21RZU4zhWKBGOrhvbKjAPxHr11ZXy/9GOzbgUuK1UB6lza+RT9B5JfTurF16qxy
 tNwA==
X-Gm-Message-State: AO0yUKW7Uh9I8aC2f1DkWfGJBSq7bIo4bYBeMR7dV9M8Sz437wYNFsTk
 7lU1XMazENgLj3T4egSWtfo=
X-Google-Smtp-Source: AK7set8+y6nFsaRhX1UdZartcuOV9lCKqA6Fzy/bfBfHkNjRTDXtDL4DUFOei4x0Jj1AQNWUtFdkzA==
X-Received: by 2002:ac2:4c39:0:b0:4ea:e688:a04a with SMTP id
 u25-20020ac24c39000000b004eae688a04amr2864973lfq.66.1679584291452; 
 Thu, 23 Mar 2023 08:11:31 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 w19-20020ac24433000000b004eb00c0d417sm150066lfl.130.2023.03.23.08.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 08:10:47 -0700 (PDT)
Date: Thu, 23 Mar 2023 18:10:22 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230323151022.q5h6rf3azbncfid3@mobilestation>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-16-Sergey.Semin@baikalelectronics.ru>
 <20230317205604.GA2723387-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230317205604.GA2723387-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Christian Marangi <ansuelsmth@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 15/16] dt-bindings: net: dwmac:
 Simplify MTL queue props dependencies
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

On Fri, Mar 17, 2023 at 03:56:04PM -0500, Rob Herring wrote:
> On Tue, Mar 14, 2023 at 01:51:02AM +0300, Serge Semin wrote:
> > Currently the Tx/Rx queues properties interdependencies are described by
> > means of the pattern: "if: required: X, then: properties: Y: false, Z:
> > false, etc". Due to very unfortunate MTL Tx/Rx queue DT-node design the
> > resultant sub-nodes schemas look very bulky and thus hard to read. The
> > situation can be improved by using the "allOf:/oneOf: required: X,
> > required: Y, etc" pattern instead thus getting shorter and a bit easier to
> > comprehend constructions.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> > 
> > Note the solution can be shortened out a bit further by replacing the
> > single-entry allOf statements with just the "not: required: etc" pattern.
> > But in order to do that the DT-schema validation tool must be fixed like
> > this:
> > 
> > --- a/meta-schemas/nodes.yaml	2021-02-08 14:20:56.732447780 +0300
> > +++ b/meta-schemas/nodes.yaml	2021-02-08 14:21:00.736492245 +0300
> > @@ -22,6 +22,7 @@
> >      - unevaluatedProperties
> >      - deprecated
> >      - required
> > +    - not
> >      - allOf
> >      - anyOf
> >      - oneOf
> 

> This should be added regardless. Can you send a patch to devicetree-spec 
> or a GH PR. But I'd skip using that here for now because then we require 
> a new version of dtschema.

Ok. I'll send the patch to the devicetree-spec mailing list.

* Note meta-schemas/base.yaml will be fixed in the similar way.

-Serge(y)

> 
> Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
