Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C7332673
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:20:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D294C57B53;
	Tue,  9 Mar 2021 13:20:20 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06E2C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:20:18 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id ba1so6567414plb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3mig/qMjkMKBLNQDSOdz3dnToagqjo5qKVAJFH1PTbE=;
 b=P21hPd7HwfCd++bVOSHd3P9PkdIzmKQntfngASpmzxuTA5WQnuO2G/Dq8Rm/QB+J34
 cAPgq+MIqIZzuJHW3NI3cgMOhZY7pqdyQK6rTmZkfu89X6bhf7wQFgig2TzUJchP2m2D
 +zYyP1x0G6MVNBrJDJARKrB0yGrTICjt0DAC2LoyvIiSbbwWqw+BLh9NXXT47P0T2GCp
 yXjW4Lq1psi9Tww5fPW7w9vt10eCxHoc+Cd0VKsI0KTCKmf71i0UgSlhNtup8v88kcfr
 LAj5UChs8nijJh+Yiy7fxrAJI6MUiX+SrTpthrbLqui7QyMOOxnj9sNbfpJ4HvWVoIh4
 jbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3mig/qMjkMKBLNQDSOdz3dnToagqjo5qKVAJFH1PTbE=;
 b=C4l36LJbrvsVIsobzF+wUmy4G8MYQfK+yFcxz4ZlrsMLdCy3lmVc7sppOsy4Yezq6m
 4RPOKsYjRMv7nULmjyDTP91P/940MPGMtgThQRy7k0Mi7YF1I17jRrclc74GF25fJcOd
 NKDZqgubg+BKYLYEUhqZW5/hjebBey5rVxg9BYytgtzRbf9XiCLMnx78Fsjrv3wYoUcL
 pinwwv4b9vw/zyLlt0VpGPKqbCSCcpczZn7h1nV/em2c/tl1mzYZRZqlSGTiZclym40V
 YkwU8H5CPrSqkT+2wxsTWvwhg88w5acMW6oMnNwm0iThGcfEJoy6JBLwSgqZfePcUu2z
 WvZQ==
X-Gm-Message-State: AOAM531Jg8yVzKLjYzQenUk126/2AaQr6xkThMj//WdB4lsIydTV6QVn
 zJISuYdg+3OHXW6kpy8VvVc=
X-Google-Smtp-Source: ABdhPJxhpQPkkPnebX+jR7TlCTiQdHhK+YUGpumv+L9adw1292UXwvsh9ht+O0l3BMMMQ9EuOLZfhA==
X-Received: by 2002:a17:90b:e95:: with SMTP id
 fv21mr4566784pjb.217.1615296017193; 
 Tue, 09 Mar 2021 05:20:17 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:20:16 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:14 +0900
Message-Id: <45c91b52199539ad2bc14990f02499ee05f7ccc9.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 01/33] docs: counter: Consolidate Counter
	sysfs attributes documentation
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

Duplicate ABIs are not valid, so let's consolidate these sysfs
attributes into the main sysfs-bus-counter documentation file.

Cc: Patrick Havelange <patrick.havelange@essensium.com>
Reviewed-by: David Lechner <david@lechnology.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-counter   | 76 ++++++++++++++++++-
 .../ABI/testing/sysfs-bus-counter-104-quad-8  | 61 ---------------
 .../ABI/testing/sysfs-bus-counter-ftm-quaddec | 16 ----
 MAINTAINERS                                   |  4 +-
 4 files changed, 75 insertions(+), 82 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
 delete mode 100644 Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index 566bd99fe0a5..29f54484183f 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -57,6 +57,7 @@ Description:
 What:		/sys/bus/counter/devices/counterX/countY/count_mode_available
 What:		/sys/bus/counter/devices/counterX/countY/error_noise_available
 What:		/sys/bus/counter/devices/counterX/countY/function_available
+What:		/sys/bus/counter/devices/counterX/countY/prescaler_available
 What:		/sys/bus/counter/devices/counterX/countY/signalZ_action_available
 KernelVersion:	5.2
 Contact:	linux-iio@vger.kernel.org
