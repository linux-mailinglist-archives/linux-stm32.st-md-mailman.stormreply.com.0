Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA479BBB6C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FAE8C78F85;
	Mon,  4 Nov 2024 17:18:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A51EC78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:08 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d58a51fa5so503492f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233448; x=1730838248;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxrWAGvbebnl7bShJIljz1Nm6dGXiAY6T1E3WWpWzg0=;
 b=O+a30Z2KOhjOT8NwKiGlUX8gC1+CkP8tsngq5nkFnHxKdMJTUZjGWzDGaiIUFiQHM3
 5pY0jTnqdvRA/G5CjbRkqGrVvR/qd6VEMoNTSeiXntjwh4WDdxp/daUv8KJBz7acMJLC
 B9BIhsDLHDRVcERmgwx35Ka9ejU/uSaMyXtOWHHpevb9FmgsgxYLeb+d6nlgVGF3v3P4
 YaFPPG/jfqB8ijk1HvsjiGMfuPtQtnT75E6Etv0/ukCVAjbgsPLL9hKP3DZ54HbKUkjO
 6o75OZbC4HxWaE3BPfV2v2bPs6spoXXO8zBpCgrP3fTVj8Ux/xpDlE+db6cNL4tYTusG
 tNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233448; x=1730838248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JxrWAGvbebnl7bShJIljz1Nm6dGXiAY6T1E3WWpWzg0=;
 b=CfVQtVcrM59BBrG7ZLtQB41Qxh1Drz1UIEbwdmFKv4J8Y77H+q6rAP7VlbvAUia9wL
 XuJtxJ8L5FP3umLdAqJUoJlJyRXY/vVTp9apVDhKvGHGpfaOv7MJKKi6SX2iRoW8kX6a
 ivcj8Z/yvVUEv+/ZLFx3V3wwYOuKO4PkTl4Uz07EW437ACatF+THR0qJr2/gk178xtjm
 c7BSeg6A88ACA0+f+9tSNv7kUgb8+vigWLd6WV4pv2danGAKPHX2gBW0+mXo5S5pE+hh
 pkhYY5w6b3wGSXdXuz1UIniTnmE9dA+TqbntAzhSC3Xn1+mlCKMJ11CqETugMhjeuXOX
 K58A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjWGlBMm/OocHgQKVVGeuyW5I5JXQ/9y4rEuVx7qiltFKxvqDMI3Y5sJChBOLTrTlxuVZooiFLT8BZqw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YznDIg3tmcvanHeNsfRzENyEtyoK+GqDvgIM5fAYhL9va0yjCMH
 vv9PKgJ7+2JUDwZbrhkThs2Zn030puING1Qa/UQv8yWWyTSK5Vcc
X-Google-Smtp-Source: AGHT+IFe4HEmiUudtU71Iu+vsYyyet/UvGGn2kWZSX/+5WG2rLBnApro20Grx6Z5bXjcP0EijIUzig==
X-Received: by 2002:a05:600c:5494:b0:431:4a7e:a121 with SMTP id
 5b1f17b1804b1-4319ad4ee8emr46759745e9.9.1730233447776; 
 Tue, 29 Oct 2024 13:24:07 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:07 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:35 +0000
Message-Id: <20241029202349.69442-10-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 09/23] ARM: dts: socfpga: add ranges
	property to sram
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

Add 'ranges' to the SRAM node as it is a required property by the
dtschema.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 5f4bed187..6a2ecc7ed 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -691,6 +691,7 @@ ocram: sram@ffe00000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0xffe00000 0x40000>;
+			ranges;
 		};
 
 		eccmgr: eccmgr {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
