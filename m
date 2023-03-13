Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E68AA6B7E50
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:57:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6D27C69053;
	Mon, 13 Mar 2023 16:57:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2310C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678726659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E28u3AC299JmAvjZr4iCran+GZMgF1vAVhXdcyHNMWs=;
 b=Id8e+ug7Q2GIPc5PED1gsttDUhR7KskR0lm6hGgVfamXRVEwYcqYEW1sD/IxaST9o7tp38
 MwJovYwrWiludx0tx+Ea70/K0dxxrU0NBqzstcPRnX0mdG803IJc0l3M6VWG1Ltv0oFV/d
 GmRpbcUhpYVJUQLSzkkZHcfe7+5A2Gk=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-cmHu1Lk1MS6qbaYKI_DnhA-1; Mon, 13 Mar 2023 12:57:38 -0400
X-MC-Unique: cmHu1Lk1MS6qbaYKI_DnhA-1
Received: by mail-oo1-f69.google.com with SMTP id
 n10-20020a4ad12a000000b0051f97e7b7f9so3532624oor.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E28u3AC299JmAvjZr4iCran+GZMgF1vAVhXdcyHNMWs=;
 b=SQTSOQQMyXLxpP1xNa0MIgL0lDb7IuIv+IPHnjnr4gfowDHnq9WujEn6Yk+c/b9GW6
 Yv/ribDYE6vIUqSI3gav2EFypY6VjeCs9Vor/2mGiL2D+6OnIC+IPnIyiHnrEs3BroKY
 JuGbOfd26v5+h147PfeKwRSiARz8sgDXOWXApfRBEv64Q9H7CUdgIZeTQbkM7FTDV9jI
 wInkOUF9YwG619oLQ1Mep4lLiIr2fGDpqia9x4wEY4VioR7A+9nk/cPpE59d3qkSDoIK
 hcYlcXvIrfIQY311p5Zbq2HD4oPy+YBw6MCXLyvnICFTfCZEd5HWNTJFjj7ddg/b5+3u
 +Xhg==
X-Gm-Message-State: AO0yUKVwvop3YzdFOehVny48A4htX4O1+yTTotakusC+OkA46fgMwdhQ
 c+pjCHdh861315Qpi9GTzr4Ur5w5fBdoem28n4qcx50Tl5PYa97AndH2p48zQ/TgUCHG0Wpr94G
 7cQ9r3M+almCgAeLEjc6gBYMMBIZSmPKYdWYWhJqF
X-Received: by 2002:a54:4486:0:b0:384:704:9b5c with SMTP id
 v6-20020a544486000000b0038407049b5cmr15120527oiv.32.1678726658077; 
 Mon, 13 Mar 2023 09:57:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set86f0/F8S5PouGiQEFyz9bxsIyQVNlLEzYRDmqmHJ8dbjOt3VXvUOdMwGwjDGA6EL6dvlxIJg==
X-Received: by 2002:a54:4486:0:b0:384:704:9b5c with SMTP id
 v6-20020a544486000000b0038407049b5cmr15120491oiv.32.1678726657851; 
 Mon, 13 Mar 2023 09:57:37 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 09:57:37 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 11:56:13 -0500
Message-Id: <20230313165620.128463-5-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
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
Subject: [Linux-stm32] [PATCH net-next 04/11] dt-bindings: net: qcom,
	ethqos: Add Qualcomm sc8280xp compatibles
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

The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
Add a compatible for this.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 68ef43fb283d..89c17ed0442f 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -24,6 +24,7 @@ properties:
     enum:
       - qcom,qcs404-ethqos
       - qcom,sm8150-ethqos
+      - qcom,sc8280xp-ethqos
 
   reg:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 3ca1239da448..f981a89ab2a5 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
         - qcom,sm8150-ethqos
+        - qcom,sc8280xp-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
         - rockchip,px30-gmac
@@ -574,6 +575,7 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
@@ -629,6 +631,7 @@ allOf:
               - ingenic,x2000-mac
               - qcom,qcs404-ethqos
               - qcom,sm8150-ethqos
+              - qcom,sc8280xp-ethqos
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