@@ -154,6 +155,15 @@ Description:
 		Count Y. If possible, this should match the name of the
 		respective channel as it appears in the device datasheet.
 
+What:		/sys/bus/counter/devices/counterX/countY/prescaler
+KernelVersion:	5.2
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Configure the prescaler value associated with Count Y.
+		On the FlexTimer, the counter clock source passes through a
+		prescaler (i.e. a counter). This acts like a clock
+		divider.
+
 What:		/sys/bus/counter/devices/counterX/countY/preset
 KernelVersion:	5.2
 Contact:	linux-iio@vger.kernel.org
@@ -215,11 +225,45 @@ Description:
 		Read-only attribute that indicates the total number of Signals
 		belonging to the Counter.
 
-What:		/sys/bus/counter/devices/counterX/signalY/signal
+What:		/sys/bus/counter/devices/counterX/signalY/cable_fault
+KernelVersion:	5.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Read-only attribute that indicates whether a differential
+		encoder cable fault (not connected or loose wires) is detected
+		for the respective channel of Signal Y. Valid attribute values
+		are boolean. Detection must first be enabled via the
+		corresponding cable_fault_enable attribute.
+
+What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_enable
+KernelVersion:	5.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Whether detection of differential encoder cable faults for the
+		respective channel of Signal Y is enabled. Valid attribute
+		values are boolean.
+
+What:		/sys/bus/counter/devices/counterX/signalY/filter_clock_prescaler
+KernelVersion:	5.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Filter clock factor for input Signal Y. This prescaler value
+		affects the inputs of both quadrature pair signals.
+
+What:		/sys/bus/counter/devices/counterX/signalY/index_polarity
 KernelVersion:	5.2
 Contact:	linux-iio@vger.kernel.org
 Description:
-		Signal data of Signal Y represented as a string.
+		Active level of index input Signal Y; irrelevant in
+		non-synchronous load mode.
+
+What:		/sys/bus/counter/devices/counterX/signalY/index_polarity_available
+What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode_available
+KernelVersion:	5.2
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Discrete set of available values for the respective Signal Y
+		configuration are listed in this file.
 
 What:		/sys/bus/counter/devices/counterX/signalY/name
 KernelVersion:	5.2
@@ -228,3 +272,31 @@ Description:
 		Read-only attribute that indicates the device-specific name of
 		Signal Y. If possible, this should match the name of the
 		respective signal as it appears in the device datasheet.
