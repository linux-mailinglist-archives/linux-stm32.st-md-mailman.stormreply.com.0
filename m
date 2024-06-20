Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF14911602
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 00:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 665DFC7801A;
	Thu, 20 Jun 2024 22:55:32 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37D1FC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 22:55:24 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso14032961fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 15:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718924123; x=1719528923;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J93Wdu3UHX/SH5BNBWL2XcVx8HcjEhvK9ORDAnvlEtw=;
 b=Ge2VvZiyaENtW/2WxVGv1hZ3sYFOigZMEqEwITSJ8HKED7rgvNQTn/EYaLvqsSHrNB
 k6mwvCHQeXqkg8sJm2R0XQQAdIxU7ZjzIQZuoLhXPpXOysvcnXpaNBX0x2PROxnGe6Ae
 GvyLQ+2+8r/PGoMIqN07Ilowm/xmwmG1PX7JTOH7ssWga7jOfMvNrGwWCiMzukbK4+jK
 oy2G4kS1ItRcMSgMy3LaxKhBAc2qYRqo2p/OEJGB0iLp4gdiWfqCVk4UfXqCB0k3WNGM
 e3vpaEyIDAPFFId8Yz0czQshcKr07PHQB0Cc11o6z8ypTuovenEyDr17uSTO+7EVDSBv
 FgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718924123; x=1719528923;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J93Wdu3UHX/SH5BNBWL2XcVx8HcjEhvK9ORDAnvlEtw=;
 b=tzXv0MHznYrcmZp4sW84ENWiXy0gz7JRdlr+naVzhLS5SrRiePY4D/Dbi3tP9DWqvi
 jG8Fle1+mRuRmQs0wBramEPj5NKRQFKASHFjHv2J4sFWOPRB30xCIrIXx89LUC3vGIwK
 gL5a7Rnw88MO13Fn259IblzioSiAHfe2o/tTK08jx7y/JT5p+BsDyAlazoFCYARrigO2
 o4w7kR6bfTtiGaqmAKxDfFi6iQM71BCq/zHUBLwFR8eWO+EmzTlxmBW81baT2A4hNUj4
 ClkfxwdgeYQdkUO5GvTUNrGk3SGunK1+w9Wkm/7apqUpHyWO+zJnEehPK7+P1/fa9wY9
 bvow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdY2CpwJlH00uCbqqbIyca0MHAjTJ/jy0tTMixqznBPAe+iIeDowVRgdVSBUYFgrbDd9NDt46YNM3vpg5G9PCRvKM+mbDWav6snOrnJRGZJwf2AbDOb8rr
X-Gm-Message-State: AOJu0YwAmjjTgX+AS5FifiMvVg92V2VcSJzTwX+PToqAvAGomHBiwKs3
 BiRdbPn7gRPZAmFNWgGtbxlZ49PYofZ3t4EFBebWVBkIpafTzQ4U5pMB8IiozAQ=
X-Google-Smtp-Source: AGHT+IFQN2Bt5zqFFKMUGCJsgkrAaABWB+x6UZRmiYHHZjBZGwfUjSSQ4U5Pk9vdJM+yd1sxDvObTg==
X-Received: by 2002:a2e:9d4d:0:b0:2ec:4d89:795e with SMTP id
 38308e7fff4ca-2ec4d897aebmr1580681fa.17.1718924123126; 
 Thu, 20 Jun 2024 15:55:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d60126fsm510461fa.20.2024.06.20.15.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 15:55:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 01:55:19 +0300
Message-Id: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFezdGYC/3WNQQ7CIBBFr9LMWgxFINaV9zBdEDq0Ew2YoVZNw
 93Funb5XvLfXyEjE2Y4NSswLpQpxQpq14CfXBxR0FAZlFRaGmXEw2cSjM/EV0FxRg7OozAhKGV
 1sA491O2dMdBr6176yhPlOfF7u1nar/0VrTz8KS6tkKLrnB2M1h798Xyj6DjtE4/Ql1I+KdSRW
 7sAAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2727;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NGDUIv34hYFZN854eluh2DVe78KwRqnWAHRvdoMY1uA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1rJ5sgVx7PFb4ZH8FW6nmSoUlXRFZdQykv9LNKyS2nzd
 In+nXqdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiI/G72vyLrNm+y3WNfvX+J
 yH0Hv1Jm72qJtYxG+9z8b7P4zXMPCN1ifTS9V7vhWs05oSV7FT4pi5x8tSTLxNuFuWnGUc3P8X5
 f+O53/Nm8K9v9yMdzEV1tsvsFxXeUnXgoeUxH9ayX95sdhnzfFngsf7Enl1+xa/HPWNOQY0+88m
 /ZdvVXPSxgXJnWvy3F19gsQGZjOJPO5+4bgoeaAzI/hGd6f79333f6o+rL8vb17QFiPfPj/RTSf
 3u88Fp+70iRv+jX+b90uU8usWlWOfGPTUNv17t6VeuT0lufb+o3tfzpf/ljVdKCjhn7fTS5JSzW
 nM/6No37w5cTb1n6Snbw2U1+ZTrdcPEepakWcyW1ck3yAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/7] usb: typec: ucsi: rework glue driver
	interface
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

The interface between UCSI and the glue driver is very low-level. It
allows reading the UCSI data from any offset (but in reality the UCSI
driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
is to be done by the glue driver (which already resulted in several
similar-but-slightly different implementations). It leaves no place to
optimize the write-read-read sequence for the command execution (which
might be beneficial for some of the drivers), etc.

The patchseries attempts to restructure the UCSI glue driver interface
in order to provide sensible operations instead of a low-level read /
write calls.

If this approach is found to be acceptable, I plan to further rework the
command interface, moving reading CCI and MESSAGE_IN to the common
control code, which should simplify driver's implementation and remove
necessity to split quirks between sync_control and read_message_in e.g.
as implemented in the ucsi_ccg.c.

Note, the series was tested only on the ucsi_glink platforms. Further
testing is appreciated.

Depends: [1], [2]

[1] https://lore.kernel.org/linux-usb/20240612124656.2305603-1-fabrice.gasnier@foss.st.com/

[2] https://lore.kernel.org/linux-usb/20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped the RFC prefix
- Rebased on top of the fixed STM32 patch
- Included the pending Yoga C630 driver into the cleanup.
- Link to v1: https://lore.kernel.org/r/20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org

---
Dmitry Baryshkov (7):
      usb: typec: ucsi: move ucsi_acknowledge() from ucsi_read_error()
      usb: typec: ucsi: simplify command sending API
      usb: typec: ucsi: split read operation
      usb: typec: ucsi: rework command execution functions
      usb: typec: ucsi: inline ucsi_read_message_in
      usb: typec: ucsi: extract common code for command handling
      usb: typec: ucsi: reorder operations in ucsi_run_command()

 drivers/usb/typec/ucsi/ucsi.c           | 215 +++++++++++++++++---------------
 drivers/usb/typec/ucsi/ucsi.h           |  26 ++--
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 100 +++++++--------
 drivers/usb/typec/ucsi/ucsi_ccg.c       | 103 +++++++--------
 drivers/usb/typec/ucsi/ucsi_glink.c     |  74 ++++-------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c   |  79 ++++--------
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 104 +++++----------
 7 files changed, 309 insertions(+), 392 deletions(-)
---
base-commit: f0dbf09a40c8100a895f675d619db5ed1f58f7ac
change-id: 20240525-ucsi-rework-interface-5ff2264f6aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
