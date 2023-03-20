Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE256C2458
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 23:16:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83F21C6A60B;
	Mon, 20 Mar 2023 22:16:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36364C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679350606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlOqWVli75QXNprPmQyXqnWUqk+FMVr+7rpbpXO8i/U=;
 b=Hjke4Ju36G5wc2SZ2+ojpk6gzJJ48iDilmS29P1C9q+oknxFqzO92qUwE3RnleRh5dyM5m
 jzm9qThSSAR/i32M74RWHXKIB86RPATz7nSO2wCaSeeb8Y510BugvFc3MXQ9AIFlWCNrM0
 jvHPueCK5UoeaxCFbs4ZRSitTqLFcIM=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-PZs8XPAgPtClzU8Hud-7MA-1; Mon, 20 Mar 2023 18:16:37 -0400
X-MC-Unique: PZs8XPAgPtClzU8Hud-7MA-1
Received: by mail-ot1-f71.google.com with SMTP id
 b2-20020a9d4782000000b0069ac2d5c7aeso6265520otf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 15:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679350597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YlOqWVli75QXNprPmQyXqnWUqk+FMVr+7rpbpXO8i/U=;
 b=pdcny9Z9TnOnrrtmRE6LyhBMoM8fnh/OuJpC5d4jJgJA84RbdIuDOx3PMsFsHG8irL
 9sHVhtlfW3FlfF2TcSUUhB8FYxessYJpADnN2IowdJ3K89nsDvQGGDqpaEUkinrnAkT6
 fJWTC6/TL/Wtje6nsrwp7IoyeFly0cvfSkFJvRBm7c5aUc236JgHRjXml0z7ZH1swCeY
 Sp6aomPtEa0ghltjkBPG0XAxcGyW99oyMm7AvZpyLsgXs3YgPdYXEvt+9TC2zbgoT2zL
 SL/pb4KY9BwaUgSm9p+apY1cJLmJlYHJpyRBqM9yza8EN+XWD1upfk0KPlIhRvuyth2p
 5GTA==
X-Gm-Message-State: AO0yUKUhS2VxT9QDAZvs5BahTXL/CZwgDXNnvhTw8i2ttkHmWC6AYr8U
 UP4eL/T0hxBfilrD0uOpb9qYdOEfujWtrsVolRjHTdAcjWUKD7WoirHizKu/6d2v8D6lIiCCBK1
 8qAMPX+FJGhUz8R8zzG//yYjeJAjcxPtZkOFlbUHo
X-Received: by 2002:a4a:d50d:0:b0:525:432a:90b0 with SMTP id
 m13-20020a4ad50d000000b00525432a90b0mr826258oos.1.1679350597051; 
 Mon, 20 Mar 2023 15:16:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set+sFN8OAUwmdLsJ9ZBRkT2O9PURonEVDvf0kVHAlkwFMtWoYbZeUAmr9vMfEPdP9CsKmxVlEQ==
X-Received: by 2002:a4a:d50d:0:b0:525:432a:90b0 with SMTP id
 m13-20020a4ad50d000000b00525432a90b0mr826216oos.1.1679350596785; 
 Mon, 20 Mar 2023 15:16:36 -0700 (PDT)
Received: from halaney-x13s.redhat.com
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 15:16:36 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 20 Mar 2023 17:16:06 -0500
Message-Id: <20230320221617.236323-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320221617.236323-1-ahalaney@redhat.com>
References: <20230320221617.236323-1-ahalaney@redhat.com>
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
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v2 01/12] dt-bindings: net: snps,
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

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
	* Dropped Krzysztof's Acked-by since changes requested
	* Changed interrupt-names items per Krzysztof

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 16b7d2904696..df4c5d184446 100644
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
