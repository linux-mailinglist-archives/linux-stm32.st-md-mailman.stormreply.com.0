Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3B332685
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:21:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6390C57B78;
	Tue,  9 Mar 2021 13:21:22 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 895D4C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:21:20 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id e6so8756541pgk.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3RYDFFjHkpdIJ04TsWBr8TmaLo8cU+WLWiTJPwxr6A=;
 b=cPm80utEO4gK7NjFC0zhB5gCOPQtq5RrNUNd9cA58RKV54Pyfn5Ple+ImuNJKzBvpt
 n8wndmxhEJq8BsaC+on7Q07Q9RHLFCNoxNaPe97INCetElIrmTqsj+Bwb9lPnVIRGw1g
 Un727QcUYB5HiVK+udGrEKeO9EX8vCZYnIbjKJWtph48VCX2XFggT0wmSwc3TO0ybB5z
 CBXoOaDrVfuxpGeV99w8q8QegdY1RsYgGuSbz9gBE4n6XusXJbjRBb1RvX4eDWh0EO4l
 K58k5bv/48LTWLNqywOg69rT+vHYe/T9mxJJjOsyCGOR24wHn0wqcfvJkzzq0n+h9zZ5
 wnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3RYDFFjHkpdIJ04TsWBr8TmaLo8cU+WLWiTJPwxr6A=;
 b=ZNsjGfzm3iQNZ3sTDWm6CgCcRXqvdwC4ctUzM+ELS/2gUN9uzsMcQmp6hZPlAm7V7d
 bp2q1IvilPD90FTIORnMU57hqfTdQitXYHgl82zOvkI/bOqF5gqveM27wz6VpIKGvc7b
 QS8VGR5LtOWwzwiHDV7kY1UAZq6b8758/gWQn77zENcdJBmW1UD0Onguw5yjmj+HH1Jo
 8PsHAgXsip/6WIA+P12qllxyFdvxPriKNUuW1drQ22XfLORaZFzp8y2bnIBg9Ba50WnF
 qB6GCi16zDb+n/AwPi6p9eDXkDrVSTcBZlBqY5VFgh96dkuV27Qh9u9mqOVBqPvsyJcQ
 Rweg==
X-Gm-Message-State: AOAM532Uz6SnA6p8Q4Btpy5I0+GIFqUKQ9VWCDZreL7JAh08YPKyJf2c
 RooPEfrf34kH/qAcrmDJ5gI=
X-Google-Smtp-Source: ABdhPJzuf+IfHPoOevXWiR5Tex/ci8k9Iu42/LT75i/JLS8DvEf89M7PROm+OH0amxUz5yHaHNf9Eg==
X-Received: by 2002:a63:d242:: with SMTP id t2mr24853367pgi.431.1615296079245; 
 Tue, 09 Mar 2021 05:21:19 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:21:18 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:26 +0900
Message-Id: <e9656724c31451a736d623920317b2e40524fa54.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 13/33] counter: ftm-quaddec: Add const
	qualifier for actions_list array
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

The struct counter_synapse actions_list member expects a const enum
counter_synapse_action array. This patch adds the const qualifier to the
ftm_quaddec_synapse_actions to match actions_list.

Cc: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/ftm-quaddec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/ftm-quaddec.c b/drivers/counter/ftm-quaddec.c
index c2b3fdfd8b77..9371532406ca 100644
--- a/drivers/counter/ftm-quaddec.c
+++ b/drivers/counter/ftm-quaddec.c
@@ -162,7 +162,7 @@ enum ftm_quaddec_synapse_action {
 	FTM_QUADDEC_SYNAPSE_ACTION_BOTH_EDGES,
 };
 
-static enum counter_synapse_action ftm_quaddec_synapse_actions[] = {
+static const enum counter_synapse_action ftm_quaddec_synapse_actions[] = {
 	[FTM_QUADDEC_SYNAPSE_ACTION_BOTH_EDGES] =
 	COUNTER_SYNAPSE_ACTION_BOTH_EDGES
 };
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
