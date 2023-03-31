Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 850A96D2A1E
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 23:46:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45BDCC69069;
	Fri, 31 Mar 2023 21:46:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 544B2C6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 21:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680299177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWAjKcn7KmjDYRHOryY9yAx4ZqStu9DbyRutO1cNTys=;
 b=RJb/g7VAYMR7AL8SBnVpWgQUz3B+y6gDzW59JBGv367j00XpwtonLJhq5dimELFxbXI5cq
 EwfzsOomESGVj+ZR7bejoKMyFp9ssU33+ny2XcGptPGs8EJ99zdHkqLZg/VwxFMDhZtM0z
 InRF85ekBCqJN6vqhWmS2N1HKk97Bk8=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-w50SXWhNNoSjA7rgSZUcWw-1; Fri, 31 Mar 2023 17:46:14 -0400
X-MC-Unique: w50SXWhNNoSjA7rgSZUcWw-1
Received: by mail-oi1-f200.google.com with SMTP id
 q127-20020acaf285000000b00386dec7a02bso5730514oih.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680299173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BWAjKcn7KmjDYRHOryY9yAx4ZqStu9DbyRutO1cNTys=;
 b=gXILV/YpQu5AiRHS7J8v3fQ0dIVYX20jietLDgDz1+TgcNSYU//uLVikNaIYYI45n2
 93GMiuhmmW3q5dGu5y0yAlYOXP9yBReCFj3W09XzGE7XUnrR4/sgisZzDXlgbxQHW6rW
 WsXmKa8r2hMwKXkHS/M3kLZoXVsXRenjCDnVZ9TJU9nbJzSfMcmyV5w2vLJ/pOGMrU3/
 jP6yUkPZr8+qsKUobgvzV8C8yACApfCWnoBsKBtvAz+uFU3v6puPVDAxUwTb0LB7n/0R
 MKRxrt5RoJzG8hZiXWzjG9GIDL14H5Uw8P8JTrdB/HppKmgmUaC5UoKdQ0ylUmsvRMa2
 NZSQ==
X-Gm-Message-State: AAQBX9dSay1/frq0w7/K0zVZUctaEJSW+S4HJmO0bR1cb6RoNbdfhTk7
 lpRbSBJ6/cEOfNGYjc1mlnesyo4h4bR/qMoVKX/U/qH2lJgQgzAFVXmUcFtnWfOuEH0tLVxpVob
 +9sR89ikcc42O4+8JFV5Nr6HEcH137V/X5dWNmBoO
X-Received: by 2002:a54:4519:0:b0:389:2d2b:4b1b with SMTP id
 l25-20020a544519000000b003892d2b4b1bmr8396903oil.43.1680299173525; 
 Fri, 31 Mar 2023 14:46:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zx2tJIil7EtW85aEQyo8RTGjEHt7aKU8TOLaUPn71QidrVG+oC5h5rPNpRYe4KMVFNW/3RtA==
X-Received: by 2002:a54:4519:0:b0:389:2d2b:4b1b with SMTP id
 l25-20020a544519000000b003892d2b4b1bmr8396874oil.43.1680299173054; 
 Fri, 31 Mar 2023 14:46:13 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 x80-20020a4a4153000000b0053d9be4be68sm1328531ooa.19.2023.03.31.14.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 14:46:12 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 31 Mar 2023 16:45:38 -0500
Message-Id: <20230331214549.756660-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331214549.756660-1-ahalaney@redhat.com>
References: <20230331214549.756660-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v3 01/12] dt-bindings: net: snps,
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v2:
    * Add Krzysztof's Reviewed-by tag

Changes since v1:
    * Dropped Krzysztof's Acked-by since changes requested
    * Changed interrupt-names items per Krzysztof

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 74f2ddc12018..5a4737e969a3 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -105,7 +105,7 @@ properties:
     minItems: 1
     items:
       - const: macirq
-      - const: eth_wake_irq
+      - enum: [eth_wake_irq, eth_lpi]
       - const: eth_lpi
 
   clocks:
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
