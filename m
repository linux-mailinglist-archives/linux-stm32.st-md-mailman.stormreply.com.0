Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F44C916B18
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 16:54:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BF42C71287;
	Tue, 25 Jun 2024 14:54:38 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12280C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:54:30 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52caebc6137so5321616e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327269; x=1719932069;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NSweAIPoKXuI7H4LOqoZzWikrFkReHajx8tj+okt9I0=;
 b=qHcte+32NWjoc+rjXcjlrq7Gg28+53D6Jmc3x5kpbsN0nJoOnqC9yDb1cfMz/JnP3V
 kNiQIi2QmQYF/qZPZ+AzgeC9u497oDuW+gFKbqDwp5Lx90zb+Fdg5/2rR5ohT7DpItkw
 Pkws373gRBjd7H2wDWj2WbDRT6GPMDbpSSRmEbvhdOb2DQ6T2lSxX/4egOlDuspaMJrj
 y3xObHIq0ZsYtOG1kIFMxdhqNNtsPlQtpO2QRM9AZ+J45yKOV2ruv5h9bBG3DVkZzADl
 DP2B3U8jo29gwPynmqZeIJ2b+hmrbx/Qv9HbC/lE3kmALH5Orhs3yaMccuKrCawQeaS9
 pZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327269; x=1719932069;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSweAIPoKXuI7H4LOqoZzWikrFkReHajx8tj+okt9I0=;
 b=ml1nKTuhn2Jzpq4YGGVDA5AvowZzx9FYpTPdT1cb6d9oT+AYgdRP0LcEBE8NDuxwnH
 EEJbX7JtbIKv97wLKRoCr5ogzpDGO/MKWqubC5sv4MIhtseUce6x5v8IEPjxIMlXXWtF
 Z3/bNHM218M00XZFoNwWYEu7ZW5sWnitSs/IxGJ5yabOrAcEVRodVkpvGHifvI43Mfbe
 HZs0fvsop16J2ndpAK011vCq6Ifk82dWu2FdDMLg7Wy1TnkEVlGAJ2RfyI0CGgYGRHWr
 l1e+GpqLqcJ80HqDY5pXP6wWXMuA1BXy86Ts7i1/7n+xVXPKCbbF97Wf4zkx8jwHqVOe
 miDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5ifqvI7wJS4P+eNBXM5zYWkDY8Lfe5XhDi4oMzvV/ahzwe+F2Hz4C5vxDmmTIA4q9fDU6zWBivy03JhLqGKdfAXHDjzrl/oMMWV/imdRAVB7Er90lBYBs
X-Gm-Message-State: AOJu0YwoL3BAjIKgyYYw6RY94g1xuQroMy1lM2W6lkG8FU+1/LvC02eK
 78HDLYcIrhy6SVnR1NkoKj3UoUsi2DmFHmCVc3QrPGGVKR1vsy7lc7b2ZIhhkd8=
X-Google-Smtp-Source: AGHT+IGeR7Mb8mzSff+xkx/yZpp3fQkqTztpSXyNBdXwUXBi7RBdm5R0F5OHiVIGXyAdCOnfrcQq1Q==
X-Received: by 2002:a05:6512:281:b0:52c:e10b:cb36 with SMTP id
 2adb3069b0e04-52ce183add6mr4527968e87.33.1719327269161; 
 Tue, 25 Jun 2024 07:54:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:54:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 17:54:25 +0300
Message-Id: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACHaemYC/3XNQQ6CMBCF4auQrq0pBRrqynsYF7VMYaJpzRSrh
 nB3C250wfJ/yXwzsQiEENmhmBhBwojB56h2BbOD8T1w7HIzKWQtGtnwh43ICZ6Brhz9COSMBd4
 4J6WqnTJgWb69Ezh8re7pnHvAOAZ6r29SuaxfUYlqQ0wlF1xro7qmri3Y9nhDbyjsA/VsIZP8Y
 WS5xcjMmEpr57S6uPafmef5A6rCgBcCAQAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zRKg6mWitu11c42NN2MnOy4OSiuaKeH1XVqNTKR3lj0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetojbLrVWL1KxL/3+AbHhHJv1YRcYzQQRHB/+
 h1vtmKVpkeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraIwAKCRCLPIo+Aiko
 1RgDB/4gKJx8pOyKonR8hoAZs8N6uQfaS0m6ZS8C12DOGIsOmj8EhMwqGRG/WlU+e2o7/zwV5b7
 JQVzIQ/4Z73v39NBv26Ayj6nvXRYxtcg825wgzqHUTON9txQ/3IKYyTNEudMPmRxI+licVGwe+9
 ARjxOQTAEqZZepY5jQwusAlcE8pKIm+jKgw911/xi4Ary9atBJRvrU4pKt1rrtp3EhCmIrQAtJq
 6ymbchcfeBhgIh0TUjk40TeY80bihzj8L2GROdqmK3b5TIsxTYifm8nANyFI/DuBe7DQ/ZghnIq
 f9iCqUcHT4ovuC4pPPFm/y/uvRbEExcisxCsGYnGWRA0xx8x
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/7] usb: typec: ucsi: rework glue driver
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
Changes in v3:
- Rebased on top of the next to resolve conflicts with the merge LG Gram
  patch (Heikki)
- Link to v2: https://lore.kernel.org/r/20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org

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
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 127 ++++++++++---------
 drivers/usb/typec/ucsi/ucsi_ccg.c       | 103 +++++++--------
 drivers/usb/typec/ucsi/ucsi_glink.c     |  74 ++++-------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c   |  79 ++++--------
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 104 +++++----------
 7 files changed, 322 insertions(+), 406 deletions(-)
---
base-commit: c0068dfdd1aaf0fa9d60367b0f392ce145ee27c3
change-id: 20240525-ucsi-rework-interface-5ff2264f6aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
