Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC359E4E03
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 08:13:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94770C71292;
	Thu,  5 Dec 2024 07:13:27 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 313A1C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 04:56:25 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7b65f2daae6so52540185a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2024 20:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733374584; x=1733979384;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NJwVGmFLLupEAjKKIh4cOJ5vLCVFBJLZBEr2Oxv6CkY=;
 b=JRKb9qSz5bPN66XExBV2jCBmDVOxtMFBbI6ZsoDtzaBTt5BhyrG4SokY46nQjAq+/1
 zIRj4koawtqKYG967ptPnvX2yyo0A9H/0jMGQpkGzzFNGvCRcBQXgPQuCzSOoFWZRBzs
 C52oEPXe0fPkQ0P4H6wD7V1eWCENcAS0RCUgDtWcgeFLMM8jhOxEzZ40FGCHgrv9GYIi
 x1DD+QZQsuLu7sJm3mBjgsrTOzEVghziXWnUOgm/Cucs+R2/xQLVl/+FOuMRoKxzq/ps
 4/ehGCPUoaMTXQ0T0XGz7htcFAizezVTeHrquFhtjuCEZont1ytl6vwFzuxH5eQNS4yT
 4+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733374584; x=1733979384;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJwVGmFLLupEAjKKIh4cOJ5vLCVFBJLZBEr2Oxv6CkY=;
 b=cg1uv7DGEL7UWIMA0KUE2+ewYXynJjMidyEhLHBqBiK1/AVwoHaYG4uYbFi41/A3qW
 Qx1+EB5S+2D5Z7GmY7sZGAVd9pLlF++9ZPv2745ydNdwVDt2RkbOh9vIrYaTu32REEKo
 hlNkX4OhC+s8veegD7ChGi8WLWPgXLOAj5ufbi0a176ULXGuBexkDEkVdcbfem6n/2wG
 NtjtIiEp2W6FTN68rpdRfsszEaSR+Nf/m13g/iOXbPmhqM7dVxQO2Setr5iHbSgClOdI
 K9rLG231X93Di61+ZxmKDqQ9wv6Vg1vS7j7GjWfpo/VnQqWxIOOCFR4vrQy/lybtFNo9
 r+ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjXe9s9RslXM5RHcA8zo4gNwz4dQ1f8PQ0ersCOkQytVR3/F5uAeiMnDeQjGw0HPUmZkJcwzH03qs+9Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvEDmpwyIoZ+pMqeXLxRAOlQdLReTd+4DhOsfzKTaUjiEjynir
 lqLA4a+OCDqsxoZDTNwU+lyCK0zdfeVbF/KDXFNtpiJwEe3LghTD
X-Gm-Gg: ASbGnctR/RfQpnoLEXG53b8Sp89F2eKSWI0t7KmKkB0/e6/UhjeDBTqyVUC7fpozfGY
 wozPSHpF9TxIDefOgLyhM1lD5MkgNvJsh4srxgDxK3xjjXNoCb++tVxg6DIbeqZv66seL/DGGCn
 3AfRm8os2IfgimUram6xM6GhlLOIjzgq2TKXVeTS4V4h4ERTZUs7UbDLnRsbIUZJZe55oGCXXRN
 iAHbkIDHrJevaLvT14KpPI2yTYGnnzjobgX1c61LXkX/DkfW32z/Vbcz+apSTLOpQ==
X-Google-Smtp-Source: AGHT+IHIuNQrbgjQ4cjH2cjwVpjstCmf4cB0AAn5tmajUXvL3AEVai2cjHK2prUL6uzLmimt8pbxNA==
X-Received: by 2002:a05:620a:2625:b0:7b1:52a9:ae15 with SMTP id
 af79cd13be357-7b6a5d2ac8fmr1106699585a.9.1733374584037; 
 Wed, 04 Dec 2024 20:56:24 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6b5a83abbsm28121185a.92.2024.12.04.20.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 20:56:22 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com,
 fabien.dessenne@foss.st.com, marex@denx.de
Date: Wed,  4 Dec 2024 23:59:42 -0500
Message-Id: <20241205045942.2441430-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Dec 2024 07:13:26 +0000
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 Mingwei Zheng <zmw12306@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: Add check for clk_enable()
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

Add check for the return value of clk_enable() to catch the potential
error. Add a cleanup loop to disable clocks already enabled in case
of an error during clock enabling for subsequent banks.

Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..eb7b2f864d88 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1738,10 +1738,16 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
 	struct stm32_pinctrl_group *g = pctl->groups;
-	int i;
+	int i, j, ret;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_enable(pctl->banks[i].clk);
+	for (i = 0; i < pctl->nbanks; i++) {
+		ret = clk_enable(pctl->banks[i].clk);
+		if (ret) {
+			for (j = 0; j < i; j++)
+				clk_disable(pctl->banks[j].clk);
+			return ret;
+		}
+	}
 
 	for (i = 0; i < pctl->ngroups; i++, g++)
 		stm32_pinctrl_restore_gpio_regs(pctl, g->pin);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
