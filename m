Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BADED6B7E4E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:57:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 828C0C65E5A;
	Mon, 13 Mar 2023 16:57:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BE51C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678726650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JepgEUi2Rsg9+d2hOOa0Co6HIDw3s31TfucmHUz975I=;
 b=SL3ATmqY+IFXeHWHutIQdzdF8M1Feo3F1wpxRd0RZNYSG3oaNQgUPGmyHgYpu8szkGBTLc
 tSW4IK9ydkvqNx12EaNN88PMt/gxnWyJnkQmAGj2Lthic1bmBfiYYNBEalvLegVVRXYNhq
 01IpOcZIEfpqB/mNPY+BMzsdvgEyhSM=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-oMe_HjPUPFez8AaLw9xgug-1; Mon, 13 Mar 2023 12:57:28 -0400
X-MC-Unique: oMe_HjPUPFez8AaLw9xgug-1
Received: by mail-oo1-f70.google.com with SMTP id
 y29-20020a4a651d000000b00525101290e7so3481614ooc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JepgEUi2Rsg9+d2hOOa0Co6HIDw3s31TfucmHUz975I=;
 b=tB8m/h1E5z4unIcuVzAshsKv3TtpSy68o/PKPaegL91hztlBnFOPJ5SFa/h3NGBGvj
 hTKa7+F1UxnIOnV78ImqLurz8S8nmPhim40gOxynSbdIoNAq938UiBgKg3sXWOwIzXkA
 3RUfTID2ZumJ+lmVVJvq+edDhpUgHR5eYXLFlUXolRjKzQ756maAMoxne3Knp+pG7NJC
 VX17mJxUVZ+0WIUJ//ieD3v3thyWqgJLLBtzcVOZ7fOEfsSmknhCfon91cyRApGEhdxL
 gl4946bkHCFK23gcEU2Eyu0Xvz2soF3iDkPiG9/aKjKaNqvk6EfrmL8eCEkCLa2Ypveb
 uRKg==
X-Gm-Message-State: AO0yUKUlKcTMH+nmG3HBG2vCtb1dfGPy1Ddng4xFOR0vIagqTXeyurMi
 vRBfkyoK+6e4greIRyIElkuSz3jJ2BSsDwdwMSZVXa0AaJ8AoH/1ai1LqxYBCUjSjRbzp5IMXh8
 u3TbxHq7xfy8ZntuiGmEHYP8cOlADPJ2yuKpUOqpD
X-Received: by 2002:a05:6808:48:b0:384:4739:dddc with SMTP id
 v8-20020a056808004800b003844739dddcmr15869252oic.2.1678726647118; 
 Mon, 13 Mar 2023 09:57:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set9jUwB7abxbtJ/4rmMYbnk+9a7FIH+IPzgb4Vv0+dyO3yPMXdplK40mvcn5yoPEjWxNdNOikQ==
X-Received: by 2002:a05:6808:48:b0:384:4739:dddc with SMTP id
 v8-20020a056808004800b003844739dddcmr15869223oic.2.1678726646844; 
 Mon, 13 Mar 2023 09:57:26 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 09:57:26 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 11:56:11 -0500
Message-Id: <20230313165620.128463-3-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next 02/11] dt-bindings: net: snps,
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

I picked this up from:
	https://lore.kernel.org/netdev/20220929060405.2445745-3-bhupesh.sharma@linaro.org/
No changes except the Reviewed-by collection.

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 52ce14a4bea7..3ca1239da448 100644
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
