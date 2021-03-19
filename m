Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCEB341A8F
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 12:01:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AB98C58D5B;
	Fri, 19 Mar 2021 11:01:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7509C58D59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 11:01:10 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id v23so2774445ple.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PqzGrUSHT2ODyc7JfjhfJrg9zplZK53Sny3wqrHE5Ek=;
 b=K/r/iTS/rRQFOSe8TdGfMXsdwK4GbGqFZpC6nQswW7ZOReIMo+qq2YMltfcUpTynIA
 bZhq07ygkFSkI6JvyePDNkpZbJX39hqrwrDtTExcjAHSQ3gDRFR4+K/oahrj/4reVDgR
 hTHHG/cVp25HO9OidHZPrZ9tU+OT9ToZWfz8Eb+Nvkd2slxt0hUVaAhWiritdT34y3rZ
 CWVl2ElXgav9a3HlCXKTgFDDYGD8/tnVXM1QD4iGaLEeILu+RrVHm42apjHXfcG1c5NC
 0CR2sU52nQbYFG0F5JfvDMD/D7td8+t6RDU7MD5tyNGF/0NKrDRLDcV4G17fbXMv/CL2
 g4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PqzGrUSHT2ODyc7JfjhfJrg9zplZK53Sny3wqrHE5Ek=;
 b=b1x4+yLguBEyRQpwJxhOEAXywUsqdV3zqhxrofYGS/30RdQ/HtCQWs1cVb5fXTnBhu
 /sZBiPpUyBvSm/cgFzJDS8/YlrFBPDOpaB/JbNpUqTsDHAzpRgMs2dEkOERONbusibNu
 UkXtN+JsOiUePl9M2F+324zh3MBiq1cI9QtuoJu9pfw1ZOCfpLqPuEj9M47bxMoQKiUi
 CifqGU5o1DrRDuHqPrTfksXJ6dbRZw7djQUGH2q0C05VWEsRBU4jHER1FX7HmqATLBcK
 MJtPOG9RhdL5WjPbY8Tl+aNIVxKBk6ladYgqBFtATU13to82V4z4lCZOltFw7DmlYtAr
 9gFQ==
X-Gm-Message-State: AOAM530K48YlLLbsp+Pjyuqtg23hbI0afADylHW+2OqbSokmNTwDGsFw
 0NbB2Mdw+J3lAKTXy/YPc2o=
X-Google-Smtp-Source: ABdhPJxSPzwwwWvvlYz9H06c9bqwy0JIeXaHfcKYZ3niakgV/iHn3Cyw3BtXdgQ+ShT1h+CUBqkuUQ==
X-Received: by 2002:a17:902:8c8d:b029:e5:e1fc:a587 with SMTP id
 t13-20020a1709028c8db02900e5e1fca587mr14078217plo.12.1616151669181; 
 Fri, 19 Mar 2021 04:01:09 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i22sm4879042pjz.56.2021.03.19.04.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 04:01:08 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 19 Mar 2021 20:00:20 +0900
Message-Id: <50707642485aee45d6410a2dbd3e0b7ae420993b.1616150619.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616150619.git.vilhelm.gray@gmail.com>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v10 01/33] docs: counter: Consolidate Counter
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
