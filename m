Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E929BBB68
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0B48C78F7B;
	Mon,  4 Nov 2024 17:18:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41C07C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:24:01 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-37d570728ebso734280f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233441; x=1730838241;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wwdH5E3n/FKvtFIFoeUG2vP8wssuIiUjkTOLgVYvdE=;
 b=OAWtRvbiOyQ1De0crrrQi2SGR4aH8tbqvrFgptBPxnWZDTclqkZopkPhcdvko+xnOw
 +9KE6Um5ijSVdN22zctMrKxenXCQClmceqCLGk/+ezuRcj41s3NifvzeeJhFPyk+H97u
 7Qj7aAX54P3nj4Xx2wkyr6BcG0wXb5VO4i5Nl8xph05T5TJpY2qrr27y0i6PqFKtX4CU
 2FpSD7nuAUooyeoMrVBQwOFc1Hn+EoAQ40gqttxfXeNNr9DLjcrHQtszDJ5bpTbluJyv
 ld3iefIIxHEi7iFNlJ9RWCIiEZ3pYBb3TcG/BVF9DhHV//g3yxLGqqcSJY0bvinExlLQ
 eeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233441; x=1730838241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9wwdH5E3n/FKvtFIFoeUG2vP8wssuIiUjkTOLgVYvdE=;
 b=fFyHHbQAiSpZCVH2Nq8F6KuWghAbyE1MrglNYaWmXiZc6wp9KqJIa/uwZw7lUc/RX6
 wanJIHoh1jUs813TcHXDXKzJumJs0r26fE18oQ3fneXXM2OdWHWMswVVqjok1pQkCiPw
 4XRy9LQR/NHO7RuoSWURNaMEcoIU1rlumBmlGqH9y1QvmjO3WBptI5hA5S6Uh1cOWYjt
 tRWjjZdOuj/uecC9+0kBoHd2HVTfwrA6LD17UTMeG2Ck2RR9TIs7gMFv0zFix4lvcIpE
 2ZLaQCnSNZ0Kuj4FcYlpJVabu92h6NZWpuQD6xZP0p9X2HZD4mfR7VVqrJ/qY69qqrhz
 PHDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK3FoJj+heragDqpvK6WpbHumC5x36NekmFIJ5MNTpkgXKbKff/q4CJBipTpW2PWr+6X1LEC66RWz0HA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZG49bsOMIxK/587RfAruO0JX+ZSXokwlfbaAq3atq9r+qleHc
 2ItS5i0SMooOcrwcKN6GxnyXz9blsmO93iGKF370D65v8kV1f/t+
X-Google-Smtp-Source: AGHT+IH2AADFwOVOQ1R4+gybUTrdQi/LWShRjvH9Hp6FgJFs5PPv8cF+35BhJDVAUQg7FgD0Y6O57w==
X-Received: by 2002:a05:6000:1fab:b0:37d:47a4:ec2b with SMTP id
 ffacd0b85a97d-3806121a2b6mr4483656f8f.11.1730233440576; 
 Tue, 29 Oct 2024 13:24:00 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:24:00 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:31 +0000
Message-Id: <20241029202349.69442-6-l.rubusch@gmail.com>
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
Subject: [Linux-stm32] [PATCH v4 05/23] ARM: dts: socfpga: add label to
	clock manager
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

Devicetree setup expects a clock manager label to be around. In
preparation of upcoming changes to allow for compatibility.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 90e4ea61d..7f7ac0dc1 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -88,7 +88,7 @@ fpga-region {
 			fpga-mgr = <&fpga_mgr>;
 		};
 
-		clkmgr@ffd04000 {
+		clkmgr: clkmgr@ffd04000 {
 				compatible = "altr,clk-mgr";
 				reg = <0xffd04000 0x1000>;
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
