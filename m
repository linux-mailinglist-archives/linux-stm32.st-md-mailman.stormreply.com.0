Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31CAADB4A
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 11:21:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D3C4C78F9F;
	Wed,  7 May 2025 09:21:30 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43AD7C78F9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 09:21:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a0ad54f0aeso143554f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746609688; x=1747214488;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+y8jPOzO/Gnjm1gvhE1qivFemvUWxShS+OkhHR4ZTcI=;
 b=LHiRu65Ffeikgrq6baJLuhmutsCQ/FUS6GQFv9Dk+qnN/0OFf8NrF0qf5nulgNNq1N
 FPy0M1VIRHDlkYfLxq+ut0cC+n449J3KOpNWbBB2QFtpV1CwC58yiqHsgHhqGPryTBJh
 pkHrhE9tt0mIYDkPqgdFeFdgv/ppoXcBmKxHFGS7Z6flKSegfSqIJI0zVS24Ob0DvEeH
 VtFnJStvt9GUCdRlQLy6Bkm3gu+bIP2csEBd0T5v+/Iufh5LB3p0kXgcWYJWaBdDbPhL
 dPU4NhNK9yVY3rpjpjVOm8sxqqpQMlA1ZSPlkLUE3YrwfjMy/HHcicrv8S+l1OGgTDkw
 artQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746609688; x=1747214488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+y8jPOzO/Gnjm1gvhE1qivFemvUWxShS+OkhHR4ZTcI=;
 b=XzBZLwB5sYCDHnFJ1SNRje6Pu4tnaYvAoBKQun4YeljZhZNJE3bL1XoxhxK7jJVxDl
 bhDKZil8S+p/YZOxUgUbi/s66nCoYHU6vZPs8UkajNTV0qpPCXH4rrmBlyjiiPSzyfTB
 fyDrnb0GR7Ic1EMuwCWzCJbHo2ylV9raKAD5xUHb4nwlNJYPtGwdFkkaV7XYkPDsZ2eI
 CkXLGYzenWtRdYasAE9+z4UulYAKMzHLP2PF/JxHQ8AUfJYO1IkCtKXznO96XbY67v9V
 dP0WoYx/EULzrFcV4sSdXUwzZPB4TNhpYp55r50/tlHFs+Kyoabdo2r7Ri2cwuLu1EeP
 zEkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY7uNurKXotIiP5krYj8UAQGvpG0wbQJDGnvvO9om9YSx0Hc5WDd8cbToswW4TbqqID1pnibI5NhmBXQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzNaXUE7RGDlL+U+0KAPNh2lpphov+D7qQTC5sdXz1QLOBQFj89
 fXvP19jGvjfG5lT/9ZjY+f6HSe6MlX9TxeCkfu+mbtGE0KXtj7i5ZcZ1dnThn8Q=
X-Gm-Gg: ASbGncsSK6Ftq+eFbqMYD5pdGs57TjOYTLAJiDn6axmeZu7tpO/ivY2Mz1/YVSnaCUj
 4UtjjVLAKs4fFTvOJQBmbH+Evfp2XYHQtcpnl2liaM+LsvAo/h2ChyPyKShCKT7bL54RHSmPxJW
 FmJLy3FwDlWPu5VEv5wobM80GXLAplTvRyuIhD1JlUFO/36RhZtL2UnnGavwpikEkPEuYbNuNE1
 oXVj4KsgjrLQBsanY7wWoAhXGgC5f+e1jyzKoMb/0thvQNybjGOzOIUzzdilrWuKXW5JG6HH37d
 p/HdTZo3SC9xSYrj8HuhQEnvGBHAsYVPC3EEc8UHbBVkLaGpWw==
X-Google-Smtp-Source: AGHT+IGj/1ahHnSJ4e2xPVwr+AuBbHJ0wuhNIZomcjtqGtlqcAu1lDRaE0pf4RUZq68YnrfTUyA8AA==
X-Received: by 2002:a5d:47c5:0:b0:3a0:7d47:8d7e with SMTP id
 ffacd0b85a97d-3a0b4a363a9mr745845f8f.8.1746609688581; 
 Wed, 07 May 2025 02:21:28 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b5764733sm1633431f8f.22.2025.05.07.02.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:21:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed,  7 May 2025 11:21:22 +0200
Message-ID: <20250507092121.95121-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=Zuk4ngv1wcV3NMC95okNfizOZQtgYbFjGF2v7oWA7MU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoGyYROrndXK6jXz7UdfFDTRPGKx2tUXBG8hAo+
 NjoRR0HvAyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBsmEQAKCRDBN2bmhouD
 1yXTEACTo9Eb1/KCCY3Jd9m8bNUsYfG6kBXHtTAAFI8wXEESF8U4GhmrAvx81vwof2w0YREvtxb
 ISMF0pjB6RnocBfCP85nQ746kCG8w4rVNu7MT0UDe2Jz018fFc7e0HVZvZYTA6jt8gJBKwCmqd/
 OgFPMAwzCMmhAN0BMMRhei5JK5WBibxnRVJcAEQUEStj9wP5hwWVvHLNHyVpQvZfaC/8dWZBQtn
 zmtaN+U9IM6vKJGcwlagZLSUw66zRwLh2m+JGoab8bZzlOQ14Obp0WgsNouRNXtU9sKOglP/YrK
 Me7qo1tycDwv/7E4OHa3sRgrA68d2lbHXQc4FGvocItlGvWTu/gKzaXMeN7j0BXnWRU1GukWcOQ
 l5QHEjIyw1Vub0gO20KmikggPtrV01IS1/6oWur1TIG6J1cQDwQrWO3sOTlviVTRx7y/vrfwuuN
 w54+Az1E3GuM7qxNAvOY+CEG5RIzkNT/aVfRMbCZt4GBPLFctNStFxyP1qSRnD/nA+4AT9Nqy9Z
 D+nsGkQaCaMla6U9FWlPBqK6HaD1qzIz3Wd/OF8PYatfVDMZSP1QMZGFmYK2BV1r7DZV431BQET
 XmFwOSmhvwY44mJFyA9kdRO+00I/Vd3zISVSx8V6tEaHfIjeqV0ByI9r73KKQY17jhlYWNl1C6W
 qg3wA9+J6hsAWEg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
Subject: [Linux-stm32] [PATCH] bus: firewall: Fix missing static inline
	annotations for stubs
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

Stubs in the header file for !CONFIG_STM32_FIREWALL case should be both
static and inline, because they do not come with earlier declaration and
should be inlined in every unit including the header.

Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: <stable@vger.kernel.org>
Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/linux/bus/stm32_firewall_device.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index 5178b72bc920..eaa7a3f54450 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -114,27 +114,30 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 
 #else /* CONFIG_STM32_FIREWALL */
 
-int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
-				unsigned int nb_firewall)
+static inline int stm32_firewall_get_firewall(struct device_node *np,
+					      struct stm32_firewall *firewall,
+					      unsigned int nb_firewall)
 {
 	return -ENODEV;
 }
 
-int stm32_firewall_grant_access(struct stm32_firewall *firewall)
+static inline int stm32_firewall_grant_access(struct stm32_firewall *firewall)
 {
 	return -ENODEV;
 }
 
-void stm32_firewall_release_access(struct stm32_firewall *firewall)
+static inline void stm32_firewall_release_access(struct stm32_firewall *firewall)
 {
 }
 
-int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
+static inline int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall,
+						    u32 subsystem_id)
 {
 	return -ENODEV;
 }
 
-void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
+static inline void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall,
+						       u32 subsystem_id)
 {
 }
 
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
