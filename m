Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C3B6B7E4D
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:57:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 733BEC65E5A;
	Mon, 13 Mar 2023 16:57:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1385C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678726645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOcsF4tnS6k1nG+I3+/hCEkdwUCH/vj5+6sHXcjYo8o=;
 b=C3geN97q6tGx1sfjy0/Ynin1+VvE4OVFJZ/c0NnbyJ5yBdPU8htJt7K9IEYpXwYVgBlUiq
 GTW+mK/kciFzkMUEi2733T8wM6AB1ilg469FQ/dft+6X6upjvjsPV3czsfHRSaTSoagapv
 0uNYUgn1V+xBQ/5p0p2R9PnaI68RWz0=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-hTJeOj7-NeSd2NrEE38vgw-1; Mon, 13 Mar 2023 12:57:25 -0400
X-MC-Unique: hTJeOj7-NeSd2NrEE38vgw-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1765e2031ccso7501082fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOcsF4tnS6k1nG+I3+/hCEkdwUCH/vj5+6sHXcjYo8o=;
 b=A2YfB21GBEOnKOvnLcn3jxMGMVDWn4NNHA0d5y15N7+R6wnEQAP2FzWt0XQnMogsZ/
 oflUFeSN3KWOk1UrgdkoinEpjC3PYUoZq2YTR3xqddIddC+t7dKnQH4SeAUTfB2CanpD
 JnUbKkoJnsXulwDAH54ngiB7yVifnMe03DGLqBkZvFMnC3CAEhva0RNOQdDx9zJyQvGx
 uOZaa2p87rcWmM5CLMJONqMl6q0VlN6Ry0ABrmlPZ464nEYe7drQYRTKyRZ6l4pjp6xC
 q45jbtWZy4UEgwTMil3fvNTlpdSCQ5SkQPhDzQVnz5dLzrgKFpAK8kzYjhspS2DqRyaS
 +Ukw==
X-Gm-Message-State: AO0yUKUVoIA+tMCQ/CeQciwRl7ctBZRbdsLE59CA9OFQ4/hz5RYIXJH4
 8rj+2tycBRMk7euWZBpeVmJWu4JGhmm8QM0ZcPJCgrp3PF3z6C56zvq53nASX4QFFaoUA0cg1xx
 YjhfqEgjIzpyrLCEfwGdJ/jTwvUTK9bz8bnd++Ltu
X-Received: by 2002:aca:190f:0:b0:383:caf3:a30e with SMTP id
 l15-20020aca190f000000b00383caf3a30emr15249952oii.17.1678726643031; 
 Mon, 13 Mar 2023 09:57:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set85oH1vWCZvr9VmhYS81pq72TuOP89pm0eNesoHATb65m1WlepR/ukthKK/bKkyu3w52zg7AQ==
X-Received: by 2002:aca:190f:0:b0:383:caf3:a30e with SMTP id
 l15-20020aca190f000000b00383caf3a30emr15249900oii.17.1678726641268; 
 Mon, 13 Mar 2023 09:57:21 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 09:57:20 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 11:56:10 -0500
Message-Id: <20230313165620.128463-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next 01/11] dt-bindings: net: snps,
	dwmac: Update interrupt-names
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

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
interrupt error msg") noted, not every stmmac based platform
makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.

So, update the 'interrupt-names' inside 'snps,dwmac' YAML
bindings to reflect the same.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

I picked this up from:
	https://lore.kernel.org/netdev/20220929060405.2445745-2-bhupesh.sharma@linaro.org/
No changes other than collecting the Acked-by.

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 16b7d2904696..52ce14a4bea7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -105,8 +105,8 @@ properties:
     minItems: 1
     items:
       - const: macirq
-      - const: eth_wake_irq
-      - const: eth_lpi
+      - enum: [eth_wake_irq, eth_lpi]
+      - enum: [eth_wake_irq, eth_lpi]
 
   clocks:
     minItems: 1
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
