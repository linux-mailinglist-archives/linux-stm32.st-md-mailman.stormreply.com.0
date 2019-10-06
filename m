Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1158CD90E
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2019 22:03:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A48FC36B0E;
	Sun,  6 Oct 2019 20:03:36 +0000 (UTC)
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA9EDC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 20:03:34 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id m1so3980501ybm.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Oct 2019 13:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PIaX21W8I9U+EF8hoBafqL2VfdvHvRxIA6u3x9/TwM0=;
 b=blJ+tDl8nG+FSdKewzSogp8WX4feg6K4mc5o3Fp+NyudNHmPlRGHJKHYyi3Dj0xOkv
 Us73dYpeeXifqLcgdM7PX4S/pUTCneN+KVMetVEJaDNO7VZyM9xbHbUSQy7NGRtXOrhh
 h8StpYzvNVVKJofD45zTFy+8iSfQKp+UUWfuGkUt9Z30wAatg9QkDUCc68Dl92za0EMf
 WimwZNQ+QHrNuB8VCVgxJNs0PnHKUX6oveNe14tkFHHhvrAwHA5rGSCXF+7LylvHdl9k
 GEQYNkWZE7HlncbmWwGSiiCFJv0aOQilT1YY2FBk+wTx64Q3I5oMqK0HdJuIw+1Dh+te
 8KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PIaX21W8I9U+EF8hoBafqL2VfdvHvRxIA6u3x9/TwM0=;
 b=hL0LxU+0U8Ml+mDr8ydl57cpCrhYR+LRlMoGfwS367iultAbiYwFGGR9lBl1Ynutrv
 4Addfirk+wjP/1dUALip+yJofHhXU6gf4t+6JIIkZ0PQkeKi+CLcGk4mkCI/D/Q+/BC9
 rNksXcgPgrB/seqC4xHQXgAAFAXBfA+wvQx0MO/7wJGPNJZ6V4Hx/0+qAJv1kTUTqsJb
 7QUWx4jhKh7yQ+wi5CiDnurLqV6OWThHfPqgI/ILG22aHZ3aihTVQWwlzNRA0/AfGV+Y
 9Cu7wk2ZavPNAAtL1Olwdu3mQ/g4i2zpjX+zicpfTmBe97xj7axc1ixhLNl5vnNcBjDt
 q/Jg==
X-Gm-Message-State: APjAAAWOAXeZZfuNBK7I+ksjuWnOUFQycGHPso26+RRJ2CNmwihufIUH
 9L61qCalykUOS2lPYz+dkQw=
X-Google-Smtp-Source: APXvYqz4mvN9s0757t230hmoQhGHOxs+DNUn1yMwWNnvg3C98M+iXwK0v5AeIOh5LLFcDlzwU/Briw==
X-Received: by 2002:a5b:b05:: with SMTP id z5mr9181818ybp.7.1570392213485;
 Sun, 06 Oct 2019 13:03:33 -0700 (PDT)
Received: from localhost.localdomain (072-189-084-142.res.spectrum.com.
 [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id x16sm3765266ywx.103.2019.10.06.13.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 13:03:32 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Sun,  6 Oct 2019 16:03:11 -0400
Message-Id: <4d8dc1e31aaa02e2d0a1ea580f1923075967db5b.1570391994.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1570391994.git.vilhelm.gray@gmail.com>
References: <cover.1570391994.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: benjamin.gaignard@linaro.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-kernel@vger.kernel.org,
 William Breathitt Gray <vilhelm.gray@gmail.com>, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, david@lechnology.com
Subject: [Linux-stm32] [PATCH v5 3/3] counter: Fix typo in action_get
	description
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

The action_get callback returns a Synapse's action mode.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 include/linux/counter.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/counter.h b/include/linux/counter.h
index 32fb4d8cc3fd..9dbd5df4cd34 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -315,7 +315,7 @@ enum counter_signal_value {
  *			Count's functions_list array.
  * @action_get:		function to get the current action mode. Returns 0 on
  *			success and negative error code on error. The index of
- *			the respective Signal's returned action mode should be
+ *			the respective Synapse's returned action mode should be
  *			passed back via the action parameter.
  * @action_set:		function to set the action mode. action is the index of
  *			the requested action mode from the respective Synapse's
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
