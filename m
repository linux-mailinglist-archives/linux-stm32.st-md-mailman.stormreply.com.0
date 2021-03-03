Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D39DE32B5D6
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 09:05:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9998AC57B72;
	Wed,  3 Mar 2021 08:05:33 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B9CFC57B70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 08:05:30 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id o6so3825608pjf.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 00:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9WScLp0r/W/RtBKCNK4NfA69nZ1jc+w0DJEtDPB+5ZA=;
 b=G2sBQX2WzFpA0aIID9mW1OQxfj8VMxagsUZzSO5d1I7/9o+JXnYm/btZiGyJEMD6L9
 mZxLQR9LaiL8cWT6vHN8XLzaaPbmekOv496xeqdb9Wyhdk7Q6+DgbXu/JrR+fNGsb4/e
 2hxUBwLsdZ07GW99aHOO4GFGPxlUAV72YYbgA3Rc29AMkq7dXwtvLzU63NxVlapdrHav
 fUaqx6SDqwAlJH11Bv+eJzRb4vZvCmC6Yd7BxYHA41W8zFRJp5wIPYT405Zq6KTtvpNF
 uDWAvjJKWLutrDW9GlUprtz/dBWvku3E/5FcqsmuI0TdqN7pjyF0NBuUxxe3VcArBMel
 rwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9WScLp0r/W/RtBKCNK4NfA69nZ1jc+w0DJEtDPB+5ZA=;
 b=kuyzWcAlerQuPEeSBchoxQ361zUGJN0wJnP1Rwsva3+ORLfcxTojT10zeGmIscRYHl
 jTYImzV74fiTp1nWmrtrT6i973K5FKVAuQrTCl42aAiFERI7grTReJHaKbgdY7PxFSAT
 nBAnYm+ZXG5kHXtZNLTDC0AWu0t32sAiTe3qn4mgKrkZHvs46lMMLynLi2OXBbaTofyl
 WEErPhSjfCGi5B7q0jwsdzRDEwLsoUihH44Fu6yA57D6d+hzjJluW8A+r98ifH4yqkdH
 NJ3cmp4qqNZwHD/TqTcigfqccEX0NOLBa+jzZFboVpHj/bRbEPzKvQyknszwnAOamfsZ
 KnOQ==
X-Gm-Message-State: AOAM531mkDkZ+FPeSh4LYMPD9v8UN8CNmvq0XXOmU+bnnwHT9xNHYNt/
 N9QzA5iJq8qLmGwACdT7LNs=
X-Google-Smtp-Source: ABdhPJw/74XRKn9gtPqd/4A4o6JVg8qNeZl7jtS4ti4dkif0WXV7VgBD8JZsIRDG6m+IoEHO013ZQQ==
X-Received: by 2002:a17:90b:3886:: with SMTP id
 mu6mr8324229pjb.153.1614758729036; 
 Wed, 03 Mar 2021 00:05:29 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm22260887pfv.84.2021.03.03.00.05.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:05:28 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Wed,  3 Mar 2021 16:05:11 +0800
Message-Id: <1614758717-18223-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH 2/8] Documentation: arm: stm32: Add stm32h750
	value line
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

detail information can be found at:
https://www.st.com/en/microcontrollers-microprocessors/stm32h750-value-line.html

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 Documentation/arm/index.rst                    |  1 +
 Documentation/arm/stm32/stm32h750-overview.rst | 33 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst

diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
index b4bea32472b6..d4f34ae9e6f4 100644
--- a/Documentation/arm/index.rst
+++ b/Documentation/arm/index.rst
@@ -52,6 +52,7 @@ SoC-specific documents
    stm32/stm32f746-overview
    stm32/overview
    stm32/stm32h743-overview
+   stm32/stm32h750-overview
    stm32/stm32f769-overview
    stm32/stm32f429-overview
    stm32/stm32mp157-overview
diff --git a/Documentation/arm/stm32/stm32h750-overview.rst b/Documentation/arm/stm32/stm32h750-overview.rst
new file mode 100644
index 000000000000..c8ce59ec3bd1
--- /dev/null
+++ b/Documentation/arm/stm32/stm32h750-overview.rst
@@ -0,0 +1,33 @@
+==================
+STM32H750 Overview
+==================
+
+Introduction
+------------
+
+The STM32H750 is a Cortex-M7 MCU aimed at various applications.
+It features:
+
+- Cortex-M7 core running up to @480MHz
+- 128K internal flash, 1MBytes internal RAM
+- FMC controller to connect SDRAM, NOR and NAND memories
+- Dual mode QSPI
+- SD/MMC/SDIO support
+- Ethernet controller
+- USB OTFG FS & HS controllers
+- I2C, SPI, CAN busses support
+- Several 16 & 32 bits general purpose timers
+- Serial Audio interface
+- LCD controller
+- HDMI-CEC
+- SPDIFRX
+- DFSDM
+
+Resources
+---------
+
+Datasheet and reference manual are publicly available on ST website (STM32H750_).
+
+.. _STM32H750: https://www.st.com/en/microcontrollers-microprocessors/stm32h750-value-line.html
+
+:Authors: Dillon Min <dillon.minfei@gmail.com>
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
