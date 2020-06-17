Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF501FC399
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2020 03:40:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF847C36B24;
	Wed, 17 Jun 2020 01:40:46 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32DC8C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 01:40:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g28so653196qkl.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 18:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iWwCvXGLu1d/G++bm7Oxn/c4JGmCfQ82ajY1qfafTpE=;
 b=HIgvMYLotp2h5l+AVet4rhc5L93WzEhO+AOYx5JGqwBg+NTBJL2yCwhpsqqPX2xeIV
 SEU3TQJ0/txS7XZIvCLkliGTluk0Uf9rDIxorpCz/0K45cQfhBuBRiej69bQGz6pMAXU
 OwDImDm792HuORCnRGS0kEq/isnW5VVTInw5FmylN+Ktp8xstSzo1ZbkGffqQg/xmOQD
 rnFthKu55yM2WGGzRf3eXRPhe/EWwUep6x4aBZN3enj1jNQ+3z/lDvsISBGQ3aj8zcoO
 M3z/xA+HYEX6wtUYhxX3DXHrGj7PmrQleDVp0i9sTG3/H3id753GZy3poMwwY57Rxz1z
 on/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iWwCvXGLu1d/G++bm7Oxn/c4JGmCfQ82ajY1qfafTpE=;
 b=GVVA23YSFHihmOTvGYe/RLH3FlR9bLBo9DxYol1/O6KPGhX/MleJgCtgWStoFCV99G
 lK7EQN+aOm5FoTN6NpS5gPJ1QroHLZ0y/yaduIVDPlVTEISBImLW1FR0AMZYiRwr2kdW
 XywA0jeEJBVJoMP6e/CFdHynlF4+g+MkeDteIyyUI/pPU04iqobKsnsp5Ur0Kv5EGi3T
 8/QtJHl0SCF76HQA8+frmwTGNtDPcqW69IoKLdaPnHnqlhZyepxFxEkBegieK3faM0RB
 tJ5V3dg9Cu4V6GCQVGqCEmFDlzYORD3fDUNbFN7nCurR11sCxhldG4mPlzwkD4/0ZuPc
 bE2A==
X-Gm-Message-State: AOAM531KSirjPLHLRT9rxvGsJd02lz/WT0GIhiDEF6dnMznlUPuvZJwz
 1xKUwB5h6WVn8kO3VQ0UBO0=
X-Google-Smtp-Source: ABdhPJwE3D3cZ9qs43mDkPVXfw5Jp+J/fhH36c9wvJ3LklRXK0DNFu/9EuqwqrvQbUSn0+uZ2ek82Q==
X-Received: by 2002:a37:9cc7:: with SMTP id
 f190mr23211573qke.236.1592358042991; 
 Tue, 16 Jun 2020 18:40:42 -0700 (PDT)
Received: from localhost.localdomain (072-189-064-225.res.spectrum.com.
 [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id a14sm1917014qkn.16.2020.06.16.18.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 18:40:42 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue, 16 Jun 2020 21:40:02 -0400
Message-Id: <061c85baa1c2e1bf1510b6235a82b44ba2a89931.1592341702.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592341702.git.vilhelm.gray@gmail.com>
References: <cover.1592341702.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, William Breathitt Gray <vilhelm.gray@gmail.com>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 4/4] docs: counter: Document character
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
 Documentation/ABI/testing/sysfs-bus-counter  |  31 +++++
 Documentation/driver-api/generic-counter.rst | 132 ++++++++++++++-----
 2 files changed, 127 insertions(+), 36 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index 566bd99fe0a5..8533a8732544 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -193,6 +193,37 @@ Description:
 		both edges:
 			Any state transition.
 
+What:		/sys/bus/counter/devices/counterX/chrdev_format
+KernelVersion:	5.9
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Data format of the respective character device node of the
+		Counter. Reading this attribute returns the current data format
+		of the respective character device node; writing to this
+		attribute sets the current data format of the respective
+		character device node. This attribute interfaces via the
+		following format:
+
+		Components/extensions are specified by a character identifier
+		and an index offset; whitespace serves as delimiters. The
+		following character identifiers are supported:
+
+		C: Count
+		S: Signal
+		E: Extension
+		A: Synapse Action
+		F: Count Function
+
+		Count/Signal extensions may be specified by first specifying the
+		respective owning component then the desired extension
+		immediately following without delimiting whitespace; Synapse
+		Action and Count Function are specified in a similar manner.
+
+		For example, "C4 C2E6 C0F S7E1 C3A4 S5" would specify the
+		following data format: Count 4, Count 2's Extension 6, Count 0's
+		Count Function, Signal 7's Extension 1, Count 3's Synapse Action
+		4, Signal 5.
+
 What:		/sys/bus/counter/devices/counterX/name
 KernelVersion:	5.2
 Contact:	linux-iio@vger.kernel.org
diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index 8aaa6cd37fd4..d46ce65d1488 100644
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
 
@@ -378,13 +365,13 @@ driver is exemplified by the following::
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
@@ -399,25 +386,32 @@ driver is exemplified by the following::
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
@@ -426,7 +420,7 @@ driver is exemplified by the following::
         \ Count: "42"                                      /
          --------------------------------------------------
 
-There are three primary components involved:
+There are four primary components involved:
 
 Counter device driver
 ---------------------
@@ -446,3 +440,69 @@ and vice versa.
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
+A `/sys/bus/counter/devices/counterX/chrdev_format` sysfs attribute is
+available to expose the character device data format.
+
+Users may write to this sysfs attribute to select the components they
+want to interface -- the layout can be determined as well from the
+order. For example::
+
+# echo "C0 C3 C2" > /sys/bus/counter/devices/counter0/chrdev_format
+
+This would select Counts 0, 3, and 2 (in that order) to be available
+in the `/dev/counter0` node as a contiguous memory region.
+
+Users can select extensions in a similar fashion::
+
+# echo "C4E2 S1E0" > /sys/bus/counter/devices/counter0/chrdev_format
+
+This would select extension 2 from Count 4, and extension 0 from
+Signal 1.
+
+Users may read from this `chrdev_format` sysfs attribute in order to see
+the currently configured format of the character device.
+
+Users may perform read/write operations on the `/dev/counterX` node
+directly; the layout of the data is what they user has configured via
+the chrdev_format sysfs attribute. For example::
+
+# echo "C0 C1 S0 S1" > /sys/bus/counter/devices/counter0/chrdev_format
+
+Yields the following `/dev/counter0` memory layout::
+
+        +-----------------+------------------+----------+----------+
+        | Byte 0 - Byte 7 | Byte 8 - Byte 15 | Byte 16  | Byte 17  |
+        +-----------------+------------------+----------+----------+
+        | Count 0         | Count 1          | Signal 0 | Signal 2 |
+        +-----------------+------------------+----------+----------+
+
+The number of bytes allotted for each component or extension is
+determined by its respective data type: u8 will have 1 byte allotted,
+u64 will have 8 bytes allotted, etc.
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
