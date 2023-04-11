Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 095AE6DE53C
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 22:04:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0AB2C65E4F;
	Tue, 11 Apr 2023 20:04:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65F19C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 20:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681243473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeRMoDwNgHrXxiMag5H3EfyVB1iYobNV8jx2yu9ZLd4=;
 b=dGAB8m0ykpKCSiLiBJ8EAwWgw+VUlCjfVvEskXbOzlNQc8xHjFBqGeg8AFNtCKvDc9t3CV
 jPVrcodcnXk3sSzU5u0pAfMmxVo4+s2xUdHgbGUz2C75BQgz8IaTsuKyoeMkDdnX5FY5L6
 Vuzd82Tq3FH0kw9WPqw81ds4PDoLUHw=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-kLlBODYqN2Cipp10yGHMLg-1; Tue, 11 Apr 2023 16:04:32 -0400
X-MC-Unique: kLlBODYqN2Cipp10yGHMLg-1
Received: by mail-oi1-f197.google.com with SMTP id
 cg17-20020a056808329100b003890ca8e7faso2267765oib.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 13:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681243472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YeRMoDwNgHrXxiMag5H3EfyVB1iYobNV8jx2yu9ZLd4=;
 b=4+b0PlLBOvDH957hZjj8W/ZViNGPgUp6U3j1JZ/PHzJSBMRXP6oHe1Lj/a/1Xav17H
 hF3JSn2JgEWbO7QdCeU1/mbi93aq3flobgSIHV6rTMoGHQ2kaNhaS0L+NsFpFM/dKmvY
 +5UNMCXn4hsYF8aHPSIQlayFBsf+2TD0Zn6oigJEy+lULXyxKdnagUWdT0AEooglVmcr
 VkRNy1vHpJvPosDCFIJuGFAsPZBzBO7MRqB/KNa4qFTezJEGoq2l7hpKmeHuPqHVdAbI
 diAHVdvhElxcx4RoCYZTmu7Z9CsARwcrVkAbXvd4wGRniLrfBXKRPoiJcFbvpizLJHwL
 BfVg==
X-Gm-Message-State: AAQBX9e+XrGTc8ITDzbeRW+Ag+ILGuiZsnbH0ilbbtVEIbpWbhIC3wmB
 Ihdf/OTdSQPjAKs5jFq+Yw3/G14OU/uMGuaVIl3rV4ZnhGnZE0U7zbTl/YROkBDIAs7pBrtYZh1
 H6r0upJs6sF5qU8LqhtNMo9l0dZPs0msQcYgDLcMO
X-Received: by 2002:aca:be88:0:b0:387:11d6:d48d with SMTP id
 o130-20020acabe88000000b0038711d6d48dmr6269978oif.37.1681243471831; 
 Tue, 11 Apr 2023 13:04:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ayqSH+7Hj8HEiFSaaeuV9ioyjXPt4cbYwGEzo7vQ16BMv3GHZIKe3My4U0lgrvHGPyDqwn4A==
X-Received: by 2002:aca:be88:0:b0:387:11d6:d48d with SMTP id
 o130-20020acabe88000000b0038711d6d48dmr6269958oif.37.1681243471614; 
 Tue, 11 Apr 2023 13:04:31 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 13:04:31 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Apr 2023 15:03:58 -0500
Message-Id: <20230411200409.455355-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411200409.455355-1-ahalaney@redhat.com>
References: <20230411200409.455355-1-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 01/12] dt-bindings: net: snps,
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

Changes since v3:
    * None

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
