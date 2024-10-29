Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D49BBB6A
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB0B3C78F80;
	Mon,  4 Nov 2024 17:18:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9453CC78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:04 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-37d7351883aso532444f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233444; x=1730838244;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=syqLQEEuQIy2cda968KqPmvPAkdMXpl9TyM7P/fgr+8=;
 b=ZrqVpcBVYYyWjvBYNH3FphbslWznFbLiyOar7/hYZ2k8oMc1eXx62A7olDZPZzBimI
 4tFJVXvvYCmMwDipcVjhQJC930nnL0GdGNS7UA2r/i6UM25xFpbFHJBm7bCWfOO4S1mO
 jYNgr4i24ZE1yBclTujVYyIfC5Oi1iaI06ShGZZH+2lzfD/2nFeRpRgEex+hN1R6UKLS
 EZHQ+ZXpaUhEDvaIMbPVtkswGy5qGI4vadITaT/rOhdq61XjjGX+pQoEmD3vyCHTO+6z
 yRc72fnY3NojEiSAMbGZxLwb8iAzSEef9QAMRVq7HZBYyLYYbPIFOYjIddszqV6cCp7h
 fuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233444; x=1730838244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=syqLQEEuQIy2cda968KqPmvPAkdMXpl9TyM7P/fgr+8=;
 b=cFwxKuk3VuPCeKLhRtawSVDOJRAVu7FN4UATFZsrOCNneGQ88fBxE09JkFvDMLHR+6
 NmbnpPDbezx+lJR84fEWJBhl2sQXGxv/3eadPaQYqe40/lQ0TYkMZQGKa999N2ebpy3u
 EexGFAEmX2glRHnaBPO2+y0jup1Nqyls2/s3l/dbzuYVvctVLgoQ5974uOyk/DTTZcx4
 BiMyp0o9GWjMM63xiHhqGLe6aentFZZfQ+qtWRSWDcqkYJ/8HnOnlOr/UyxiylVa4W0/
 /g6+4tDG0UBAR/pgn/P9kXf4gL8hAm2CtZ4KnB6XN3XHBmkiBWzmnJ2JOjBDm8y1Z0Qa
 lrdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlKPdKcsHN62N5Rs9IQppfbbIsbgWPFxpT+qxDmuz9ikORB1/vWqpPf3p9X+orOb4zoMnd2K4S9Fh3ag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzxc+rmu0cv99gQrUoz61LB2cmartPvEcEogtYAawsOKFB1HO5H
 eExz7hsC9kjMmjhbcOWPoEXAILyRzgqjIXlBFDVaPz/HVws5m4fM
X-Google-Smtp-Source: AGHT+IHGVFfyqJqlmqeKRFFKcmhj1OyaAu/znhSmRzQJTc6ZYgh+32XL3bPFTzuO8uUces3IhKZcmQ==
X-Received: by 2002:a05:6000:1446:b0:37d:54d0:1f15 with SMTP id
 ffacd0b85a97d-38061231c59mr4689734f8f.7.1730233443892; 
 Tue, 29 Oct 2024 13:24:03 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:03 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:33 +0000
Message-Id: <20241029202349.69442-8-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 07/23] ARM: dts: socfpga: fix missing ranges
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

Add reanges, since by dtschema 'ranges' is a required property here.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 4b19fad1e..65d04339f 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -81,10 +81,10 @@ pdma: dma-controller@ffda1000 {
 		};
 
 		fpga-region {
+			compatible = "fpga-region";
 			#address-cells = <0x1>;
 			#size-cells = <0x1>;
-
-			compatible = "fpga-region";
+			ranges;
 			fpga-mgr = <&fpga_mgr>;
 		};
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
