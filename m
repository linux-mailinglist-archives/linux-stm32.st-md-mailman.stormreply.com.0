Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD18AB30FED
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 09:08:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C384C3F959;
	Fri, 22 Aug 2025 07:08:40 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B095CC3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 03:50:11 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b47173749dbso1175125a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 20:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755834610; x=1756439410;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rSKRWggFm2gwVL+yK6cxP6RJKjf/dyRkrtyiTbymMX4=;
 b=S2OKy/a7yvyz1V+3eczTNt6sfgSDU3GjLZxQgoEfkKunOS8UkFsdrispnFYiOc6zxX
 uKkUJxO32pO+q7Jq7xDpbsznDa+4wYWaDdVxwaBHFiDTXzJ1mn3zuEj5Lx1kRIEaKade
 uzP7400bJp7+tcB+MfX+KS9SQyEWxWKeGptKEPmWRCaL4tQ2dJJ3n+r2svD4/dsll9o9
 r5XCmxo3ssjoToNcMqJFhghm7Q4eHxClckmPpOWrd0IJ10WMcWwKaIP1+dKDkEadLziu
 yt1mZuroMV5sEDkjg9pyGwWg36nKgQ+OF1gWj2xxg9S+hYGLrqdPlYgxMTK3xqxBzZPz
 DdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755834610; x=1756439410;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rSKRWggFm2gwVL+yK6cxP6RJKjf/dyRkrtyiTbymMX4=;
 b=lsAyWFhzrQ7kT2vmFoIKuCrI4DWJLmwr6E/WGx5JE5SgnnZS6DUGW8IjvEoulPs0g/
 qR1Y7mjhbItWlnpUnnAgxANxoiWSrv4CGAshWNm0SFBkysmF0XkkowuK2vi5/K1f5MQ9
 J1VisKlx03rbToVBLSucaUl9On5Vuj5fAsSdsclvswFYJjHa+NQdwggdBA7nSuLbhuo8
 AHEJxyY5K1AyjTTLmJgAmigkh1pQTIT1CTIMgzKJm3Gpthy3gHZTmX4KyfPP5YRAfv8A
 6oL3UZcLGuU4f8gkEE6vJWBQZT4uyrCq1YuWOtMrJ1JZ34KFd+7F4v/+PEYoss/UtwaL
 7d4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1dGzt3jJZwakGsoyEpfk1b5xxjAnm8R822iMkDMdrib9F2UzNuqm+7osOYRGcp5wU+ZP9UirntE3heg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxUzGKin9su6jtZSJ0PNIIrIhvcY/fsiF/M4nNto3yYQqHlxsZ2
 LKH3Mz9OkEmgkyk44hag1EuXmVjxC6YrhRgeSLUvhK99F2asSKfhXNId
X-Gm-Gg: ASbGncucFb5FczGTvGLFB1Am3i3tt79VFnt1RkckaRcoRpGST4n8UOO5mJuHqMtRoiJ
 CSHxnjuuP1HafSmTpuJs8fCAwjbqCWizsAooCAouEtH8LpGH5aVW09RxImtUVRjiEWgtK+J+Mw/
 Ne9osc74EFxXi9l7y18aiLg+bh9Ghdo156JnnJH84+1dTdAbh/z/gEJS92C4ma5cpZy8EigiT5t
 LT3T6NShdGJY4RddMA5txDc8NzuQJdvsAouesyLux4DtI5SkXk7z+Hjculn5eBMINbOCOA6IwzV
 wmyG8EYOrQpD0ngzacl+K7/XsodqgJoL9cjJaoIvqTLWctyqFeSLlxopgcCKXwHBU9xENYFr2Ro
 dJWGjDsjQE2usnCCcOYezsBa0HgSh
X-Google-Smtp-Source: AGHT+IGCVxew1BDZArBDIFetyektFCJx25ozr5W6t7TZGZRe9/Jw3ZLLLMj8b6oUhny28mvLZll1RA==
X-Received: by 2002:a05:6a20:2446:b0:240:66:bfbf with SMTP id
 adf61e73a8af0-24340d2c0aemr2084997637.32.1755834610000; 
 Thu, 21 Aug 2025 20:50:10 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 20:50:09 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:48 +0530
