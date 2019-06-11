Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F44172D
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 23:52:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24852C58A7E
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 21:52:12 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1AA4C58A7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 21:52:10 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j19so16432406qtr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 14:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3r12qJQBXAuvMT4EwoDNzavCtWYu4iRZchiufeeQkDA=;
 b=cLLpMLcTmNEJAZ0ER027LGV+A214dtSQ8vkv5hwA1InKKowQCC5yo3T3D49ahRjlQE
 oV8M/UkJdiaZdkaTT/RLmbBamumSnX5zHG9jnM0xYZkOnYNXEvfXagRu8SiQbq5+ZSFR
 hXqA6SkEPMxtZGOwjj8+LOR3A6babP+a0O6dnTGjZxQ6Bran2l98aBCg58sZFTIVPfYS
 GmGgovqqdOcwDgYwra5b2A0Cloz9mVCu3AzKNuo9wjrfg4MYV9ZL/Pp80RZkqHjAkK8f
 ojnRhjvAxYGBjI+CgqMzpExEEINuKwZ8/iEYX6K3XjUFuKL9omzK238NLc2bnXi/W9at
 kc5w==
X-Gm-Message-State: APjAAAVdva4TGZdkGD6MNB78xfKxPEGzeNR8cXxsyLD9VCgXlsg8nUBN
 lUNMc6J7rbJMg1G3mVUfqg==
X-Google-Smtp-Source: APXvYqwYg7O90+eWMBJqzuTqXctWOHI40/oJ0GPlNFDUVF6CgMDfl7e03c/8RDgTcCt1Q9vjJvfAkA==
X-Received: by 2002:a0c:b997:: with SMTP id v23mr62799346qvf.128.1560289929520; 
 Tue, 11 Jun 2019 14:52:09 -0700 (PDT)
Received: from localhost ([64.188.179.199])
 by smtp.gmail.com with ESMTPSA id j26sm8645067qtj.70.2019.06.11.14.52.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 14:52:09 -0700 (PDT)
Date: Tue, 11 Jun 2019 15:52:06 -0600
From: Rob Herring <robh@kernel.org>
To: megous@megous.com
Message-ID: <20190611215206.GA17759@bogus>
References: <20190527162237.18495-1-megous@megous.com>
 <20190527162237.18495-5-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527162237.18495-5-megous@megous.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v6 4/6] dt-bindings: display:
 hdmi-connector: Support DDC bus enable
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

On Mon, 27 May 2019 18:22:35 +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> Some Allwinner SoC using boards (Orange Pi 3 for example) need to enable
> on-board voltage shifting logic for the DDC bus using a gpio to be able
> to access DDC bus. Use ddc-en-gpios property on the hdmi-connector to
> model this.
> 
> Add binding documentation for optional ddc-en-gpios property.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/display/connector/hdmi-connector.txt     | 1 +
>  1 file changed, 1 insertion(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
