Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA108D790A
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 01:25:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF311C78001;
	Sun,  2 Jun 2024 23:25:05 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7DFFC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 23:24:57 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52b78ef397bso3654766e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 16:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717370697; x=1717975497;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9GW/P8HNtUj4gAsXICqtNm+UsqGq0aT7yVz6HhJrHSA=;
 b=H9HWXK6M6r+vHBzbE1Ua6MmqYv0hmC9BRGRtD3FFNMATOVZO2wD1SLyX+wQ+FS8Ehy
 mUV7M6+WlOYHHMxVYsmFWTUnWwHwXlCzNvo9PBYBSb8vB5wWymR8y8yqPr3O/y/0auWe
 H6OrQFkli2AndPldR7COblZa5gA0Xnq0u4JleMgBLOAT/PVTcYqb2958r7r4eEx9bpef
 WND9xSIHDY2k/9v0oMcVbBRHRslUy0XPEhtwFfiX1wtDhlokkwf+tGwoyC3czGAXQ6A6
 SrMIfEdABDmIAPlNZUYDN5qfOM3ttD5YAe/snb0FWG0t8cbiZFiV2ODLVe5DHm3GicHd
 VODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717370697; x=1717975497;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9GW/P8HNtUj4gAsXICqtNm+UsqGq0aT7yVz6HhJrHSA=;
 b=Ek3ruwqbRnWxpO6Djuo36zd3FwX/wtvNzxzkT9YbkvFsvBs8EmD6maaNWoFU9DpzEg
 pJJ6FrxjoOBkUg9mAItxdQy1KbeX+hs2iqjNMCBZ1kp5FNAGqsbOMM7CQiBf3pf3hYTK
 b6/D8ePqOO3UovCWhaopvbQUnWp5zetX+yfcCai4DsArFxwTPNuGTaUmAmz4DCpoWAwD
 ++ycmhl64ZGB/210JAqZeuU1teevPV5TYteU21GRk2rtpKF3rQFlfmjz7/QOxnQifRbg
 L/0eOUI1HuRBlssnSxysA/PMOHjCjr4i66Z0Dt/3TA0VXbqyOkXmiRAXNJM49Htu9W8M
 qTYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsSne8O+4G/RM7GPcVsIZUuBsPxm+ndx8nOGutsNEoccudwBihDt49lZ9uSNVzAYFCEvCj4kNs5PTr1pKqLFX3netY18FBdgx5REC4CmK5AoLpaWCAaBG1
X-Gm-Message-State: AOJu0YxsopDWhddzmp9IlyO4aKM3RSi3560d0zSTFYuu0q4vRDVBdta+
 zwGNTm+eeOXlXZTO2XQa6ZZqjxKGzVjIdV1wPLKdISpeDT1zSKweeFvVpZ5oaFk=
X-Google-Smtp-Source: AGHT+IFObhCSI9ATwzqYvUqFHXDu4y0kBGo1nJVdLLy4L1+PoQcx3K73d/nUhKyCvcqieX4Kw6RrLw==
X-Received: by 2002:ac2:4889:0:b0:51f:8df0:fbf1 with SMTP id
 2adb3069b0e04-52b7e350b53mr2917997e87.30.1717370696998; 
 Sun, 02 Jun 2024 16:24:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:24:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:24:53 +0300
Message-Id: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEX/XGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyNT3dLk4kzdotTy/KJs3cy8ktSitMTkVF3TtDQjIzOTNLPE1GQloN6
 CotS0zAqwudFKQW7OSrG1tQAdoJOsbAAAAA==
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2404;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gBMQdnHYBqt0Cz6vbwrln0vxA5FTa/0tj8FaEe/b0zs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9GP5gxL64nLA9ixHwOAFBfXBDUwb3IytFr9
 MzqXPncK2KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/RgAKCRCLPIo+Aiko
 1QMtB/9Ey2KOkOoXQtrK3z40/JUfDsmj8HhHIM+2tx5HLtM3vh51/enSM0NG8/7joFYK3odgHCr
 Qog87gI4VxOkkiZ2uolgr+BS+iYg9qCg9l5KwpUqE3pDu3mYNHlId+ZWojI23jfAAffFI0VHuRQ
 jbehKAnAkH+8sY9knuzynaOHFpu4qwJO5dHUcEIrfEUP/rSaiL4z/1jJopD3q1uajUH1SBAOwLG
 OXf4RS3IsMDMVGMa0s0X+u3vuhy2itfvTF5Njhb47z4yvz4IAe8xFlq7k9d5y/G85oy70S6Clwp
 ozyuGd4VH5nNmhlUka6xJw3tBeUIsue8TLMONydFvPfh1hL9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 0/7] usb: typec: ucsi: rework glue driver
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

[1] https://lore.kernel.org/linux-usb/20240521151109.3078775-1-fabrice.gasnier@foss.st.com/

[2] https://lore.kernel.org/linux-usb/20240531104653.1303519-1-heikki.krogerus@linux.intel.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (7):
      usb: typec: ucsi: move ucsi_acknowledge() from ucsi_read_error()
      usb: typec: ucsi: simplify command sending API
      usb: typec: ucsi: split read operation
      usb: typec: ucsi: rework command execution functions
      usb: typec: ucsi: inline ucsi_read_message_in
      usb: typec: ucsi: extract common code for command handling
      usb: typec: ucsi: reorder operations in ucsi_run_command()

 drivers/usb/typec/ucsi/ucsi.c         | 215 ++++++++++++++++++----------------
 drivers/usb/typec/ucsi/ucsi.h         |  26 ++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    | 100 ++++++++--------
 drivers/usb/typec/ucsi/ucsi_ccg.c     | 103 +++++++---------
 drivers/usb/typec/ucsi/ucsi_glink.c   |  74 ++++--------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c |  79 +++++--------
 6 files changed, 277 insertions(+), 320 deletions(-)
---
base-commit: 975aa2136eebb8c7c716ac2d24d9bfdb002f87fd
change-id: 20240525-ucsi-rework-interface-5ff2264f6aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
