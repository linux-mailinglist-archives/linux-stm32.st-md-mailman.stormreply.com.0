Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9584B65FA
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 16:23:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5488C35E01;
	Wed, 18 Sep 2019 14:23:38 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE180C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 14:23:36 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x15so4211136pgg.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X0YlaBg0eWRFmg01LcYcEakBboU2udItKz/WvLmsstE=;
 b=AQUtfExt8PphIK/V+c+mEJ3tgaUEISxw78DBCeSXeyLH9gYToCX1fyDRsFiqifcLuN
 c5domyKtQbNk8UW32C/o8pZxeVKctq+eYM2nl/a+mrfcyhODXnb1TWcvL3vFe3MDygUK
 358nsEwOyj4l+QNqq6/0BFrGmo5RY6rTAIZqbnkTVAqAnMc+ybt1H0p7QnhLAYo0iSGa
 W/AAiFLjZJoyfi3SME//ZCANuAHVX9bV2/CFWUIAQL4r8biRaX9RplWV0+THsCypl3Gp
 G+ZgOwie51YPSdJZmnm4/9gLYzpCIxn8HXzoM2hzP3BYjAceYcayoq/G0oXGgCoTG/i3
 u3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X0YlaBg0eWRFmg01LcYcEakBboU2udItKz/WvLmsstE=;
 b=cKYEd9GvohzLEZq0eZ8GzJZhyw5kYSU23jeQr8GEm6P7NHi/efZxWTytEABWmOtV7s
 msx30ZjSP012S6Gnm5Kncs21KwS7RuSWCz2Cvq5V0jfyRfKSTV/637quUGJ4zDhmO3d4
 v+Rvub10eaAvcsC6p3Ake5UDsz4SFryFCso6EBw2D2HoTHDVymYG/upNALhwX4cq0mx7
 iYyg85GB+8q7mpPhbJdXYauAATcDEGGLGCBKxMX5wNeUDEHJxYUCD4rAIZQ6pBy0QPqR
 ZUmU+RPoaA8wm46y04esGvxlZIq9iPdTLB7ZBfPvnwjqfVShC8sdyCKGVT8aNxZHaDiI
 ggzg==
X-Gm-Message-State: APjAAAVhhLrt2JUxNgXbPmu6GLIROOvv7eg6XUZZ24jN0yK8aO6uaYQA
 qhzeg6QSuKt5kik6BJC7vqQ=
X-Google-Smtp-Source: APXvYqwraF/YHqWdOvbISaW0toiHH71DUpkNZY1Cp7PbrQONBy+X5ThJP7vWM980IKlnropOI/g2qw==
X-Received: by 2002:a17:90a:c8a:: with SMTP id v10mr3943216pja.6.1568816615452; 
 Wed, 18 Sep 2019 07:23:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:268:c145:8e3a:1c91:3b66:30:c335])
 by smtp.gmail.com with ESMTPSA id
 d5sm10996675pfa.180.2019.09.18.07.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 07:23:34 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@jic23.retrosnub.co.uk
Date: Wed, 18 Sep 2019 23:22:46 +0900
Message-Id: <e7517c4062cfa186f90dc9e16765bd0745068c0b.1568816248.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568816248.git.vilhelm.gray@gmail.com>
References: <cover.1568816248.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: benjamin.gaignard@linaro.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-kernel@vger.kernel.org,
 William Breathitt Gray <vilhelm.gray@gmail.com>, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/2] docs: driver-api: generic-counter:
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
