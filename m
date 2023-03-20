Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B986C2457
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 23:16:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 730F3C6A60A;
	Mon, 20 Mar 2023 22:16:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73C2BC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 22:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679350604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DO1JoA7rf1NN/v1DlyTM5EYQQrfJrSOpwTi6FaNOaeQ=;
 b=dg/6HvQ58tb620E0BM7TpFtAQs0sFbab2CHn4fKieughqwLi+mizXVUXQlrD1laf+S9ouJ
 OxtfaTlpozGECvuVKeJRtNx2BBDbWZggc/xhJxNlDXEMHKsNV55HxnOUASxoEcIgasjoF7
 iVAnVYtpql0qkD5FEagj/8MXwEsD1f4=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-JBG123LDNSKPGZi48R02pg-1; Mon, 20 Mar 2023 18:16:43 -0400
X-MC-Unique: JBG123LDNSKPGZi48R02pg-1
Received: by mail-ot1-f71.google.com with SMTP id
 f14-20020a9d5f0e000000b0069d8d0ff799so5872267oti.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 15:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679350602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DO1JoA7rf1NN/v1DlyTM5EYQQrfJrSOpwTi6FaNOaeQ=;
 b=cDqp8RKdNJJj2m/QEIEy+xC1lJV+1pfKLM2JpkLGt2bq7x74eah5UMS9SlTnIhxrSn
 Wrh4bWnDt20YzRRZZJkr0v497x7g40Dtg0Sccqv8hjL8uaFc6nkYBqTYHh7pmI/kx63l
 QJIvn1GJiBxirytbTeH8IzRw9BhMwfH3FnGjRhsrbCgFcTVc4oOHOdqgCGT6IIhGp4dX
 TG7mhEcwocvV50uBw0dbyqBlVgSzg4vqlBIBejSCGciepM79w3eFJ4XDQmkTKA6W5B4m
 AGcri8i9AbYpSQCY9Ht3GGHtqpuAIoeKdL27LGAlYK52SApVOpJUmmATZZCIo+oNhuoK
 xnCw==
X-Gm-Message-State: AO0yUKWAQya0fSZdP6OggSU7Wuf5u6qb6J9pvSXtiJEt9+AfQy5Yo2SS
 MKAkH5xXfzdmARq4CzNXQwJQRJH1oFvUl3fpaUHLYNjTQLaF9P9FF5a8MJ8IEHLrS+QVTzdz+1/
 6GIh7yweHUxj1o4g/SgCK+Sd+miYrJ2Sc2Xfk+2j+
X-Received: by 2002:a05:6830:18da:b0:69f:3fd:d03e with SMTP id
 v26-20020a05683018da00b0069f03fdd03emr147161ote.12.1679350602132; 
 Mon, 20 Mar 2023 15:16:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set+WqeyPEu+9Z1p1lpdrw7AyksGa+7Eo7VAfnk6kC1FQXbmvfF3G9lqNRW2EAEBEJNNTLjJb6w==
X-Received: by 2002:a05:6830:18da:b0:69f:3fd:d03e with SMTP id
 v26-20020a05683018da00b0069f03fdd03emr147141ote.12.1679350601927; 
 Mon, 20 Mar 2023 15:16:41 -0700 (PDT)
Received: from halaney-x13s.redhat.com
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 15:16:41 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 20 Mar 2023 17:16:07 -0500
Message-Id: <20230320221617.236323-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
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
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v2 02/12] dt-bindings: net: snps,
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

Changes since v1:
	* None

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index df4c5d184446..154955718246 100644
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
