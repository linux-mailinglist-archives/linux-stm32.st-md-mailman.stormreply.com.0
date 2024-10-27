Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B38969B1DAB
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Oct 2024 13:27:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57377C78014;
	Sun, 27 Oct 2024 12:27:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F349FC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2024 12:26:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso34132735e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2024 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730032019; x=1730636819;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZUox4fpqeo/zDddrp/d5ARvM/uTsS9cEvM95lpoNCeU=;
 b=i03F/MNvqDzvqOkcqFYBE95BECRiRyqAZCNEUUJP0nj7ubDeR7JNNnLJGnsCgKOdPf
 l2QPCbciQWxa/en1h4r1Ec5GwLljXMNkf0nlYx4QvdTC860KmGsNA3ocJNfAGsoOh6IT
 vOvw8ZtR7Lrch6q9UTMI3Yzlk1ZnIN1/MADjXMyZN4DFCUPIskQb8nVGNOw5C8C2WjcM
 gsUav4JwnniySx37GqeH5IOt8b1IyRP4HHOesTXZZfMPD/S2S28gKHEJaUVOb+wi2mEw
 DeRJCpNS+BHdl2YtKJurKlU4ZgpB4EBk85KX3clgjHcNTg5DNfFDnX8qKb1x3LYwAvdR
 QMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730032019; x=1730636819;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZUox4fpqeo/zDddrp/d5ARvM/uTsS9cEvM95lpoNCeU=;
 b=bMzqlw26jGYJ/v4pHw/9r2776q1BMYmB2i+QCakGGmpR2wOfFsnMT19JhOubfP1ejA
 xIFup6A/XnkQkS3xY5AjuBCC8SDBi9uHYK5LtVkgB+oGgRyw1wcB/BgXDxCy36E/CxEc
 Irm/b0rEeSh37PfinbRe0gFLTsXliVoKEmWKbJok2+z8nKgFryhasrRYzpd4Ykbvj4bA
 XGRFMx6uX2FiWns4AcarszUasUjq5wybGSSbiwsHzqtKdyAJ4tv1BMpEUN1mrmJ6cGY1
 meLrmF04mwdxrIw26/AvwA8GmIICKKi3nY2gDJ8yM78urBhrtcCAg1E3PPzyEwXo1IDv
 J3Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX1wKA1m7vHKNmvc2N5tRlgIRLi22GpO5RRCeDCdwsKvlsQWtWUT8L6Sd0jvI0zIDJoy1gHr9+sQwvVA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxIx/RoE0vnzUVa15r6mY3Vmg67DGfK78I8DWstOw1Svq0ZTW2l
 rK/9/LFmgPAckS0qQIyE6ADoOB8Mr22ORLluKl6DH25w6eLFUL6l
X-Google-Smtp-Source: AGHT+IFXSjarOOyrm9SCHyLOkxePmegV6ax6tAQ2bgxrY3uY5BPagoFhiBo/T1Tejx8BUQyXMnKozw==
X-Received: by 2002:adf:e3c9:0:b0:37d:4a80:c395 with SMTP id
 ffacd0b85a97d-3806113ce39mr3910403f8f.21.1730032019083; 
 Sun, 27 Oct 2024 05:26:59 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41cf-e200-a7df-fd2d-69ec-cea7.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:a7df:fd2d:69ec:cea7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b479ffsm6660329f8f.49.2024.10.27.05.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 05:26:58 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 27 Oct 2024 13:26:49 +0100
MIME-Version: 1.0
Message-Id: <20241027-stm32-timer-cnt-of_node_put-v1-1-ebd903cdf7ac@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIgxHmcC/x3MQQ5AMBAAwK/Inm1Ci+IrIo3UYg9aaUsk4u8ax
 7nMA4E8U4A+e8DTxYGdTSjzDMw22ZWQ52QQhajKQigMcZcCI+/k0diIbtHWzaSPM2JrmqarSU1
 SSUjD4Wnh+9+H8X0/eZHNJ20AAAA=
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 William Breathitt Gray <wbg@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730032017; l=1276;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=2VfQ2wflpZ8ggu3Rv8nU1yTN7fzoGtQvbu+rKsfAeS4=;
 b=ttxCObxsybWJIgkp3t2xxh4Xm7JGzXtW4FHFxWo2OkmZrk/DpI+wSsrsoHQjA49VdenYI1+Ym
 ccrTBxMRZYCDzDOzYdTjD9iZQqPc25zxaGhNPKBePtPyyGRlsA3UUMT
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: linux-iio@vger.kernel.org, William Breathitt Gray <william.gray@linaro.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix device_node
 handling in probe_encoder()
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

Device nodes accessed via of_get_compatible_child() require
of_node_put() to be called when the node is no longer required to avoid
leaving a reference to the node behind, leaking the resource.

In this case, the usage of 'tnode' is straightforward and there are no
error paths, allowing for a single of_node_put() when 'tnode' is no
longer required.

Cc: stable@vger.kernel.org
Fixes: 29646ee33cc3 ("counter: stm32-timer-cnt: add checks on quadrature encoder capability")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 186e73d6ccb4..0d8206adccb3 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -694,6 +694,7 @@ static int stm32_timer_cnt_probe_encoder(struct device *dev,
 	}
 
 	ret = of_property_read_u32(tnode, "reg", &idx);
+	of_node_put(tnode);
 	if (ret) {
 		dev_err(dev, "Can't get index (%d)\n", ret);
 		return ret;

---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241027-stm32-timer-cnt-of_node_put-8c6695e7a373

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
