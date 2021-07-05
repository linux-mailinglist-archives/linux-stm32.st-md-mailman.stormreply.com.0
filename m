Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A873BB8CC
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 10:20:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F4F3C57B60;
	Mon,  5 Jul 2021 08:20:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23F33C57B5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 08:20:07 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso11318213pjp.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jul 2021 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A67nL6VY5QuqzX4d9vtFWwhex7SYuitKz1DcH71mkPY=;
 b=V02DqOs7FO+Rxpaao17rnMSfpXkDn6hELLAi7trWMki59XCnOCqkYlX9nRQJNi4npP
 3DtNib8TrNIXhXHRQX2aBymxlx+ll+ScUHP9Aduqdt7J+pe1Y31hCLiXFxSZRz/J/nf6
 R5p+FoyA7JI/DNd+ZdgIhs10Ctf3yhm/p/FGCjWIo3qGRuaX/QJlJNRlVvisrT6zszI/
 v3VRPpFDGMRXz4DWlY6mvrO/25VCgox8JIyqVB742v6k9w1VLBqteHdMIUo3H8/RERRs
 UHAQ0F81hTVdTt3YyIef7ZG1b4zsKa7LKxyPW4EOKsl/n5HZC5maOESwT+6PpKUhpBzZ
 w9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A67nL6VY5QuqzX4d9vtFWwhex7SYuitKz1DcH71mkPY=;
 b=QM1bGaHsU7fdhw9UM3rjS8W3adkYXbVed8Uu2NePbqN/ywt9xKqz5/eu/L5PJ9XK94
 5ojOC/bXC9yn7LGAac9nfCUMNQB5tRghKHY8MVER4cEQJ/1rId8A/gVWQgwrXFxpQpUL
 hbMUF2iqmsA1iAwXe3X21UlQ3oMl5b2wzTLkcfnLUbEdRv+eiaGHMiBYgXJA6gEFhHw1
 6+VAWfLLP77qaKQLU0vnwCKhSMzV90mP9bGMk4+DLOUJm6w64fG5+WwKgptGfmYG0QbN
 jj0sYLvUuTN2d+NWUblsW4uhOgmWkERl6nPENErw8PJHv0qDvxOrnLl3BZJ5Pd/WCiMp
 XiwQ==
X-Gm-Message-State: AOAM532rAK80GDWONDFhCZdjoJEW3l5T67z86PVQ43vpUYlV/dvBF7gN
 TMXEDzia5Z6OZcPaf/pnwO0=
X-Google-Smtp-Source: ABdhPJy7ASUjr1Me3ibXp+zSB7NGG5pLHoVFw5uw43je2IpvW2bBPLUVl+JXYKpYZibCK5ljuf1Mtg==
X-Received: by 2002:a17:90b:103:: with SMTP id
 p3mr14172079pjz.217.1625473205641; 
 Mon, 05 Jul 2021 01:20:05 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y11sm12209986pfo.160.2021.07.05.01.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:20:05 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Mon,  5 Jul 2021 17:18:56 +0900
Message-Id: <3e0a3f7a32bba0f56f5830ff1548ef417e63880e.1625471640.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1625471640.git.vilhelm.gray@gmail.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v12 08/17] docs: counter: Update to reflect
	sysfs internalization
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

The Counter subsystem architecture and driver implementations have
changed in order to handle Counter sysfs interactions in a more
consistent way. This patch updates the Generic Counter interface
documentation to reflect the changes.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-counter  |   9 +-
 Documentation/driver-api/generic-counter.rst | 243 ++++++++++++++-----
 2 files changed, 185 insertions(+), 67 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index 20fe5afd4f9e..dee79b606847 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -286,7 +286,14 @@ What:		/sys/bus/counter/devices/counterX/signalY/signal
 KernelVersion:	5.2
 Contact:	linux-iio@vger.kernel.org
 Description:
-		Signal data of Signal Y represented as a string.
+		Signal level state of Signal Y. The following signal level
+		states are available:
+
+		low:
+			Low level state.
+
+		high:
+			High level state.
 
 What:		/sys/bus/counter/devices/counterX/signalY/synchronous_mode
 KernelVersion:	5.2
diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index 64fe7db080e5..f6397218aa4c 100644
--- a/Documentation/driver-api/generic-counter.rst
+++ b/Documentation/driver-api/generic-counter.rst
@@ -250,8 +250,8 @@ for defining a counter device.
 .. kernel-doc:: drivers/counter/counter.c
    :export:
 
