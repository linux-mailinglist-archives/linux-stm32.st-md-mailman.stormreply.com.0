Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 097949BBB89
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BED44C7A84C;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3937FC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Nov 2024 11:41:36 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c9ff17eddbso288390a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Nov 2024 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730547696; x=1731152496;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uOkHw4o/DpBBAteKKHGiek6FnJvHtdDfQKLJ8jI641Y=;
 b=gTmWOrc+YxDJiCHv+529uFuOXVlnbRe5HxJQyeLrpb5afc3AwcYgJ9m9OQjZjfZX36
 DcGpbv1HKtriE8GtPhSnnbXSfh2EsxfT3Zrfed9eBvkwM2aM8Tt9CqwG4/5eP1DyrKaI
 2Ehe5LP1u8moaU0QYiX6a8ne4MJKvGenBdKfx5VSckxHdW8At4YkRuZobiDAvtdwI1Nn
 QAiilrdPGWYw6/VlifQ1RmMRGqQ5cwNvRG41r69CANing0AyENAmvh2sGS++3fH0+gSd
 FSDci8jyQ/UqLl6uHpNgnMwmT2mMCe6rMG+OXuJgR36NzeNHyBoVk0Uh4eC61jWcC4FB
 VBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730547696; x=1731152496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOkHw4o/DpBBAteKKHGiek6FnJvHtdDfQKLJ8jI641Y=;
 b=Ioy/VpoVqn0X4b9zXeqgC7Djm/Q2hUEWl9hylX0pH2nPmM3KyFl1LdJjxUST2tdcCm
 +bdqp7BSnrVJ0i2Gp+ZwCDhb93y58E1S+51rBRfe53SvQU6kzsinHflFmJyppViSpe5k
 SVa3KggAdoqJ6gm9UfZeTlfRsfkNTsVmwbl+ACOlRQMH4nXjz+r+OEbkHaNfAOaWwlqk
 5G9ZO6pYUgNv7nWB+dk+OtEENFZjT+g4S2kIvSYKo+PdjcjD93TdctaedD0En4dnCwWt
 /JsuupA/cQlgej8/OuAnr8Ms6TjwNq4xwYxvZuQD+Wn32kViZ2EZf8Xm0G8Dx60P1d9A
 Rh8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTnZVlkQiKGfEnKj/sqb+j6pVX3SfuUmNxznf/3/xM5QQ3iedxLacOwSEF2iymoXOVbRn4OfG+kMNyWA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw429ESHmZL+mSVIyy71nfpOvfiTDWHpHGGU6i5xc8gNI9HyPqg
 dXJFS4415m6v3Cp/jW9Rfa0PeXo72ASulEqqh2vbir4bIJ0Ot0mH
X-Google-Smtp-Source: AGHT+IHjlFEbf282MF76qwHad6BykjaTigqFREVRHfAAOyoo0BQ9DtSIfDsLbquzvjN8C3vTjqzNpw==
X-Received: by 2002:a50:fb8b:0:b0:5ce:ccff:ac34 with SMTP id
 4fb4d7f45d1cf-5ceccffaf12mr288807a12.6.1730547693808; 
 Sat, 02 Nov 2024 04:41:33 -0700 (PDT)
Received: from 1bb4c87f881f.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceb11a7aaasm2224918a12.83.2024.11.02.04.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 04:41:32 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	kuba@kernel.org
Date: Sat,  2 Nov 2024 11:41:22 +0000
Message-Id: <20241102114122.4631-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241102114122.4631-1-l.rubusch@gmail.com>
References: <20241102114122.4631-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, l.rubusch@gmail.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 2/2] dt-bindings: net: snps,
	dwmac: add support for Arria10
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

The hard processor system (HPS) on the Intel/Altera Arria10 provides
three Ethernet Media Access Controller (EMAC) peripherals. Each EMAC
can be used to transmit and receive data at 10/100/1000 Mbps over
ethernet connections in compliance with the IEEE 802.3 specification.
The EMACs on the Arria10 are instances of the Synopsis DesignWare
Universal 10/100/1000 Ethernet MAC, version 3.72a.

Support the Synopsis DesignWare version 3.72a, which is used in Intel's
Arria10 SoC, since it was missing.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 15073627c..d26bb77eb 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -26,6 +26,7 @@ select:
           - snps,dwmac-3.610
           - snps,dwmac-3.70a
           - snps,dwmac-3.710
+          - snps,dwmac-3.72a
           - snps,dwmac-4.00
           - snps,dwmac-4.10a
           - snps,dwmac-4.20a
@@ -88,6 +89,7 @@ properties:
         - snps,dwmac-3.610
         - snps,dwmac-3.70a
         - snps,dwmac-3.710
+        - snps,dwmac-3.72a
         - snps,dwmac-4.00
         - snps,dwmac-4.10a
         - snps,dwmac-4.20a
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
