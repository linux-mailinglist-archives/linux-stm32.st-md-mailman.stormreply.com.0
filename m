Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH6qAnLHvGlS2wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 05:05:06 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 999EA2D5B29
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 05:05:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 300EDC87ED2;
	Fri, 20 Mar 2026 04:05:05 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E07CCC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 04:05:03 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2ad9a9be502so1242035ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 21:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773979502; x=1774584302;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=;
 b=FNecNZZgfPNC4+oym5154I2Vp+7pfgUi9Fu0yPpPD3Fw4r2LbjhaazlNSWifIMtLvc
 9rHDk6MA+Na2ALp4CE/GEYwFwvSDBf/KRTlnjF5D66JW65LP1qpthFogBN0eRkFyZLJu
 0WSe4e59X+sfzEPkm9EPo/534iqIy/ClHY/gjiNd7Ao8XSuYh5Yy5Fx23vVEuyPgG5tS
 NMmVBp94tpwhb4fy5kE+X3gl/ezZaYKfo5D8nboSJraCnD4/25JLhw96eB9um/ZvUr2S
 0QGVhvPbD0KAmTRO5PbW873FxtlpCVA1sWbZVsioyoOt+uuYpZoRBlB1K3p6d8KhuMr4
 T/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773979502; x=1774584302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bi+cpYb6Vg0VXFOuregCJb6MTqBCf/daXiAT548yjY0=;
 b=r6rQ5qfk30j6BhKGG0YvvAq9byFg4V7+eQslk9NOtOtNDXJU+EVjQAXrT12i6oLX89
 AB+hRDFNayDW7farcSDP+lYPbpthodEyo8J2npMCrLmD6dK4hbsBIeA/VFy5oB3KoPkl
 00SztFzvAYqUd0R7/byE/uP/jJZ0sdWWnrdU9jI0AHfS0ANo4XON378Kj5+Gm7PhUus8
 KywihfL91qZdkqIQ2OiicQda/1KCdAT/ka+SsiQkJ8i5xHiikcPdIJxzeuWxitkeGbK8
 buX5xwiglD7g6ZZbmPTFjAwYyE50lHLWPd9DLkQx2wn40o/5z2HZWG6qbiU7SmHwd2zX
 csLw==
X-Gm-Message-State: AOJu0YxR0tpg21KSlrWq6bvyuHZg6mQ2Dw49B2JisP9+nNNtR0c1DAqZ
 N2WBqAKTFf9WorD1MQuYnnVzWMu/97WLGOl3vMklr0Kj0X/p6xk1IWffVprSGh8j
X-Gm-Gg: ATEYQzw7S19TXxd+Ej1WkFQDV+WvU0ivIMWDBgt6q+LOVZ62MsToXUWMdZIkP38E6Ox
 LF7JVNtlPx1ucUhzmvHSlx/P21rWHTXVKi7alal4x/qO+ZjBvDKrPNMO6Q0awHt4gJAZg6zuZrN
 9UCKTfD6Q/8h/tLjrxPkcNNGrWC/P3LHfz169g22lfdhlpBlS+wCSGY18xJMTUkp6FhgoKvJhpM
 W+VVCc3RaW+Da866a414vR648zH79ugFhaQ2t6Qn7Vpzz4PtLQrpzzLlNgx3zSGwsHsoh1YrjIy
 XZYxeXDhaGgXX9TkOVA/8ym+dP18grHq43QtdadU4w0cBLZKC6XIGQe8bB0bVdRNGZZPJe5ZbgR
 AbUgmNMwdKXypR8zcc5els1sfqHpRINVE5UNi4l4szg3ZCFnD56w00vjO7RuCrW6rSPmYN8Ipm+
 CK3shpKVVyS84SsM+rya6rHg4OIJzuRzMe2Cg3EQ9gYFfypD3Ta0z5FkU=
X-Received: by 2002:a17:902:e74b:b0:2b0:7531:b61e with SMTP id
 d9443c01a7336-2b0827c2095mr13747205ad.41.1773979501693; 
 Thu, 19 Mar 2026 21:05:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b083516ae1sm7212905ad.13.2026.03.19.21.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 21:05:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 19 Mar 2026 21:04:43 -0700
Message-ID: <20260320040443.46038-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH] irqchip/stm32-exti: Use kzalloc_flex
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,kernel.org,gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.380];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 999EA2D5B29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplifies allocations by using a flexible array member in these structs.
No need for a second kfree.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/irq-stm32-exti.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 5fdf335acb46..144120cadfa0 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -45,8 +45,8 @@ struct stm32_exti_chip_data {
 struct stm32_exti_host_data {
 	void __iomem *base;
 	struct device *dev;
-	struct stm32_exti_chip_data *chips_data;
 	const struct stm32_exti_drv_data *drv_data;
+	struct stm32_exti_chip_data chips_data[];
 };
 
 static const struct stm32_exti_bank stm32f4xx_exti_b1 = {
@@ -269,26 +269,20 @@ stm32_exti_host_data *stm32_exti_host_init(const struct stm32_exti_drv_data *dd,
 {
 	struct stm32_exti_host_data *host_data;
 
-	host_data = kzalloc_obj(*host_data);
+	host_data = kzalloc_flex(*host_data, chips_data, dd->bank_nr);
 	if (!host_data)
 		return NULL;
 
 	host_data->drv_data = dd;
-	host_data->chips_data = kzalloc_objs(struct stm32_exti_chip_data,
-					     dd->bank_nr);
-	if (!host_data->chips_data)
-		goto free_host_data;
 
 	host_data->base = of_iomap(node, 0);
 	if (!host_data->base) {
 		pr_err("%pOF: Unable to map registers\n", node);
-		goto free_chips_data;
+		goto free_host_data;
 	}
 
 	return host_data;
 
-free_chips_data:
-	kfree(host_data->chips_data);
 free_host_data:
 	kfree(host_data);
 
@@ -389,7 +383,6 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
 	irq_domain_remove(domain);
 out_unmap:
 	iounmap(host_data->base);
-	kfree(host_data->chips_data);
 	kfree(host_data);
 	return ret;
 }
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
