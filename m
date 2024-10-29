Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A869BBB69
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF3E9C78F7D;
	Mon,  4 Nov 2024 17:18:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07FACC78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:03 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4315dfa3e0bso7131905e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233442; x=1730838242;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zykG5xT9htU2beqODKL0ma8uO47wG8f6mRcFvD55rTU=;
 b=chm4TZe9bnoo5dh8avmJ1pY4CBVhq3LMFUkpibTv0VOA/axDVu4Gyks2C4ySqYsjEJ
 6jVXSHSt+Oas7kdp9C1kb43AGLHWwV1yo6B2uu9IwQEvyPa+Jl+3eCPBLt8WiqyUh5/P
 856sDhTtE9tgxhOZpXpskNAx/B730wwQFQhP5gnWBvDr3bBMyliZg5GjnF9wyV7fI0dV
 Y0kNz/6WZBPeUzVhEv4d7r47+pJlCMRc3/ga8c5l6Uxx0irEKb6swMA+FnybBBjlWODa
 NntL1nsZP09FBlTL26+NEpRJOKFhzxaAP15VQ1hl+NE3qugl44JOjgKFG/O6Zwjxtoqk
 iWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233442; x=1730838242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zykG5xT9htU2beqODKL0ma8uO47wG8f6mRcFvD55rTU=;
 b=CPwrBWwpPA7ldqmx1W4Vg+NruNxG94UUtbcmqL93LgZEUnXxx+V4zd2hgMwpcfE0kq
 dbCezkAHyEOjCww6WDpOqrfqoZD9EZhdzXdXHTbKJTZlWhRFDbRa/62vUicREPu/IqAD
 e+4dWxMWghwLpeNibGUKl2+EGz/uttxdWThAjSIWW/uM4Opnla4+Zw+QoVglzwPUhr05
 Rj9FiB6pRP6KUmFWs1697ezIFf1WNuJ5qheAkaXFsB3SOQP36SdwFJoWB1fwmQMaxpQe
 L8/ewkjFcraynBJHn2UDguJoMVkAgZ/dHAO3quw4kUcSY7HPNPsw/+T9pMOsPU3gQe9Q
 vwMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfVws4hek8k12jNXc+VuMEwohHvVyUL1YZoWmiEYk7ddSuDR7dhLNvyF16cLn3XdrY2kQ0j6qyGKpPDw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzfCjZdhmv0H9lm2qIMt4IO2fyges6/S8GvKIfbKW7K5ak+akJR
 cleXQ0akiyPlZMnKrFQYgE/jrk5txAjeDSDiAn1uewdkeVXAPh0/
X-Google-Smtp-Source: AGHT+IHmAsezJTQ6HDzRiPuCCGE+RMKKJV1S7Rnrkqh2NL2lY4iIeUnDKBM6QOnU1gla9isevRSz4g==
X-Received: by 2002:a05:600c:3542:b0:42c:ba6c:d9a7 with SMTP id
 5b1f17b1804b1-4319ad08603mr47418785e9.4.1730233442025; 
 Tue, 29 Oct 2024 13:24:02 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:01 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:32 +0000
Message-Id: <20241029202349.69442-7-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 06/23] ARM: dts: socfpga: add missing cells
	properties
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

Binding requires size-cells and address-cells to be around for the SRAM.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 7f7ac0dc1..4b19fad1e 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -684,6 +684,8 @@ nand: nand-controller@ffb90000 {
 
 		ocram: sram@ffe00000 {
 			compatible = "mmio-sram";
+			#address-cells = <1>;
+			#size-cells = <1>;
 			reg = <0xffe00000 0x40000>;
 		};
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
