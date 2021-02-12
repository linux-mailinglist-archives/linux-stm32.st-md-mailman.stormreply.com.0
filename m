Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC0B319DFE
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 13:14:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D21BC57B5B;
	Fri, 12 Feb 2021 12:14:24 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A264AC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 12:14:23 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id b14so8448747qkk.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 04:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6xiffz/2juDPYZZmbqjFbaJKECdvS7YcRGaS6EInCRI=;
 b=mZwTrnYBpzn4XVHU4cjflgs4dw3om1p7+bsPTTIGiZD2NCewK4MDA6YLmPTaDa6DMu
 Ge04VhdsHPF4MRQu30KIcCqwXytSwbkASdr+K1rrR67Uv9HT8pQZivCSWDLOaNXHa+3M
 TGh9iaQ4NiaLDiIFFXI1FEPic/hMSPuaFhzexZOXuh9Mc6E5AxBlw1Mnt7EhujKKYvK3
 sWRt1tNWuoZz4jm/M7mZWE2JOvL1aQF6cEuA5eracV6uuSMk+BARM+N/EVLNw/fUJA4v
 7kebs8UyURXh0sS+M8bV0F8gP2jaAGrrDKi6gl38qEe+fn80R4JoTK3zJb+lSPfxZKxI
 +ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6xiffz/2juDPYZZmbqjFbaJKECdvS7YcRGaS6EInCRI=;
 b=D56U01SpXRVGZ1sRQPg4M/TDfl4e8brtwDvTXuqvPCq+wk0zf+BlMBKIH0FieTT58l
 hQ+vwW/inly3b/FsSaONJ9a45IizmU+Wx5Qoe8qtPHhHXwSln/L31gY8fb2ulQD0KlNr
 o+92uULlJ5y8XBLPFE9wqLDMo2AN5T1bQ75UidD9rm75jqlnlf40o1T3/EGq5i6fsoiS
 kiIhlzRyxMP4Gi96hk6jbkQ4f30fn/vk1Iw/Nb8n203qsb4OUIl8DmtEhRB9UIXZa0xb
 PsfJKA4ij8tQ8MRoqjMFEuhr/bJOF77asAPORG6KjnE4A/7UmCky5WVscG6VcI2OHAJ/
 YRMA==
X-Gm-Message-State: AOAM532p6PV1Ly9Ofi8QA97A/j6Gwo6uikGQamn9glauGSYDNZLhtCVy
 zEzPIvZEFAcD4tfbQBPPTm8=
X-Google-Smtp-Source: ABdhPJwoTxWbQejBvfQ1z5Et+JABQcqujW3McbDYqiMJyzm1dfG/tggH8StL/8Q1BhTbF/53po07Dw==
X-Received: by 2002:a37:6cc6:: with SMTP id h189mr1325495qkc.195.1613132062689; 
 Fri, 12 Feb 2021 04:14:22 -0800 (PST)
Received: from localhost.localdomain ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id y135sm6278534qkb.14.2021.02.12.04.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 04:14:22 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 12 Feb 2021 21:13:28 +0900
Message-Id: <b16b0f7e882a80924d785f022f8ff6b160f9d288.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v8 04/22] counter: 104-quad-8: Annotate
	hardware config module parameter
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

When the kernel is running in secure boot mode, we lock down the kernel to
prevent userspace from modifying the running kernel image.  Whilst this
includes prohibiting access to things like /dev/mem, it must also prevent
access by means of configuring driver modules in such a way as to cause a
device to access or modify the kernel image.

To this end, annotate module_param* statements that refer to hardware
configuration and indicate for future reference what type of parameter they
specify.  The parameter parser in the core sees this information and can
skip such parameters with an error message if the kernel is locked down.
The module initialisation then runs as normal, but just sees whatever the
default values for those parameters is.

Note that we do still need to do the module initialisation because some
drivers have viable defaults set in case parameters aren't specified and
some drivers support automatic configuration (e.g. PNP or PCI) in addition
to manually coded parameters.

This patch annotates the 104-QUAD-8 driver.

Cc: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index f0608b21196a..37551d3016de 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -21,7 +21,7 @@
 
 static unsigned int base[max_num_isa_dev(QUAD8_EXTENT)];
 static unsigned int num_quad8;
-module_param_array(base, uint, &num_quad8, 0);
+module_param_hw_array(base, uint, ioport, &num_quad8, 0);
 MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
 
 #define QUAD8_NUM_COUNTERS 8
-- 
2.30.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
