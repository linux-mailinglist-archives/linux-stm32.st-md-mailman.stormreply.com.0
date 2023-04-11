Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EB26DE53D
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 22:04:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF806C65E4F;
	Tue, 11 Apr 2023 20:04:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9911EC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681243481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxbCAB/8HzlpJB8LqCEaUSfegFqXseWfZCk3ZTKeLVg=;
 b=TS8gWfL7btchnKdHwGMQR8fyUsKooSk06rbGGfOl43c1/cp8KptRNgMZlFnf1b/14/JDVW
 nMf8rhue7GAwQKizKvYriZZBbx7ff2PRRn6BZwPe9ee8DtcwWdg+VnU4lJHbb4zzkRYk6k
 rG6ZVWV1hRgnM/7+lClYmhbeQcy2c3o=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-hUl7kw7pPsu5QRZTtCNhdg-1; Tue, 11 Apr 2023 16:04:40 -0400
X-MC-Unique: hUl7kw7pPsu5QRZTtCNhdg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1843282ca4aso4879688fac.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 13:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681243477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxbCAB/8HzlpJB8LqCEaUSfegFqXseWfZCk3ZTKeLVg=;
 b=Lo7Ccvv2pMOC9vatgBhck/OPXMguq/kgTcR0qJQmTAr4fx0GpBYWNBUkahJQlLr6wM
 bC7HsA6sxAyle5fbmEGt9pYAGz+VGCx3I2RyJPixVeP4QDox3Uay6UjMApCmFubZh48M
 wapwAI+SrEws9eqdKYFJtzvPmc+WOqvuaQoOuw9QqIKBzRinUlgJAIEVKF2e35f/RUsO
 ykhQkAStjezvihYTCNSEa5ii1TcxezGCFqLto/izZHOF5O1D1JrbdKjpSHH4jf41rjXt
 6NHJT4O+UV/DK+G2xFJxVSajM1AeuYFed2W1euJoitLyzeU6ejwwx07tAMAmeg5ZTWHb
 y/zg==
X-Gm-Message-State: AAQBX9f4o1C2GESymVmb/GtuuMYAMIxe6YuAmpodbu42/wGWxZBbP1EF
 EZlTubvyS5/qzGKvZiwtOM5rOqiJGWvrVvzHc0sI/oQ7gC8MWjeo6IccK4ZoA4MPD625gvNd1MT
 1WqurHc/zAKbYaOVelC87yDH/OcZPtW9Acc7ZpDNL
X-Received: by 2002:a05:6808:4ca:b0:384:1e0c:fbbf with SMTP id
 a10-20020a05680804ca00b003841e0cfbbfmr1731003oie.40.1681243477432; 
 Tue, 11 Apr 2023 13:04:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350bi3pa6TdrWMyJhhKoNUuP9LYHu6k08zIXOEEGyiC+/nSaxJEVgCmNNNshInHIbaG9sgMjbfQ==
X-Received: by 2002:a05:6808:4ca:b0:384:1e0c:fbbf with SMTP id
 a10-20020a05680804ca00b003841e0cfbbfmr1730980oie.40.1681243477101; 
 Tue, 11 Apr 2023 13:04:37 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 13:04:36 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Apr 2023 15:03:59 -0500
Message-Id: <20230411200409.455355-3-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 02/12] dt-bindings: net: snps,
	dwmac: Add Qualcomm Ethernet ETHQOS compatibles
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

Add Qualcomm Ethernet ETHQOS compatible checks
in snps,dwmac YAML binding document.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1/v2/v3:
    * None

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5a4737e969a3..1e7982704114 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -65,6 +65,8 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - qcom,qcs404-ethqos
+        - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
         - rockchip,px30-gmac
@@ -625,6 +627,8 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,qcs404-ethqos
+              - qcom,sm8150-ethqos
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
