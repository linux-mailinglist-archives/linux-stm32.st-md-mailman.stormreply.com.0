Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C91A51BE5E9
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 20:12:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B409C36B0E;
	Wed, 29 Apr 2020 18:12:03 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5675AC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 18:12:00 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z90so2661352qtd.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 11:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ozWAZTiRiQAsK8Aefmx7KqwvCcl9XDLzbB/7ZK1Lnsc=;
 b=X98dJh2mUqPg9rHjeKO5tNwemXuPt/5B4cuoYCOj/ENiDh8dqX5JfZfHbLnz9RK7Bk
 LEXUoo3YA0cfboza3R2b/+yYHdNIKetX61wBVB8K2oYEDhA4F+25D4Pn9gUBe/sGJS+9
 qr7LFqSz89b177nk9ztecnXr3yQouAOu/tQyzNsWaxXdsDi8pfIHZgkvJGINd7UV5TNz
 oFS3XN5kFlv3lZPiS6OJrAmCkeR1VfBStHrD+7+FvTslu7vlnqlAeH7gr2Hyhogy1kNv
 X5391wX02q2k+g8VDQQ87UsAL0Gp54czE6mQS8n61cTmsdpnplQYm3uQddBL6vjWoB9G
 4+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ozWAZTiRiQAsK8Aefmx7KqwvCcl9XDLzbB/7ZK1Lnsc=;
 b=mNSM3nbaO7tTud4r4LuAoKZqO29KArP+rDhL9hkja7M05VriOVdmV3tZDMb+t4U7eJ
 HTzSL5W1ZORf/2fVkSZAFvrRv0qymoFE27i0PChocei3+5rSw21BXgy6DhPzjDnmXRd0
 1fvn0gdKZC6bNKRBM5AEc51naN5ZPUqDWQEbgPvCfYr0sQqFu/iuLTDZCx6yQA7S8ege
 DoHNAtCavvDKiRDvml/fP9zs3HvFocWeYrpGL0GYq2kS1V7BbvmnMBYWAURRQPNEnHmV
 TwxfzZhktVaM/Tv2P9YfEa+baNHW9v+qoh/T2NeDPD6+KslULsixgSfnW1VG1zHsOTDV
 gUKQ==
X-Gm-Message-State: AGi0PuaIUtaX9DL8cJHNkru88KmuHKvFLJpOlYWaArgBqUuMs0tEsj2B
 5yHlc60J/QmXxhLDSDfRma0=
X-Google-Smtp-Source: APiQypIWl6+H5EHpNscQV77b86EnqxfLSGzZvkfErQF6MEiAnf4tiPyI8Vqlk2Lg1QDznTxR0sOJ9A==
X-Received: by 2002:ac8:7c81:: with SMTP id y1mr33853251qtv.97.1588183919027; 
 Wed, 29 Apr 2020 11:11:59 -0700 (PDT)