+
+What:		/sys/bus/counter/devices/counterX/signalY/signal
+KernelVersion:	5.2
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Signal data of Signal Y represented as a string.
+
+What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode
+KernelVersion:	5.2
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Configure the counter associated with Signal Y for
+		non-synchronous or synchronous load mode. Synchronous load mode
+		cannot be selected in non-quadrature (Pulse-Direction) clock
+		mode.
+
+		non-synchronous:
+			A logic low level is the active level at this index
+			input. The index function (as enabled via preset_enable)
+			is performed directly on the active level of the index
+			input.
+
+		synchronous:
+			Intended for interfacing with encoder Index output in
+			quadrature clock mode. The active level is configured
+			via index_polarity. The index function (as enabled via
+			preset_enable) is performed synchronously with the
+			quadrature clock on the active level of the index input.
diff --git a/Documentation/ABI/testing/sysfs-bus-counter-104-quad-8 b/Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
deleted file mode 100644
index eac32180c40d..000000000000
--- a/Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
+++ /dev/null
@@ -1,61 +0,0 @@
-What:		/sys/bus/counter/devices/counterX/signalY/cable_fault
-KernelVersion:	5.7
-Contact:	linux-iio@vger.kernel.org
-Description:
-		Read-only attribute that indicates whether a differential
-		encoder cable fault (not connected or loose wires) is detected
-		for the respective channel of Signal Y. Valid attribute values
-		are boolean. Detection must first be enabled via the
-		corresponding cable_fault_enable attribute.
-
-What:		/sys/bus/counter/devices/counterX/signalY/cable_fault_enable
-KernelVersion:	5.7
-Contact:	linux-iio@vger.kernel.org
-Description:
-		Whether detection of differential encoder cable faults for the
-		respective channel of Signal Y is enabled. Valid attribute
-		values are boolean.
-
-What:		/sys/bus/counter/devices/counterX/signalY/filter_clock_prescaler
-KernelVersion:	5.7
-Contact:	linux-iio@vger.kernel.org
-Description:
-		Filter clock factor for input Signal Y. This prescaler value
-		affects the inputs of both quadrature pair signals.
-
-What:		/sys/bus/counter/devices/counterX/signalY/index_polarity
-KernelVersion:	5.2
-Contact:	linux-iio@vger.kernel.org
-Description:
-		Active level of index input Signal Y; irrelevant in
-		non-synchronous load mode.
-
-What:		/sys/bus/counter/devices/counterX/signalY/index_polarity_available
-What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode_available
-KernelVersion:	5.2
-Contact:	linux-iio@vger.kernel.org
-Description:
-		Discrete set of available values for the respective Signal Y
-		configuration are listed in this file.
-
-What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode
-KernelVersion:	5.2
-Contact:	linux-iio@vger.kernel.org
-Description:
-		Configure the counter associated with Signal Y for
-		non-synchronous or synchronous load mode. Synchronous load mode
-		cannot be selected in non-quadrature (Pulse-Direction) clock
-		mode.
-
-		non-synchronous:
-			A logic low level is the active level at this index
-			input. The index function (as enabled via preset_enable)
-			is performed directly on the active level of the index
-			input.
-
-		synchronous:
-			Intended for interfacing with encoder Index output in
-			quadrature clock mode. The active level is configured
-			via index_polarity. The index function (as enabled via
-			preset_enable) is performed synchronously with the
-			quadrature clock on the active level of the index input.
diff --git a/Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec b/Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec
deleted file mode 100644
index 7d2e7b363467..000000000000
--- a/Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec
+++ /dev/null
@@ -1,16 +0,0 @@
-What:		/sys/bus/counter/devices/counterX/countY/prescaler_available
-KernelVersion:	5.2
-Contact:	linux-iio@vger.kernel.org
-Description:
-		Discrete set of available values for the respective Count Y
-		configuration are listed in this file. Values are delimited by
-		newline characters.
-
-What:		/sys/bus/counter/devices/counterX/countY/prescaler
-KernelVersion:	5.2
-Contact:	linux-iio@vger.kernel.org
-Description:
-		Configure the prescaler value associated with Count Y.
-		On the FlexTimer, the counter clock source passes through a
-		prescaler (i.e. a counter). This acts like a clock
-		divider.
diff --git a/MAINTAINERS b/MAINTAINERS
index 9a9bf18bba00..ddabf7bb5246 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -299,7 +299,6 @@ M:	William Breathitt Gray <vilhelm.gray@gmail.com>
 M:	Syed Nayyar Waris <syednwaris@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
 F:	drivers/counter/104-quad-8.c
 
 ACCES PCI-IDIO-16 GPIO DRIVER
@@ -4578,7 +4577,7 @@ COUNTER SUBSYSTEM
 M:	William Breathitt Gray <vilhelm.gray@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-counter*
+F:	Documentation/ABI/testing/sysfs-bus-counter
 F:	Documentation/driver-api/generic-counter.rst
 F:	drivers/counter/
 F:	include/linux/counter.h
@@ -6960,7 +6959,6 @@ FLEXTIMER FTM-QUADDEC DRIVER
 M:	Patrick Havelange <patrick.havelange@essensium.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-counter-ftm-quaddec
 F:	Documentation/devicetree/bindings/counter/ftm-quaddec.txt
 F:	drivers/counter/ftm-quaddec.c
 
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
