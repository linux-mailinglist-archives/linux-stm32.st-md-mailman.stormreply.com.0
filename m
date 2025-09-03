Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB84AB419D4
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 11:25:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28157C3F95F;
	Wed,  3 Sep 2025 09:25:05 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC5A4C3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 09:25:03 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-807e414be94so110573585a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Sep 2025 02:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891502; x=1757496302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xww/iHCRl4Br2j+u3kaOpXoF0IPDaTQthPF3CkkfnBg=;
 b=rPHckIVnQqRqxigWr6nqAMQEerLt40RzXzliVn8ZLGp2IF1i9A7nmW6zEyxdgwEy6E
 cNdQwCJEVw86vuQg1Q/Udo08alXzEHPvIFGV+LQEOkn4CaoOWU+EFEU2EHs2tGkBuM+w
 mn5YY3Daum9bMiiLdTO5A0Jr2F9EArUjOETBIcomaTJ2JVfoAC0RHaW1Mg6rJuw05TMo
 wnLqzr70SvQQO9KAGwX2My3J/+kHR+gJ/Faye1Qc1A0hs5WGcrRluuh8iewrGWmtq57l
 +h3uy6b/548RvA1SJzSaNub0GovI6oQOYyFBcYm7BldnAjuwLp97UPkQf4yKgO833Q7q
 lnNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkMFhzMcEYA74cHj8RU1hN97ilEZZ5KEk0ZlnAzJmOBJLuVNn0YRHBsN6Maccq/E62lkaiQ4BY2s52Ig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyltOWFo3vgBRhCJNHiOx0Y9xT1aSh1o/446n1+1vIi9MRiKtWN
 hfhW6dh6xVXcknCPDb36Rf9FiKeW6ig558y7uJAIvE9OiV/FuiA3GVJSlW4MORvy
X-Gm-Gg: ASbGnct3Ng8fVhuOdbt/8ZwMTivhBttsIorYl5qcdhg5I+613o+fzamcKshBLeJ8p0Y
 flmBQyLbQmhJBOMGSCQbjYdsY7dLuS/qMKpeSXf+icRHOFjHIICwPbFiYXML9aM2GxmS0FuE61A
 kiQm3rMZrqs8LJQNd11lzakzVUHmtIa/FUe0AdT9oqcg8FoX60n2fq11DZSAbfBwkKEuA8C3k+R
 9R9X6vrAlZUE4Ty4z0mM7Ibu2BRlixWwh/cpA0CLqQFCF1nUE/Soezx7P+Xt4b45j1vQsnzyYgf
 8kPrEjGJcBqzOquiLcHwI1YurdzO+Ul4/2p64ao05l2vVKSa/GhDQAUwC8YItcLiCyp28xbEtYV
 L1NL0gBdvxd5AUZ9GvHVVFPTklVNecAvLEplgEs1FPg54S1KEUqMZJ1hR72pWrTPoKmrp/vZYVr
 Q=
X-Google-Smtp-Source: AGHT+IGMaqYi5MYFBrxPrCRsQe+G0YdhAq2/mQ+pRGf4CNuJRh7zocSnO7W8VZuGZ2vfIfA94RT9bg==
X-Received: by 2002:a05:620a:4612:b0:806:2aeb:69c7 with SMTP id
 af79cd13be357-8062aeb6afdmr699128885a.62.1756891502332; 
 Wed, 03 Sep 2025 02:25:02 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com.
 [209.85.222.173]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-80aac142328sm81340085a.62.2025.09.03.02.25.02
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 02:25:02 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-805a55c09aeso201210885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Sep 2025 02:25:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHUi1s6GPano2I+9flEp3hYG/ufzt5L+kRTFSXr3xRDyB4PRLVlnxegX1UbTUy6/RkWg9YtlmyKyLNCQ==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:54a4:b0:522:1013:cace with SMTP id
 ada2fe7eead31-52b19a5277emr5076476137.10.1756891107431; Wed, 03 Sep 2025
 02:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
 <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 11:18:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXT35qvPNyjegzhCysA7kRY3fTWSWy4GZ=TZ7FG1JpKQw@mail.gmail.com>
X-Gm-Features: Ac12FXy7CQvB1AiVQKpvJM9u_WFe4oPUM6ax2MBP4KMifXDrnlzAsDa3ZqgU8bU
Message-ID: <CAMuHMdXT35qvPNyjegzhCysA7kRY3fTWSWy4GZ=TZ7FG1JpKQw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: net: renesas,
	rzn1-gmac: Constrain interrupts
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

On Tue, 2 Sept 2025 at 17:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
