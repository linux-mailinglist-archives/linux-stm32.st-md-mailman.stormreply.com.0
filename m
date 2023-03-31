Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4E6D2A1F
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 23:46:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53CE6C69069;
	Fri, 31 Mar 2023 21:46:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 468B8C69069
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 21:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680299180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lcrUOTtZQ8Y8eq1MxEjtzOYPZBObLg5qooJNdijlKM=;
 b=GXDHNb8/dq6tkIxXL2wzRDdqReBxZgIx1uDyah2G+oWMFo5waYCpu0SAzDSsqwp4x06H2o
 YiWmsMDz6Vm+nu71MeEgHnSY8P+vVsb/LuFAgLhAzrFa+5S0GydHbBYiY6hCNd5HAxLGp7
 mXsQRVAPSrX21W3p3X7Ha6vmyoLlQ44=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-2uk05yUyMIqSQiGEA9UHTw-1; Fri, 31 Mar 2023 17:46:19 -0400
X-MC-Unique: 2uk05yUyMIqSQiGEA9UHTw-1
Received: by mail-ot1-f71.google.com with SMTP id
 f23-20020a056830205700b006a1d2e5b085so1820515otp.14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680299177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8lcrUOTtZQ8Y8eq1MxEjtzOYPZBObLg5qooJNdijlKM=;
 b=clnDMRjAU4emXyH1D2/n9Hzrd+/da1L8dI+1K1FO3q0Kayxn+DmmP9VyGLAySe/3rZ
 g1nM0NNLgEusMfc6/bwLlKYF7jKFEGoRKUTUnKxlHdlEgvh7ZG1FCQwYUjqYMMs/w0aT
 rAPpfdTFufHB/AKQS0YXsy9hUrDlxksJHOI098OomRSUbBSbELku9hWEuE/5RIqXLAmw
 9vUXcdkawXnO/qy1dNaF1RUBjgCUiYGgp06mkzQECdn+96WwaAIxCpqCw0VXmA86idos
 DcFJOb2Iubybk5w34BlDjglJFDGY9IBSd6QUFt04xkxskGsFTE/gK1tzNrTX1d+sVqlR
 FGGw==
X-Gm-Message-State: AAQBX9c0mUuGbQyAi0YMXwVdg2sbwuBM5BrtAo5ua1RhUWlw96CGoRL4
 54Sa8EfLq1tnslYSNZQRnfX74Wi7Q5Jp6nzaZQm+DiO9M+fDeVu5dacEy7H1XXKzHrn1bgv2OvO
 uEO0+qQaS9dg9oBpow4T+P71WShjLMfYbL8MIRyTZ
X-Received: by 2002:a9d:6a4a:0:b0:6a1:6cf9:49ee with SMTP id
 h10-20020a9d6a4a000000b006a16cf949eemr4413159otn.9.1680299177279; 
 Fri, 31 Mar 2023 14:46:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350aUQ7W33R935fGo9TuSQD3HX9RxY871Aop63H4kyUDTxL9RxaeaTlk4Ws52w4rzbyNf1gKQ5Q==
X-Received: by 2002:a9d:6a4a:0:b0:6a1:6cf9:49ee with SMTP id
 h10-20020a9d6a4a000000b006a16cf949eemr4413139otn.9.1680299177094; 
 Fri, 31 Mar 2023 14:46:17 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 x80-20020a4a4153000000b0053d9be4be68sm1328531ooa.19.2023.03.31.14.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 14:46:16 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 31 Mar 2023 16:45:39 -0500
Message-Id: <20230331214549.756660-3-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 02/12] dt-bindings: net: snps,
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

Changes since v1 and v2:
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
