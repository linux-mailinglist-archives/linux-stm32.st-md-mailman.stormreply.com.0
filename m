Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E91F147E
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jun 2020 10:30:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 322A3C36B23;
	Mon,  8 Jun 2020 08:30:50 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AB46C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2020 08:30:48 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id q16so6383714plr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2020 01:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8feILcDA0tIlewM1KO106AZP1TsRZlV0wrLhrdTJ7fk=;
 b=B+4fToX21iv9QoVjppr44/lc3ZFWBQL5JO6a0275yptTgsD+TOR9A/boCycuYUAFMr
 s3DV8OTQT7upBbdc7HXwhLR5Saea1NCSTfOwGRbbDHejss7/uan7AnGazjgLMmJBZKtd
 H9uVZkwQ+qRvuc34NfGPopkwptiy6DJMlnfp/xcPWG3SZh/1+6H70UHL3CJhpeQU23hU
 PObJzAwBoqFTlWdZu8gwUOEVslw0Qy6zIFLfStKtCys1sJOhgVm8KSVcz1ClmdKGpCf6
 WK+OGFNGbBvZuSnIKm/10x51jWms8hcCaxCsZvq9+Mk0vZjbVSskn57LFKSJWZDFzqSO
 BhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8feILcDA0tIlewM1KO106AZP1TsRZlV0wrLhrdTJ7fk=;
 b=Z6pDIsZWLwsI4x3uwmSU+nElmQM7Ia2M673P7xoQ3wPKXO6M9ZerZYW8D+8AiBM9if
 1fpf4kv4F/OjkrjA+FAiYOZoQus/OnK2CFkpYDUYwCdmbVZEamnoAeVtoFBv1ZpX+vZq
 uZSE5+hN1dDroUFYjtEnrOqxKgU2u9/onsMg60dhsKuauJZcnBzDBqL3M2cG0tVaWVbj
 LrG2zVop0RdV8JuTxsEtrzHvTQ1xaR9kvmtpWi4cHj3pFro+CYfs4DQANKQ6DuVir3UN
 b3CQrlXbofFEJ/tKbcxUmmMgE+Po9eHKqgFGMFQ9a0O5JmI+LEPOPW9n6Qc2A21tDHE8
 tlTw==
X-Gm-Message-State: AOAM533lZxNWeHOdiqMXob5wVI0vJlfMW9ySFqvYZluGneRL0Ai9cn6T
 DfYDTDjnohT/OBHqHO9uat4=
X-Google-Smtp-Source: ABdhPJyeHWrRZ7QzXxletY3kLJIxJWIs+gLBJ56sWRWJ2KQLKn7J5lIcB99++scBN53d1bkhC2luYg==
X-Received: by 2002:a17:902:b601:: with SMTP id
 b1mr20489872pls.39.1591605047030; 
 Mon, 08 Jun 2020 01:30:47 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
 by smtp.gmail.com with ESMTPSA id 27sm1210829pjg.19.2020.06.08.01.30.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 01:30:46 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 linux@armlinux.org.uk, vladimir.murzin@arm.com,
 kstewart@linuxfoundation.org, allison@lohutok.net, info@metux.net,
 tglx@linutronix.de
Date: Mon,  8 Jun 2020 16:30:37 +0800
Message-Id: <1591605038-8682-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Setup 4M bytes reserved
	memory for mmap
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

To mmap a framebuffer or v4l2 buffer from kernel to userspace on
no-mmu platform, we need rely on 'arm_nommu_dma_ops' from
arch/arm/mm/dma-mapping-nommu.c , so setup 4M bytes memory
reserved for this purpose.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f469-disco.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 9397db0c43de..082b24ee81f7 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -65,6 +65,20 @@
 		reg = <0x00000000 0x1000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,dma {
+			compatible = "shared-dma-pool";
+			size = <0x400000>;
+			no-map;
+			linux,dma-default;
+		};
+
+	};
+
 	aliases {
 		serial0 = &usart3;
 	};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
