Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F286DE53F
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 22:04:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07D3DC6A60A;
	Tue, 11 Apr 2023 20:04:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8907CC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681243488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06OBUIWkgRNV7Fvg7Z0iX+fADdcC3n0Oeepo2lUID2M=;
 b=ig4idc8Yzzp56eDaWVE9Ga9gztA8+pMk47cmZav45tRSDVAW7x1B5aT9b5tqpykEqGLfYx
 jH/QxsxLi83G5ZDXFD4FrAOOebvJdAN3uStw/adLzLy7cqtEw49rsLLARILogDsLnTNZre
 vIUvs6TPXbpRY7gQtADHfKtJSc5x6Uo=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-B-RmNkybNn-9H2lnj934EQ-1; Tue, 11 Apr 2023 16:04:47 -0400
X-MC-Unique: B-RmNkybNn-9H2lnj934EQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 x132-20020a4a418a000000b0053b4ee58e0fso3062879ooa.17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 13:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681243487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=06OBUIWkgRNV7Fvg7Z0iX+fADdcC3n0Oeepo2lUID2M=;
 b=HZ/982bBKYT/T44FdD5nCpXa0ZoLfCv+15iRygfxAjRliShQ7KAlahDO+mxmuvOSZs
 qYiM8/OfXfDFcqnqcHVOQxl6NusNw7ehu17HrUejgIbOBQCyS5U2px3zQJVWi8nP/CWk
 Kzk/Gf/aj/gzM984CC4BUySAkclFUOhkYcFgsKmQyFe9Swi2MiCAWhPhvV2J8vczodn6
 OuZWj7Fa5tRz65T9yz5zX1L53MiKH74q1eUOGuS/d/QaMROMAPZ8tWJmjWNYHfdCLhHH
 pedIrI/r4nIusdFfkmKFTg6nbvGIoTQPKajlZVe9qokqHzTy0s052vMa5PpV2q2wDC9N
 9RqQ==
X-Gm-Message-State: AAQBX9czSq3yqutAjzmK1xmrIjawADhdn37sp2qmjQ984TpV8qtO5qSX
 R5tW567GMxASx30b4aqZogpgTtwzokusYg5hJjazJSO3wskneSFMy21lXBduBDGVAu7HkWcI3fl
 lPFAJUpUwsG4Sf4i9U3lkNzVuzGxXfFc7GfiQhmM5
X-Received: by 2002:aca:1916:0:b0:38b:effa:7d78 with SMTP id
 l22-20020aca1916000000b0038beffa7d78mr29032oii.13.1681243486809; 
 Tue, 11 Apr 2023 13:04:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZD+96wPOgzlRfj4I6lXSesK7kOUy3JXAhugHSrPi7TfwOOp0WqSjbXkCy45QjGZSt9EBsTrw==
X-Received: by 2002:aca:1916:0:b0:38b:effa:7d78 with SMTP id
 l22-20020aca1916000000b0038beffa7d78mr29012oii.13.1681243486533; 
 Tue, 11 Apr 2023 13:04:46 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 13:04:46 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Apr 2023 15:04:01 -0500
Message-Id: <20230411200409.455355-5-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 04/12] dt-bindings: net: qcom,
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v3:
    * Add Acked-by (Krzysztof)

Changes since v2:
    * *Really* alphabetical sorting (sorry Krzysztof!)

Changes since v1:
    * Alphabetical sorting (Krzysztof)

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 88234a2010b1..60a38044fb19 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs404-ethqos
+      - qcom,sc8280xp-ethqos
       - qcom,sm8150-ethqos
 
   reg:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 1e7982704114..da311c1f2c88 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -66,6 +66,7 @@ properties:
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
@@ -574,6 +575,7 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
@@ -628,6 +630,7 @@ allOf:
               - ingenic,x1830-mac
               - ingenic,x2000-mac
               - qcom,qcs404-ethqos
+              - qcom,sc8280xp-ethqos
               - qcom,sm8150-ethqos
               - snps,dwmac-4.00
               - snps,dwmac-4.10a
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
