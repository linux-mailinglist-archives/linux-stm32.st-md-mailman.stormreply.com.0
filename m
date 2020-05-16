Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167E1D63C9
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2020 21:20:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56442C36B21;
	Sat, 16 May 2020 19:20:49 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47E9CC36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2020 19:20:45 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l1so4878206qtp.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2020 12:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VwCAFe7MBCqJ2a3UC8HemYjtQtYkC6zmx8xai56rLfc=;
 b=fbL3q6avYx3M4P/cPgZcdIzEGnk6vehyBCli11hV3Wksa00cJmRvC5npEJwONngXvf
 M3obtU/uKlPmhiGi8MPXLeQdNY/fXaPcJqVDmdaxCm+qHAzhabob/nSgZ0AzEYI89GZV
 3RxjJINcfVKvL/y40rhATW7mTT2sSC0CFUYXhBesM9gEqOz8HBeU3aT2lUX9xFmx5Lx1
 vG26CYvW2Cy2OpUIG4cWmUg+78ydQZ4wEXREg+LhLlUqtFfYVpA+eZmD4+y2Enh3B2Av
 bJXgBWK49dxmEIQ3PCeyuFpY8uE801G7gfas4jkxeJioISFCsF6g9pQUI7Bk8zNC+2eA
 q3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VwCAFe7MBCqJ2a3UC8HemYjtQtYkC6zmx8xai56rLfc=;
 b=CfUaZBcnDLsA7jynmHpLaD+p5uOQiIOveWwbLajB5xt4LEUyJwFL8+kN9Pt/9zmcRO
 IQHwYTSYnArf6Ps8mAcEv0Z44FH1p5yos1IyltVj+gxaryLRjAULVNlz3aRIZoSVbLgo
 JGaOhlsh3U7WWJ1Jj1K2GHx/69Gi6dGV6HrDFJCfWxlYGzV8v9d43lMvhm3SaCpcUIw8
 VlqVkwUaP70LLmbbKuD55FGfioxBKh1r3Rkzrleu+Gqn4fArEHj6Krgj6c/dH5Iqm3Wl
 vjswXfraTJ6D74fWR8Z5kaX4mnFsbH9tjHlm0RNFaER6rc2Dh5gA+vSDZ2vxsOefXL47
 5eiw==
X-Gm-Message-State: AOAM531pnq6rM8iEyfSAeXfm10/UV1wIlYB1ZKYt0WQC9SwBD9ZOg5kd
 hoLfPbEoKZZQ07WsykwTW90=
X-Google-Smtp-Source: ABdhPJzo2+BnZF7E3lsdOjU0oT5HoCFBnq5wOVRK4nYC/5f97QFj0Ggf8cSSDoGXGVI7c9IUtE053Q==
X-Received: by 2002:ac8:7b35:: with SMTP id l21mr9455431qtu.21.1589656844149; 
 Sat, 16 May 2020 12:20:44 -0700 (PDT)
Received: from localhost.localdomain (072-189-064-225.res.spectrum.com.
 [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id g19sm3160409qke.32.2020.05.16.12.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 12:20:43 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Sat, 16 May 2020 15:20:02 -0400
Message-Id: <db0a9206d31c82f8381316ef5ff9872bfb53665b.1589654470.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1589654470.git.vilhelm.gray@gmail.com>
References: <cover.1589654470.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, William Breathitt Gray <vilhelm.gray@gmail.com>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/4] docs: counter: Document character
	device interface
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

This patch adds high-level documentation about the Counter subsystem
character device interface.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/driver-api/generic-counter.rst | 112 +++++++++++++------
 1 file changed, 76 insertions(+), 36 deletions(-)

diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index 8f85c30dea0b..58045b33b576 100644
--- a/Documentation/driver-api/generic-counter.rst
+++ b/Documentation/driver-api/generic-counter.rst
@@ -223,19 +223,6 @@ whether an input line is differential or single-ended) and instead focus
 on the core idea of what the data and process represent (e.g. position
 as interpreted from quadrature encoding data).
 
-Userspace Interface
-===================
-
-Several sysfs attributes are generated by the Generic Counter interface,
-and reside under the /sys/bus/counter/devices/counterX directory, where
-counterX refers to the respective counter device. Please see
-Documentation/ABI/testing/sysfs-bus-counter for detailed
-information on each Generic Counter interface sysfs attribute.
-
-Through these sysfs attributes, programs and scripts may interact with
-the Generic Counter paradigm Counts, Signals, and Synapses of respective
-counter devices.
-
 Driver API
 ==========
 
