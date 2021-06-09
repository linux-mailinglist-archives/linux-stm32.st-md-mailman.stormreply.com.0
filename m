Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1053A090F
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6411AC58D5C;
	Wed,  9 Jun 2021 01:32:03 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74BDCC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:00 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id g4so432932pjk.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SB7sEpjvZQOQtpvHPsP8l+Li1AdCcsSe3f9eehUgeNA=;
 b=bR7sbjaGx4kSXHi4iNwDpN5CAiQqp8YdU7IFjtl5Vw5TAcgxrA07MXYJgROuXCDpoe
 Bw87UnUVk8DS6pTXSkn/fGSCfoTWdMR5dih+6lvsSkApTiPDkrwMRGRmbaZi8BgGieFN
 /vyNAgp8yev1m0pO+f5EGQvcsauSZiW2UdYjIX8KGpStHOhAyhTPhL5qatkPX49y3Fto
 UY0qLv+oDJKFpO4PkdH5AvXEMHhOQCRk5TAdzmj65M6BPz72BYtRIKWUOeDeCbhzlKHC
 a7WyvJlKOjHrwFm4hu9GWqDvJ+LFzKIvqUnmP2IJ8rF8Ic0mogEeKeyPwKNsE3pRlLFb
 Oz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SB7sEpjvZQOQtpvHPsP8l+Li1AdCcsSe3f9eehUgeNA=;
 b=cwGAgYhSprDubEinZ2t/p54iPaxlg5dC/iMBxETYviHpARzQY+IuUAbe+nhI81ETa2
 ixB6o8GwKsP7WIBO3hLh1X62OBdlU+4P4asHeQ67KirZdOzlr5VpHtSWOCc2aFXiHtnz
 Rh/WoXK7U5DnWAqalM7ugOw0Mdduvk1VSGLp6TywEix3lzGoIaWtHDk79oKNvBn1doVz
 kvVuD0Fqt2uFAE3Azugi5H2JSyZjkJdoUtDMSyBflm8ZYlrdcxWMIcKdHi0prOAoJXJB
 TaOMnGUClMlQNzEmX71mjmIC2JJ8wTcXMefXRE7Kam1MDuEdxgfTTI0S1N19kAQX21Z9
 Teqg==
X-Gm-Message-State: AOAM5302dvLGLEdKJIK8LDpMIh8Bm/62cMZ4g6Z8x2rAWYPGEEXdZNtv
 8p2ArfQNsMRQZxNA6VJ0VkY=
X-Google-Smtp-Source: ABdhPJy41Fnn86plANS8oj54WBpfJPXMo+Hw7PQLX7SuavwXtUnl64XC0Gjbxq637YKKZvhYZOfqaw==
X-Received: by 2002:a17:902:b713:b029:fd:8738:63cb with SMTP id
 d19-20020a170902b713b02900fd873863cbmr2592038pls.28.1623202318988; 
 Tue, 08 Jun 2021 18:31:58 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:31:58 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:05 +0900
Message-Id: <880c2fd0e2e91b8962c9d388b37ba582d548db8e.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 02/33] docs: counter: Fix spelling
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

"Miscellaneous" is the correct spelling.

Reviewed-by: David Lechner <david@lechnology.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/driver-api/generic-counter.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index b02c52cd69d6..64fe7db080e5 100644
--- a/Documentation/driver-api/generic-counter.rst
+++ b/Documentation/driver-api/generic-counter.rst
@@ -307,7 +307,7 @@ Determining the type of extension to create is a matter of scope.
 
 * Device extensions are attributes that expose information/control
   non-specific to a particular Count or Signal. This is where you would
-  put your global features or other miscellanous functionality.
+  put your global features or other miscellaneous functionality.
 
   For example, if your device has an overtemp sensor, you can report the
   chip overheated via a device extension called "error_overtemp":
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