Message-Id: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN3op2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMj3dS8/NzE3Pic/PRi3TQzMzMTI0tT87QkYyWgjoKi1LTMCrBp0bG
 1tQCmSYNeXQAAAA==
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=3085;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=hgVzG6HidK5orceR0qnfKXbDRBYduOwo4V7lILI4Rm8=;
 b=WRGEFFGiWV0zUgwoAaJABm7znaR2ui0mgJOni6YE0h+a7dxpgGWXH4VPdRYWFcy2vTScWDi7v
 /AbBSSYdX3qABloc3gMuzl/AmRds5P7PoFeLgXP50B5iPhIdDBRp3Z2
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-Mailman-Approved-At: Fri, 22 Aug 2025 07:08:39 +0000
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dixit Parmar <dixitparmar19@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
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

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().
With these patches, all the iio drivers now has uniform handling
of the -ENOMEM while device_allocation and trigger_allocation
calls.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
Dixit Parmar (10):
      iio: accel: Drop unnecessary -ENOMEM messages
      iio: adc: Drop unnecessary -ENOMEM messages
      iio: dac: Drop unnecessary -ENOMEM messages
      iio: health: Drop unnecessary -ENOMEM messages
      iio: humidity: Drop unnecessary -ENOMEM messages
      iio: light: Drop unnecessary -ENOMEM messages
      iio: potentiostat: Drop unnecessary -ENOMEM messages
      iio: pressure: Drop unnecessary -ENOMEM messages
      iio: proximity: Drop unnecessary -ENOMEM messages
      iio: temperature: Drop unnecessary -ENOMEM messages

 drivers/iio/accel/bma220_spi.c      | 4 +---
 drivers/iio/accel/dmard06.c         | 4 +---
 drivers/iio/accel/dmard09.c         | 4 +---
 drivers/iio/accel/dmard10.c         | 4 +---
 drivers/iio/accel/mc3230.c          | 4 +---
 drivers/iio/accel/mma7660.c         | 4 +---
 drivers/iio/accel/stk8312.c         | 4 +---
 drivers/iio/accel/stk8ba50.c        | 4 +---
 drivers/iio/adc/ad7949.c            | 4 +---
 drivers/iio/adc/bcm_iproc_adc.c     | 4 +---
 drivers/iio/adc/cpcap-adc.c         | 6 ++----
 drivers/iio/adc/da9150-gpadc.c      | 5 ++---
 drivers/iio/adc/dln2-adc.c          | 9 +++------
 drivers/iio/adc/exynos_adc.c        | 4 +---
 drivers/iio/adc/imx7d_adc.c         | 4 +---
 drivers/iio/adc/imx8qxp-adc.c       | 4 +---
 drivers/iio/adc/mxs-lradc-adc.c     | 4 +---
 drivers/iio/adc/palmas_gpadc.c      | 4 +---
 drivers/iio/adc/rn5t618-adc.c       | 4 +---
 drivers/iio/adc/stm32-dfsdm-adc.c   | 4 +---
 drivers/iio/adc/stmpe-adc.c         | 4 +---
 drivers/iio/adc/ti-adc084s021.c     | 4 +---
 drivers/iio/adc/ti-ads131e08.c      | 8 ++------
 drivers/iio/adc/ti_am335x_adc.c     | 5 ++---
 drivers/iio/adc/twl4030-madc.c      | 4 +---
 drivers/iio/adc/viperboard_adc.c    | 4 +---
 drivers/iio/dac/ad5380.c            | 4 +---
 drivers/iio/dac/ad5764.c            | 4 +---
 drivers/iio/dac/ds4424.c            | 4 +---
 drivers/iio/dac/ti-dac7311.c        | 4 +---
 drivers/iio/dac/vf610_dac.c         | 4 +---
 drivers/iio/health/afe4403.c        | 4 +---
 drivers/iio/health/afe4404.c        | 4 +---
 drivers/iio/humidity/am2315.c       | 4 +---
 drivers/iio/humidity/dht11.c        | 4 +---
 drivers/iio/light/stk3310.c         | 4 +---
 drivers/iio/potentiostat/lmp91000.c | 4 +---
 drivers/iio/pressure/dlhl60d.c      | 4 +---
 drivers/iio/proximity/ping.c        | 4 +---
 drivers/iio/proximity/srf04.c       | 4 +---
 drivers/iio/temperature/mlx90632.c  | 4 +---
 41 files changed, 47 insertions(+), 130 deletions(-)
---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250822-enomam_logs-f66642957fb3

Best regards,
-- 
Dixit Parmar <dixitparmar19@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
