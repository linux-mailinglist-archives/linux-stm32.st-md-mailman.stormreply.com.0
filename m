Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E9EB5E53
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 09:53:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C07ACC35E02;
	Wed, 18 Sep 2019 07:53:29 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA888C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 07:53:28 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q12so3816629pff.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 00:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X0YlaBg0eWRFmg01LcYcEakBboU2udItKz/WvLmsstE=;
 b=AkDFryyhXfRKyYsBUK/KXoVhWOS+frVLcJhgIH2cxTS3whUyNT8x2qvtaNcSFWmZvy
 5gsAQmmAO/3Gxs67mdVJcyC02/Jvf+6VXiHN1VH1qkQPZiu5eREbG0BkyO6aH3fnqqHS
 Id0cQ2DVr5dAEeR/Opp7cYg5Hk3IJT+duEw8CaFbEvueqmUysPnSgyXqEBzwtDxdFUKk
 sOhzOeSdHbNP7Xofpfxt+xqLByjC70EJpD0/NNRYwXvoJaRvuu1GZNfd19BNVYwMoCLK
 ZjFBOEMIA1l0YlAKCVd4B84k/44VcCjkkAsjE4giIMyTrTw0Ar5hauGdOXV4YG3vfhMH
 ilzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X0YlaBg0eWRFmg01LcYcEakBboU2udItKz/WvLmsstE=;
 b=fgHe1yT0ScuoOe9JwIhwPT3x+zDj/tV5iTI6o9v96cpFAI4Tjrd968Es0bHp7dKyPH
 7duiW7qOL2TuOPwRr6agAFZ9H3tmLxd3owDEWGYBv2axNU1bigoId4xQTZpfo/a8M/Ur
 2A/5dTetQQbXObi6/5VXeHR2JO5PRuhCAWc06BdyI/YY6wYIxRClSvIXwG7AhbA9O3yq
 jo8wctfgOH/oAZAQsdhi7f7KOdalvrmcEOPskfJBxZ5GGtzRjFBmL6n72oyYRnhY3nYm
 eWu18QkyVxVGvtIPpl6YWm/e+NOPqPtSivcfg3zWYciuwgp5SbQtfor4LGQZtId0PL7z
 q/zA==
X-Gm-Message-State: APjAAAUWDGe7XSWudkxRknyA+IVwORhUYIriM9h+88aUsYTMP7cZxumo
 tiGVTjK8fRhNz1tdeitR2gQ=
X-Google-Smtp-Source: APXvYqzaZ48uQhaDCpAmPYWnFCbRwXOhnRpAWgBqtZsQrr7+jFYScd1DVyElD2iND+AbYLOOfNJGWQ==
X-Received: by 2002:a62:ab04:: with SMTP id p4mr2716826pff.227.1568793207344; 
 Wed, 18 Sep 2019 00:53:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:268:c147:d9df:f819:e399:825f:f2dc])
 by smtp.gmail.com with ESMTPSA id h8sm5580715pfo.64.2019.09.18.00.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 00:53:26 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@jic23.retrosnub.co.uk
Date: Wed, 18 Sep 2019 16:52:44 +0900
Message-Id: <f7e5486216f4368e1e00a20842928a1f0f6a4135.1568792697.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568792697.git.vilhelm.gray@gmail.com>
References: <cover.1568792697.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/7] docs: driver-api: generic-counter:
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