-Implementation
-==============
+Driver Implementation
+=====================
 
 To support a counter device, a driver must first allocate the available
 Counter Signals via counter_signal structures. These Signals should
@@ -267,25 +267,61 @@ respective counter_count structure. These counter_count structures are
 set to the counts array member of an allocated counter_device structure
 before the Counter is registered to the system.
 
-Driver callbacks should be provided to the counter_device structure via
-a constant counter_ops structure in order to communicate with the
-device: to read and write various Signals and Counts, and to set and get
-the "action mode" and "function mode" for various Synapses and Counts
-respectively.
+Driver callbacks must be provided to the counter_device structure in
+order to communicate with the device: to read and write various Signals
+and Counts, and to set and get the "action mode" and "function mode" for
+various Synapses and Counts respectively.
 
 A defined counter_device structure may be registered to the system by
 passing it to the counter_register function, and unregistered by passing
 it to the counter_unregister function. Similarly, the
-devm_counter_register and devm_counter_unregister functions may be used
-if device memory-managed registration is desired.
-
-Extension sysfs attributes can be created for auxiliary functionality
-and data by passing in defined counter_device_ext, counter_count_ext,
-and counter_signal_ext structures. In these cases, the
-counter_device_ext structure is used for global/miscellaneous exposure
-and configuration of the respective Counter device, while the
-counter_count_ext and counter_signal_ext structures allow for auxiliary
-exposure and configuration of a specific Count or Signal respectively.
+devm_counter_register function may be used if device memory-managed
+registration is desired.
+
+The struct counter_comp structure is used to define counter extensions
+for Signals, Synapses, and Counts.
+
+The "type" member specifies the type of high-level data (e.g. BOOL,
+COUNT_DIRECTION, etc.) handled by this extension. The "``*_read``" and
+"``*_write``" members can then be set by the counter device driver with
+callbacks to handle that data using native C data types (i.e. u8, u64,
+etc.).
+
+Convenience macros such as ``COUNTER_COMP_COUNT_U64`` are provided for
+use by driver authors. In particular, driver authors are expected to use
+the provided macros for standard Counter subsystem attributes in order
+to maintain a consistent interface for userspace. For example, a counter
+device driver may define several standard attributes like so::
+
+        struct counter_comp count_ext[] = {
+                COUNTER_COMP_DIRECTION(count_direction_read),
+                COUNTER_COMP_ENABLE(count_enable_read, count_enable_write),
+                COUNTER_COMP_CEILING(count_ceiling_read, count_ceiling_write),
+        };
+
+This makes it simple to see, add, and modify the attributes that are
+supported by this driver ("direction", "enable", and "ceiling") and to
+maintain this code without getting lost in a web of struct braces.
+
+Callbacks must match the function type expected for the respective
+component or extension. These function types are defined in the struct
+counter_comp structure as the "``*_read``" and "``*_write``" union
+members.
+
+The corresponding callback prototypes for the extensions mentioned in
+the previous example above would be::
+
+        int count_direction_read(struct counter_device *counter,
+                                 struct counter_count *count,
+                                 enum counter_count_direction *direction);
+        int count_enable_read(struct counter_device *counter,
+                              struct counter_count *count, u8 *enable);
+        int count_enable_write(struct counter_device *counter,
+                               struct counter_count *count, u8 enable);
+        int count_ceiling_read(struct counter_device *counter,
+                               struct counter_count *count, u64 *ceiling);
+        int count_ceiling_write(struct counter_device *counter,
+                                struct counter_count *count, u64 ceiling);
 
 Determining the type of extension to create is a matter of scope.
 
@@ -313,52 +349,127 @@ Determining the type of extension to create is a matter of scope.
   chip overheated via a device extension called "error_overtemp":
   /sys/bus/counter/devices/counterX/error_overtemp
 