@@ -377,13 +364,13 @@ driver can be exemplified by the following::
                 +----------------------------+          |
                 | Processes data from device |   -------------------
                 |----------------------------|  / driver callbacks /
-                | Type: unsigned long        |  -------------------
+                | Type: u64                  |  -------------------
                 | Value: 42                  |          |
                 +----------------------------+          |
                         |                               |
-                 ----------------                       |
-                / unsigned long /                       |
-                ----------------                        |
+                 ----------                             |
+                / u64     /                             |
+                ----------                              |
                         |                               |
                         |                               V
                         |               +----------------------+
@@ -398,25 +385,32 @@ driver can be exemplified by the following::
                         |               / driver callbacks /
                         |               -------------------
                         |                       |
-                +-------+                       |
+                +-------+---------------+       |
+                |                       |       |
+                |               +-------|-------+
+                |               |       |
+                V               |       V
+        +--------------------+  |  +---------------------+
+        | Counter sysfs      |<-+->| Counter chrdev      |
+        +--------------------+     +---------------------+
+        | Translates to the  |     | Translates to the   |
+        | standard Counter   |     | standard Counter    |
+        | sysfs output       |     | character device    |
+        |--------------------|     |---------------------+
+        | Type: const char * |     | Type: u64           |
+        | Value: "42"        |     | Value: 42           |
+        +--------------------+     +---------------------+
                 |                               |
-                |               +---------------+
-                |               |
-                V               |
-        +--------------------+  |
-        | Counter sysfs      |<-+
-        +--------------------+
-        | Translates to the  |
-        | standard Counter   |
-        | sysfs output       |
-        |--------------------|
-        | Type: const char * |
-        | Value: "42"        |
-        +--------------------+
-                |
-         ---------------
-        / const char * /
-        ---------------
+         ---------------                 ----------
+        / const char * /                / u64     /
+        ---------------                 ----------
+                |                               |
+                |                               V
+                |                       +-----------+
+                |                       | read      |
+                |                       +-----------+
+                |                       \ Count: 42 /
+                |                        -----------
                 |
                 V
         +--------------------------------------------------+
@@ -425,7 +419,7 @@ driver can be exemplified by the following::
         \ Count: "42"                                      /
          --------------------------------------------------
 
-There are three primary components involved:
+There are four primary components involved:
 
 Counter device driver
 ---------------------
@@ -445,3 +439,49 @@ and vice versa.
 Please refer to the `Documentation/ABI/testing/sysfs-bus-counter` file
 for a detailed breakdown of the available Generic Counter interface
 sysfs attributes.
+
+Counter chrdev
+--------------
+Translates counter data to the standard Counter character device; data
+is transferred via standard character device read/write calls.
+
+Sysfs Interface
+===============
+
+Several sysfs attributes are generated by the Generic Counter interface,
+and reside under the `/sys/bus/counter/devices/counterX` directory,
+where `X` is to the respective counter device id. Please see
+Documentation/ABI/testing/sysfs-bus-counter for detailed information on
+each Generic Counter interface sysfs attribute.
+
+Through these sysfs attributes, programs and scripts may interact with
+the Generic Counter paradigm Counts, Signals, and Synapses of respective
+counter devices.
+
+Counter Character Device
+========================
+
+Counter character device nodes are created under the `/dev` directory as
+`counterX`, where `X` is the respective counter device id. Defines for
+the standard Counter data types are exposed via the userspace
+`include/uapi/linux/counter-types.h` file.
+
+The first 196095 bytes of the character device serve as a control
+selection area where control exposure of desired Counter components and
+extensions may be selected. Each byte serves as a boolean selection
+indicator for a respective Counter component or extension. The format of
+this area is as follows:
+
+* For each device extension, a byte is required.
+* For each Signal, a byte is reserved for the Signal component, and a
+  byte is reserved for each Signal extension.
+* For each Count, a byte is reserved for the Count component, a byte is
+  reserved for the count function, a byte is reserved for each Synapse
+  action, and byte is reserved for each Count extension.
+
+The selected Counter components and extensions may then be interfaced
+after the first 196095 bytes via standard character device read/write
+operations. The number of bytes available for each component or
+extension is dependent on their respective data type: u8 will have 1
+byte available, u64 will have 8 bytes available, strings will have 64
+bytes available, etc.
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
