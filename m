Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE024CD34F
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2019 18:03:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8120CC36B0E;
	Sun,  6 Oct 2019 16:03:34 +0000 (UTC)
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B962C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 16:03:32 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id k10so642166ybs.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Oct 2019 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X0YlaBg0eWRFmg01LcYcEakBboU2udItKz/WvLmsstE=;
 b=fyQ5xERCIVVSDumVC4ubV58r5dQvmSwwgM1gDnffp4c+23b97gjExIR2w5eKv7/8Jq
 ziZYQoR+ekNbyGmg5MyCdRKQCpjPl96Gg05vwaXu+bKwftDmAqbbBSH5E6QwSe5Ye+LQ
 xBUefkUGCXsIWAzl+r81TYehHx4jhYKp4zVdIT8iewLeyrco31I++sQZr0GkvC3qWrAI
 ySzHJ9fVZA81+D7Pk/jT9oRRn9rbqPtPhS1BPMSDfCtq7jRYvKthUyl4YoB3plYqlI9i
 4S/8SyDDMH2Wqfnrbl6M9RacL1dX7HAom4on1ZHwAGQZJQp1mHNTFfq/qMP0zFcmFZqo
 4HYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X0YlaBg0eWRFmg01LcYcEakBboU2udItKz/WvLmsstE=;
 b=eRw65B4rc7B1aH25bWcJxmKiGBGt+B8s7t85OAJeL1910KvyGn6Ikxp4KpE8ktanLx
 dgDlpjtqlDWCLahRS7ApaIfVoIqxLX5tN/YWnUh3GS7+Hsf0BZFovHskWTThAf3XgRR4
 2PWTX5OqMg/VYTtTMdyL3UkWmCmDzJ6m+itx1PzZmsTNcPGJ604/7FdjpViIIHxhyg4s
 2PiaxWGvCP763gJOR7QbTqUCEhjFtbgv3B2Xu78BpKXB1corjTWqc/p/djgQM2PZTxHu
 f/sB5mejzMoHxdIMstITrziCebTZfOHIJ1e1UYMjZoHxSenZsc+KBrD6O3qRj+Zw/deq
 CL2w==
X-Gm-Message-State: APjAAAX4hCNsra1u11ID2VjHzbs9fCjjbiDjSnMExZt/eXilzv5uyOBG
 Iad4PwewyazJg4HrEWJju4g=
X-Google-Smtp-Source: APXvYqxNW/YNL3A3scV1Qc1+vAzbrjym3yfhoINYZ8xNzXVB83HFsdfnpe2UcuggrPJqmHwKu7egzA==
X-Received: by 2002:a25:ce08:: with SMTP id x8mr8866430ybe.177.1570377811262; 
 Sun, 06 Oct 2019 09:03:31 -0700 (PDT)
Received: from localhost.localdomain (072-189-084-142.res.spectrum.com.
 [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id y129sm3341816ywy.41.2019.10.06.09.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 09:03:30 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Sun,  6 Oct 2019 12:03:11 -0400
Message-Id: <75a9ca9837f4d66cb4912cfa535176e27f7c219a.1570377521.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1570377521.git.vilhelm.gray@gmail.com>
References: <cover.1570377521.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: benjamin.gaignard@linaro.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-kernel@vger.kernel.org,
 William Breathitt Gray <vilhelm.gray@gmail.com>, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, david@lechnology.com
Subject: [Linux-stm32] [PATCH v4 2/2] docs: driver-api: generic-counter:
	Update Count and Signal data types
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

Count data is now always represented as an unsigned integer, while
Signal data is either SIGNAL_LOW or SIGNAL_HIGH.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/driver-api/generic-counter.rst | 22 +++++++-------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index 8382f01a53e3..161652fc1025 100644
--- a/Documentation/driver-api/generic-counter.rst
+++ b/Documentation/driver-api/generic-counter.rst
@@ -39,10 +39,7 @@ There are three core components to a counter:
 COUNT
 -----
 A Count represents the count data for a set of Signals. The Generic
-Counter interface provides the following available count data types:
-
-* COUNT_POSITION:
-  Unsigned integer value representing position.
+Counter interface represents the count data as an unsigned integer.
 
 A Count has a count function mode which represents the update behavior
 for the count data. The Generic Counter interface provides the following
@@ -93,19 +90,16 @@ SIGNAL
 A Signal represents a counter input data; this is the input data that is
 evaluated by the counter to determine the count data; e.g. a quadrature
 signal output line of a rotary encoder. Not all counter devices provide
-user access to the Signal data.
-
-The Generic Counter interface provides the following available signal
-data types for when the Signal data is available for user access:
+user access to the Signal data, so exposure is optional for drivers.
 
-* SIGNAL_LEVEL:
-  Signal line state level. The following states are possible:
+When the Signal data is available for user access, the Generic Counter
+interface provides the following available signal values:
 
-  - SIGNAL_LEVEL_LOW:
-    Signal line is in a low state.
+* SIGNAL_LOW:
+  Signal line is in a low state.
 
-  - SIGNAL_LEVEL_HIGH:
-    Signal line is in a high state.
+* SIGNAL_HIGH:
+  Signal line is in a high state.
 
 A Signal may be associated with one or more Counts.
 
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