Received: from localhost.localdomain (072-189-064-225.res.spectrum.com.
 [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id o43sm16315082qtf.46.2020.04.29.11.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 11:11:58 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed, 29 Apr 2020 14:11:36 -0400
Message-Id: <0e37267e49de3a45c850b051d76a8a55ffdde196.1588176662.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1588176662.git.vilhelm.gray@gmail.com>
References: <cover.1588176662.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 felipe.balbi@linux.intel.com, linux-iio@vger.kernel.org, syednwaris@gmail.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, patrick.havelange@essensium.com,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 fabien.lahoudere@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/4] docs: counter: Update to reflect sysfs
	internalization
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
 Documentation/driver-api/generic-counter.rst | 220 +++++++++++++------
 1 file changed, 157 insertions(+), 63 deletions(-)

diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
index e622f8f6e56a..3ab8125b9c05 100644
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
@@ -267,11 +267,10 @@ respective counter_count structure. These counter_count structures are
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
@@ -279,13 +278,58 @@ it to the counter_unregister function. Similarly, the
 devm_counter_register and devm_counter_unregister functions may be used
 if device memory-managed registration is desired.
 
-Extension sysfs attributes can be created for auxiliary functionality
-and data by passing in defined counter_device_ext, counter_count_ext,
-and counter_signal_ext structures. In these cases, the
-counter_device_ext structure is used for global/miscellaneous exposure
-and configuration of the respective Counter device, while the
-counter_count_ext and counter_signal_ext structures allow for auxiliary
-exposure and configuration of a specific Count or Signal respectively.
+The struct counter_data structure is used to define counter extensions
+for Signals, Synapses, and Counts::
+
+        struct counter_data {
+                enum counter_data_type type;
+                const char *name;
+                void *read;
+                void *write;
+                void *priv;
+        };
+
+The "type" member specifies the type of data (e.g. unsigned long,
+boolean, etc.) handled by this extension. The "read" and "write" members
+can then be set by the counter device driver with callbacks to handle
+that data.
+
+Convenience macros such as COUNTER_DATA_UNSIGNED_LONG are provided for
+use by driver authors. In particular, driver authors are expected to use
+the provided macros for standard Counter subsystem attributes in order
+to maintain a consistent interface for userspace. For example, a counter
+device driver may define several standard attributes like so::
+
+        struct counter_data count_ext[] = {
+                COUNTER_DATA_DIRECTION(count_direction_read),
+                COUNTER_DATA_ENABLE(count_enable_read, count_enable_write),
+                COUNTER_DATA_CEILING(count_ceiling_read, count_ceiling_write),
+        };
+
+This makes it intuitive to see, add, and modify the attributes that are
+supported by this driver ("direction", "enable", and "ceiling") and to
+maintain this code without getting lost in a web of struct braces.
+
+Callbacks must match the function type expected for the respective
+component or extension. These types are defined in the
+`drivers/counter/counter-function-types.h` file.
+
+The corresponding prototypes for the callbacks mentioned in the previous
+example would be::
+
+        int count_direction_read(struct counter_device *counter,
+                                 struct counter_count *count,
+                                 enum counter_count_direction *direction);
+        int count_enable_read(struct counter_device *counter,
+                              struct counter_count *count, bool *enable);
+        int count_enable_write(struct counter_device *counter,
+                               struct counter_count *count, bool enable);
+        int count_ceiling_read(struct counter_device *counter,
+                               struct counter_count *count,
+                               unsigned long *ceiling);
+        int count_ceiling_write(struct counter_device *counter,
+                                struct counter_count *count,
+                                unsigned long ceiling);
 
 Determining the type of extension to create is a matter of scope.
 
@@ -313,52 +357,102 @@ Determining the type of extension to create is a matter of scope.
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
+Counter drivers pass and take data natively (i.e. unsigned long, bool,
+size_t, etc.) and the shared counter module handles the translation
+between the driver callbacks and userspace interfaces. This gurantees a
+standard userspace interface for all counter drivers, and helps
+generalize the Generic Counter driver ABI in order to support various
+userspace interfaces without changes to the existing counter drivers.
+
+A high-level view of how a count value is passed down from a counter
+driver can be exemplified by the following::
+
+       Count data request:
+       ~~~~~~~~~~~~~~~~~~~
+                 ----------------------
+                / Counter device       \
+                +----------------------+
+                | Count register: 0x28 |
+                +----------------------+
+                        |
+                 -----------------
+                / raw count data /
+                -----------------
+                        |
+                        V
+                +----------------------------+
+                | Counter device driver      |----------+
+                +----------------------------+          |
+                | Processes data from device |   -------------------
+                |----------------------------|  / driver callbacks /
+                | Type: unsigned long        |  -------------------
+                | Value: 42                  |          |
+                +----------------------------+          |
+                        |                               |
+                 ----------------                       |
+                / unsigned long /                       |
+                ----------------                        |
+                        |                               |
+                        |                               V
+                        |               +----------------------+
+                        |               | Counter core         |
+                        |               +----------------------+
+                        |               | Routes device driver |
+                        |               | callbacks to the     |
+                        |               | userspace interfaces |
+                        |               +----------------------+
+                        |                       |
+                        |                -------------------
+                        |               / driver callbacks /
+                        |               -------------------
+                        |                       |
+                +-------+                       |
+                |                               |
+                |               +---------------+
+                |               |
+                V               |
+        +--------------------+  |
+        | Counter sysfs      |<-+
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
+Please refer to the `Documentation/ABI/testing/sysfs-bus-counter` file
+for a detailed breakdown of the available Generic Counter interface
+sysfs attributes.
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
