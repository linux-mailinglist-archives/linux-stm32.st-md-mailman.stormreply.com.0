Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 021DC9BBB66
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB8F8C78F77;
	Mon,  4 Nov 2024 17:18:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A00BCC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:23:56 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37d58a51fa5so503452f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233436; x=1730838236;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7BTF2QgV5p9nNttdJyKFEUTkRzHJB1L1AnxAUE0mKw=;
 b=F8FyDIQ1ueC1oRlNF5WT7OiNE8cgcW+/roMlbcOCqANP1fNMC0GCdf3gxx+3aa1Qaf
 vD2FzG/4Unzaesle4kQgW8yN2QB7IlfZM5IFr9s9VK8m6xfJujsXJ3nunWfULSnD+gT0
 AzcJEhZbmZMV8T95G4ZMwOvhFST+WI1b1J1rb/6HwCCG412ECcqy+kEymaxlJ5EgGNYA
 nE5IIWHiQp6lL42B8iCjYUDN6Z9CtA2aZ5v5SPi8I+McTbh2iwiHGt34fxTXUKqqAH4m
 kMQd7+dZOW+L+oLh+t5s+3DjYPgfVKUfOyZ8bfg5qBBxo6Qb94R03rJdcW5kyQFrizga
 FKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233436; x=1730838236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7BTF2QgV5p9nNttdJyKFEUTkRzHJB1L1AnxAUE0mKw=;
 b=TOJzvSSYYuABpYtZ30s6ad13ogpsdoG1H48Eid+FHcn5zIC706DFKDWNHLEphHa19L
 NqEyc5oLVQ8E9PtKREZ0Q7iX88KqqKdIp0RD9UiPEyiMq/Ez4H1vZrORo8o3zJ+xQyYy
 kQnzQQPdgt2IQxGRtfXs6o/Wg8Gq2IzizecFRs5YIvD/IhzqHzFlh27GzlN7SI3NTets
 pYh79ofh6C67xDNupad7y72OeMhn39Cu2LUsdNCDqjR6zNzeKiD61sbnlosYcObMqWbd
 sx0X/Lj3UG7SZL3dAQZ+gm6awGxsVMxoe4aM5JTKm7dHD89vq8m8KUzNUUwfDj7fDNPR
 0/uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmGYb2nnTlNNymBxGFzZewVP+bC4798mwM4BKH7IMGMuAk4BWIgUfYQllYSMyv+w3X5plMVEdljXvJhQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz4Lw3zgLjiHulyWSjvIsr11HC7ecWvdCsz39CaK/kR6eAjSgT5
 iv1fSFWcB77+NT5lxuhntL06xXeIbunPKiyXlS5c4f3nS+r0mfAl
X-Google-Smtp-Source: AGHT+IGD+/RLlUFQ9JfrHmh8ZbfUuGjxW0QoMqGnWizIoxkZXn06IHyKtDzC4H57odNMJ3rODgdWcg==
X-Received: by 2002:a05:6000:186b:b0:378:955f:d244 with SMTP id
 ffacd0b85a97d-380612bdf5dmr4232846f8f.14.1730233435443; 
 Tue, 29 Oct 2024 13:23:55 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:23:54 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:28 +0000
Message-Id: <20241029202349.69442-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 02/23] ARM: dts: socfpga: align bus name
	with bindings
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

Binding expects the bus node name to match bus and not amba.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 2 +-
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
index 35be14150..c7ba1e4c7 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
@@ -62,7 +62,7 @@ soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
-		amba {
+		bus {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 7113fe5b5..7abb8a0c5 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -54,7 +54,7 @@ soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
-		amba {
+		bus {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
