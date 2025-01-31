Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D691AA240AE
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2025 17:37:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C771C7128F;
	Fri, 31 Jan 2025 16:37:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CBC6C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 16:37:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so26291785e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738341438; x=1738946238;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMx2YnOlJPDXeo1XJnfHHROuTOY3+drwNmWAuq+4lIg=;
 b=AeymkxVVegoEUczbzZ1MajxN0mbupjlpIKkfMuLmrRh8H5VfcegOnxwmVnBzsUEsAv
 ix8LE0DYRA9tKpEVGLaeTF5j+AKJQoL7ofIcv1NKxQpSQr03Nx1ZT+EKk/jg200S486K
 ysWfMnR7A7IZpdr24m6rR/PgD/EGdHB4J3FLthPl6s1n4AGtH+NGGaITiTWG0OieHiua
 95VjjkoEJx89B91Zq346ROld+H2+qk1LkGfeVQKn4zCmWtQ7NJ0Z3ksGJcWGBnBKa+YP
 ll02BhhMBfb+Yo59OXKZd/UDI0zAfECZyr7ExRmoBEze5Mxpa2mRDBDy9QfzSiiGZeBz
 UMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738341438; x=1738946238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMx2YnOlJPDXeo1XJnfHHROuTOY3+drwNmWAuq+4lIg=;
 b=UCFJAsLYVSRKZoCKp5sAuRKJgV+xbXHk7JXmzn7kK9eQtwsrMTGVvysLtTZ8n4slt9
 jMDvmpW08BZntXe0OWUeMiWnT71jKsShKQePQTuaxGKMyKXXLOxEfdYfL/UV1R0AUB3d
 6ZPKzgB9sZeyab38R+1LPmd4D171ina2oyYQ9+wazFUHWUpgBs7+ROCexea4SoZwlCWr
 3M+zls7vkUkTtXh/bmG8A1scnWenFbimNMZMpscb65rAXzU8kZ86Tq3llu+w9HQXSgJa
 3kSfeGoabriLwNY6DY6WucKoBxGALT1WyPd7aPSTXOAXTuf+HVKlpu5tqfxG99Q/HPt4
 E09g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Qnl0lMcicD0TfJi2Cfi82RjmiDi9ueyJpOOh0M3Q7ZK+Cmct/GYixCQvQNHJsbCx3q3l/nUAuZ9KGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPUZfPC8iQ/XjSTSg5tUzJYKw10JUEHIVn4l9FnoaMNLEBwndx
 vm73AK7ihHwGQpM3Ce2kCcMxCQPZw6MujWJQnF6o9AShuGK+MEQ22LKOASIJ/k0=
X-Gm-Gg: ASbGnctL1ZbiGiBil5Dno6GqY0avUvxNXOjwi2DRzgezA4xpWoLf2XdhMKPZMEut+30
 +pqDMVKJPpr01SuELlKzDBiUS8qXAKvBf9qq+i/DsjKYiKImmFCyF0qGYHgj4s3300Mtune5TOR
 zFM15w2G8Q/gh2xxtXKn7aIcEbGAJLdwqlsYYwl+IbmPuUsl7uKO3/hQfh3DFrmMiDo1QaGMHs4
 R0dyHfkq8Jncyyoct/biSn/cVZ5oQ/KqSFu7uSZ+LO6wSp4U2ROXu6wXnnEopXt0Y22UOA3du2H
 FgfADKI3IPq5lAc=
X-Google-Smtp-Source: AGHT+IEK8aXASXk07qexYhvsAde0vZ0pJEgD444D81jkJ1PplRhBIzhtI0G4gtXUjh/qBfrt6nphdA==
X-Received: by 2002:a05:600c:4ec7:b0:436:e751:e436 with SMTP id
 5b1f17b1804b1-438dc40d574mr116288475e9.19.1738341437975; 
 Fri, 31 Jan 2025 08:37:17 -0800 (PST)
Received: from pop-os.. ([145.224.90.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:37:11 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Date: Fri, 31 Jan 2025 16:36:14 +0000
Message-Id: <20250131163617.1730505-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163617.1730505-1-james.clark@linaro.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
MIME-Version: 1.0
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 quic_jinlmao@quicinc.com, alexander.shishkin@linux.intel.com,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, James Clark <james.clark@linaro.org>,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, quic_tingweiz@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Subject: [Linux-stm32] [PATCH 2/3] coresight: Export coresight_get_sink()
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 253ef02fde12..f31c8477f7b7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -526,6 +526,7 @@ struct coresight_device *coresight_get_sink(struct list_head *path)
 
 	return csdev;
 }
+EXPORT_SYMBOL_GPL(coresight_get_sink);
 
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