-Architecture
-============
-
-When the Generic Counter interface counter module is loaded, the
-counter_init function is called which registers a bus_type named
-"counter" to the system. Subsequently, when the module is unloaded, the
-counter_exit function is called which unregisters the bus_type named
-"counter" from the system.
-
-Counter devices are registered to the system via the counter_register
-function, and later removed via the counter_unregister function. The
-counter_register function establishes a unique ID for the Counter
-device and creates a respective sysfs directory, where X is the
-mentioned unique ID:
-
-    /sys/bus/counter/devices/counterX
-
-Sysfs attributes are created within the counterX directory to expose
-functionality, configurations, and data relating to the Counts, Signals,
-and Synapses of the Counter device, as well as options and information
-for the Counter device itself.
-
-Each Signal has a directory created to house its relevant sysfs
-attributes, where Y is the unique ID of the respective Signal:
-
-    /sys/bus/counter/devices/counterX/signalY
-
-Similarly, each Count has a directory created to house its relevant
-sysfs attributes, where Y is the unique ID of the respective Count:
-
-    /sys/bus/counter/devices/counterX/countY
-
-For a more detailed breakdown of the available Generic Counter interface
-sysfs attributes, please refer to the
-Documentation/ABI/testing/sysfs-bus-counter file.
-
-The Signals and Counts associated with the Counter device are registered
-to the system as well by the counter_register function. The
-signal_read/signal_write driver callbacks are associated with their
-respective Signal attributes, while the count_read/count_write and
-function_get/function_set driver callbacks are associated with their
-respective Count attributes; similarly, the same is true for the
-action_get/action_set driver callbacks and their respective Synapse
-attributes. If a driver callback is left undefined, then the respective
-read/write permission is left disabled for the relevant attributes.
-
-Similarly, extension sysfs attributes are created for the defined
-counter_device_ext, counter_count_ext, and counter_signal_ext
-structures that are passed in.
+Subsystem Architecture
+======================
+
+Counter drivers pass and take data natively (i.e. ``u8``, ``u64``, etc.)
+and the shared counter module handles the translation between the sysfs
+interface. This guarantees a standard userspace interface for all
+counter drivers, and enables a Generic Counter chrdev interface via a
+generalized device driver ABI.
+
+A high-level view of how a count value is passed down from a counter
+driver is exemplified by the following. The driver callbacks are first
+registered to the Counter core component for use by the Counter
+userspace interface components::
+
+        Driver callbacks registration:
+        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+                        +----------------------------+
+                        | Counter device driver      |
+                        +----------------------------+
+                        | Processes data from device |
+                        +----------------------------+
+                                |
+                         -------------------
+                        / driver callbacks /
+                        -------------------
+                                |
+                                V
+                        +----------------------+
+                        | Counter core         |
+                        +----------------------+
+                        | Routes device driver |
+                        | callbacks to the     |
+                        | userspace interfaces |
+                        +----------------------+
+                                |
+                         -------------------
+                        / driver callbacks /
+                        -------------------
+                                |
+                +---------------+
+                |
+                V
+        +--------------------+
+        | Counter sysfs      |
+        +--------------------+
+        | Translates to the  |
+        | standard Counter   |
+        | sysfs output       |
+        +--------------------+
+
+Thereafter, data can be transferred directly between the Counter device
+driver and Counter userspace interface::
+
+        Count data request:
+        ~~~~~~~~~~~~~~~~~~~
+                         ----------------------
+                        / Counter device       \
+                        +----------------------+
+                        | Count register: 0x28 |
+                        +----------------------+
+                                |
+                         -----------------
+                        / raw count data /
+                        -----------------
+                                |
+                                V
+                        +----------------------------+
+                        | Counter device driver      |
+                        +----------------------------+
+                        | Processes data from device |
+                        |----------------------------|
+                        | Type: u64                  |
+                        | Value: 42                  |
+                        +----------------------------+
+                                |
+                         ----------
+                        / u64     /
+                        ----------
+                                |
+                +---------------+
+                |
+                V
+        +--------------------+
+        | Counter sysfs      |
+        +--------------------+
+        | Translates to the  |
+        | standard Counter   |
+        | sysfs output       |
+        |--------------------|
+        | Type: const char * |
+        | Value: "42"        |
+        +--------------------+
+                |
+         ---------------
+        / const char * /
+        ---------------
+                |
+                V
+        +--------------------------------------------------+
+        | `/sys/bus/counter/devices/counterX/countY/count` |
+        +--------------------------------------------------+
+        \ Count: "42"                                      /
+         --------------------------------------------------
+
+There are three primary components involved:
+
+Counter device driver
+---------------------
+Communicates with the hardware device to read/write data; e.g. counter
+drivers for quadrature encoders, timers, etc.
+
+Counter core
+------------
+Registers the counter device driver to the system so that the respective
+callbacks are called during userspace interaction.
+
+Counter sysfs
+-------------
+Translates counter data to the standard Counter sysfs interface format
+and vice versa.
+
+Please refer to the ``Documentation/ABI/testing/sysfs-bus-counter`` file
+for a detailed breakdown of the available Generic Counter interface
+sysfs attributes.
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
