Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 468DE65AE0F
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jan 2023 09:25:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C64EFC65E73;
	Mon,  2 Jan 2023 08:25:16 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AE9AC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Jan 2023 08:25:15 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so19671062pjq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jan 2023 00:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=93nJ5Kz+BlIZ58Rw+CqZdrGFJhp2grdsPUR6i1eSHYg=;
 b=ELMrLaaNHYA60UyumkyNKPmpsHkbWZ1wp0uePUanFKJQMdmeuiPk8xrbSiw9Qv+LWD
 QpUGYakUN5IK62N8/Zugfgf2L61dVoVqkkp8ThHB8wAIqNZhArKbsOYJN5z0GRuzhLMv
 MUhhXPtAAppVWP9S9sfHMghKNjcNpXb0zsOV58owX6YhEkudX4UgXdB5EqS10aFMU55A
 EQFGS8qS7KDxfZY08122Bw6jNZ9mWxl4I8Yo+iTRFCdFuTVTHpZaoRTkzj8vg0ZN+9h/
 QyZ7Nc2/Ifub3QekUxhDpyY8OXWu2M/WM88M9z3pFwKMGp5pIfi6KcMX25Qc1CvEAEwN
 WjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93nJ5Kz+BlIZ58Rw+CqZdrGFJhp2grdsPUR6i1eSHYg=;
 b=O4RZkOjXKf8jA7LTUv1Rp+IJ41rFDBf1BXQdB1gyq6LIOHqUfJaRh9v0CK72SImief
 QlSM7GESeo69QA8+guROWDXyB3jQuwnxbbLHGwC9RbxqNfNHbeOPbss5c5/7GW9ieACc
 5HIYdIKMJ+udwsDM8VhoVA3RS5h9SXjtRdiWYg5n5ZLUmmFrMhaT0aytALPKMmpFmkKw
 UARPBfABELMiMznnNf3ZRgdhU+k4sRzNL+IfEIkg8m8MWCzew6pr5lByj6kNPdDCfkxZ
 GZX4pm9q38POVNgIb4KMgrz6F8gJZ6eVAd/E9196L2i0UZAigMtYZbxnJ6U8oWFeY3yt
 7lVw==
X-Gm-Message-State: AFqh2koazrvHKpaWn33eaKS06WsJ/tycWvk6omCCR/a46r3JKyFEaLkL
 x79zObEqe7ywx0b2KoVzU4U=
X-Google-Smtp-Source: AMrXdXubgNR4C0fUl2MCMV1zJ50oUurN2jUlpFmeXREJ9xRDIHh0oonNJ3jsqTuPywljKSGeO8HlYA==
X-Received: by 2002:a17:90a:ebc6:b0:226:5900:f2f4 with SMTP id
 cf6-20020a17090aebc600b002265900f2f4mr8244054pjb.4.1672647913766; 
 Mon, 02 Jan 2023 00:25:13 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 lr4-20020a17090b4b8400b001fde655225fsm11431028pjb.2.2023.01.02.00.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 00:25:13 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Miaoqian Lin <linmq006@gmail.com>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  2 Jan 2023 12:24:56 +0400
Message-Id: <20230102082503.3944927-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: Fix refcount leak in
	stm32_pctrl_get_irq_domain
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

of_irq_find_parent() returns a node pointer with refcount incremented,
We should use of_node_put() on it when not needed anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: d86f4d71e42a ("pinctrl: stm32: check irq controller availability at probe")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 1cddca506ad7..cb33a23ab0c1 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1382,6 +1382,7 @@ static struct irq_domain *stm32_pctrl_get_irq_domain(struct platform_device *pde
 		return ERR_PTR(-ENXIO);
 
 	domain = irq_find_host(parent);
+	of_node_put(parent);
 	if (!domain)
 		/* domain not registered yet */
 		return ERR_PTR(-EPROBE_DEFER);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
