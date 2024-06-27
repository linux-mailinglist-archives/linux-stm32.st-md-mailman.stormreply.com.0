Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 810A691A977
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 16:44:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AA3CC7128F;
	Thu, 27 Jun 2024 14:44:53 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5814C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 14:44:43 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ec5779b423so59729281fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719499483; x=1720104283;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OU3mOlwnB7yXdNX3pzXS01pB5G7EZpP4xG1jI/1t+1k=;
 b=YeO+2+BLDuFEYfJok/NQieD4cQQnsF9QhoDTwW6wB0L3HtPljeii2rFX3APVMkNWsG
 BEbu+U/GtRWkNqr5FnChQNQEmEenjj6nWXYdUX27eO2duj8UN11ZiHPOB/xOd2RGZ3WP
 cswfIuZo1VEHaiZTkmugjKlVmDrqk59pkIocToSx5aVrCj1zBirAVemWb38HV7Uqf8C6
 14fyHgQDuTtHeMrwzqpVWBT5UBO03pdnC0b+S0GFaZ8F7IXx8fyH36mo9T1TpLhW6+Nk
 GBvDqqw3KyBBjkx5HRP272SjlPkIfsXg9orH9fTXxjssFv0RbqtEyg3YuZtT4ogvFaRL
 mZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719499483; x=1720104283;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OU3mOlwnB7yXdNX3pzXS01pB5G7EZpP4xG1jI/1t+1k=;
 b=u+wWdpHpSy3P9Oe9FgJtY5BTlsq4KELWZ+xvrcCgkfIH2qyEyAaX98L92lB2UvC1UT
 1kZa5EuMsfjlBjiqd2xa06hABcwpmMnoWiJsLuioNFtxVqmPIeV6XDGcCJwattG+h0/0
 bSUL28utVIwDbiGo3IjQs5YmDcF/CZIMNQnFTgx/paw5xaHtmPjOMimloXWieRLvLzts
 yQcKR/P0sTRW7DK9QsMbmNjIIVk19zjcXUS9Zx3WlEd0qlkDTIk7+2jVowTIvLjHmPRe
 p4/p+KhTGXjD5nqznjqMjs/dJtWwdYi9NBTyhz0jietHxNH+CTvywpNTltf0UiPZMCkr
 /REA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM3ZW51BYww1oJLzldwd9V/TxQo9BamEvj2U0sIrNllVGIQtXqRvuDI4KfdXdvS/+R+Y8sWxlgYrTZ8tjFqrMEOWwnmrSKDOQt5bNjzyYDnjNtBuHoaqBW
X-Gm-Message-State: AOJu0YwLksAfS+us89uxhKCuVqd8aaz/t1cPq93HCmUtStn25+HF/43R
 +vPA6wvayeZZE+IHbNqjFuzkBlY+wWaZVJdqFur4N+LUTG49ZjnZ8IFcSgT+6+E=
X-Google-Smtp-Source: AGHT+IEawBNGQyhMDfZk05i3TKpcNT+YhEEzV5vSCXQFMuu8PQZieFyGjjzkLFDHqSWQ0x8moGwfKQ==
X-Received: by 2002:a2e:b6ca:0:b0:2ec:4de9:733c with SMTP id
 38308e7fff4ca-2ec59310257mr100015781fa.9.1719499482923; 
 Thu, 27 Jun 2024 07:44:42 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a34447fsm2775911fa.11.2024.06.27.07.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 07:44:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 17:44:39 +0300
Message-Id: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANh6fWYC/3XPwQ7CIAyA4VcxnMVswHB48j2MB8bKbDTDFEWN2
 bvL5mXG7Pg36df0zSIQQmS71ZsRJIwY+hxqvWLuZPsOOLa5mSiEKipR8buLyAkegc4c+xuQtw5
 45b0QWnltwbG8eyXw+JzcwzH3CeMt0Gs6k8px+hV1IRfEVPKCG2N1WynlwNX7C/aWwiZQx0Yyi
 RkjyiVGZMZKY7w3uvH1PyPnzNJ/SWZma7Wrodw2IO0PMwzDB3y8vXxJAQAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bV6pMkV0+VB/9V9ogB8UlgFP7o3YnKPH33jLb5wU5ts=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfXrYk+USNOvo5MKGxj+al1QwKFMYgN/fC0KdH
 AL11aqxH5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn162AAKCRCLPIo+Aiko
 1RDFB/9T7NQaaf13GsUbtwV5QVP8vJXFzfmwMieA4x3a3gV+YOuz/RPy7+T557w6o9XTQjAOdSj
 nRRJABvhYU7BCY9Jghy3/RAHQEZxiQJjIEAWSqJQwi6+4Qy4PJ9wZvAIO+k6Yp46wfSSJMrhhc0
 roNYrd9usq58bxfFuh7a0oEd2FEMpmATUYt7SlkMN0FAAsUmYiTUZNiWLDLVfKboH9ap3oCVtHS
 OVfqGTw7bZYnnK2am/90mDSRq0mDc41LITRKiTjtTaFefr4wVJ5mYAoPSPQ3dxIQaTwQL3ROapQ
 TKRt8EcmMSdJCgPghifjuqlOC/SmXEfuVjjQY6DIZPeiI4rS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/7] usb: typec: ucsi: rework glue driver
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
Changes in v4:
- Rebased on top of Greg's tree to resolve conflicts.
- Link to v3: https://lore.kernel.org/r/20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org

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

 drivers/usb/typec/ucsi/ucsi.c           | 221 +++++++++++++++++---------------
 drivers/usb/typec/ucsi/ucsi.h           |  26 ++--
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 127 +++++++++---------
 drivers/usb/typec/ucsi/ucsi_ccg.c       | 103 +++++++--------
 drivers/usb/typec/ucsi/ucsi_glink.c     |  74 ++++-------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c   |  79 ++++--------
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 104 +++++----------
 7 files changed, 325 insertions(+), 409 deletions(-)
---
base-commit: 878bae2ba39bdd581cbe77d8210b9a03ae172adf
change-id: 20240525-ucsi-rework-interface-5ff2264f6aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
